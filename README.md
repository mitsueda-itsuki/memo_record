# MemoRecord

ActiveRecordっぽい挙動をします

## 準備

```ruby
class User < MemoRecord
end
```

のようにしておきます。

## 作成

```ruby
user = User.new(name: 'hoge', email: 'hoge@gmail.com')
user.save
```

(idを指定しない場合は、作成した順番にidが付きます)

あるいは

```ruby
user = User.create(name: 'hoge', email: 'hoge@gmail.com')
```

で作成できます。

## 更新

```ruby
user.update(name: 'fuga')
```

```ruby
user.update(name: 'fuga', email: 'fuga@gmail.com')
```

## 削除

```ruby
user.destroy
```

## 検索

### idで検索

```ruby
User.find(id)
```

### プロパティで検索(一致する最初の一件)

```ruby
User.find_by(email: 'hoge@gmail.com')
```

### プロパティで検索(一致するすべてのデータ)

```ruby
User.where(name: 'hoge')
```

### 全件取得

```ruby
User.all
```
