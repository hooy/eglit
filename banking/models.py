from __future__ import unicode_literals
import uuid
from random import randint
from django.utils.translation import ugettext_lazy as _
from django.db import models
from moneyfield import MoneyField
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


class Profile(models.Model):
    ''' in case we will extend our user model in future '''
    user = models.OneToOneField(User, on_delete=models.CASCADE)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


class EGMoney(MoneyField):
    ''' Extend MoneyField so we ensure to use the same
        defaults and currencies in all models
    '''
    __CURRENCY_CHOICES = (
        ('EUR', _('Euro')),
        ('USD', _('Dollar')),
        ('GBP', _('Pound')),
        ('CHF ', _('Franc ')),
    )
    __CURRENCY_DEFAULT = 'EUR'

    def __init__(self, *args, **kwargs):
        kwargs['decimal_places'] = 4
        kwargs['max_digits'] = 14
        kwargs['currency_choices'] = self.__CURRENCY_CHOICES
        kwargs['currency_default'] = self.__CURRENCY_DEFAULT
        super(EGMoney, self).__init__(*args, **kwargs)


class Account(models.Model):
    ''' Basic account info.
        Accounts are identified by 8-digit
        numbers which are assigned by the system.
        all things that are omitted in current task
        and relays on user data can be stored in Profile model
    '''

    user = models.ForeignKey(Profile, unique=True)
    balance = EGMoney()
    number = models.CharField(max_length=8)

    def get_unique_number():
            # Generate ID once, then check the db. If exists, keep trying.
            def gen_id():
                return randint(10**7, 10**8 - 1)
            generated_id = gen_id()
            while Account.objects.filter(number=generated_id).exists():
                generated_id = gen_id()

            return generated_id

    def save(self):
        # first time saving instance -> generate new number
        if not self.number:
            self.number = self.get_unique_number()
        super(Account, self).save()


class Transaction(models.Model):
    # lets generate transaction id which can be used as users
    # for reference
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    source = models.ForeignKey(Account)
    destination = models.ForeignKey(Account)
    amount = EGMoney()
    type = models.CharField(max_length=30)
