<script lang="ts">
    let code = "";
</script>

<svelte:head>
    <title>Enter Leaderboard Code</title>
    <meta name="description" content="FRC picklist voter" />
</svelte:head>

<div class='flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8'>
    <div class='sm:mx-auto sm:w-full sm:max-w-sm'>
    <h1 class='mt-10 text-center text-2xl font-bold leading-1 tracking-tight text-gray-900'>Enter Leaderboard Code</h1>
    </div>
    <div class='mt-10 sm:mx-auto sm:w-full sm:max-w-sm'>
        <form class='space-y-6'>
            <div>
                <label for="leaderboardCode" >Ask your scouting lead for a 6 digit code</label>
                 <input class= "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 indent-1" name ="leaderboardCode" type="text" required bind:value={code}/>
            </div>
            <div>
                <a
                    href="/leaderboard/{code}"
                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                >
                    Submit
                </a>
            </div>
        </form>
    </div>
</div>