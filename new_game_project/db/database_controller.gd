extends RefCounted
class_name DBController

static var ref:AppDatabase

const DB_PATH := "user://db.tres"

static func get_db() -> AppDatabase:
	if ref == null:
		ref = load_db()
	return ref

static func load_db() -> AppDatabase:
	if ResourceLoader.exists(DB_PATH):
		return ResourceLoader.load(DB_PATH)

	var data := AppDatabase.new()
	var res = ResourceSaver.save(data,DB_PATH)
	assert(res == OK,"res is not okay " + error_string(res)) 
	print("making new data instance")
	return data

static func save() -> void:
	var res = ResourceSaver.save(get_db(),DB_PATH) 
	assert(res == OK,"res is not okay " + error_string(res)) 
	print("database updated")

static func add_user(user:User) -> void:
	get_db().users.append(user)
	login_user(user)
	save()
	pass

static func get_user(username:String) -> User:
	var db = get_db()
	for user in db.users:
		if user.username == username:
			return user
	print("no user")
	return null

static func login_user(user:User) -> void:
	get_db().logged_in_user = user;
	pass

static func logout() -> void:
	get_db().logged_in_user = null;
	pass

static func get_logged_in_user() -> User:
	return get_db().logged_in_user

static func log_users() -> void:
	for user in get_db().users:
		print(user)
	pass
