# 命名規則及び、基本文法

## 命名規則で使われる記法一覧

|記法名|例|備考|
|:-----------|:------------|:------------|
|スネークケース|example_case|すべて小文字で複合語のスペースをアンダースコアで区切る。|
|ローワーキャメルケース|exampleCase|先頭を小文字で書き始め、複合語のスペースをなくし要素の先頭は大文字にする|
|アッパーキャメルケース|ExampleCase|先頭を大文字で書き始め、複合語のスペースをなくし要素の先頭は大文字にする|
|パスカルケース|ExampleCase|アッパーキャメルケースと同じ|

## 基本文法
基本文法は以下の通りである。

- インデントはスペース2文字にする。タブは使わない。
    - カリキュラムの設定を初期設定のところをしっかりやっているなら、タブキーを一回押すとスペースを２回押したことになっているはずなので、ここは気にしなくて良い
    - 設定できているかどうか確認したいならhttps://webkaru.net/dev/sublime-text-3-indent/をチェック
- 演算子の前後にはスペースを置く
- メソッドと丸かっこ()間にはスペースを置かない
- 不要な丸かっこ()は使わない
- ifを複数行で書くならthenは使わない
- ロケット記法(=>)は使わない

悪い例を示し、修正する形でその文法を示す。以下は悪い例である
```
class CommentsController<ApplicationController
   def index()
      @comment=Comment.find ( params[:id] )
      if(request.format==:xml) then
         render(:layout=>false)
      end
   end
end
```
- 全体: インデントがスペース3文字になってしまっている
- 1行目: <の前後にスペースがない
- 2行目: かっこは不要
- 3行目: =の前後にスペースがない
- 3行目: findメソッド後の丸かっこ(の前後にスペースがある
- 4行目: ==の前後にスペースがない
- 4行目: thenは不要
- 4行目: 丸かっこ()は不要
- 5行目: =>の前後にスペースがない
- 5行目: 丸かっこ()は不要
- 5行目: ロケット記法（=>）は使わない

上記を修正すると以下のようになる

```
class CommentsController < ApplicationController
  def index
    @comment = Comment.find(params[:id])
    if request.format == :xml
      render layout: "false"
    end
  end
end
```

## クラス、モジュール

**クラス名、モジュール名は原則UpperCamelCase。各単語の最初の文字は大文字、それ以外は小文字にする。`_`は使わない。単語に数字をつける際は隣接させる**

OK:

* `Groups`
* `ColorBar`
* `CoinServer`
* `TechExpert2019`

NG

* `GROUPS`
* `COLORBar`
* `Coin_Server`
* `Techexpert_2019`

**ただし、略字は大文字のままにする（場合もある）。**

OK:

* `HTMLBuilder`
* `SMTPServer`

**クラスやモジュールはネストできる。ネストした場合も命名規則は同様。**

OK:

* `MenuWindow::Color`
* `HogeService::Item`


## メソッド

**メソッド名は小文字で`_`区切り(いわゆるsnake_case)。単語に数字をつける際は隣接させる**

OK:

* `find_items`
* `all_children`

NG:

* `findItems`
* `find_Items`
* `FindItems`
* `Find`

**いわゆるアクセサには`get`や`set`はつけない。**

OK:

* `name`
* `family_name`

NG:

* `get_name`
* `getName`

**真偽値(trueとかfalse)を返すメソッドには`?`をつける。`is`や`has`を頭につけたり、`p`を最後につけたりはしない。**

OK:

* `user?`
* `permitted?`
* `clicked?`

NG:

* `is_user`
* `is_user?`
* `user_p`
* `is_clicked`

**破壊的でないメソッドと破壊的なメソッドがある場合、破壊的メソッド名の末尾には感嘆符!を置くことで区別する**
```
BAD 破壊的メソッドに対応する非破壊的メソッドがない

class Person
  def update!

  一定の処理

  end
end

# 良好　破壊的メソッドに!が記述されており、破壊的メソッドに対応する非破壊的メソッドがある
class Person
  def update!

  一定の処理

  end

  def update

  一定の処理

  end
end
```

## 変数およびシンボルネーム

**命名ルール自体は基本的にメソッド名と同じ。ぱっと見ではメソッドと区別がつかない場合もある。単語に数字をつける際は隣接させる**

OK:

* `names`
* `:member_age`
* `cart_item`
* `order_id`
    * `order_id`を`oid`のように省略しすぎるのは非推奨。とはいえ例えばPostgreSQLのOIDは`oid`としても構わない。

NG:

* `cartItem`
* `:MemberAge`
* `order_Id`

**例外的に短い名前が使われるものもあるが、あくまで例外で、どちらかと言うと長めの命名の方が多い。**

OK:

* `i`, `j`
    *  ループカウンタやインデックス用。 `books.each_with_index{|item, i| ... }` などのように使う。
* `x`, `y`, `z`
    * 座標用。

## 定数

**定数は全部大文字で`_`区切り。単語に数字をつける際は隣接させる**

OK:

* `FIGURE_X_SIZE`
* `MAX_WIDTH`

NG:

* `Figure_X_Size`
* `MaxWidth`

参考：https://qiita.com/yimajo/items/a3fac0026c07ec538fc2

参考：https://techracho.bpsinc.jp/hachi8833/2017_02_13/35364
