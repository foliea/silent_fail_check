ActiveRecord::Schema.define do
  self.verbose = false

  create_table :silent_fail_logs, :force => true do |t|
    t.string :message
    t.timestamps
  end

  create_table :users, :force => true do |t|
    t.string :name
    t.decimal :connection_time
    t.timestamps
  end
end
