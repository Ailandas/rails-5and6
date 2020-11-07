class UserController < ApplicationController
  skip_before_action :verify_authenticity_token



  def registracija

    @msg=params[:message]
    
  end

  def trinti
    user=User.new
    outcome=user.delete(params[:deletable_user_id])
    if outcome==true then
      redirect_to :controller => 'user', :action => 'naudotojai'
    end

  end
  
  def new
    user=User.new
    outcome=user.insertNew(params[:user][:email],params[:user][:password1],params[:user][:password2]) #Paduodu duomenis i modeli
    if outcome==true then #Ar sekmingai patalpinta
    newUser=User.new(email:params[:user][:email],password:params[:user][:password1]) #Jei patalpinta issisaugau i sesija
    session[:user]=newUser
    redirect_to :controller => 'user', :action => 'naudotojas' #jei gerai viskas redirektinu i naudotojas
    else
      redirect_to :controller => 'user', :action => 'registracija', :message => "slaptažodžiai turi sutapti ir turi būti nuo 6 iki 20 simboliu" 
    end
  end

  def prisijungti
    @msg=params[:message]
  end
  def validation
    user=User.new
    outcome=user.validate(params[:user][:email],params[:user][:psw])
    if outcome!=nil then
      session[:user] = outcome
    redirect_to :controller => 'user', :action => 'naudotojas'
    else 
    redirect_to :controller => 'user', :action => 'prisijungti', :message => "Neteisingas prisijungimas"
    end
  end

  def atsijungti
  session[:user]=nil
  redirect_to :controller => 'user', :action => 'prisijungti'
  end

  def naudotojas
    @msg=params[:message] #Parodo ar sekmingas ar ne atnaujinimas
  end

  def atnaujinti
    user=User.new
    rez=user.atnaujinti(params[:user][:oldPassword],params[:user][:newPassword],session[:user]["id"]) #Paduodu i modeli update reiksmes
    if rez==true then
      redirect_to :controller => 'user', :action => 'naudotojas', :message => "Slaptažodis atnaujintas sėkmingai" #Redirect jei ok
    else 
      redirect_to :controller => 'user', :action => 'naudotojas', :message => "Blogas senas slaptažodis" #Pranesu, kad bad
    end
  end

  def naudotojai
    user=User.new
    @users=user.visiNaudotojai
    @msg=params[:message]
    
  end

  def getuser
    user=User.new
    @userData=user.getuser(params[:search_email])
    
    
  end

  def naudotojas
     if session[:user] == nil then
      redirect_to :controller => 'user', :action => 'registracija'
     else
      if session[:user]["userType"]==1 then
        redirect_to :controller => 'user', :action => 'naudotojai'
        
      end
    end
  end
end



 



