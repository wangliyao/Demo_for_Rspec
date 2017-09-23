class User < ActiveRecord::Base
  include BCrypt

  validates_uniqueness_of :name

  def self.message(phone, flag)
    #conn = Faraday.new(:url=>'https://sms.yunpian.com/')
    info = rand(9999)
    user = User.find_by(:name => phone)
    if flag == 'login'
      if user.present?
        user.update_attributes(:code => info)
      else
        info = '该账号未注册'
      end
    else
      User.create(:name => phone, :code => info)
    end

    #response = conn.post do |req|
    #  req.url '/v2/sms/single_send.json'
    #  req.body = {"apikey": '###',"mobile": "#{phone}","text": "【运维服务系统】您的订单编号：#{info},物流信息：#{info}"}
    #end
    return info
  end


  def password_hash
    @password ||= Password.new(password)
  end

  def password_hash=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end
end
