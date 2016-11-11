class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  #   def welcome_email(user)
  #     @user = user
  #     @url  = 'localhost:3000/orders/:id'
  #     mail(to: @user.email, subject: 'Jungle Order Receipt')
  #   end

  def order_receipt_email(order)
    @order = order
    mail(to: 'ty2kim@gmail.com', subject: "Jungle Order Receipt for #{@order.id}")
  end
end
