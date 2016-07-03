# -*- coding: utf-8 -*-
from django.views.generic import (
    CreateView,
    DeleteView,
    DetailView,
    UpdateView,
    ListView
)

from .models import (
	Event,
)


class EventCreateView(CreateView):

    model = Event


class EventDeleteView(DeleteView):

    model = Event


class EventDetailView(DetailView):

    model = Event


class EventUpdateView(UpdateView):

    model = Event


class EventListView(ListView):

    model = Event

