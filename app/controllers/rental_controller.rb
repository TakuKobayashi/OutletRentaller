class RentalController < BaseController
  def reserve
    @resister = RentalRegister.create!(user_agent: request.env["HTTP_USER_AGENT"])
    session[:token] = @resister.token
  end

  def new
    @rental_resister = RentalRegister.find_or_initialize_by(token: session[:token], user_agent: request.env["HTTP_USER_AGENT"])
    @language = params[:language] || "ja"
    @phone_number = params[:phone_number]
  end

  def regist
    rental_resister = RentalRegister.find_or_initialize_by(token: session[:token])
    rental_resister.update!(params[:rental_register])
    user = User.find_or_initialize_by(rental_register_id: rental_resister.id)
    user.update!(language: params[:language])

    redirect_to regist_comlete_rental_url(token: user.token)
  end

  def regist_comlete
    @user = User.find_by!(token: params[:token])
  end
end
