class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title               #タイトル
      t.text :description           #目標推進の意気込み
      t.datetime :duedate           #期日
      t.float :target_time          #目標時間
      t.float :actual_time          #実績時間(累積)
      t.float :level_of_achievement #達成度
      t.text :comment               #結果に対するコメント
      t.string :status              #実行中／完了の区分をする
      t.integer :user_id
      t.timestamps
    end
  end
end
