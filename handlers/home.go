package handlers

import (
	"gothstarter/pages"
	"gothstarter/utils"
	"net/http"
)

func HandleHome(w http.ResponseWriter, r *http.Request) error {
	return utils.RenderComponent(w, r, pages.Index())
}
