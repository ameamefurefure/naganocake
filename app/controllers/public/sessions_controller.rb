# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    customers_path(current_customer.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  def customer_state#退会しているかを判断するメソッド
    #[処理1]入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    
    #アカウントを取得できなかった場合、このメソッドを終了
    return if !@customer
    
    #[処理2]取得したアカウントのパスと入力されたパス一致しているかを判別
    #if @customer.valid_password?(paramas[:customers][:password]) 
      #if @customer.is_active == false
        #redirect_to new_customer_registration_path
      #else
        #return
      #end
    #end
    
    if @customer.valid_password?(paramas[:customers][:password]) && @customer.is_active == false
      redirect_to new_customer_registration_path
    else
      return
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_in_params
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
  #end
end
