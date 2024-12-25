package utils

import (
	"net/http"

	"github.com/a-h/templ"
)

func RenderComponent(w http.ResponseWriter, r *http.Request, c templ.Component) error {
	return c.Render(r.Context(), w)
}
