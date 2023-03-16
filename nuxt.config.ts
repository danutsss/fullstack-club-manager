// https://nuxt.com/docs/api/configuration/nuxt-config
import { defineNuxtConfig } from "nuxt/config";

export default defineNuxtConfig({
	components: {
		dirs: ["~/components", "~/components/layout"],
	},
	modules: [
		"@nuxtjs/tailwindcss",
		"@nuxtjs/google-fonts",
		"nuxt-headlessui",
		"@nuxtjs/supabase",
		"@sidebase/nuxt-pdf",
	],

	pdf: {
		pdf: {
			format: "A4",
		},
		i18n: false,
		meta: {
			title: "Export atlet",
			titleTemplate: "Export - %s",
			author: "ZERO SAPTE SERVICES",
			subject: "Export atlet",
			keywords: ["pdf", "atlet", "export", "judo"],
		},
	},

	tailwindcss: {
		configPath: "~/config/tailwind.config.js",
	},
	googleFonts: {
		families: {
			Inter: [300, 400, 500, 600, 700, 800, 900],
			"Open Sans": [300, 400, 600, 700, 800],
		},
	},

	css: ["@fortawesome/fontawesome-svg-core/styles.css"],
});
