require 'githubchart'

module Jekyll
  class GitHubChartTag < Liquid::Tag

    def initialize(tag_name, github_username, tokens)
      super
      @github_username = github_username.strip
    end

    def render(context)
      GithubChart.new(user: github_user(context), colors: custom_chart_color_scheme).render(:svg_only_chart)
    end

    def custom_chart_color_scheme
      ['#ffffff', '#d6e685', '#8cc665', '#44a340', '#1e6823']
    end

    def github_user(context)
      context[@github_username] || @github_username
    end
  end
end

Liquid::Template.register_tag('githubchart', Jekyll::GitHubChartTag)
