# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!(	name:  "管理者",
						introduction: "開発者です",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
						point: 100,
						telephone: "00011112222",
             			email: "admin1@example.jp",
         				password:  "Nagi7230",
             			password_confirmation: "Nagi7230",
             			is_deleted: false,
             			is_admin: true
             		)
users = User.create!(	name:  "ユーザー1",
						introduction: "ユーザー１です。よろしく！",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
						point: 1000,
						telephone: "11122223333",
             			email: "user1@example.jp",
         				password:  "Nagi7230",
             			password_confirmation: "Nagi7230",
             			is_deleted: false,
             			is_admin: false
             		)
users = User.create!(   name:  "ユーザー2",
                        introduction: "ユーザー２です。よろしく！",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
                        point: 1000,
                        telephone: "22233334444",
                        email: "user2@example.jp",
                        password:  "Nagi7230",
                        password_confirmation: "Nagi7230",
                        is_deleted: false,
                        is_admin: false
                    )
users = User.create!(   name:  "ユーザー3",
                        introduction: "ユーザー３です。よろしく！",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
                        point: 1000,
                        telephone: "33344445555",
                        email: "user3@example.jp",
                        password:  "Nagi7230",
                        password_confirmation: "Nagi7230",
                        is_deleted: false,
                        is_admin: false
                    )