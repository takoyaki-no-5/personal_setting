# プログラム修正予定
../common/xxx
../common/yyyみたいになってるのを直す

Modifierkeyみたいな名前の関数強引に短くしたい

# 機能追加予定
## TODO
ESCキーのロジックが、現在は全てのアプリケーションでvimのescになってしまっている
Functionキー用のファイル
RunAs,Runを調査
ESCボタンでvimoffできるようにする imeも気をつけて
Mainの中にdefaultlayerも入れていいと思う

# スキャンコード
sc027 セミコロン
sc038 Alt
sc039 Space
sc079 変換キー
sc07b 無変換キー

# 記述ルール
_で終わる変数、関数は命名のみを目的とした変数、関数
リマップは、基本的にテンプレートに合わせて作る

## 造語
tap…単押し
hold…長押し
doble press…同じキーを2回連続で押すこと

physical…実際に押されたキー
injected…スクリプトが送ったキー

## テンプレート
#Requires AutoHotkey v2.0

;1段目
;q
;w
;e
;r 
;t
;y
;u
;i
;o
p

;2段目
;capslock
;a
;s
;d
;f
;g
;h
;j
;k
;l
;; 

;3段目
;z
;c
;v
;x
;b
;n
;m
;,
;.
;/


