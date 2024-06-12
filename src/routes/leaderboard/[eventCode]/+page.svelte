<script lang="ts">
    export let data;
</script>

<svelte:head>
    <title>{data.allData.name} leaderboard</title>
    <meta name="description" content="Leaderboard" />
</svelte:head>
<div class='flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8'>
    <div class='sm:mx-auto sm:w-full sm:max-w-sm'>
      <h1 class='mt-10 text-center text-2xl font-bold leading-1 tracking-tight text-gray-900 mb-5'>{data.allData.name} Leaderboard</h1>
      </div>
    <div class='sm:mx-auto sm:w-full sm:max-w-sm'>
      <ul class='menu bg-base-300 w-80 rounded-box mx-auto'>
          {#each data.ranked as item,index (index)}
              <li class='text-center'><a class='text-center'>
                  <h1 class='mr-20 text-center text-l font-bold leading-1 tracking-tight text-gray-900'>{index+1}.</h1>
                  <h1 class='ml-20 text-center text-lg font-bold leading-1 tracking-tight text-gray-900'>{item}</h1>
              </a></li>
          {/each}
      </ul>
    </div>
    
  </div>
)