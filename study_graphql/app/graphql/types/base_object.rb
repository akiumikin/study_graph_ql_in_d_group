class Types::BaseObject < GraphQL::Schema::Object
  include Authority
  class_attribute :_model

  def self.model(klass)
    self._model = klass
  end

  def self.field_config(lst)
    association_names = lst.values.inject(:+).uniq
    association_names.each do |association_name|
      define_method(association_name) do
        forbidden_value = Authority.forbidden_value(association_name, self.class)

        # agent_forbiddenの対象なら値を返さない
        return forbidden_value if Authority.agent_forbidden?(lst, context, association_name)
        # 値を返さない系の処理の対象外でpreloadが指定されてればload
        return load(association_name) if preload?(lst, association_name)
        
        object.send(association_name)
      end
    end
  end
  
  def load(association_name)
    AssociationLoader.for(self._model, association_name).load(object)
  end
  
  def run_preload(fiber, current_value = nil)
    response, return_value = fiber.resume(current_value)
    return return_value if response == :return
    response.then do |result|
      run_preload(fiber, result)
    end
  end

  private

  def preload?(lst, association_name)
    lst[:preload].include?(association_name)
  end
end

