<script lang="ts">
  import { enhance } from "$app/forms";
  import type { PageData } from "./$types";

  export let form;


</script>

<svelte:head>
  <title>Create Leaderboard</title>
  <meta name="description" content="Create a FRC leaderboard" />
</svelte:head>
<div class='flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8'>
  <div class='sm:mx-auto sm:w-full sm:max-w-sm'>
  <h1 class='mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900'>Enter Event Code</h1>
  </div>
  <div class='mt-10 sm:mx-auto sm:w-full sm:max-w-sm'>
      <form method="POST" class='space-y-6' use:enhance>
          <div>
            {#if form?.type =="eventCode"}
              <label for="eventCode" style="color: red">{form.message}</label>
              <input class= "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 indent-1" name ="eventCode" type="text" style="color: red" required/>
            {:else}
              <label for="eventCode" style="color: black">Enter Event Code</label>
              <input class= "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 indent-1" name ="eventCode" type="text" style="color: black" required/>
            {/if}
          </div>
          <div>
            {#if form?.type =="name"}
              <label for="leaderboardName" style="color: red">{form.message}</label>
              <input class = "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 indent-1" name = "leaderboardName" type="text" style="color: red" required/>
            {:else}
              <label for="leaderboardName" style="color: black">Enter Leaderboard Name</label>
              <input class = "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 indent-1" name = "leaderboardName" type="text" style="color: black" required/>
            {/if}
          </div>
          <div>
              <button
                  type="submit"
                  class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >
                  Submit
              </button>
          </div>
      </form>
  </div>
</div>