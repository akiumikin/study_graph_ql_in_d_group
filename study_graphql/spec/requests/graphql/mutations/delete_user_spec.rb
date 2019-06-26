require 'rails_helper'

RSpec.describe '【delete_user mutation】', type: :request do
  let!(:user) { FactoryBot.create(:user) }

  context 'Userの削除の場合' do
    before do
      mutation = <<-MUTATION
        mutation {
          deleteUser(input: {
            id: "#{user.id}"
          }) {
            user {
              id
              name
              createdAt
              updatedAt
            }
            errorMessage  
          }
        }
      MUTATION
      @post = post(graphql_path, params: { query: mutation })
      @json = JSON.parse(response.body, symbolize_names: true)
    end

    it '削除したUserのattributesが返ること' do
      res_data = @json[:data][:deleteUser][:user]
      expect_data = graphql_format(user)

      expect(@post).to eq 200
      expect(res_data).to eq expect_data
    end
  end

  context '存在しないUserの削除の場合' do
    before do
      mutation = <<-MUTATION
        mutation {
          deleteUser(input: {
            id: 999999
          }) {
            user {
              id
              name
              createdAt
              updatedAt
            }
            errorMessage  
          }
        }
      MUTATION
      @post = post(graphql_path, params: { query: mutation })
      @json = JSON.parse(response.body, symbolize_names: true)
    end

    it '削除後のUserが返らずエラーメッセージが存在すること' do
      res_data = @json[:data][:deleteUser][:user]
      error_message = @json[:data][:deleteUser][:errorMessage]
      expect_data = nil

      expect(@post).to eq 200
      expect(res_data).to eq expect_data
      expect(error_message.present?).to eq true
    end
  end
end
