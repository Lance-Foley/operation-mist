class Forecast
  @projects = Project.all
  @jobs_array = []

  def self.all_jobs

  end

  def self.start_year_of_project(project)
    return project.start_date.year
  end

  def self.end_year_of_project(project)
    return project.end_date.year
  end

  def self.days_in_month
    @start_day = Project.first.start_date.day
    @end_of_month = Project.first.start_date.end_of_month.day
    @days_in_start_month = @end_of_month - @start_day
    return @days_in_start_month
  end

  def self.days_in_end_month
    @end_day = Project.first.end_date.day
    @start_of_month = Project.first.end_date.at_beginning_of_month.day
    @days_in_end_month = @end_day - @start_of_month
    return @days_in_end_month
  end

  def self.duration_of_project(project)
    return @duration = (project.end_date.to_date - project.start_date.to_date).to_i
  end

  def self.cost_per_day(project)
    return @cost_per_day = project.total_cost_per_day
  end

  def self.first_month(project)
    return @first_month = project.start_date.strftime("%B")
  end

  def self.end_month(project)
    return @end_month = project.end_date.strftime("%B")
  end

  #returns cost per month
  #
  # TODO Not all months are rendering
  def self.month_cost(year, month, day)
    @month = Date.new(year, month, day)
    @month_days = day
    @date = @month.between?(@projects.first.start_date, @projects.first.end_date)

    if @date
      if @month.month == @projects.first.start_date.month
        @days = (@month - @projects.first.start_date).to_i
        return @days * @projects.first.total_cost_per_day
      elsif @month.month == @projects.first.end_date.month
        @days = (@month - @projects.first.end_date).to_i
        if @days > 0
          return @days * @projects.first.total_cost_per_day
        else
          return @projects.first.total_cost_per_day * @month_days
        end
      else
        return @month_days * @projects.first.total_cost_per_day
      end
    else
      return 0
    end

  end

end
