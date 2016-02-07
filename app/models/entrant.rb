class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: "results"
  
  field :bib,     type: Integer
  field :secs,    type: Float
  field :o,       type: Placing,  as: :overall
  field :gender,  type: Placing,  as: :gender
  field :group,   type: Placing,  as: :group

  embeds_many :results, class_name: 'LegResult', order: [:"event.o".asc], after_add: :update_total
  

  def update_total(result)
    self.secs = results.map(&:secs).sum
  end
end
