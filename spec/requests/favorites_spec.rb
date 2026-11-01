require "rails_helper"

RSpec.describe "Favorites", type: :request do
  describe "POST /favorites" do
    let(:message) { "明日はまた違う景色が見えるかもしれません" }

    context "正常に登録できる場合" do
      it "お気に入りの件数が1件増える" do
        expect {
          post favorites_path, params: { message: message }
        }.to change(Favorite, :count).by(1)
      end

      it "登録したメッセージが保存される" do
        post favorites_path, params: { message: message }

        expect(Favorite.last.message).to eq(message)
      end

      it "時間帯別メッセージ画面にリダイレクトする" do
        post favorites_path, params: { message: message }

        expect(response).to redirect_to(main_index_path)
      end
    end

    context "登録に失敗する場合" do
      it "お気に入りの件数が増えず、エラーメッセージを表示する" do
        expect {
          post favorites_path, params: { message: "" }
        }.not_to change(Favorite, :count)

        expect(response).to redirect_to(main_index_path)
        expect(flash[:alert]).to eq("お気に入りに登録できませんでした")
      end
    end
  end
end
