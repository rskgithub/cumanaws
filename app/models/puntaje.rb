class Puntaje
  include Mongoid::CumanawsBase
  
  field :espera, type: Intger, default: 0
  field :activo, type: Integer, default: 0
  
  belongs_to :cuenta
  
end