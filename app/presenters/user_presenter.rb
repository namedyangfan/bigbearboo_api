class UserPresenter < BasePresenter
  def basic_hash
    {
      user_id:    id,
      user_name:  name,
      email: email
    }
  end

  def auth_hash
    {
      user_id:    id,
      user_name:  name,
      email: email,
      token: remember_token,
      role: @model.role.name
    }
  end
end
