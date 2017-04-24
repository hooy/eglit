from rest_framework import routers, serializers, viewsets, generics
from banking.models import Transaction, Account
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView


# class AccountSerializer(serializers.HyperlinkedModelSerializer):
#     class Meta:
#         model = Account
#         fields = '__all__'


# class AccountViewSet(generics.ListAPIView):
#     serializer_class = AccountSerializer

#     def get_queryset(self):
#         """
#         This view should return a list of all the accounts
#         for the currently authenticated user.
#         """
#         user = self.request.user
#         return Account.objects.filter(user__user=user)

#     query_set = get_queryset()


# class TransactionSerializer(serializers.ModelSerializer):
#     # id = serializers.UUIDField(read_only=True, format='hex_verbose'
#     # date = serializers.DateTimeField(read_only=True)
#     # source = serializers.StringRelatedField()
#     # destination = serializers.StringRelatedField()
#     # amount
#     class Meta:
#         model = Transaction
#         fields = '__all__'


# class TransactionViewSet(generics.ListAPIView):
#     serializer_class = TransactionSerializer

#     def get_queryset(self):
#         """
#         This view should return a list of all the purchases
#         for the currently authenticated user.
#         """
#         user = self.request.user
#         return Purchase.objects.filter(purchaser=user)

    # title = serializers.CharField(required=False, allow_blank=True, max_length=100)
    # code = serializers.CharField(style={'base_template': 'textarea.html'})
    # linenos = serializers.BooleanField(required=False)
    # language = serializers.ChoiceField(choices=LANGUAGE_CHOICES, default='python')
    # style = serializers.ChoiceField(choices=STYLE_CHOICES, default='friendly')

    # def create(self, validated_data):
    #     """
    #     Create and return a new `Snippet` instance, given the validated data.
    #     """
    #     return Snippet.objects.create(**validated_data)

    # def update(self, instance, validated_data):
    #     """
    #     Update and return an existing `Snippet` instance, given the validated data.
    #     """
    #     instance.title = validated_data.get('title', instance.title)
    #     instance.code = validated_data.get('code', instance.code)
    #     instance.linenos = validated_data.get('linenos', instance.linenos)
    #     instance.language = validated_data.get('language', instance.language)
    #     instance.style = validated_data.get('style', instance.style)
    #     instance.save()
    #     return instance