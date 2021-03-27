# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# メインのサンプルユーザーを1人作成する
User.create!(name: 'ろうじ',
             email: 'admin@example.com',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true,
             activated: true,
             guest: false,
             activated_at: Time.zone.now)
User.create!(name: 'ゲスト',
             email: 'guest@example.com',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: false,
             activated: true,
             guest: true,
             activated_at: Time.zone.now)
# 追加のユーザーをまとめて生成する
user_num = 18
user_num.times do |n|
  gimei = Gimei.name
  name = case n % 6
         when 1
           gimei.last.hiragana
         when 2
           gimei.last.kanji
         when 3
           gimei.last.romaji
         when 4
           gimei.first.hiragana
         when 5
           gimei.first.kanji
         else
           gimei.first.romaji
         end
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               guest: false,
               activated_at: Time.zone.now)
end
posts = [{ 'title' => '【美容】肌綺麗選手権',
           'content' => '1週間かけて自身の肌を綺麗にする対決。審査員として専門家を呼んでどの人の肌が1番綺麗かを決める。お金をどれだけかけてもよいので、お金をかけるとどうなるのかも気になるポイント' },
         { 'title' => '【美容】肌汚い選手権',
           'content' => '1週間かけて自身の肌を汚くする対決。審査員として専門家を呼んでどの人の肌が1番汚いかを決める。不摂生をしたり、お金をかけて汚くしてみたり。お金をかけるとどうなるのかも気になるポイント。' },
         { 'title' => '【ドッキリ】しばゆー、作ったものは自分で食え！',
           'content' => '料理対決では毎回ゲテモノを作りがちなしばゆーに料理対決と言っていつもどおり作ってもらい、しばゆーに完食してもらう企画。' },
         { 'title' => '【大討論】大の大人がガチでディベートしてみた',
           'content' => '3vs3でチームを組み、パワポなど資料作成し本気で討論してみる。オーディエンスをzoomなどを使って募り勝敗を決める。' },
         { 'title' => '【怪文書】解かれたら負け、ツイートバトル',
           'content' => 'Twitterで怪文書を一斉にツイートし、解かれたら負け、というシンプルなバトル。外注して怪文書を作る人もいて欲しい。' },
         { 'title' => '【オタク】好きなものプレゼン',
           'content' => '自分が好きなものについてプレゼンをしてみんなにハマらせるバトル。' },
         { 'title' => '【筋肉】プロテインってどれくらいすごいの？',
           'content' => '筋トレを1ヶ月続けてもらい、筋肉量がどれくらい増えるのかを検証する。その際プロテインを使用可能なペアと不可のペアを用意してプロテインはどれだけ効率が良いのかを検証する企画。' },
         { 'title' => 'メントスコーラ2021',
           'content' => 'YouTuberの登竜門であるメントスコーラ。芸能人も参入してきたことにより年々激化するYouTube市場。擦られまくったメントスコーラを最も面白くできるYouTuberこそ今年のYouTubeを獲るのではないのか？コーラとメントスを使い新たなメントスコーラを作るような企画。' },
         { 'title' => '【男のロマン】秘密基地選手権',
           'content' => '子供の頃夢だった秘密基地を大金かけて作る企画。最後はクレーン車使って一気に壊す。クリエイターの個性が光る企画' },
         { 'title' => '誰風の何？DIYクイズ！',
           'content' => '「誰」と「何」を紙に描き(ヒカキン、イス)一人一人DIYする対決。最後はクイズ形式で「誰」と「何」を当てるような企画' },
         { 'title' => 'ネタ会議で大喜利してみた',
           'content' => '出オチだと思うネタは多々あると思うので、それで大喜利をして欲しいwww' },
         { 'title' => '【失礼】茶道部のお茶vs綾鷹',
           'content' => '茶道部ガチ勢にきてもらいお茶を立ててもらう。綾鷹と飲み比べてどっちがどっちなのかを当てるゲーム' },
         { 'title' => 'この箸の持ち方誰？利き箸持ち！！',
           'content' => '人気Youtuberの食事中の手元を写して、誰なのかを当てるクイズ形式の企画。' },
         { 'title' => '【激エモ】利き元カノ',
           'content' => 'ある質問に対してメンバーの各元カノに回答してもらい、メンバーがこれは俺の元カノかも、というのを当てるゲーム。元カノと連絡が取れるかがカギ。' },
         { 'title' => '本気で殺陣してみた',
           'content' => 'プロの人に殺陣を教わってそれで1本動画を撮るという企画。複数動画が完成しそう。(入り&練習編&締め、作成した殺陣の動画)' },
         { 'title' => '【利き編集】編集、これ誰っぽい？',
           'content' => 'メンバーが他のYouTuberの編集を真似て動画を編集し、これはあのYouTuberを真似てるんだ！と当てるようなクイズ企画。色々なクリエイターの名前が使えるのでSEO的にも良いかも?' },
         { 'title' => '概要欄でメッセージ書いたらバレるの？',
           'content' => '概要欄で暗号やメッセージを書いて実はこんなことしてました、と視聴者にバラす企画。視聴者巻き込み型の企画' }]
# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(18)
i = 0
posts.each do |post|
  title = post['title']
  content = post['content']
  users[i % user_num].microposts.create!(title: title, content: content)
  i += 1
end

i = 0
microposts = Micropost.all
users = User.all
microposts.each do |post|
  id = post.id
  users.each do |user|
    i += 1
    next if (i % 5).zero?
    next if (i % 7).zero?

    user.likes.create(micropost_id: id)
  end
end
