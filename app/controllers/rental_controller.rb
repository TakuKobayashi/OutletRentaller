class RentalController < BaseController
  def reserve
    @resister = RentalRegister.create!(user_agent: request.env["HTTP_USER_AGENT"])
    session[:token] = @resister.token
  end

  def new
    @rental_resister = RentalRegister.find_or_initialize_by(token: session[:token], user_agent: request.env["HTTP_USER_AGENT"])
    @rental_resister.token = SecureRandom.hex if @rental_resister.token.blank?
    @language = params[:language] || "ja"
    @phone_number = params[:phone_number]
  end

  def regist
    if session[:token].blank?
      token = params[:rental_register][:token]
    else
      token = session[:token]
    end
    update_params = params[:rental_register]
    update_params.delete(:token)
    user = nil
    RentalRegister.transaction do
      rental_resister = RentalRegister.find_or_initialize_by(token: token)
      rental_resister.update!(update_params)
      if rental_resister.phone_number[0] == "0"
        rental_resister.phone_number = "+81" + rental_resister.phone_number[1..rental_resister.phone_number.length]
        rental_resister.save!
      end
      rental_resister.rentaling!
      user = User.find_or_initialize_by(rental_register_id: rental_resister.id)
      user.update!(language: params[:language])
    end

    redirect_to regist_comlete_rental_url(token: user.token)
  end

  def regist_comlete
    @user = User.find_by!(token: params[:token])
  end
end
