# Yonda?

## サービス概要
絵本を読み聞かせした時の記録を家族、友人などと共有できるアプリケーションです。<br>
また、タイムラインを通してどのような絵本が読まれているのか、リアルタイムで確認できます。

## このサービスへの思い・作りたい理由
自分の子供が絵本が大好きで、たくさんの絵本を読み聞かせてきました。<br>
自分で読んだ絵本はもちろん、家族が読んだ絵本などの記録も残したいと思い、
このアプリを開発することにしました。<br>
また、他のご家庭でどのような絵本、どのようなタイミングで読み聞かせているのか気になったので、家族だけでなく、友人などでも共有できるようにしました。

## ユーザー層について

小さいお子様がいるご家庭向け。<br>
年齢層は特になし。

## サービスの利用イメージ

絵本選びに困った時や、読み聞かせのモチベーションが上がらない時などに利用してもらいます。利用されている皆さんの読み聞かせ記録を見ることで、モチベーションの向上になります。

## ユーザーの獲得について

最初は何人かの友人家庭で使用してもらい、その次は友人周りのご家庭でも使用してもらえればと思っています。<br>
また、使用するときのハードルを下げる為、ゲストとしてサービスを利用できるようにする予定です。

## サービスの差別化ポイント・推しポイント

年齢別での絵本の検索機能を持たせようと思っています。また、絵本の詳細ページにて、どの年齢のお子さんに読まれているのか、棒グラフなどの目で見て分かりやすい表示を追加します。<br>
方法としては、家族情報を登録する際に、子供の年齢も入力してもらい、読み聞かせ記録を登録するタイミングで読み聞かせた子供を選択することで年齢別の統計をとることができます。

## 機能候補
### MVPリリース
- ユーザー登録
  - 家族登録
  - 子供登録
- ログイン機能
  - ログアウト機能
- ユーザー情報編集
  - メールアドレス変更
  - パスワード変更
- 絵本登録（My本棚の作成）
  - 絵本登録解除
- 絵本詳細画面でのコメント機能
  - コメント編集
  - コメント削除
- 絵本読み聞かせ記録登録
  - 読み聞かせ記録の編集、削除
  - タグ付け機能
- 絵本検索（Google Books API, ページネーション）
- My本棚の表示
- お問い合わせフォーム

### 本リリース
- ユーザー登録
  - 家族登録
    - 家族招待機能
- ユーザー情報編集
  - 編集画面リンク付きのメール送信機能
    - メールアドレス変更
    - パスワード変更
- 絵本読み聞かせ記録
  - 登録家族への通知
- 絵本検索
  - マルチ検索・オートコンプリート
  - 年齢での検索
  - タグ検索
- 絵本詳細画面での年齢別統計
- トップページでのランキング表示
- タイムライン表示
  - いいね機能
- フォロー機能（家族、ユーザー）

## 機能の実装方針予定
- Google Books APIを使用しての絵本情報の取得
