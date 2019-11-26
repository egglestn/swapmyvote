

def create_random_user(i, preferred_party_id, willing_party_id)
  gender = rand > 0.5 ? "female" : "male"
  firstname = gender == "male" ? Random.firstname_male : Random.firstname_female

  ons_constituency_id = rand(1 + OnsConstituency.count)

  ons_id = OnsConstituency.find_by_id(ons_constituency_id).ons_id

  User.create(
    name: "#{firstname} #{Random.lastname}",
    email: "#{firstname.downcase}@example.com",
    constituency_ons_id: ons_id,
    preferred_party_id: preferred_party_id,
    willing_party_id: willing_party_id,
    image: format("http://api.randomuser.me/portraits/med/%s/#{i}.jpg",
                  (gender == "male" ? "men" : "women"))
  )
end

5.times do |i|
  create_random_user(i, 1, 2)
  create_random_user(i, 1, 3)

  create_random_user(i, 2, 1)
  create_random_user(i, 2, 3)

  create_random_user(i, 3, 1)
  create_random_user(i, 3, 2)
end
