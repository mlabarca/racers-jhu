class SwimResult < LegResult
  field :pace_100, type: Float
  
  def calc_ave
    self[:pace_100] = (secs * 100) / event.meters if event && secs
  end
end