# frozen_string_literal: true

# Helper Methods for Intro specific view functionality
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

  def fun_intro
    content_tag :div, class: 'attention-intro' do
      concat(combined_line)
      concat(content_tag(:p, t('home.intro.part_2')))
    end
  end

  def serious_intro
    content_tag :div, class: 'serious-intro' do
      concat(content_tag(:p, t('home.content.part_1')))
      concat(anchored_line)
      concat(content_tag(:p, t('home.content.part_3')))
    end
  end

  def combined_line
    content_tag :p do
      concat(t('home.intro.part_1'))
      concat(hellip)
    end
  end

  def anchored_line
    content_tag :p do
      concat(t('home.content.part_2'))
      concat(skills_link)
    end
  end

  def skills_link
    link_to('(See Skills)', '#skills', data: { turbo: false })
  end

  def hellip
    '&hellip;'.html_safe
  end
end
