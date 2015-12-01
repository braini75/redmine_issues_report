if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match 'issues_report_generate',via: [:get, :post], :to => 'issues_report#generate'    
    match 'issues_report_generate_pdf',via: [:get, :post], :to => 'issues_report#generate', :format => 'pdf'
    match 'projects/:project_id/issues_report_generate',via: [:get, :post], :to => 'issues_report#generate'
    match 'projects/:project_id/issues_report_generate_pdf',via: [:get, :post], :to => 'issues_report#generate', :format => 'pdf' 
  end
end