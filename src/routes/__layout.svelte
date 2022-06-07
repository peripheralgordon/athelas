<script>
    import '../athelas.css';
    import Navbar from './modules/layout/navbar.svelte';
    import { currentPage } from '../storage/store';
</script>

{#if $currentPage == 2}
    <div class="w-full h-full bg-black fixed top-0 left-0 flex flex-col justify-center items-center" style="background-color: rgba(100, 100, 100, 0.5); z-index: 100;">
        <div class="bg-gray-300 rounded-3xl opacity-100 flex flex-col justify-center items-center" style="width: 600px; height: 400px;">
            <h1 class="text-4xl font-bold text-orange-600">STAY TUNED!</h1>
            <img class="p-4 h-32" src="attention.png" alt="wip"/>
            <p class="p-8 text-lg font-bold text-center">Grazie per aver provato Athelas! Stiamo lavorando per assicurarti un'esperienza di wellness a 360°...</p>
        </div>
    </div>
{/if}

<div class="w-full h-screen flex flex-row justify-center items-start bg-slate-200">
    <div class="w-5/6 max-w-4xl mt-5 mb-5">
        <!-- NAV STARTS HERE -->
        <div class="w-full">
            <Navbar />
        </div>
        <!-- NAV ENDS HERE -->

        <!-- PAGE CONTENT STARTS HERE -->
        <div class="w-full drop-shadow-2xl mt-3 rounded-3xl bg-white overflow-hidden">
            <slot />
        </div>
        <!-- PAGE CONTENT ENDS HERE -->
    </div>
</div>


<div class="fixed bottom-0 left-0 w-32">
    <img class="w-32" src="logoposte.svg" alt="logo poste italiane"/>
</div>