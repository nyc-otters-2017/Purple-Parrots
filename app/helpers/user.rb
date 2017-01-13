def passwords_match?(password1, password2)
  if password1 == password2
    @password = password1
  else
    ## error for not matching
  end
end


def find_user(id)
  @user = User.find(id)
end


def email_hash(user)
  @hash = Digest::MD5.hexdigest(@user.email.downcase)
end
