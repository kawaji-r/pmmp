# pmmp
## 動作確認環境
* Ubuntu 20.04.1 LTS

## 環境構築手順
```
git clone https://github.com/kawaji-r/pmmp
```

### bash実行準備
* rootユーザーのパスワードを設定
```
su -
passwd
```

### bash実行
```
bash pmmp.sh
```

### 仕上げ
```
sed -i -e "s/enable-dev-builds: false/enable-dev-builds: true/g" /home/mine/pmmp/pocketmine.yml
sudo ufw enable
```
