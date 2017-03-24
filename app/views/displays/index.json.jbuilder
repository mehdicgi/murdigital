json.array!(@displays) do |display|
  json.extract! display, :id, :name, :show_date, :show_from, :show_limit, :columns, :lines, :consigne
  json.url display_url(display, format: :json)
end
