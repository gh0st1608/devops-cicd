from django.shortcuts import render, redirect
from django.urls import reverse
from django.core.mail import EmailMessage
from .forms import ContactForm

# Create your views here.
def contact(request):
    # print("Tipo de peticion: {}".format(request.method))
    contac_form = ContactForm()

    if request.method == 'POST':
        contac_form = ContactForm(data=request.POST)
        if contac_form.is_valid():
            name =request.POST.get('name', '')
            email =request.POST.get('email', '')
            content =request.POST.get('content', '')
            # suponemos que todo ha ido bien redireccionamos


            email = EmailMessage(
                "Coffe Sone: Nuevo Mensaje de Contacto",
                "De {}<{}>\n\nEscribió\n\n{}".format(name, email, content), 
                "no-contestar@inbox.mailtrap.io",
                ["godoyfranciscov200@gmail.com"],
                reply_to=[email]
            )

            try:
                email.send()
                # todo ha ido bien redireccionamos a ok
                return redirect(reverse('contact')+'?ok')
            except:
                # algo no ha ido bien redireccionamos a Fail
                return redirect(reverse('contact')+'?fail')

    return render(request, 'contact/contact.html', {'form': contac_form})  