# Lecture40 インフラ環境の自動テスト～Terraform built-in test～

※注記:このTerraformコードを使うには事前にS3バケットを作成し、 `terraform init` の backend 設定で変数で指定できるようにしてください。

#### **「backend設定手順」**

1. バックエンド用S3バケットの作成  
TerraformのState管理用S3バケットを事前に作成してください。

2. 初期化（terraform init）  
バックエンドのS3バケット名は、初期化時に `-backend-config` オプションを使って環境変数などから安全に指定します。  
【コマンド】`terraform init -backend-config="bucket=バケット名"`

---

## 実装内容

Terraformで構築したインフラ環境をbuilt-in testを利用し、インフラテストを実装・実施しました。  

### 動作確認環境

- **Terraform本体**: v1.14.7
- **OS/CPU**:Windows/amd64
- **AWS Provider**: v6.40.0

### テスト項目

---

- **各モジュールのコード値をテストします。**
  
  【使用コマンド】`terraform test`(全体同時テスト実行)

1. **VPCのCidr blockの検証テスト**
2. **各サブネットのCidr blockの検証テスト**（パブリック1a/1c、プライベート1a/1c）
3. **ポート番号の検証テスト**(SSH、8080ポート)
4. **EC2のインスタンスタイプの検証テスト**
5. **EC2のAMIの検証テスト**(ハードコーディング　→　動的取得での検証に変更)
6. **RDSのengine及びengine versionの検証テスト**
7. **RDSのインスタンスクラスの検証テスト**
8. **RDSのオプションの検証テスト  (skip_final_snapshot,backup_retention_period,delete_automated_backups)**
9. **ALBのinternal設定の検証テスト**
10. **ALBのロードバランサータイプの検証テスト**
11. **ALBのターゲットグループのポート番号及びプロトコルの検証テスト**
12. **AWS WAFの名前およびscopeの検証テスト**
13. **CloudWatchのアラーム名及び各項目の検証テスト  (comparison_operator,evaluation_periods,metric_name,name_space)**

---


- **特定モジュールのみ個別テスト実行します。**

  【使用コマンド】`terraform test -filter="tests\alb_test.tftest.hcl"`(`-filter`オプション　※例albモジュールの実行コマンド※)

---

- **レッドグリーンテストの実施。**

---

### テスト結果

- `terraform test`を実行し、正常にパスすることを確認しました。

```text
PS C:\dev\Github\AWS-study-raisetech\terraform-test-lecture40> terraform test
tests\alb_test.tftest.hcl... in progress
  run "verify_alb"... pass
tests\alb_test.tftest.hcl... tearing down
tests\alb_test.tftest.hcl... pass
tests\compute_test.tftest.hcl... in progress
  run "verify_port_number"... pass
tests\compute_test.tftest.hcl... tearing down
tests\compute_test.tftest.hcl... pass
tests\monitoring_test.tftest.hcl... in progress
  run "verify_monitoring"... pass
tests\monitoring_test.tftest.hcl... tearing down
tests\monitoring_test.tftest.hcl... pass
tests\network_test.tftest.hcl... in progress
  run "verify_vpc_cidr_block"... pass
tests\network_test.tftest.hcl... tearing down
tests\network_test.tftest.hcl... pass
tests\security_test.tftest.hcl... in progress
  run "verify_security"... pass
tests\security_test.tftest.hcl... tearing down
tests\security_test.tftest.hcl... pass
tests\storage_test.tftest.hcl... in progress
  run "verify_storage"... pass
tests\storage_test.tftest.hcl... tearing down
tests\storage_test.tftest.hcl... pass

Success! 6 passed, 0 failed.
```

---

- 特定モジュールのみ個別テスト.

```text
PS C:\dev\Github\AWS-study-raisetech\terraform-test-lecture40> terraform test -filter="tests\alb_test.tftest.hcl"
tests\alb_test.tftest.hcl... in progress
```

---

- レッドグリーンテスト

エラー時ログ（レッド）

```text
PS C:\dev\Github\AWS-study-raisetech\terraform-test-lecture40> terraform test -filter="tests\alb_test.tftest.hcl"
tests\alb_test.tftest.hcl... in progress
  run "verify_alb"... fail
╷
│ Error: Test assertion failed
│ 
│   on tests\alb_test.tftest.hcl line 10, in run "verify_alb":
│   10:     condition     = module.alb.alb_internal == true
│     ├────────────────
│     │ Diff:
│     │ --- actual
│     │ +++ expected
│     │ - false
│     │ + true
│ 
│ 
│ Internal ALB settings did not match expected
╵
tests\alb_test.tftest.hcl... tearing down
tests\alb_test.tftest.hcl... fail

Failure! 0 passed, 1 failed.
```

成功時ログ（グリーン）

```text
PS C:\dev\Github\AWS-study-raisetech\terraform-test-lecture40> terraform test -filter="tests\alb_test.tftest.hcl"
tests\alb_test.tftest.hcl... in progress
  run "verify_alb"... pass
tests\alb_test.tftest.hcl... tearing down
tests\alb_test.tftest.hcl... pass

Success! 1 passed, 0 failed.
```

---
