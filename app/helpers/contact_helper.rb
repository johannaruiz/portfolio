# frozen_string_literal: true

# Helper methods for contact-related functionality
module ContactHelper
  def obfuscate_email(email)
    email.chars.map { |char| "\\u#{char.ord.to_s(16).rjust(4, '0')}" }.join
  end

  def obfuscate_text(text)
    text.gsub('@', '[at]').chars.map { |char| "\\u#{char.ord.to_s(16).rjust(4, '0')}" }.join
  end

  def contact_by_email(email, text)
    # obfuscated_email = obfuscate_email(email)
    # obfuscated_text = obfuscate_text(text)
    # mail_to_href = "javascript:location='mailto:#{obfuscated_email}';void 0"
    # mail_to_text = "<script type=\"text/javascript\">document.write('#{obfuscated_text}')</script>"
    # TODO: Refactor to not use html_safe rubocop:disable Rails/OutputSafety rubocop:enable Rails/OutputSafety
    #
    # old_link = link_to(mail_to_text.html_safe, mail_to_href.html_safe, rel: :noopener, target: :_blank, title: 'Say HEY!')
    #
    mail_to(email, text, subject: 'Hello from the internet',
                         body: 'The sender of this email agrees to give Johanna 1 Million Dollars (muah ah ah ah)')
  end

  def contact_by_phone
    phone_to t('phone').gsub(/[^\d+]/, ''),
             number_to_phone(t('phone'), delimiter: '-', area_code: true),
             country_code: '1',
             target: :_blank,
             title: 'Call Johanna',
             rel: :noopener,
             class: 'phone-link'
  end
end
