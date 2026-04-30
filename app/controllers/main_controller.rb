class MainController < ApplicationController
   MESSAGES = [
    "今日はよく頑張りました",
    "ゆっくり深呼吸してみましょう",
    "あなたのペースで大丈夫です",
    "温かい飲み物を飲んでみませんか？",
    "少し肩の力を抜いてみましょう",
    "ここまで来ただけでも十分すごいです"
  ]
  def index
     @message = MESSAGES.sample
  end
end
