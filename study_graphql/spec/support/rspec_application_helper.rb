module RspecApplicationHelpers
  # テスト時にgraph-qlのレスポンスと比較するためのデータ整形
  def graphql_format(data)
    return if data.blank?

    if data.class.method_defined?(:map)
      data.map { |d| graphql_format(d) }
    else
      convert_data_for_graphql_format(data)
    end
  end

  private

  def convert_data_for_graphql_format(data)
    if data.class.superclass&.name == 'ApplicationRecord'
      hash = {}
      data.attributes.each { |k, v| hash[k.camelize(:lower).to_sym] = v.to_s }
      hash
    else
      data.to_s
    end
  end
end
