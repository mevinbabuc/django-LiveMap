# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.views.generic import TemplateView

from . import views

urlpatterns = [
    url(
        regex="^Event/~create/$",
        view=views.EventCreateView.as_view(),
        name='Event_create',
    ),
    url(
        regex="^Event/(?P<pk>\d+)/~delete/$",
        view=views.EventDeleteView.as_view(),
        name='Event_delete',
    ),
    url(
        regex="^Event/(?P<pk>\d+)/$",
        view=views.EventDetailView.as_view(),
        name='Event_detail',
    ),
    url(
        regex="^Event/(?P<pk>\d+)/~update/$",
        view=views.EventUpdateView.as_view(),
        name='Event_update',
    ),
    url(
        regex="^Event/$",
        view=views.EventListView.as_view(),
        name='Event_list',
    ),
	]
