// https://nuxt.com/docs/api/configuration/nuxt-config
import { defineNuxtConfig } from "nuxt/config";

export default defineNuxtConfig({
	modules: ["@nuxtjs/tailwindcss", "@nuxtjs/google-fonts"],
	tailwindcss: {
		configPath: "~/config/tailwind.config.js",
	},
	googleFonts: {
		families: {
			Inter: [300, 400, 500, 600, 700, 800, 900],
			"Open Sans": [300, 400, 600, 700, 800],
		},
	},
});
