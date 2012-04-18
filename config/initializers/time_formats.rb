# Customized Time String Formats
# Example Usage:  message.created_at.to_s(:event_post_date)

Time::DATE_FORMATS[:month_name]         = "%b"        # Abbreviated Month Name
Time::DATE_FORMATS[:weekday_name]       = "%A"        # Full weekday name
Time::DATE_FORMATS[:day_of_month]       = "%d"        # Day of month
Time::DATE_FORMATS[:event_time]         = "%I:%M%p"   # Time 12-hour clock time format
Time::DATE_FORMATS[:event_pub_date]     = "%m/%d/%Y"  # Common date format Month / Day / Year


