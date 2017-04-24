from django.conf.urls import url, include
from . import views

# router.register(r'users', views.UserDetailViewSet)


urlpatterns = [
    # url(r'^', include(router.urls)),
    url(r'^$', views.home),
    url(r'^account/(?P<account_number>\w+)/details/$', views.details),
    url(r'^new/transfer/$', views.new_transfer),


]
