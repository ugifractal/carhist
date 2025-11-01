# frozen_string_literal: true

require "will_paginate/view_helpers/link_renderer"
require "will_paginate/view_helpers/action_view"

class CarhistTurboRenderer < WillPaginate::ActionView::LinkRenderer
  protected

  def previous_or_next_page(page, text, classname, aria_label = nil)
    if page
      link(text, page, class: classname, "aria-label": aria_label, "data-page": page, "data-controller": "event-dispatch", "data-action": "click->event-dispatch#sendEvent", "data-event-name": "page-changed", "data-event-param": { page: page }.to_json)
    else
      tag(:span, text, class: "#{classname} disabled", "aria-label": aria_label)
    end
  end

  def page_number(page)
    if page == current_page
      tag(:em, page, class: "current")
    else
      link(page, "#", { rel: rel_value(page), class: "px-3", "data-page": page, "data-controller": "event-dispatch", "data-action": "click->event-dispatch#sendEvent", "data-event-name": "page-changed", "data-event-param": { page: page }.to_json })
    end
  end
end
