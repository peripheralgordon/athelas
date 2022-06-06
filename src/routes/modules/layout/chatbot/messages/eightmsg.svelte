<script>
    import { fly } from 'svelte/transition';
    import { currentPage, username } from '../../../../../storage/store';

    var btnStyle = "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded";
    
    const showResults = function() {
        currentPage.set(1);
    }

</script>

<div class="flex flex-col justify-between overflow-hidden bg-white pb-6">
    <div in:fly="{{ x: -1000, duration: 200 }}" class="mb-3 bg-blue-700  rounded-lg text-white w-fit">
        <p class="p-2 pl-4 pr-4">Abbiamo finito {$username}! In base alle tue risposte ho alcuni consigli sul tuo stile di vita...</p>
    </div>

    <button class={btnStyle} on:click={showResults}>mostra risultati</button>
</div>