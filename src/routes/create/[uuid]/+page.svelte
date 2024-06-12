<script lang="ts">
  import { enhance } from "$app/forms";
  import { onMount } from "svelte";
  import { invalidateAll } from "$app/navigation";
  import SubmissionRow from "./SubmissionRow.svelte";
  import {qr} from "@svelte-put/qr/svg";

  export let form;
  export let data;

  onMount(() => {
    const interval = setInterval(() => {
      invalidateAll();
    }, 1000);

    return () => {
      clearInterval(interval);
    };
  });
</script>

<svelte:head>
  <title>Admin Dashboard</title>
  <meta name="description" content="Dashboard" />
</svelte:head>

<div class="flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8">
  <div class="sm:mx-auto sm:w-full sm:max-w-sm">
    <h2
      class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900"
    >
      Manage Submissions for <span class="text-indigo-600">{data?.data.name}</span>
    </h2>
    <h2
      class="mt-5 text-center text-xl font-bold leading-9 tracking-tight text-gray-900"
    >
      Leaderboard Code: <span class="text-green-700">{data?.data.leaderboard_code}</span>
    </h2>
    <svg
    use:qr={{
        data: window.location.origin + "/join/" + data?.data.leaderboard_code,
        shape: "square",
    }}
    />
    
  </div>

  <div class="mt-5 sm:mx-auto sm:w-full sm:max-w-sm">
    <div class="space-y-6">
      {#if data?.data.submissions.length == 0}
        <p
          class="text-center text-xl font-bold leading-9 tracking-tight text-gray-900"
        >
          No submissions yet
        </p>
      {:else}
        {#each data?.data.submissions as submission, index (submission.id)}
          <SubmissionRow
            {submission}
            {index}
            admin_session_id={data?.data.admin_session_id}
          />
        {/each}
      {/if}
    </div>
  </div>
</div>
