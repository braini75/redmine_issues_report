# Hooks for the Redmine-Plugin redmine_issue_report
# 
# Author:: Thomas Koch

# This class holds all hooks for redmine_issue_report

class IssuesReportHook < Redmine::Hook::ViewListener
  
  # Creates hook for redmine_issue_report at bottom of a project issue view
  def view_issues_index_bottom(context={})
    if !context[:project].nil? && !context[:issues].empty?
      ret_str = ''
      ret_str << '<p class="other-formats">' << l(:label_link_description)
      ret_str << content_tag('span', link_to(l(:label_link_quick_name),
                                            { :controller => 'issues_report', :action => 'generate', :project_id => context[:project], :query_id => context[:query] },
                                            { :rel => 'nofollow', :title => l(:label_link_quick_tooltip) }))
      #ret_str << content_tag('span', link_to(l(:label_link_quick_name)+' as pdf', :controller => 'detailed_export', :action => 'export_current', :format => 'pdf', :project_id => context[:project], :query_id => context[:query]))
      ret_str << '</p>'

      return ret_str.html_safe
    end
  end
end