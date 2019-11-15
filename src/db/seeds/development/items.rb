# frozen_string_literal: true

titles = [
  "\u65E5\u672C\u8A9E\u306E\u52C9\u5F37\u306E\u4ED5\u65B9\u306B\u3064\u3044\u3066",
  "How to learn Ruby on Rails",
  "\u6C34\u9053\u51CD\u7D50\u3057\u305F\u5834\u5408\u306E\u5BFE\u51E6\u65B9\u6CD5",
  "\u6210\u7E3E\u304C\u4E0A\u304C\u308B\u30CE\u30FC\u30C8\u306E\u3068\u308A\u65B9"
]
body = "# 見出し1
## 見出し2
### 見出し3
#### 見出し4
##### 見出し5
###### 見出し6

- リスト1
    - ネスト リスト1_1
        - ネスト リスト1_1_1
        - ネスト リスト1_1_2
    - ネスト リスト1_2
- リスト2
- リスト3

1. 番号付きリスト1
    1. 番号付きリスト1_1
    1. 番号付きリスト1_2
1. 番号付きリスト2
1. 番号付きリスト3

> お世話になります。xxxです。
>
> ご連絡いただいた、バグの件ですが、仕様です。

> お世話になります。xxxです。
>
> ご連絡いただいた、バグの件ですが、仕様です。
>> お世話になります。 yyyです。
>>
>> あの新機能バグってるっすね

インストールコマンドは `gem install hoge` です

normal *italic* normal
normal _italic_ normal

normal **bold** normal
normal __bold__ normal

normal ***bold*** normal
normal ___bold___ normal


***

___

---

*    *    *




[Google先生](https://www.google.co.jp/)

https://www.google.co.jp/

```
# h1
- list
- list
```

"
0.upto(3) do |i|
  Item.create(
    title: titles[i % 4],
    body: body,
    user_id: (i % 3) + 1
  )
end
