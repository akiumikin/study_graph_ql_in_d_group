# study_graph_ql_in_d_group

## 目的
リポジトリオーナーの周辺の人たちとGraphQL-Rubyの使い方の勉強をすることが目的  

## 当面の目標
graph-qlにて下記の操作をかけるようになること  
1. queryによる"単一のテーブルの情報"の取得
1. queryによる"1対多の関係の情報"の取得（graph-ql batch）
1. queryによる"多対多の関係の情報"の取得（graph-ql batch）
1. mutationによる"単一のテーブルのCRUD"
1. mutationによる"１対多の関係のテーブルのCRUD"
1. その他、やろうかなって思ったことをやる

## 仕様

### 環境
Ruby 2.6.3  
Rails 5.2.3  
GraphQl-ruby 1.9.6  
Docker + docker-compose  

### テーブル構成
ここに雑に書いてみた
https://docs.google.com/presentation/d/1wXCPmpWFswAdv4UvA8YFB3msqDl7BgAJLmwXudOVfIQ/edit#slide=id.p

なにも考えずに、userにtagつけるようにしちゃった...
普通ならblogにtagな気がするけど勉強用だしこのままにしておく

## 環境構築編

リポジトリにfirst_commitを入れる  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/1  
  
Dockerfileとdocker-compose.ymlの生成 〜 railsプロジェクトの作成まで  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/2  
  
マウントディレクトリの修正（rails new . --api で直下に作成している場合は多分不要）  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/4  
  
mysql設定  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/5  
  
railsサーバーの起動  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/8  

binding.pryを入れる
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/15  
  
## テーブル作成
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/6

## graph-ql（graph-ql batch未使用の場合）
graph-qlの初期設定（graph-ql batchはまだ先）  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/3  
  
デバッグ画面のためgraphiqlを入れる  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/9  

フロントからのqueryに対してuserテーブルのレコードデータを返す
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/10  
  
1対多のリレーションデータを合わせて取得できるようにする（user ⇨ blogs）  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/11  

多対多のリレーションデータを合わせて取得できるようにする（user ⇨ 中間テーブル ⇨ tags）  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/12  

userを複数同時に取得できるようにする（graph-qlのn+1問題）  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/13 

## graph-ql batchを入れる
userテーブルからのリレーションテーブルへの参照にgraph ql batchを使うようにする  
https://github.com/akiumikin/study_graph_ql_in_d_group/pull/14  
