class RunResult < LegResult
  field :mmile, type: Float, as: :minute_mile
  
  def calc_ave
    self[:minute_mile] = (secs/60)/event.miles if event && secs
  end
end