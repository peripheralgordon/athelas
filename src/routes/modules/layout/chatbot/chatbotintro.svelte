<script>
    import { fly, fade } from 'svelte/transition';
    import { onMount} from "svelte";
    import { nameanswer, username, agreement, exit } from '../../../../storage/store';

    var hello = false;
    onMount(() => {
        setTimeout(() => hello = true, 500);
    });
</script>

<div class="bg-white pb-6">
    <div class="flex flex-col justify-between overflow-hidden">
        {#if hello}
            <div in:fly="{{ x: -1000, duration: 200 }}" class="mb-3 bg-blue-700  rounded-lg text-white w-fit">
                <p class="p-2 pl-4 pr-4">Ciao sono il dott. Athelas e questo è il mio portale di telemedicina. Da qui potrai prenotare visite, ordinare prodotti Health&Pharm, e ricevere consigli per migliorare il tuo stile di vita. Posso chiederti il tuo nome?</p>
            </div>
        {/if}

        {#if $username}
            <div in:fly="{{ x: 1000, duration: 200 }}" class="mb-3 rounded-lg text-black bg-slate-300 w-fit self-end">
                <p class="p-2 pl-4 pr-4">{$nameanswer}</p>
            </div>

            <div in:fly="{{ x: -1000, duration: 200, delay: 500 }}" class="mb-3 bg-blue-700  rounded-lg text-white w-fit">
                <p class="p-2 pl-4 pr-4">Piacere di conoscerti {$username}! Posso farti qualche domanda sul tuo stile di vita?</p>
            </div>
        {/if}

        {#if $agreement && $exit == false}
            <div in:fly="{{ x: 1000, duration: 200 }}" class="mb-3 rounded-lg text-black bg-slate-300 w-fit self-end">
                <p class="p-2 pl-4 pr-4">{$agreement}</p>
            </div>
        {/if}

        {#if $exit}
            <div in:fly="{{ x: 1000, duration: 200 }}" class="mb-3 rounded-lg text-black bg-slate-300 w-fit self-end">
                <p class="p-2 pl-4 pr-4">{$agreement}</p>
            </div>

            <div in:fly="{{ x: -1000, duration: 200, delay: 500 }}" class="mb-3 bg-blue-700  rounded-lg text-white w-fit">
                <p class="p-2 pl-4 pr-4">Va bene {$username}, alla prossima volta!</p>
            </div>
        {/if}
    </div>
</div>
