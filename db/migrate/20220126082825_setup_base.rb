class SetupBase < ActiveRecord::Migration[6.1]
  def change
    create_table :group_categories  do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.string :avatar
      t.string :cover

      t.timestamps null: false
    end

    create_table :tests do |t|
      t.string :name
      t.text :description
      t.integer :difficulty
      t.integer :attempt_times
      t.datetime :open_time
      t.datetime :close_time
      t.datetime :release_time

      t.integer :duration
      t.integer :status, default: 0

      t.string :slug
      t.integer :position
      t.references :user

      t.timestamps null: false
    end

    add_index :tests, :name



    create_table :group_questions do |t|
      t.string :name
      t.text :description
      t.text :content, limit: 16.megabytes - 1
      t.text :guide
      t.text :transcript

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.references :test
      t.references :user
      t.timestamps null: false
    end

    add_index :group_questions, :parent_id
    add_index :group_questions, :lft
    add_index :group_questions, :rgt

    create_table :questions do |t|
      t.references :group_question
      t.integer :question_number
      t.string :name
      t.text :content, limit: 16.megabytes - 1
      t.text :explanation, limit: 16.megabytes - 1
      t.text :answer
      t.integer :difficulty
      t.float :score
      t.integer :status, default: 0
      t.boolean :is_swap

      t.references :user
      t.timestamps null: false
    end

    create_table :question_options do |t|
      t.references :question
      t.text :content, limit: 16.megabytes - 1
      t.boolean :is_answer
      t.text :explanation, limit: 16.megabytes - 1
      t.integer :position

      t.references :user
      t.timestamps null: false
    end

    create_table :user_take_tests do |t|
      t.references :user
      t.references :test

      t.datetime :start_time
      t.datetime :end_time

      t.integer :score
      t.integer :correct_number

      t.integer :status, default: 0
      t.timestamps null: false
    end

    create_table :user_test_responses do |t|
      t.references :user_take_test
      t.references :question
      t.string :answer
      t.references :question_option
      t.boolean :is_correct
      t.integer :difficulty
      t.integer :score

      t.references :user
      t.timestamps null: false
    end

    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :group_category
      t.string :slug
      t.integer :position
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps null: false
    end



    create_table :tests_categories do |t|
      t.references :test
      t.references :category
      t.integer :position
    end

  end
end
