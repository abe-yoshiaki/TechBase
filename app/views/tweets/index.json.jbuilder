json.array! @tweets do |tweet|
  json.title tweet.title
  json.content tweet.content
  json.created_at tweet.created_at.strftime("%Y/%m/%d %H:%M")
  json.nickname tweet.user.nickname
  json.id tweet.id
end
