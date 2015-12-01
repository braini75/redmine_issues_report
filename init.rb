Redmine::Plugin.register :redmine_issues_report do
  name 'Detailed Report of Issues'
  author 'Thomas Koch'
  description 'This Redmine plugin offers a detailed report of multiple issues.'
  version '0.1'
  url 'https://github.com/braini75/redmine_issues_report'
  author_url 'https://github.com/braini75'
  require 'issues_report_hooks'
end
