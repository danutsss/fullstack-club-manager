<template>
	<LayoutNavBar />

	<LayoutHeader>
		<template v-slot:main-text>Antrenori Judo</template>
		<template v-slot:secondary-text
			>Contribuie la crearea unei liste cu toti antrenorii de Judo din
			Romania.</template
		>
		<template v-slot:header-img>
			<img
				class="sm:w-3/4 sm:h-3/4 mt-2 shadow-2xl aspect-square rotate-3 rounded-2xl bg-zinc-100 dark:bg-zinc-800"
				src="~/assets/images/judo-time.jpg"
				alt="Judo"
				loading="lazy"
				style="color: transparent"
				decoding="async"
			/>
		</template>
	</LayoutHeader>

	<LayoutFooter />
</template>
