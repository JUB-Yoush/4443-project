extends Resource
class_name AppData

var users: Array[User]
var logged_in_user:User

static var ref:AppData

const DB_PATH := "res://db/db.tres"

static func get_db() -> AppData:
    if ref == null:
        ref = load_db()
    return ref

static func load_db() -> AppData:
    var data := load(DB_PATH)

    if data != null:
        return data

    data = AppData.new()
    ResourceSaver.save(data,DB_PATH) 
    return data

static func save() -> void:
    ResourceSaver.save(get_db(),DB_PATH) 

static func add_user(user:User) -> void:
    get_db().users.append(user)
    AppData.save()
    pass

static func get_user(username:String) -> User:
    var db = get_db()
    for user in db.users:
        if user.username == username:
            return user
    return null

static func login_user(user:User) -> void:
    get_db().logged_in_user = user;
    pass

static func logout() -> void:
    get_db().logged_in_user = null;
    pass

static func get_logged_in_user() -> User:
    return get_db().logged_in_user

