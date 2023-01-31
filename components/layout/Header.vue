<template>
	<section class="relative h-screen">
		<div
			class="container flex flex-col-reverse lg:flex-row lg:gap-6 justify-center items-center h-full"
		>
			<div class="flex flex-1 flex-col items-center lg:items-start">
				<h2
					class="text-nepal-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center lg:text-left mb-6"
				>
					<slot name="main-text"></slot>
				</h2>
				<p
					class="text-black font-body text-xl text-center lg:text-left mb-6"
				>
					<slot name="secondary-text"></slot>
				</p>
			</div>

			<div class="flex justify-center flex-1 -z-10">
				<slot name="header-img"></slot>
			</div>
		</div>
	</section>
</template>
