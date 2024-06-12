<script lang="ts">
    export let data;

    let name = "";
</script>

<svelte:head>
    <title>Enter your name</title>
</svelte:head>

<div class='flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8'>
    <div class='sm:mx-auto sm:w-full sm:max-w-sm'>
    <h1 class='mt-10 text-center text-2xl font-bold leading-1 tracking-tight text-gray-900'>Enter Your Name</h1>
    </div>
    <div class='mt-10 sm:mx-auto sm:w-full sm:max-w-sm'>
        <form class='space-y-6'>
            <div>
                <input class= "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 indent-1" name ="name" type="text" bind:value={name} required/>
            </div>
            <div>
                <a
                    href="/join/{data?.eventCode}/{name}"
                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                >
                    Submit
                </a>
            </div>
        </form>
    </div>
</div>