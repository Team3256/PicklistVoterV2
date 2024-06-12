<script lang="ts">
  import { supabase } from "$lib/supabaseClient";


</script>

<svelte:head>
  <title>Picklist Voter</title>
  <meta name="description" content="FRC picklist voter" />
</svelte:head>
<div class="flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8">
	<div class="sm:mx-auto sm:w-full sm:max-w-sm">
	  <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">
		Welcome to Picklist!
	  </h2>
	</div>

	<div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
	  <form class="space-y-6">
		<div>
		  <a
			href="/join"
			class="my-5 flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
		  >
			Join a Picklist
		  </a>
		  <a
			href="/create"
			class="my-5 flex w-full justify-center rounded-md bg-red-400 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-red-300 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-400"
		  >
			Create a picklist
		  </a>
		  <a
			href="/leaderboard"
			class="flex w-full justify-center rounded-md bg-orange-400 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-orange-300 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-orange-400"
		  >
			View a leaderboard
		</a>
		</div>
	  </form>

	</div>
  </div>