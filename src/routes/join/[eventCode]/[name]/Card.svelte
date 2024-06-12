<svelte:options immutable={true} />

<script lang="ts">
  import { createEventDispatcher } from "svelte";
  export let teamNumber: string;
  export let rank: number;
  export let autoAverage: number;
  export let rankingPoints: number;
  const dispatch = createEventDispatcher();
</script>

<div class="px-4 py-5 sm:px-6 border-t border-gray-200">
  <div class="flex items-center justify-between">
    <h3 class="text-lg leading-6 font-medium text-gray-900">{teamNumber.slice(3)}</h3>
    <p class="mt-1 max-w-2xl text-sm text-gray-500">Auto Average: {autoAverage}</p>
  </div>
  <div class="mt-4 flex items-center justify-between">
    <p class="text-sm font-medium text-gray-500">
      Rank: <span class="text-green-600">{rank}</span>
    </p>
    <p class="font-medium text-gray-500">
      Ranking Points: <span class="text-indigo-600 hover:text-indigo-500"
        >{rankingPoints}</span
      >
    </p>
  </div>
</div>

<div>
  <button class="up" on:click={() => dispatch("up")}>
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 24 24"
      width="16px"
      height="16px"
      ><path d="M0 0h24v24H0V0z" fill="none" /><path
        d="M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6 1.41 1.41z"
      /></svg
    >
  </button>
  <button class="down" on:click={() => dispatch("down")}>
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 24 24"
      width="16px"
      height="16px"
      ><path d="M0 0h24v24H0V0z" fill="none" /><path
        d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"
      /></svg
    >
  </button>
</div>

<style>
  button {
    position: absolute;
    background: transparent;
    display: block;
    width: 10%;
    height: 33%;
    border: none;
    outline: none;
    cursor: pointer;
  }
  button.down {
    bottom: 0;
    top: 67%;
    left: 40%;
    right: 83%;
  }
  button.up {
    top: 0;
    bottom: 33%;
    left: 40%;
    right: 33%;
  }
</style>
