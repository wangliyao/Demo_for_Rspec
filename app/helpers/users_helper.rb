module UsersHelper
  def find_name(id)
  name = ''
  if id.present?
    user =  User.find_by_id(id)
    if user.present?
     name =  user.name
   else
     name = '游客'
    end
  else
    name = '游客'
  end

  name
end
end
