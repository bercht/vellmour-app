// app/javascript/controllers/index.js
import { application } from "controllers/application"

// Importar todos os controllers
import NavbarController from "controllers/navbar_controller"
import DropdownController from "controllers/dropdown_controller"
import ConfirmDeleteController from "controllers/confirm_delete_controller"
import LogoutController from "controllers/logout_controller"
import MobileMenuController from "controllers/mobile_menu_controller"
import ImagePreviewController from "controllers/image_preview_controller"
import MapController from "controllers/map_controller"
import FlashController from "controllers/flash_controller"
import SweetalertController from "controllers/sweetalert_controller"
import HelloController from "controllers/hello_controller"
import SpotlightController from "controllers/spotlight_controller"

// Registrar todos os controllers
application.register("navbar", NavbarController)
application.register("dropdown", DropdownController)
application.register("confirm-delete", ConfirmDeleteController)
application.register("logout", LogoutController)
application.register("mobile-menu", MobileMenuController)
application.register("image-preview", ImagePreviewController)
application.register("map", MapController)
application.register("flash", FlashController)
application.register("sweetalert", SweetalertController)
application.register("hello", HelloController)
application.register("spotlight", SpotlightController)

console.log("✅ Controllers registrados com sucesso!");