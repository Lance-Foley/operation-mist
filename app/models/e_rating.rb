class ERating
  @total_hours_company_bid_hours = 0
  @jobs = Job.all

  def self.division(division)
    @bid_hours = 0
    @actual_hours = 0

    @jobs.each do |job|
      if job.completed == true and job.division_name == division
        @bid_hours = @bid_hours + job.man_hours
        @actual_hours = @actual_hours + job.actual_worked_hours
      end
    end
    if @bid_hours == 0 and @actual_hours == 0
      @e_rating = 0
    else
      @e_rating = @bid_hours / @actual_hours * 100
    end
    return @e_rating.round(2)
  end

  def self.project(project)
    @bid_hours = 0
    @actual_hours = 0

    @jobs.each do |job|
      if job.project_id == project.id and job.completed === true
        @bid_hours = @bid_hours + job.man_hours
        @actual_hours = @actual_hours + job.actual_worked_hours

      end
    end
    if @bid_hours === 0 and @actual_hours === 0
      @e_rating = 0
    else
      @e_rating = @bid_hours / @actual_hours * 100
    end
    return @e_rating.round(2)

  end

  def self.crew(crew)
    @bid_hours = 0
    @actual_hours = 0

    @jobs.each do |job|
      if job.crew_id == crew.id and job.completed == true
        @bid_hours = @bid_hours + job.man_hours
        @actual_hours = @actual_hours + job.actual_worked_hours

      end
    end
    if @bid_hours == 0 and @actual_hours == 0
      @e_rating = 0
    else
      @e_rating = @bid_hours / @actual_hours * 100
    end
    return @e_rating.round(2)

  end
end