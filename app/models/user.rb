class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable

    
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    def full_name
        first_name + " " + last_name
    end
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :profile_name, presence: true, uniqueness: true, format: {
                                            with: /a-zA-Z0-9_-/,
                                            message: 'Must be formatted correctly.'
                                            }
    
    has_many :statuses
    
    def sign_up
        default_params.permit(:first_name, :last_name, :profile_name)
    end
end
