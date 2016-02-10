# This Main Controller of the Redmine-Plugin redmine_issue_report
# 
# Author:: Thomas Koch

# This Main Controller of the Redmine-Plugin redmine_issue_report

class IssuesReportController < ApplicationController
  
  helper :sort
  include SortHelper
  helper :queries
  include QueriesHelper
  helper :issues
  include IssuesHelper
  helper :journals
  helper :custom_fields
  include CustomFieldsHelper
  
  # generate a detailed ticketlist from current projekt and send to render
  #
  # TODO: add support for other formats only html support yet
   
  def generate   
    @project=Project.find(params[:project_id])
    retrieve_query    
    logger.info "Anzahl aus Query: #{@query.issue_count} Projekt: #{@project}"
    sort_init(@query.sort_criteria.empty? ? [['id', 'desc']] : @query.sort_criteria)
    sort_update(@query.sortable_columns)
    if @query.valid?
      @limit = per_page_option
      @query.sort_criteria = sort_criteria.to_a
      @issue_count = @query.issue_count
      @issue_pages = Paginator.new @issue_count, @limit, params['page']
      @offset ||= @issue_pages.offset
      @issues = @query.issues(:include => [:assigned_to, :tracker, :priority, :category, :fixed_version],
                              :order => sort_clause,
                              :offset => @offset,
                              :limit => @limit)
      @issue_count_by_group = @query.issue_count_by_group           
    end

    respond_to do |format|
      format.html { render :template => 'issues_report/report_list' }      
    end
  end

end