require 'rails_helper'

RSpec.describe 'user_type query', type: :request do
  let!(:user) { FactoryBot.create(:user) }

  context 'Userの取得（リレーションなし）の場合' do
    before do
      query = <<-QUERY
        {
          user(id: "#{user.id}") {
            id
            name
          }
        }
      QUERY
      @post = post(graphql_path, params: { query: query })
      @json = JSON.parse(response.body, symbolize_names: true)
    end

    it 'リクエストが200で返ること' do
      expect(@post).to eq 200
    end

    it '[id]が返ること' do
      expect(@json[:data][:user][:id].to_i).to eq user.id
    end

    it '[name]が返ること' do
      expect(@json[:data][:user][:name]).to eq user.name
    end
  end

  context 'Userの取得（blogs付き）の場合' do
    before do
      query = <<-QUERY
        {
          user(id: "#{user.id}") {
            id
            name
            blogs {
              id
            }
          }
        }
      QUERY
      @post = post(graphql_path, params: { query: query })
      @json = JSON.parse(response.body, symbolize_names: true)
    end

    it 'リクエストが200で返ること' do
      expect(@post).to eq 200
    end

    it 'blogsが返ること' do
      res_ids = @json[:data][:user][:blogs].pluck(:id)
      expect(res_ids.map(&:to_i)).to eq user.blogs.pluck(:id)
    end
  end

  context 'Userの取得（tags付き）の場合' do
    before do
      query = <<-QUERY
        {
          user(id: "#{user.id}") {
            id
            name
            tags {
              id
            }
          }
        }
      QUERY
      @post = post(graphql_path, params: { query: query })
      @json = JSON.parse(response.body, symbolize_names: true)
    end

    it 'リクエストが200で返ること' do
      expect(@post).to eq 200
    end

    it 'blogsが返ること' do
      res_ids = @json[:data][:user][:tags].pluck(:id)
      expect(res_ids.map(&:to_i)).to eq user.tags.pluck(:id)
    end
  end
end
