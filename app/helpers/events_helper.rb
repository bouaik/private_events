module EventsHelper
  def event_errors(event)
    render 'events/errors', event: event, model: 'event' if event.errors.any?
  end
end
