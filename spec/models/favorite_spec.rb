require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'バリデーション' do
    it 'メッセージが存在する場合、有効であること' do
      favorite = Favorite.new(message: 'ひと息つきましょう')

      expect(favorite).to be_valid
    end

    it 'メッセージが空の場合、無効であること' do
      favorite = Favorite.new(message: '')

      expect(favorite).not_to be_valid
    end
  end

  describe '保存' do
    it 'お気に入りデータを保存できること' do
      favorite = Favorite.new(message: '明日はまた違う景色が見えるかもしれません')

      expect(favorite.save).to be true
      expect(Favorite.last.message).to eq('明日はまた違う景色が見えるかもしれません')
    end
  end
end
