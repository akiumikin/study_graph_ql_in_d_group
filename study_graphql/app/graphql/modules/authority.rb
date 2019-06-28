# base_queryおよびbase_mutationで権限処理をする際の共通処理

module Authority
  def self.agent_forbidden?(lst, context, association_name)
    return false unless context[:agent]
    lst[:agent_forbidden].include?(association_name)
  end

  def self.forbidden_value(association_name, klass)
    # graphqlのフィールドは lower camel のため変換
    camel_association_name = association_name.to_s.camelize(:lower)

    # firldがnilを許容していればnilで返す
    return nil unless klass.fields[camel_association_name].type.non_null?
    # firldがnil不可のStringなら0を返す
    return '' if klass.fields[camel_association_name].type.of_type == GraphQL::Types::String
    # firldがnil不可のIDならなら0を返す
    return 0 if klass.fields[camel_association_name].type.of_type == GraphQL::Types::ID
    
    raise '権限を所有してない時の戻り値が設定されていないタイプのfield設定です'
  end

  def forbidden_mutation(context, action_name)
    prefix_text = action_name.present? ? "#{action_name}は" : ''
    raise "#{prefix_text}エージェントには使用できない機能です" if context[:agent]
    # raise "#{prefix_text}ユーザーには使用できない機能です" if context[:user]
  end
end