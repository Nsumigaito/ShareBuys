# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!(	name:  "管理者",
						introduction: "アイウエオ",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
						point: 100,
						telephone: "00011112222",
             			email: "admin100@example.jp",
         				password:  "Nagi7230",
             			password_confirmation: "Nagi7230",
             			is_deleted: false,
             			is_admin: true
             		)
users = User.create!(	name:  "ユーザー",
						introduction: "あいうえお",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
						point: 1000,
						telephone: "11122223333",
             			email: "user10@example.jp",
         				password:  "Nagi7230",
             			password_confirmation: "Nagi7230",
             			is_deleted: false,
             			is_admin: false
             		)
users = User.create!(   name:  "ユーザー2",
                        introduction: "かきくけこ",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
                        point: 1000,
                        telephone: "22233334444",
                        email: "user20@example.jp",
                        password:  "Nagi7230",
                        password_confirmation: "Nagi7230",
                        is_deleted: false,
                        is_admin: false
                    )
users = User.create!(   name:  "ユーザー3",
                        introduction: "さしすせそ",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
                        point: 1000,
                        telephone: "33344445555",
                        email: "user30@example.jp",
                        password:  "Nagi7230",
                        password_confirmation: "Nagi7230",
                        is_deleted: false,
                        is_admin: false
                    )
users = User.create!(   name:  "ユーザー4",
                        introduction: "たちつてと",
                        image: open("./db/fixtures/142_refileDownloadImage.png"),
                        point: 1000,
                        telephone: "44455556666",
                        email: "user40@example.jp",
                        password:  "Nagi7230",
                        password_confirmation: "Nagi7230",
                        is_deleted: false,
                        is_admin: false
                    )