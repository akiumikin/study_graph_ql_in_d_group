require 'rails_helper'

RSpec.describe '【upsert_user mutation】', type: :request do
  let!(:user) { FactoryBot.create(:user) }

  context 'Userの作成の場合' do
    before do
      @name = "#{FFaker::NameJA.name}_created"
      mutation = <<-MUTATION
        mutation {
          upsertUser(input: {
            name: "#{@name}"
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

    it '作成後のUserのattributesが返ること' do
      res_data = @json[:data][:upsertUser][:user]
      error_message = @json[:data][:upsertUser][:errorMessage]
      expect_data = graphql_format(User.find(res_data[:id]))

      expect(@post).to eq 200
      expect(res_data).to eq expect_data
      expect(error_message).to eq nil
      # 作成の場合IDで期待値とレスポンスの相対が取れないためnameで代用
      expect(res_data[:name]).to eq @name
    end
  end

  context '更新可能なUserの更新の場合' do
    before do
      mutation = <<-MUTATION
        mutation {
          upsertUser(input: {
            id: "#{user.id}"
            name: "#{FFaker::NameJA.name}_updated"
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

    it '更新後のUserのattributesが返ること' do
      res_data = @json[:data][:upsertUser][:user]
      error_message = @json[:data][:upsertUser][:errorMessage]
      expect_data = graphql_format(user.reload)

      expect(@post).to eq 200
      expect(res_data).to eq expect_data
      expect(error_message).to eq nil
    end
  end

  context '存在しないUserの更新の場合' do
    before do
      mutation = <<-MUTATION
        mutation {
          upsertUser(input: {
            id: 999999
            name: "#{FFaker::NameJA.name}_updated"
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

    it '更新後のUserが返らずエラーメッセージが存在すること' do
      res_data = @json[:data][:upsertUser][:user]
      error_message = @json[:data][:upsertUser][:errorMessage]
      expect_data = nil

      expect(@post).to eq 200
      expect(res_data).to eq expect_data
      expect(error_message.present?).to eq true
    end
  end
end
