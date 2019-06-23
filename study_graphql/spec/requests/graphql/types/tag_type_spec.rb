require 'rails_helper'

RSpec.describe '【tag_type query via user】', type: :request do
  let!(:user) { FactoryBot.create(:user, :tags) }

  context 'tagsの取得の場合' do
    before do
      query = <<-QUERY
        {
          user(id: "#{user.id}") {
            id
            tags {
              id
              name
              createdAt
              updatedAt
            }
          }
        }
      QUERY
      @post = post(graphql_path, params: { query: query })
      @json = JSON.parse(response.body, symbolize_names: true)
    end

    it 'tagsの[id, name, createdAt, updatedAt]が返ること' do
      res_data = @json[:data][:user][:tags]
      expect_data = graphql_format(user.tags)

      expect(@post).to eq 200
      expect(res_data).to eq expect_data
    end
  end
end

# 他のfield越しに取得可能な場合には増やす
# RSpec.describe 'tag_type query via xxxx', type: :request do
#   let!(:xxxx) { FactoryBot.create(:xxxx) }
# end
