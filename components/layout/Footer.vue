<template>
	<footer class="bg-black py-8 mt-auto">
		<div class="container flex flex-col md:flex-row items-center">
			<div
				class="flex flex-1 flex-wrap items-center justify-center md:justify-between gap-12"
			>
				<div
					class="flex items-center justify-center md:justify-start gap-2"
				>
					<svg
						xmlns="http://www.w3.org/2000/svg"
						className="h-6 w-6"
						fill="none"
						viewBox="0 0 24 24"
						stroke="currentColor"
						strokeWidth="{2}"
						width="24"
						height="24"
						class="text-slate-500"
					>
						<path
							strokeLinecap="round"
							strokeLinejoin="round"
							d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"
						/>
					</svg>
					<span class="text-white font-display font-black">
						ZERO SAPTE SERVICES
					</span>
				</div>
				<div>
					<ul class="flex text-white uppercase gap-12 text-xs">
						<li class="cursor-pointer">
							<NuxtLink
								class="text-white font-semibold font-display"
								to="/sign-in"
								>Logare</NuxtLink
							>
						</li>
						<li class="cursor-pointer">
							<NuxtLink
								class="text-white font-semibold font-display"
								to="/sign-up"
								>Inregistrare</NuxtLink
							>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</template>
