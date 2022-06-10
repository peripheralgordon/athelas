<script>
    import { currentPage } from '../../../../storage/store'

    var btnStyle = "bg-blue-500 hover:bg-blue-700 text-white font-bold py-4 px-6 rounded-full";
    
    const book = function() {
        currentPage.set(2);
    }
</script>

<div class="flex flex-col w-full">
    <div class="flex flex-row justify-between w-full">
        <div class="w-2/4">
            <h1 class="font-extrabold text-3xl p-4 pb-2">Puoi fare di meglio!</h1>
            <p  class="text-lg p-4 pt-2">
                Non ci siamo proprio, il tuo stile di vita non è salutare. Le tue abitudini quotidiane non aiutano a tenerti in forma e a lungo andare potrebbero essere dannose. Ma non ti scoraggiare, perché anche un lungo viaggio inizia con un piccolo passo!
            </p>
        </div>
        <div class="flex flex-row justify-center w-2/4">
            <img width="300px;" src="tiredness.png" alt="high wellness score" />
        </div>
    </div>
    <div class="flex flex-row justify-between items-center w-full mt-1">
        <div><img style="width: 80px;" src="doctor.png" alt="bot doctor" /></div>
        <div class="w-2/3 text-xl text-left font-bold text-blue-500">Incontra nella stanza virtuale uno dei nostri specialisti e ricevi consigli su come migliorare il tuo stile di vita!</div>
        <div>
            <button class={btnStyle} on:click={book}>continua</button>
        </div>
    </div>
</div>