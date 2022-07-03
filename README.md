
手動部署 K8s 叢集是件重複又繁瑣的事情，除了要先準備好基礎機器環境之外，還要每一台機器安裝依賴套件後，並一個一個加入叢集內，透過 Terraform + Ansible Iac 最佳組合自動化完成一整個系列從無到有創建。

<!-- more -->

## 1. DEMO 執行範例


![](https://i.imgur.com/mNot4JE.png "初始化")

![](https://i.imgur.com/JxsisIM.png "Terraform 自動創建 GCE")


![](https://i.imgur.com/u1USg5g.png "Ansible 自動部署 K8s")

![](https://i.imgur.com/IjiaeAp.png "K8s 狀態")



---

## 2. Quick Start  
>透過 Docker 快速創建 Terraform & Ansible 環境及 Iac Code。


1. 啟動建立好的環境。

```bash
docker run --rm -it jeffwen0105/iac-gce-k8s bash
```

2.  使用 vi 編輯 credentials ，將 GCP 具備創建 VPC 及 GCE 的 credentials 貼上。

```json
{
  "type": "service_account",
  "project_id": "<project_id>",
  "private_key_id": "<private_key_id>",
  "private_key": "<private_key>",
  "client_email": "<client_email>",
  "client_id": "<client_id>",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "<client_x509_cert_url>"
}
```


3. 使用 vi 編輯 Project ，將專案修改專案 Project id。
>*如果是 GCP 新專案，需先啟動 Enable Compute Engine Api ..*


4.  執行自動部屬腳本。

> *該環境會使用既有的金鑰遠端連線執行 Ansible 操作，如果擔心金鑰重複的安全性，可以先執行 `bash regenerateKey.sh` 來重新產生一組公私鑰。*


```bash
bash run.sh
```


更多內容請至 HowHow 官網查閱，[AWS - Terraform & Ansible 在 GCP 上自動部署 K8S 叢集請點我](https://how64bit.com/posts/gcp/2022/gcp-iac_k8s/)