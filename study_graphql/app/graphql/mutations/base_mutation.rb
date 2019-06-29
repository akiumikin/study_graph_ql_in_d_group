class Mutations::BaseMutation < GraphQL::Schema::RelayClassicMutation
  include Authority
  class_attribute :_model
  
  def self.model(klass)
    self._model = klass
  end
end
