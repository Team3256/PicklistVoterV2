<!-- 
	This is a very simple example that shows basic dragging and dropping in a veritcal list.
 -->
<svelte:options immutable={true} />

<script lang="ts">
  import DragDropList, {
    VerticalDropZone,
    reorder,
    type DropEvent,
  } from "svelte-dnd-list";
  import Card from "./Card.svelte";
  // import type { Team } from "$lib/types/+team";
  import { enhance } from "$app/forms";
  import type {Teams} from "$lib/types/types";


  export let data;

  $: teamNum = data.teams as Teams[];

  let teamNumList: DragDropList;

  function onDrop({ detail: { from, to } }: CustomEvent<DropEvent>) {
    if (!to || from === to) {
      return;
    }

    teamNum = reorder(teamNum, from.index, to.index);
  }
</script>
<svelte:head>
    <title>Sort your picklist!</title>
    <meta name="description" content="Sort your picklist!" />
</svelte:head>

<div class="min-h-full flex-col justify-center px-8 py-12 lg:px-8">
  <div class="sm:mx-auto sm:w-full sm:max-w-sm">

    <h2
      class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900"
    >
      Sort your picklist!
    </h2>
  </div>
  <div
    class="bg-white shadow overflow-hidden sm:rounded-md max-w-sm mx-auto mt-12"
  >
  {#if teamNum.length === 0}
    <div class="p-4 text-center text-gray-500">
      <h2>Invalid event code or no teams found</h2>
    </div>
  {:else}
    <DragDropList
      bind:this={teamNumList}
      id="Team Number List"
      type={VerticalDropZone}
      itemSize={100}
      itemCount={teamNum.length}
      on:drop={onDrop}
      let:index
    >
      <Card
        teamNumber={teamNum[index].team_key}
        on:down={() =>
          index < teamNum.length - 1 &&
          teamNumList.move(index, index + 1, teamNumList.dropzone)}
        on:up={() =>
          index > 0 && teamNumList.move(index, index - 1, teamNumList.dropzone)}
        rank={teamNum[index].rank}
        autoAverage={teamNum[index].sort_orders[3]}
        rankingPoints={teamNum[index].sort_orders[0]}
      />
    </DragDropList>
    {/if}
  </div>
    <form method="POST" use:enhance class="flex justify-center">
        <input type="hidden" name="rankings" value={JSON.stringify(teamNum.map(team=>team.team_key.slice(3)))}>
        <input type="hidden" name="eventCode" value={data.eventCode}>
        <input type="hidden" name="name" value={data.name}>
        <button
        class="flex w-6/12 mt-4 justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
        type="submit"
        disabled={teamNum.length === 0}

        >Submit</button
    >
    </form>
</div>
