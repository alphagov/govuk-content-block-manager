Time::DATE_FORMATS[:long_ordinal_with_at] = ->(time) { [time.strftime("%e %B %Y").strip, time.strftime("%l:%M%P").strip].join(" at ") }
