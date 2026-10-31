require 'rails_helper'

RSpec.describe "Period", type: :request do
  describe "GET /period/index" do
    it "正常に表示されること" do
      get period_index_path

      expect(response).to have_http_status(:ok)
    end

    it "タイトルと季節別メッセージが表示されること" do
      get period_index_path

      expect(response.body).to include("季節のひと息メッセージ")

      messages = PeriodController::SPRING_MESSAGES +
                 PeriodController::SUMMER_MESSAGES +
                 PeriodController::AUTUMN_MESSAGES +
                 PeriodController::WINTER_MESSAGES

      expect(messages).to include(
        Nokogiri::HTML(response.body).at_css(".message").text.strip
      )
    end
  end
end
