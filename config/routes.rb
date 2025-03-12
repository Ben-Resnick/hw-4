Rails.application.routes.draw do
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get("/login", { controller: "sessions", action: "new" })
  post("/login", { controller: "sessions", action: "create" })
  get("/logout", { controller: "sessions", action: "destroy" })
  get("/signup", { controller: "users", action: "new" })
  get("/", { controller: "places", action: "index" })
end