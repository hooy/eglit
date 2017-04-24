from models import Account, Transaction
from rest_framework import serializers


class AccountSerializer(serializers.ModelSerializer):

    class Meta:
        model = Account
        fields = ('number', 'balance', 'balance_currency')


class TransactionSerializer(serializers.ModelSerializer):
    source = serializers.StringRelatedField(many=False)
    destination = serializers.StringRelatedField(many=False)

    class Meta:
        model = Transaction
        fields = ('id', 'date', 'source', 'destination', 'amount',
                  'amount_currency',)
