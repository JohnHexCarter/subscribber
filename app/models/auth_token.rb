# frozen_string_literal: true

class AuthToken
  def self.key
    Rails.application.credentials.secret_key_base
  end

  def self.token(user)
    payload = { user_id: user.id }
    JWT.encode payload, key, 'HS256'
  end

  def self.verify(token)
    result = JWT.decode token, key, true, { algorithm: 'HS256' }
    log = Logger.new(STDOUT)

    log.debug result

    return if result.empty?
    User.find_by(id: result[0]['user_id'])
  end
end
