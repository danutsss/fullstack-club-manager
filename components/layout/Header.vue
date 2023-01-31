<template>
	<section class="relative h-screen">
		<div
			class="container flex flex-col-reverse lg:flex-row lg:gap-6 justify-center items-center h-full"
		>
			<div class="flex flex-1 flex-col items-center lg:items-start">
				<h2
					class="text-nepal-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center lg:text-left mb-6"
				>
					Asociatii judetene de judo
				</h2>
				<p
					class="text-black font-body text-xl text-center lg:text-left mb-6"
				>
					<span class="text-nepal-600 font-bold">AJJ.RO</span>
					este un website dedicat Asociatiilor Judetene de Judo din
					Romania, oferint informatii despre acestea si cluburi.
					Suntem un hub pentru Asociatiile Judetene de Judo din
					Romania, lucrand pentru a promova si extinde cooperarea in
					sportul judo romanesc.
				</p>
			</div>

			<div class="container flex justify-center flex-1">
				<SvgMap />
			</div>
		</div>
	</section>
</template>
