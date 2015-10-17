Hiroshima-arcインフラ環境用Packerイメージレポジトリ
===
# 目的
Hiroshima-arcイベント（セミナー・勉強会）参加者が  
環境準備に時間を取られないようにしたい  
なぜなら、イベントの内容により集中できるようにしたいから

# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| packer    　　　| 0.8.6       |             |
| vagrant   　　　| 1.7.4       |             |

# 構成
+ [セットアップ](#1)
+ [Vagrantイメージ作成（ローカル編）](#2)
+ [Vagrantイメージ作成(クラウド編)](#3)

# 詳細
## <a name="1">セットアップ</a>
[ここ](https://www.packer.io/intro/getting-started/setup.html)

## <a name="2">Vagrantイメージ作成（ローカル編）</a>
[ここ](https://www.packer.io/intro/getting-started/build-image.html)

    rm packer_virtualbox-iso_virtualbox.box || true
    packer build -only virtualbox-iso ubuntu-14.04.3-server-amd64.json
    vagrant box remove vagrant_machine || true
    vagrant box add vagrant_machine packer_virtualbox-iso_virtualbox.box
    vagrant init vagrant_machine
    vagrant up
    vagrant ssh

## <a name="3">Vagrantイメージ作成(クラウド編)</a>
[ここ](https://www.packer.io/intro/getting-started/remote-builds.html)  
予めATLASのEnvironment Variablesに環境変数ATLAS_NAMEとATLAS_USERNAMEを設定しおかないと失敗する。

    vagrant login
    export ATLAS_TOKEN="xxxxxxxxxxxxxxxxxxxxxxxxx"    
    packer push -name ATLAS_USERNAME/ATLAS_NAME ubuntu-14.04.3-server-amd64-atlas.json

# 参照
+ [Packer](https://www.packer.io/)
+ [VAGRANT](https://www.vagrantup.com/)
+ [ATLAS](https://atlas.hashicorp.com/)
