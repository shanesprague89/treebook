class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable

    
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    def full_name
        first_name + " " + last_name
    end
    
    def sign_up
        default_params.permit(:first_name, :last_name, :profile_name)
    end
    
    #NO FUCKING CLUE>>
    #sign_in ( Devise::SessionsController)
    #sign_up ( Devise::RegistrationsController )
    #account_update ( Devise::RegistrationsController )
    #<<NO FUCKING CLUE
    
    
    #This doesn't work anymore! Now, with Devise, you need strong parameters!     
    #attr_accessible :email, :password, :password_confirmation, :remember_me,
    #:first_name, :last_name, :profile_name
                    
    #has_many :statuses
   
end
