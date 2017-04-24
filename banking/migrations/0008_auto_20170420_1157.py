# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-20 11:57
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('banking', '0007_transaction_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transaction',
            name='destination',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='transaction_destination', to='banking.Account'),
        ),
        migrations.AlterField(
            model_name='transaction',
            name='source',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='transaction_source', to='banking.Account'),
        ),
    ]
