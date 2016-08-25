collection @settlements
attributes :id, :owner_name

node(:progress) do |settlement|
  ProgressCheck.all.inject({}) do |hash, item|
    hash.merge!({ item.name => settlement.progress_for(item) * item.value / 100.0 })
  end
end
