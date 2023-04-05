class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :status, :is_admin, :token, :type, :is_primary_user
  has_one :society
end
