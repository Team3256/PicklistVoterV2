<script lang="ts">
  import { enhance } from "$app/forms";
  import type {Submissions} from "$lib/types/types";

    export let submission:Submissions;
    export let admin_session_id:number;
</script>

<form method = "POST" id="delete" action="?/delete" use:enhance>
    <input type="hidden" name="id" value={submission.id}>
    <input type="hidden" name="admin_session_id" value={admin_session_id}>
</form>

<form method="POST" id = "update" action="?/update" use:enhance>
    <div class="h-6 grid grid-cols-3 gap-5 content-start ...">
      <div>
          <label for="weighting" class="mt-1.5 block text-xl font-medium leading-6 text-gray-900 ">
          {submission.name}
          </label>
      </div>
      <div>
          <button
          class="flex w-12/12 content-end justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          type="submit"
          >
          Change
          </button>
      </div>
      <div class="ml-12">
          <button
              class="flex w-12/12 content-end justify-center rounded-md bg-red-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-red-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600"
              type = "submit"
              form="delete"
          >
              Delete
          </button>
      </div>
    </div>
    <div class="mt-6">
        <input type="hidden" name="uuid" value={submission.id}>
        <input type="hidden" name="admin_session_id" value={admin_session_id}>
      <input
        name="weighting"
        type="text"
        class="block indent-2 w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
        value="{submission.weighting}"
      />
    </div>
</form>