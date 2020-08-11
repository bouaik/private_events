module EventsHelper
  def event_errors(event)
    render 'events/errors', event: event if event.errors.any?
  end
end
