require 'rails_helper'

shared_context 'with failure authentication user' do
  let(:token) { build(:user).create_new_auth_token }
  let('HTTP_ACCESS_TOKEN') { token['access-token'] }
  let('HTTP_TOKEN_TYPE') { token['token-type'] }
  let('HTTP_CLIENT') { token['client'] }
  let('HTTP_EXPIRY') { token['expiry'] }
  let('HTTP_UID') { token['uid'] }
end
