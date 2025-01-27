## UIKit のすゝめ

### UIKit とは

UIKit は iOS アプリを開発する上で中核となるフレームワークです。UI と名のつくように UI パーツが多く提供されており、UIViewController や UIButton などよく聞く名前が並びます

以下によく使うコンポーネントを書き下します。

- UIViewController

  - 画面を表示する際に必要になるクラスです。これを用意して present するところから全ての iOS アプリは始まるといっても過言ではありません

- UIView

  - UI コンポーネントの最小単位(だと勝手に思ってます)のクラスです。大体画面に表示されているコンポーネントはこいつのサブクラスです。それゆえカスタマイズ性は無限大

- UILabel
- UITextFiled
- UITextView

  - 文字列を表示するためのコンポーネント、UILabel は表示のみ。UITextFiled と UITextView は文字列の表示と入力ができます。UITextFiled は一般的に 1 行表示で、UITextView は複数行表示の時に使います.

- UIImage
- UIImageView

  - 画像を表示するためのコンポーネント。UIImage は画像そのもの、UIImageView はその Image を表示させるためのクラスです。

- UIScrollView

  - スクロールのためのコンポーネント。スクロールさせたい。拡大させたい場合はこいつを使う

- UITableView
- UICollectionView

  - リスト表示のためのコンポーネント、UITableView は垂直方向へ特化したリスト、UICollectionView はリストやグリッドが作れます。そのため極端にシンプルにしたいという要望がない限り UICollectionView で作り、コンポーネントの再利用を考えた方が良いでしょう。

- UIStackView
  - コンポーネントをまとめるためのコンポーネント。子要素に応じて自動で shrink したり grow したりしてくれる最強のやつ。とりあえずこいつを使いこなせたら初心者脱却
