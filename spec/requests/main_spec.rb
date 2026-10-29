
require 'rails_helper'

RSpec.describe "Main", type: :request do
  describe "GET /main/index" do
    it "正常に表示されること" do
      get main_index_path

      expect(response).to have_http_status(:ok)
    end

    it "タイトルと挨拶、メッセージが表示されること" do
      get main_index_path

      expect(response.body).to include("癒されたいあなたへ")
      expect(response.body).to match(/おはようございます|こんにちは|こんばんは/)
      expect(response.body).to include('<div class="message">')
    end
  end
end
