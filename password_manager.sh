
echo "パスワードマネージャーへようこそ！"

while :
do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read choices
    
    # Add Password が入力された場合
    if [ "$choices" = "Add Password" ]; then
    
        echo "サービス名を入力してください："
        read service
        
            ## 既存のサービス名をファイルから読み取り、重複をチェック
            if grep -q "^$service:" s:u:p.txt; then
                echo "サービス名$serviceは既に存在します。重複を避けてください。"
            else
            
            echo "ユーザー名を入力してください："
            read user
            echo "パスワードを入力してください："
            read password
            
            echo "パスワードの追加は成功しました。"
                
            ## s:u:p.txtに「サービス名:ユーザー名:パスワード」の形で追記
            echo "$service:$user:$password" >> s:u:p.txt
                
            fi
    fi
done