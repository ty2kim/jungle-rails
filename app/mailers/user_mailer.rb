class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  #   def welcome_email(user)
  #     @user = user
  #     @url  = 'localhost:3000/orders/:id'
  #     mail(to: @user.email, subject: 'Jungle Order Receipt')
  #   end

  def order_receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Jungle Order Receipt for #{@order.id}")
    # if you fix the order info
    # mail(to: @order.email, subject: "Jungle Order Receipt for #{@order.id}")
  end

  # def receive(email)
  #   byebug
  #   page = Page.find_by(address: email.to.first)
  #   page.emails.create(
  #     subject: email.subject,
  #     body: email.body
  #   )
  # end
end
