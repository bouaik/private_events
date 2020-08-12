module UsersHelper
  def user_errors(user)
    render 'events/errors', event: user, model: 'user' if user.errors.any?
  end
end
