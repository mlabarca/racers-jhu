class Racer
  include Mongoid::Document
  embeds_one :info, class_name: 'RacerInfo', as: :parent, autobuild: true
  has_many :races, class_name: 'Entrant', foreign_key: 'racer.racer_id', 
    dependent: :nullify, order: :"race.date".desc
  before_create :initialize_id
  
  def initialize_id
    self.info.id = self.id
  end
end
