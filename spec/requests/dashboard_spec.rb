require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  describe "GET /" do
    it "正常に表示されること" do
      get root_path

      expect(response).to have_http_status(:ok)
    end

    it "タイトルとメニューが表示されること" do
      get root_path

      expect(response.body).to include("ひと息メッセージ")
      expect(response.body).to include("時間帯別のメッセージ")
      expect(response.body).to include("時期別のメッセージ")
      expect(response.body).to include("お気に入り一覧")
    end
  end
end
