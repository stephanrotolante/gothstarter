package handlers

import (
	"gothstarter/pages"
	"gothstarter/utils"
	"net/http"
)

func HandleHome(w http.ResponseWriter, r *http.Request) error {

	data := `{"name":"Vince","role":"Software Engineer","location":"Earth"}`

	return utils.RenderComponent(w, r, pages.Index(data))
}
