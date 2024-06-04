class ApplicationController < ActionController::Base
  def top
  end

  def about
  end

  # def create
  # # ログイン処理の実装
  #  if current_user.admin?
  #    redirect_to admin_items_path
  #  else
  #    redirect_to items_path
  #  end
  # end

  # def destroy
  # # ログアウト処理の実装
  #  if current_user.admin?
  #    redirect_to new_admin_session_path
  #  else
  #    redirect_to new_customer_session_path
  #  end
  # end

end
