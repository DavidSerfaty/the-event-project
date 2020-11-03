class UserMailer < ApplicationMailer
  default from: 'david@owanted.io'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://the-event-project.herokuapp.com/'
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def welcome_event(attendant)
    @owner = attendant.event.owner
    @event  = attendant.event
    mail(to: @owner.email, subject: 'Bienvenue chez nous !')
  end
end
