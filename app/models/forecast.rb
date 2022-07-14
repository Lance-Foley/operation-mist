class Forecast
  @projects = Project.all
  @jobs_array = []
  @all_jobs_array = []

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
    @date = @month.between?(@project.start_date, @project.end_date)
    @year = @month.year

    if @month.month === @project.start_date.month and @month.month === @project.end_date.month and @month.year === @project.end_date.year and @month.year === @project.start_date.year
      @total = @project.cost + @project.sub_cost
      value = [Date::MONTHNAMES[@month.month], @total, @project.name, @client]
    elsif @date
      if @month.month === @project.start_date.month
        @days = @month.day - @project.start_date.day + 1
        @total = @days * @project.project_cost_per_day
        value = [Date::MONTHNAMES[@month.month], @total, @project.name, @client]
      else
        @total = @month.day * @project.project_cost_per_day
        value = [Date::MONTHNAMES[@month.month], @total, @project.name, @client]
      end
    elsif @month.month === @project.end_date.month
      @days = @project.end_date.day
      @total = @days * @project.project_cost_per_day
      value = [Date::MONTHNAMES[@month.month], @total, @project.name, @client]
    else
      value = [Date::MONTHNAMES[@month.month], 0, @project.name, @client]
    end

    return @jobs_array.push(value)
  end

  def self.projects(project)
    year = Time.now.year
    @jobs_array = []
    i = 1
    m = 0
    while i < 13 do
      @month = Date.new(year, i, -1)
      month_cost(@month, project)
      monthly_totals(@jobs_array)
      m = m + 1
      i = i + 1
    end
    return @jobs_array
  end

  def self.monthly_totals(jobs)
    @all_jobs_array.push(jobs)
    return @all_jobs_array
  end
end
