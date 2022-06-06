<script>
    import '../athelas.css'
    import { currentPage } from '../storage/store'
    import Chatbot from './modules/layout/chatbot/chatbot.svelte';
    import Solution from './modules/layout/solution.svelte';
    import Book from './modules/layout/book.svelte';
</script>

<div class="flex flex-row justify-between py-5 px-6 w-full">
    {#if $currentPage == 0}
        <Chatbot />
    {:else if $currentPage == 1}
        <Solution />
    {:else}
        <Book />
    {/if}
</div>