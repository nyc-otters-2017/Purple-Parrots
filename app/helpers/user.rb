def passwords_match?(password1, password2)
  if password1 == password2
    @password = password1
  else
    @password_error = "Passwords do not match"
  end
end


def find_user(id)
  @user = User.find(id)
end


def email_hash(user)
  @hash = Digest::MD5.hexdigest(user.email.downcase)
end
