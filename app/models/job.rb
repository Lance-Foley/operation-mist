class Job < ApplicationRecord

  def save(**)

    self.weeks = (end_date.to_datetime - start_date.to_datetime).to_f / 7
    self.hours_per_week = (man_hours / weeks).to_f
    today = (Time.now.midnight.to_datetime)
    three_months_from_now = today + 91.205
    six_months_from_now = today + 182.5
    nine_months_from_now = today + 273.75
    twelve_months_from_now = today + 365
    end_date_minus_today = end_date.to_datetime - today
    start_date_minus_today = start_date.to_datetime - today
    @Field_Months_Remaining = Job.where(crew: ["Field 1", "Field 2", "Field 3", "Field 4"]).sum(:twelve_month_hours) / Employee.where(crew: ["Field 1", "Field 2", "Field 3", "Field 4"]).sum(:man_hours_twelve_months)
    ###################################################################################
    # Calculate Weeks Remaining
    if today > start_date.to_datetime
      if ((end_date.to_datetime - Time.now.midnight.to_datetime).to_f / 7) < 0
        self.week_remaining = 0
      else
        self.week_remaining = ((end_date.to_datetime - Time.now.midnight.to_datetime).to_f / 7)
      end
    else
      self.week_remaining = weeks
    end
    ##################################################################################
    # Calculate Hours Remaining
    if today > start_date.to_datetime
      if (week_remaining * hours_per_week) < 0
        self.hours_remaining = 0
      else
        self.hours_remaining = (week_remaining * hours_per_week)
      end
    else
      self.hours_remaining = (weeks * hours_per_week)
    end

    ###################################################################################
    # Calculate Hours In Three Months
    if today > start_date.to_datetime
      if end_date.to_datetime > three_months_from_now
        self.three_month_hours = ((three_months_from_now - today).to_f / 7 * hours_per_week)
      elsif end_date.to_datetime < three_months_from_now
        self.three_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.three_month_hours = 0
      end
    else
      if today < start_date.to_datetime
        if end_date.to_datetime > three_months_from_now and
          start_date.to_datetime < three_months_from_now and
          week_remaining != 0
          self.three_month_hours = ((three_months_from_now - start_date.to_datetime).to_f / 7 * hours_per_week)
        elsif end_date.to_datetime < three_months_from_now and
          start_date.to_datetime < three_months_from_now and
          week_remaining != 0
          self.three_month_hours = hours_remaining
        else
          self.three_month_hours = 0
        end
      else
        self.three_month_hours = 0
      end
    end

    ###################################################################################
    # Calculate Hours In Six Months
    if today > start_date.to_datetime
      if end_date.to_datetime > six_months_from_now
        self.six_month_hours = ((six_months_from_now - today).to_f / 7 * hours_per_week).round(1)
      elsif end_date.to_datetime < six_months_from_now
        self.six_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.six_month_hours = 0
      end
    else
      if today < start_date.to_datetime
        if end_date.to_datetime > six_months_from_now and
          start_date.to_datetime < six_months_from_now and
          week_remaining != 0
          self.six_month_hours = ((six_months_from_now - start_date.to_datetime).to_f / 7 * hours_per_week).round(1)
        elsif end_date.to_datetime < six_months_from_now and
          start_date.to_datetime < six_months_from_now and
          week_remaining != 0
          self.six_month_hours = hours_remaining
        else
          self.six_month_hours = 0
        end
      else
        self.six_month_hours = 0
      end
    end

    ##################################################################################
    # Calculate Hours In Nine Months
    if today > start_date.to_datetime
      if end_date.to_datetime > nine_months_from_now
        self.nine_month_hours = ((nine_months_from_now - today).to_f / 7 * hours_per_week).round(2)
      elsif end_date.to_datetime < nine_months_from_now
        self.nine_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.nine_month_hours = 0
      end
    else
      if today < start_date.to_datetime
        if end_date.to_datetime > nine_months_from_now and
          start_date.to_datetime < nine_months_from_now and
          week_remaining != 0
          self.nine_month_hours = ((nine_months_from_now - start_date.to_datetime).to_f / 7 * hours_per_week).round(2)
        elsif end_date.to_datetime < nine_months_from_now and
          start_date.to_datetime < nine_months_from_now and
          week_remaining != 0
          self.nine_month_hours = hours_remaining
        else
          self.nine_month_hours = 0
        end
      else
        self.nine_month_hours = 0
      end
    end

    ###########################################################################
    # # Calculate Hours In Twelve Months
    if today > start_date.to_datetime
      if end_date.to_datetime > twelve_months_from_now
        self.twelve_month_hours = ((twelve_months_from_now - today).to_f / 7 * hours_per_week).round(2)
      elsif end_date.to_datetime < twelve_months_from_now
        self.twelve_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.twelve_month_hours = 0
      end
    else
      if today < start_date.to_datetime
        if end_date.to_datetime > twelve_months_from_now and
          start_date.to_datetime < twelve_months_from_now and
          week_remaining != 0
          self.twelve_month_hours = ((twelve_months_from_now - start_date.to_datetime).to_f / 7 * hours_per_week).round(2)
        elsif end_date.to_datetime < twelve_months_from_now and
          start_date.to_datetime < twelve_months_from_now and
          week_remaining != 0
          self.twelve_month_hours = hours_remaining
        else
          self.twelve_month_hours = 0
        end
      else
        self.twelve_month_hours = 0
      end
    end

    # ##########################################################################
    super

  end
end

