require 'rails_helper'

RSpec.describe '【user_type query】', type: :request do
  let!(:user) { FactoryBot.create(:user) }

  # リレーションのテストは各リレーション先のtype_spec
  context 'Userの取得の場合' do
    before do
      query = <<-QUERY
        {
          user(id: "#{user.id}") {
            id
            name
            createdAt
            updatedAt
          }
        }
      QUERY
      @post = post(graphql_path, params: { query: query })
      @json = JSON.parse(response.body, symbolize_names: true)
    end

    it 'Userのattributesが返ること' do
      res_data = @json[:data][:user]
      expect_data = graphql_format(user)

      expect(@post).to eq 200
      expect(res_data).to eq expect_data
    end
  end
end
