from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import Http404
from django.db.models import Q
from models import Account, Transaction, Profile
from viewsets import ListViewCreateSet
from rest_framework.response import Response
from rest_framework import status
from serializers import AccountSerializer, TransactionSerializer
from permissions import UserIsOwnerOrAdmin
from Project.settings import CURRENCIES
from moneyed import Money
from rest_framework.exceptions import ValidationError


@login_required
def home(request):

    # collect all user accounts
    accounts = Account.objects.filter(user__user=request.user)

    return render(request, 'home.html', {'accounts': accounts})


@login_required
def details(request, account_number):
    # collect all user accounts
    try:
        account = Account.objects.get(user__user=request.user,
                                      number=account_number)
        try:
            transactions = Transaction.objects.filter(
                Q(source=account) | Q(destination=account)
            )
        except:
            transactions = None
    except:
        raise Http404("No Accounts matches the given query.")

    return render(
        request, 'details.html',
        {
            'account': account,
            'transactions': transactions,
        }
    )


@login_required
def new_transfer(request):
    # TODO
    # if request.method == 'POST':
    #     form = TransactionForm(request.POST, request.FILES)
    #     if form.is_valid():
    #         form.save()
    # else:
    #     form = TransactionForm()

    # return render(
    #     request, 'new_transfer.html',
    #     {
    #         'form': form,
    #     }
    # )
    pass


class AccountViewSet(ListViewCreateSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    permission_classes = (UserIsOwnerOrAdmin,)

    def get_queryset(self):
        """
        This view should return a list of all user accounts
        for the currently authenticated user.
        """
        user = self.request.user
        return Account.objects.filter(user__user=user)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        data = {
            'error': False,
            'data': serializer.data,
        }

        return Response(data, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        currency = self.request.data['currency']
        if currency in CURRENCIES:
            p = Profile.objects.get(user=self.request.user)
            serializer.save(
                balance=Money(0, currency),
                user=p
            )
        else:
            raise ValidationError('No such currency %s' % currency)


class TransactionViewSet(ListViewCreateSet):
    queryset = Transaction.objects.all()
    serializer_class = TransactionSerializer
    permission_classes = (UserIsOwnerOrAdmin,)

    def get_queryset(self):
        """
        This view should return a list of all user accounts
        for the currently authenticated user.
        """
        user = self.request.user
        number = self.request.GET.get('account', None)
        if number:
            account = Account.objects.filter(user__user=user, number=number)
            if account:
                transactions = Transaction.objects.filter(
                    Q(source=account) | Q(destination=account)
                )
                if transactions:
                    return transactions
                else:
                    raise ValidationError('No transactions')
            else:
                raise ValidationError('Wrong account number')

        else:
            raise ValidationError('Specify account number')

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        data = {
            'error': False,
            'data': serializer.data,
        }

        return Response(data, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        source_account = self.request.POST.get('sourceAccount', None)
        destination_account = self.request.POST.get('destAccount', None)
        # amount = self.request.POST.get('amount')
        if (source_account or destination_account):
            if source_account:
                sacc = Account.objects.get(number=source_account)
            else:
                sacc = None
            if destination_account:
                dacc = Account.objects.get(number=destination_account)
            else:
                dacc = None

            serializer.save(
                source=sacc,
                destination=dacc
            )
        else:
            raise ValidationError('Specify atleast one account')
