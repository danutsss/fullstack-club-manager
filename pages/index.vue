<template>
	<LayoutNavBar />
	<LayoutHeader>
		<template v-slot:main-text>Asociatii judetene de judo</template>
		<template v-slot:secondary-text>
			<span class="text-nepal-600 font-bold">AJJ.RO</span> este un website
			dedicat Asociatiilor Judetene de Judo din Romania, oferint
			informatii despre acestea si cluburi. Suntem un hub pentru
			Asociatiile Judetene de Judo din Romania, lucrand pentru a promova
			si extinde cooperarea in sportul judo romanesc.
		</template>
		<template v-slot:header-img>
			<img
				class="sm:w-3/4 sm:h-3/4 mt-2 mb-2 shadow-2xl aspect-square rotate-3 rounded-2xl bg-zinc-100 dark:bg-zinc-800"
				src="~/assets/images/header.webp"
				alt="Judo"
				loading="lazy"
				style="color: transparent"
				decoding="async"
			/>
		</template>
	</LayoutHeader>

	<div class="container flex flex-row flex-1 justify-center">
		<SvgMap />
	</div>

	<LayoutFooter class="mt-8" />
</template>

<script setup>
useHead({
	title: "Prima pagina @ AJJ.RO",
	meta: [
		{
			name: "description",
			content:
				"Prima pagina a site-ului Asociatiilor Judetene de Judo din Romania.",
		},
		{
			name: "keywords",
			content:
				"asociatii judetene de judo, Romania, AJJ.RO, judo, Romania, veterani judo, antrenori judo, sportivi judo, cluburi judo, judoka",
		},
		{
			name: "author",
			content: "Matei Nicolae - Daniel @ AJJ.RO",
		},
		{
			name: "robots",
			content: "index, follow",
		},
		{
			name: "googlebot",
			content: "index, follow",
		},
		{
			name: "google",
			content: "nositelinkssearchbox",
		},
		{
			name: "google",
			content: "notranslate",
		},
	],
});
</script>
