
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
        
    # Get Password が入力された場合
    if [ "$choices" = "Get Password" ]; then
        echo "サービス名を入力してください："
        read search
        file=s:u:p.txt
        result=$(grep "^$search" "$file")
        
            ## サービス名が保存されていた場合
            if [ -n "$result" ]; then
                ## 検索した文字列の行をコロンで分けて変数に代入
                user=$(echo "$result" | cut -d":" -f2)
                password=$(echo "$result" | cut -d":" -f3)
                
                echo "サービス名：$search"
                echo "ユーザー名：$user"
                echo "パスワード：$password"
            else
                ## サービス名が保存されていなかった場合
                echo "そのサービスは登録されていません。"
            fi
    fi
    
        # Add Password/Get Password/Exit 以外が入力された場合
    if [ "$choices" != "Add Password" ] && [ "$choices" != "Get Password" ] && [ "$choices" != "Exit" ]; then
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
    
        # Exit が入力された場合
    if [ "$choices" = "Exit" ]; then
        echo "Thank you!"
        break
    fi
done