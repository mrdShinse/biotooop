f = File.open("#{Rails.root}/config/mail.yml")
config = YAML.load(f)[Rails.env]
ActionMailer::Base.add_delivery_method(
    :ses,
    AWS::SES::Base,
    {
        access_key_id: config['access_key_id'],
        secret_access_key: config['secret_access_key']
    }
)