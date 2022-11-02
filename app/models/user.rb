class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_secure_password
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{8,32}\z/i  #https://techtechmedia.com/password-validate-expression/ で確認
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX
                       }  #, message: "パスワードは半角8~32文字のアルファベット・数字それぞれ１文字以上含む必要があります" を入れたい
                       
  has_many :projects
end
