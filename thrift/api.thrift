namespace csharp arthrift
namespace rb ArThrift

enum Status {
  INACTIVE = 0,
  ACTIVE = 1,
  SUSPENDED = 2
}

struct User {
  1: string username,
  2: Status my_status
}

struct Comment {
  1: User author,
  2: string body,
  3: bool published
}

struct Project {
  1: string name
}

exception InvalidOperation {
  1: i32 what,
  2: string why
}

service MyService {
  void ping(),

  /* Users */
  User add_user(1:string username) throws (1:InvalidOperation ouch),
  User get_user(1:string username) throws (1:InvalidOperation ouch),
  list<User> list_all_users(),
  oneway void delete_user(1:string username),
  
  /* Comments */
  void add_comment(1:string username, 2:string comment) throws (1:InvalidOperation ouch),
  
  /* Projects */
  Project add_project(1:string name) throws (1:InvalidOperation ouch),
  list<Project> list_all_projects()
  
}