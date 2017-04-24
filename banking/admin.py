from django.contrib import admin
from banking.models import Account, Transaction
from django.utils.translation import ugettext_lazy as _


@admin.register(Account)
class AccountAdmin(admin.ModelAdmin):
    list_display = ('number', 'user', 'balance', )


@admin.register(Transaction)
class TransactionAdmin(admin.ModelAdmin):
    list_display = ('id', 'date', 'source', 'destination', 'amount',)


admin.site.site_header = _(u'E-Global Finance')
