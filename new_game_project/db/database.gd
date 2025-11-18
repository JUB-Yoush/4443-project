extends Resource
class_name AppData

var users: Array[User]

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

