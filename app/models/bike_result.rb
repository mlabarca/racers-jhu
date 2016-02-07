class BikeResult < LegResult
  field :mph, type: Float
  
  def calc_ave
    self[:mph] = 1.0 # Dummy number
  end
end