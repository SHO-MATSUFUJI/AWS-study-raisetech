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
3. **ポート番号の検証テスト**(SSH、8080ポート)
4. **EC2のインスタンスタイプの検証テスト**
5. **EC2のAMIの検証テスト**(ハードコーティング　→　動的取得での検証に変更)

### テスト結果

`terraform test`を実行し、正常にパスすることを確認しました。

PS C:\dev\Github\AWS-study-raisetech\terraform-test-lecture40> terraform test
tests\compute_test.tftest.hcl... in progress
  run "verify_port_number"... pass
tests\compute_test.tftest.hcl... tearing down
tests\compute_test.tftest.hcl... pass
tests\network_test.tftest.hcl... in progress
  run "verify_vpc_cidr_block"... pass
tests\network_test.tftest.hcl... tearing down
tests\network_test.tftest.hcl... pass

Success! 2 passed, 0 failed.
