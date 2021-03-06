# 勉強会 171015 - オブジェクト指向設計ガイド

## コンポジションについて

- is-a
- has-a
- behaves-like-a

<a href="https://gyazo.com/5931cde8557d6b53b07d93078b83a23e"><img src="https://i.gyazo.com/5931cde8557d6b53b07d93078b83a23e.png" alt="https://gyazo.com/5931cde8557d6b53b07d93078b83a23e" width="1037"/></a>

## 「is-a,has-a,behaves-like-a」選択の基準

- 継承とは特殊化です
- 継承が最も適しているのは過去のコードの大部分を使いつつ、新たなコードの追加が比較的少量のときに、既存のクラスに機能を追加する場合です
- 振る舞いが、それを構成するパーツの総和を上回るのならば、コンポジションを使いましょう

### is-aのメリット
- 「過去のコードの大部分を使いつつ、新たなコードの追加が比較的少量」
- 例：メリーゴーランド

### behave-like-a
- 「種類が多岐にわたるが同じ様な振る舞いを実装する場合」
- 例： ビッグサンダーマウンテン, スプラッシュマウンテン, スペースマウンテン, ダンボ
  - 待ち時間に関する振る舞い
  
### has-a
- 端的に
  - パーツの種類＜オブジェクトの種類
- 例：ショーのパレードのパレードカー
  - 構成要素は似通っているが、載せるパーツの組み合わせが膨大
