class ApplicationController < ActionController::API
  set_current_tenant_by_subdomain_or_domain(:account, :subdomain, :domain)
end
