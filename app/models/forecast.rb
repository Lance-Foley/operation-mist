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

  def self.month_cost(date, project)
    @project = project
    @month = date
    @client = Client.where(id: project.client_id).first&.name
    @month_days = @month.day
    @date = @month.between?(@project.start_date, @project.end_date)

    if @date
      if @month.month == @project.start_date.month
        @days = @month.day - @project.start_date.day
        @total = @days * @project.total_cost_per_day
        value = [Date::MONTHNAMES[@month.month], @total, @project.name, @client]
      elsif @month.month == @project.end_date.month
        @days = @project.end_date.day
        @total = @days * @project.total_cost_per_day
        value = [Date::MONTHNAMES[@month.month], @total, @project.name, @client]
      else
        @total = @month_days * @project.total_cost_per_day
        value = [Date::MONTHNAMES[@month.month], @total, @project.name, @client]
      end
    else
      value = [Date::MONTHNAMES[@month.month], 0, @project.name, @client]
    end

    return @jobs_array.push(value)
  end

  def self.projects(project)
    @jobs_array = []
    year = Time.now.year
    @month = Date.new(year, 1, -1)
    @month_days = @month.day

    i = 12
    while i > 0 do
      month_cost(@month, project)
      i = i - 1
      @month = @month + 1.month
    end
    return @jobs_array
  end

  def self.month_value
    @projects.each do |project|

      i = 12
      while i > 0 do
        value = Forecast.projects(project)[i][1]
        i = i -1
      end

    end
  end

end
