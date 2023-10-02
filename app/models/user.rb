class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :uid, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :admin, inclusion: { in: [true, false] }

  def self.create_new_user(params, uid)
    user = nil
    begin
      Rails.logger.info "Creating a new user with uid: #{uid} and name: #{params[:username]} and params: #{params}"  # ログにuidとnameを出力
      ActiveRecord::Base.transaction do
        user = User.create!(uid: uid, name: params[:username])
      end

      return { status: 'success', message: 'User created successfully.', user: user }
    rescue => e
      Rails.logger.error "User creation failed: #{e.message}"
    end
  end
end