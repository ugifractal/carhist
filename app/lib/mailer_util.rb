class MailerUtil
  class << self
    def with_admin_emails
      ENV.fetch("ADMIN_EMAILS").split(",").map(&:strip).each do |email|
        yield email
      end
    end
  end
end
