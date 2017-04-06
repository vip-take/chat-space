* Ruby version
2.3.1

# chat-space

# DB設計

## Users table
### table設計
name, text, index: true, null: false, unique: true

### association設計
has_many :rooms, through: group_users
has_many :messages, dependent: destroy
has_many :group_users dependent: destroy

## groups table
### table設計
name, string, null: false, unique: true

### association設計
has_many :users, through: :group_users
has_many :messages, dependent: destroy
has_many :group_users

## messages table
### table設計
text, text
image, text
user, references, foreign_key: true
room, references, foreign_key: true

マルチカラムインチデックスを検討？
group, created_at

### association設計
belongs_to :user
belongs_to :message

## groups_users table
### table設計
user, references, foreign_key: true
group, references, foreign_key: true

### association設計
belongs_to :user
belongs_to :group

