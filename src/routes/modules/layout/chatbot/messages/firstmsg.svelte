<script>
import { loop_guard } from 'svelte/internal';

    import { fly, fade } from 'svelte/transition';
    import { currentQuestion, score } from '../../../../../storage/store';
import Chatbot from '../chatbot.svelte';

    var btnStyle = "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded";
    
    const nextQuestion = function() {
        // update score
        score.set($score+ageScore)

        // go to next question
        currentQuestion.set($currentQuestion+1);

        console.log("new score is: "+$score);
    }

    let questions = [
		{ id: 1, text: `Da 18 a 35`, value: 10 },
		{ id: 2, text: `Da 35 a 45`, value: 8 },
		{ id: 3, text: `Da 45 a 60`, value: 5 },
        { id: 3, text: `Oltre 60`, value: 3 }
	];

    // user age score
    let ageScore = 10; // default selection

</script>

<div class="flex flex-col justify-between overflow-hidden bg-white pb-6">
    <div in:fly="{{ x: -1000, duration: 200 }}" class="mb-3 bg-blue-700  rounded-lg text-white w-fit">
        <p class="p-2 pl-4 pr-4">Bene, iniziamo. Quanti anni hai?</p>
    </div>

    <select bind:value={ageScore} class="form-select form-select-md mb-3
        appearance-none
        block
        w-full
        px-3
        py-1
        text-lg
        font-normal
        text-gray-700
        bg-white bg-clip-padding bg-no-repeat
        border border-solid border-gray-300
        rounded
        transition
        ease-in-out
        m-0
    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label=".form-select-lg example">
		{#each questions as question}
            <option value={question.value}>
                {question.text}
            </option>
		{/each}
	</select>

    <button class={btnStyle} on:click={nextQuestion}>conferma</button>
</div>