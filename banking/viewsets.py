from rest_framework import mixins, viewsets, generics


class DetailViewSet(mixins.CreateModelMixin, mixins.RetrieveModelMixin,
                    mixins.UpdateModelMixin, mixins.DestroyModelMixin,
                    viewsets.GenericViewSet):
    pass


class ReadOnlyDetailViewSet(mixins.RetrieveModelMixin,
                            viewsets.GenericViewSet):
    pass


class ListViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    pass


class ListViewCreateSet(mixins.ListModelMixin,
                        mixins.CreateModelMixin,
                        viewsets.GenericViewSet,
                        generics.GenericAPIView):
    pass
