Redmine::Plugin.register :redmine_issues_report do
  name 'Detailed Report of Issues'
  author 'Thomas Koch'
  description 'This Redmine plugin offers a detailed report of multiple issues.'
  version '1.0'
  url 'https://github.com/braini75/redmine_issues_report'
  author_url 'https://github.com/braini75'  
  require_dependency File.expand_path('../lib/issues_report_hooks', __FILE__)
end
