# frozen_string_literal: true

# Helper methods for intro-related functionality
module IntroHelper
  def portfolio_name
    "#{t('name.first')} #{t('name.last')}"
  end

  def job_title
    t('job_title')
  end

  def portfolio_tagline
    t('job_tag')
  end
end
