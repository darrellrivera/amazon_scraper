class ItemMailer < ActionMailer::Base
  default from: "from@example.com"

  def notify_price_below_target(item, current_price)
    @item = item
    @user = item.user
    @current_price = current_price

    mail(:to => @user.email,
         :subject => "Price below your target")
  end
end
