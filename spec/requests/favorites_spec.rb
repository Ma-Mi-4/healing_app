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

  describe "GET /favorites" do
    context "お気に入りが登録されている場合" do
      let!(:favorite1) { Favorite.create!(message: "明日はまた違う景色が見えるかもしれません") }
      let!(:favorite2) { Favorite.create!(message: "何もしない時間も、大切なひとときです") }

      it "お気に入り一覧画面が表示される" do
        get favorites_path

        expect(response).to have_http_status(:ok)
        expect(response.body).to include("お気に入り一覧")
      end

      it "登録済みのメッセージが表示される" do
        get favorites_path

        expect(response.body).to include(favorite1.message)
        expect(response.body).to include(favorite2.message)
      end

      it "登録件数が正しく表示される" do
        get favorites_path

        expect(response.body).to include("登録件数：2件")
      end
    end

    context "お気に入りが登録されていない場合" do
      it "登録件数が0件と表示される" do
        get favorites_path

        expect(response.body).to include("登録件数：0件")
      end

      it "お気に入りが未登録であることを知らせるメッセージが表示される" do
        get favorites_path

        expect(response.body).to include("お気に入りはまだ登録されていません。")
      end
    end
  end
end
