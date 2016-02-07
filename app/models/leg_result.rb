class LegResult
  include Mongoid::Document
  field :secs,  type: Float
  
  after_initialize :calc_ave
  
  embedded_in :entrant
  embeds_one  :event, as: :parent

  validates_presence_of :event

  def calc_ave
    #subclasses will calc event-specific ave
  end

  def secs= value
    self[:secs] = value
    calc_ave
  end
end