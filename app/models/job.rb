class Job < ApplicationRecord
  require 'date'
  has_one :project, autosave: true

  # enum crew: {"Field 3": 3, "Design": 16, "Planned Home Maintenance": 13, "Admin": 15, "Marketing": 14,
  #             "Project Lead": 12, "Field 1": 1, "Field 2": 10, "Arch-Design": 9, "Field 4": 8,
  #             "Interior-Design": 7, "Cabinet_Design": 6, "Shop": 5}


  # today = Time.now.midnight.to_datetime
  # # three_months_from_now = today + 91.205
  # # six_months_from_now = today + 182.5
  # # nine_months_from_now = today + 273.75
  # twelve_months_from_now = today + 365
  #
  # after_initialize calculate_hours_in_set_month_period(twelve_months_from_now, :twelve_month_hours)
  private def create_or_update(touch: nil, **)


    #todo Fix Division 3 month workload and weeks break when job is same day
    self.weeks = (end_date.to_datetime - start_date.to_datetime).to_f / 7
    # @hourPerWeek = self.hours_per_week = (man_hours / weeks).to_f
    # Checks if Weeks is less then one. Gets Hours Per week
    if weeks < 1
      self.hours_per_week = man_hours
    else
      self.hours_per_week = (man_hours / weeks).to_f
    end
    today = Time.now.midnight.to_datetime
    three_months_from_now = today + 91.205
    six_months_from_now = today + 182.5
    nine_months_from_now = today + 273.75
    twelve_months_from_now = today + 365
    end_date_minus_today = end_date.to_datetime - today
    start_date_minus_today = start_date.to_datetime - today
    # @Field_Months_Remaining = Job.where(crew_id: [1, 2, 3, 4]).sum(:twelve_month_hours) / Employee.where(crew_id: [1, 2, 3, 4]).sum(:man_hours_twelve_months)

    ####################################################################################
    # Checks if Job is Complete then Calculates E_rating
    if (completed == true)
      self.e_rating =  (man_hours / actual_worked_hours).to_f.round(2) * 100
    else
      self.e_rating = 0.0
    end
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
    if start_date.beginning_of_day == end_date.beginning_of_day
      if today > end_date
        self.hours_remaining = 0
      else
        self.hours_remaining = man_hours
      end
    elsif today > start_date.to_datetime
      if (week_remaining * hours_per_week) < 0
        self.hours_remaining = 0
      else
        if weeks > 1
          self.hours_remaining = (week_remaining * hours_per_week)
        else
          self.hours_remaining = man_hours
        end
      end
    else
      if weeks > 1
        self.hours_remaining = (week_remaining * hours_per_week)
      else
        self.hours_remaining = man_hours
      end
    end

    ###################################################################################
    # Calculate Hours In Three Months
    if today > start_date.to_datetime and week_remaining > 0
      if end_date.to_datetime > three_months_from_now
        self.three_month_hours = ((three_months_from_now - today).to_f / 7 * hours_per_week)
      elsif end_date.to_datetime < three_months_from_now
        self.three_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.three_month_hours = hours_remaining
      end
    else
      if today < start_date.to_datetime
        if weeks == 0 and start_date.to_datetime > today and end_date.to_datetime < three_months_from_now
          self.three_month_hours = hours_remaining
        elsif end_date.to_datetime > three_months_from_now and
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
    if today > start_date.to_datetime and week_remaining > 0
      if end_date.to_datetime > six_months_from_now
        self.six_month_hours = ((six_months_from_now - today).to_f / 7 * hours_per_week).round(1)
      elsif end_date.to_datetime < six_months_from_now
        self.six_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.six_month_hours = 0
      end
    else
      if today < start_date.to_datetime
        if weeks == 0 and start_date.to_datetime > today and end_date.to_datetime < six_months_from_now
          self.six_month_hours = hours_remaining
        elsif end_date.to_datetime > six_months_from_now and
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
    if today > start_date.to_datetime and week_remaining > 0
      if end_date.to_datetime > nine_months_from_now
        self.nine_month_hours = ((nine_months_from_now - today).to_f / 7 * hours_per_week).round(2)
      elsif end_date.to_datetime < nine_months_from_now
        self.nine_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.nine_month_hours = 0
      end
    else
      if today < start_date.to_datetime
        if weeks == 0 and start_date.to_datetime > today and end_date.to_datetime < nine_months_from_now
          self.nine_month_hours = hours_remaining
        elsif end_date.to_datetime > nine_months_from_now and
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
    # Calculate Hours In Twelve Months
    if today > start_date.to_datetime and week_remaining > 0
      if end_date.to_datetime > twelve_months_from_now
        self.twelve_month_hours = ((twelve_months_from_now - today).to_f / 7 * hours_per_week).round(2)
      elsif end_date.to_datetime < twelve_months_from_now
        self.twelve_month_hours = end_date_minus_today.to_f / 7 * hours_per_week
      else
        self.twelve_month_hours = 0
      end
    else
      if today < start_date.to_datetime
        if weeks == 0 and start_date.to_datetime > today and end_date.to_datetime < twelve_months_from_now
          self.twelve_month_hours = hours_remaining
        elsif end_date.to_datetime > twelve_months_from_now and
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


