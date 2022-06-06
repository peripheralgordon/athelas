<script>
    import Goodshape from './solutions/goodshape.svelte';
    import Badshape from './solutions/badshape.svelte';
    import {score} from '../../../storage/store.js';
</script>

{#if $score <= 35}
    <Badshape />
{:else}
    <Goodshape />
{/if}



