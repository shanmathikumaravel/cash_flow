class AuthenticateUser
	prepend SimpleCommand

	def initialize(email, password)
		@email = email
		@password = password		
	end

	def call
    if user = get_user
		  {token: JsonWebToken.encode(user_id: user.id, type: 'user'), user: user }
    end
	end

  private

  attr_accessor :email, :password

  def get_user
    user = nil
    user = User.where(email: @email).first
    return user if user && user.authenticate(@password)
    error = user.present? ?  "Email or Password are incorrect" : "Email not found"
    errors.add :error, error
  end
end