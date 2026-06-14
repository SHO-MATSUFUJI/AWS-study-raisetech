# Lecture40 インフラ環境の自動テスト～Terraform built-in test～

※注記:このTerraformコードを使うには事前にS3バケットを作成する必要があります。

---

## 実装内容

Terraformで構築したインフラ環境をbuilt-in testを利用し、インフラテストを実装・実施しました。  

### 動作確認環境

- **Terraform本体**: v1.14.7
- **OS/CPU**:Windows/amd64
- **AWS Provider**: v6.40.0

### テスト項目

【使用コマンド】`terraform test` 

1. **VPCのCidr blockの検証テスト**
2. **各サブネットのCidr blockの検証テスト**（パブリック1a/1c、プライベート1a/1c）

### テスト結果

`terraform test`を実行し、正常にパスすることを確認しました。

PS C:\dev\Github\AWS-study-raisetech\terraform-test-lecture40> terraform test
tests\network_test.tftest.hcl... in progress
  run "verify_vpc_cidr_block"... pass
tests\network_test.tftest.hcl... tearing down
tests\network_test.tftest.hcl... pass

Success! 1 passed, 0 failed.