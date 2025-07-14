class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin

  private

  def ensure_admin
    # Por enquanto, apenas usuários logados podem acessar admin
    # Você pode ajustar essa lógica depois
    redirect_to root_path unless user_signed_in?
  end
end