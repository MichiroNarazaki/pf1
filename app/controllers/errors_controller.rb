class ErrorsController < ApplicationController
  layout 'application'

  rescue_from StandardError, with: :render500
  rescue_from ActionController::RoutingError, with: :render404
  rescue_from ActiveRecord::RecordNotFound, with: :render404

  def show; end

  def render404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if exception
    render template: 'errors/404', status: :not_found, layout: 'error_layout'
  end

  def render500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception
    render template: 'errors/500', status: :internal_server_error, layout: 'error_layout'
  end

  def show
    raise request.env['action_dispatch.exception']
  end
end
