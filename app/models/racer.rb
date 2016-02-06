class Racer
  include Mongoid::Document
  embeds_one :info, class_name: 'RacerInfo', as: :parent, autobuild: true

  before_create :initialize_id
  
  def initialize_id
    self.info.id = self.id
  end
end
