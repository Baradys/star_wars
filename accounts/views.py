from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.db.models import Count
from django.shortcuts import render, redirect
from django.urls import reverse_lazy, reverse
from django.views import View
from django.views.generic import CreateView, DetailView, UpdateView, DeleteView, TemplateView

from .forms import ProfileForm, MessageForm
from .models import Profile, Chat


class SignUpView(CreateView):
    model = Profile
    template_name = 'accounts/signup.html'
    form_class = UserCreationForm
    success_url = reverse_lazy('login')


class ProfilePageView(DetailView):
    model = Profile
    template_name = 'accounts/detail_profile.html'
    context_object_name = 'profile'


class EditProfileView(UpdateView):
    model = Profile
    form_class = ProfileForm
    template_name = 'accounts/update_profile.html'
    success_url = reverse_lazy('main_page')


class DeleteProfileView(DeleteView):
    model = Profile
    template_name = 'accounts/delete_profile.html'
    success_url = reverse_lazy('main_page')


class DialogsView(TemplateView):
    model = Chat
    template_name = 'accounts/dialogs.html'
    context_object_name = 'dialog'

    def get_context_data(self, **kwargs):
        context = super(DialogsView, self).get_context_data(**kwargs)
        context['user_profile'] = self.request.user
        context['chats'] = Chat.objects.filter(members__in=[self.request.user.id])
        return context


class MessagesView(View):
    @staticmethod
    def get(request, pk):
        try:
            chat = Chat.objects.get(id=pk)
            if request.user in chat.members.all():
                chat.message_set.filter(is_read=False).exclude(author=request.user).update(is_read=True)
            else:
                chat = None
        except Chat.DoesNotExist:
            chat = None

        return render(request, 'accounts/messages.html', {
            'user_profile': request.user,
            'chat': chat,
            'form': MessageForm()
        })

    @staticmethod
    def post(request, pk):
        form = MessageForm(data=request.POST)
        if form.is_valid():
            message = form.save(commit=False)
            message.chat_id = pk
            message.author = request.user
            message.save()
        return redirect(reverse('messages', args=[pk]))


class CreateDialogView(View):
    @staticmethod
    def get(request, pk):
        chats = Chat.objects.filter(members__in=[request.user.id, pk], type_of_chat=Chat.DIALOG).annotate(
            c=Count('members')).filter(c=2)
        if not chats and int(pk) != request.user.id:
            chat = Chat.objects.create()
            chat.members.add(request.user, pk)
        else:
            chat = chats.first()
            if not chat:
                return redirect(reverse('dialogs'))
        return redirect(reverse('messages', kwargs={'pk': chat.pk}))
