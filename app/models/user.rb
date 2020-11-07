class User < ApplicationRecord
    validates :password, presence: true
    validates :email, presence: true
    validates :password, length: { in: 6..20 } #Validacija
   def insertNew(email1,pasw1,pasw2)
        newUser=User.new(email:email1,password:pasw1,userType:false) #susikuriu objekta
        if newUser.valid? then #jei tinkami parametrai issisaugau duomenu bazeje
            if pasw1==pasw2 then
                newUser.save
                return true
            else
                return false
            end
        
        else
            return false
        end

        
   end

   def validate(email,password)
    users=User.all
     users.each do |n|
     if password==n.password and email==n.email then
       
        return n
     end
    end
    return nil
   end

   def atnaujinti(oldPassword,newPassword,user_id)
    user = User.find_by(id: user_id) #Susirandu duomenu bazeje
   
        if oldPassword==user.password then #jei slaptazodi sena gerai ivede
            user.update(password:newPassword) #atnaujinu
            return true; #grazinu, kad viskas oke
        end
   
    
        return false #klaida, nerado

   end

   def visiNaudotojai
    user_array=[]
    User.all.each do |user|
        user_array << user
      end
      return user_array
   end
   def delete(user_id) #trinimo metodas
    
    user=User.find_by(id:user_id) #surandu paspausto userio id
    user.destroy #user destroy
    return true #grazinu viskas gerai
   end
    
   def getuser(user_email)
    user=User.find_by(email:user_email)
    return user

   end
end
