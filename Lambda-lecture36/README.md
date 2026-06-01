# Lecture36 - AWS Lambda 
## 課題内容
Lambdaを活用したバックエンド処理を実装。

## 実施内容
- チュートリアル①:最初の Lambda 関数を作成する
- チュートリアル② Amazon S3 トリガーを使用して Lambda 関数を呼び出す
- チュートリアル③ Amazon S3 トリガーを使用してサムネイル画像を作成する
- チュートリアル④: API Gateway で Lambda を使用する ← 追加（推奨課題）

## 構成図
![構成図](lambda-s3-Thumbnail.png)


## スクリーンショット
### チュートリアル①
![関数作成](images/スクリーンショット_2026-05-31_142635.png)

### チュートリアル②③ S3トリガー
![Cloudwatchログ](images/スクリーンショット_2026-05-31_150024.png)
![サムネイル比較](images/スクリーンショット_2026-05-31_161958.png)

### チュートリアル④（推奨課題） API Gateway + Lambda + DynamoDB
![DynamoDB](images/スクリーンショット_2026-06-01_231350.png)
![curl実行結果](images/スクリーンショット_2026-06-01_231624.png)