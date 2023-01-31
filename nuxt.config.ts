// https://nuxt.com/docs/api/configuration/nuxt-config
import { defineNuxtConfig } from "nuxt/config";

export default defineNuxtConfig({
	components: {
		dirs: ["~/components", "~/components/layout"],
	},
	modules: ["@nuxtjs/tailwindcss", "@nuxtjs/google-fonts", "nuxt-headlessui"],
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
