from __future__ import unicode_literals
import uuid
from random import randint
from django.db import models
from django.db import transaction
from django.db.models.signals import post_save
from djmoney.models.fields import MoneyField
from django.contrib.auth.models import User
from django.dispatch import receiver
from django.utils.encoding import python_2_unicode_compatible
from moneyed import Money
from django.urls import reverse
from rest_framework.authtoken.models import Token


@python_2_unicode_compatible
class Profile(models.Model):
    ''' in case we will extend our user model in future '''
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


# Let's create API token for every new user
@receiver(post_save, sender=User)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)


def get_unique_number():
    # Generate ID once, then check the db. If exists, keep trying.
    def gen_id():
        return randint(10**7, 10**8 - 1)
    generated_id = gen_id()
    while Account.objects.filter(number=generated_id).exists():
        generated_id = gen_id()

    return generated_id


@python_2_unicode_compatible
class Account(models.Model):
    ''' Basic account info.
        Accounts are identified by 8-digit
        numbers which are assigned by the system.
        all things that are omitted in current task
        and relays on user data can be stored in Profile model
    '''

    user = models.ForeignKey(Profile)
    balance = MoneyField(
        max_digits=10,
        decimal_places=2,
        default_currency='EUR'
    )

    number = models.CharField(max_length=8, default=get_unique_number)

    def __str__(self):
        return '%s (%s)' % (self.number, self.balance_currency)


class IncorrectTransactionDetected(Exception):
    pass


@python_2_unicode_compatible
class Transaction(models.Model):
    # lets generate transaction id which can be used as users
    # for reference
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    date = models.DateTimeField(auto_now_add=True)
    source = models.ForeignKey(
        Account,
        related_name='transaction_source',
        null=True,
        blank=True
    )
    destination = models.ForeignKey(
        Account,
        related_name='transaction_destination',
        null=True,
        blank=True
    )
    amount = MoneyField(
        max_digits=10,
        decimal_places=2,
        default_currency='EUR'
    )

    @property
    def type(self):
        if self.source is None:
            return 'deposit'
        elif self.destination is None:
            return 'withdraw'
        else:
            return 'transfer'

    def __str__(self):
        return "%s (%s)" % (self.id, self.type)

    @transaction.atomic  # ensures save wii
    def save(self, *args, **kwargs):
        if self.source or self.destination:
            if self.source != self.destination:
                if self.source:
                    # represents 0
                    z = Money(0, self.amount_currency)
                    if self.source.balance - self.amount > z:
                        self.source.balance -= self.amount  # withdraw money
                        self.source.save()
                    else:  # not enough money on account
                        raise IncorrectTransactionDetected()
            else:  # same account
                raise IncorrectTransactionDetected()
            if self.destination:
                self.destination.balance += self.amount  # deposit money
                self.destination.save()
        else:
            raise IncorrectTransactionDetected()

        super(Transaction, self).save(*args, **kwargs)
