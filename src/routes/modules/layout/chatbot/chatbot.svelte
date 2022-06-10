<script>
    import '../../../../athelas.css'
    import Chatbotintro from './chatbotintro.svelte';
    import Firstmsg from './messages/firstmsg.svelte';
    import Secondmsg from './messages/secondmsg.svelte';
    import Thirdmsg from './messages/thirdmsg.svelte';
    import Fourthmsg from './messages/fourthmsg.svelte';
    import Fifthmsg from './messages/fifthmsg.svelte';
    import Sixthmsg from './messages/sixthmsg.svelte';
    import Seventhmsg from './messages/seventhmsg.svelte';
    import Eightmsg from './messages/eightmsg.svelte';
    import { username, currentQuestion, start, answers, currentAnswer, introQuestions, agreement, exit } from '../../../../storage/store';

    var interval;
    var text = "";
    var disabled = true;
    var btnStyle = "bg-blue-500 text-white font-bold py-2 px-4 rounded-full opacity-50 cursor-not-allowed";

    const clickHandler = function() {

        // if username has not been set
        if ($introQuestions == 0) {

            console.log("setting up user name")

            var name = text.split("");

            console.log(name);

            // set name
            username.set(name[-1]);
            // go to intro question number 2
            introQuestions.set(1);

            // reset text input field
            document.getElementById("userTextField").value = "";

            // reset button status
            disabled = true;
            btnStyle = "bg-blue-500 text-white font-bold py-2 px-4 rounded-full opacity-50 cursor-not-allowed";

        } else if ($introQuestions == 1) {

            if(!text.includes("no") && !text.includes("No") && !text.includes("NO")){
                
                agreement.set(text);
                console.log("starting evaluation")

                // add answer to list
                $answers = [...$answers, text];

                console.log($answers);

                // update answer position
                currentAnswer.set($currentAnswer+1)

                // reset text input field
                document.getElementById("userTextField").value = "";

                // reset button status
                disabled = true;
                btnStyle = "bg-blue-500 text-white font-bold py-2 px-4 rounded-full opacity-50 cursor-not-allowed";

                // set start to true after 1 second
                interval = window.setTimeout(() => start.set(true), 1000);
            } else {
                agreement.set(text);
                exit.set(true);

                console.log("evaluation won't start")

                // reset text input field
                document.getElementById("userTextField").value = "";

                // reset button status
                disabled = true;
                btnStyle = "bg-blue-500 text-white font-bold py-2 px-4 rounded-full opacity-50 cursor-not-allowed";
            }
        }
	}

    const writingHandler = function() {

        // if user is writing, reset timeout
        window.clearTimeout(interval)

        // if text is not an ampty string, update button status
        if (text == "") {
            disabled = true;
            btnStyle = "bg-blue-500 text-white font-bold py-2 px-4 rounded-full opacity-50 cursor-not-allowed";
        } else {
            disabled = false;
            btnStyle = "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full";
        }
    }

    function updateChatBoxPos() {
        let height = document.getElementById("chatbox").clientHeight;
        document.getElementById("chatbox").style.transform = "translateY(-" + height + "px)";
    }

</script>

<div class="h-96 flex flex-col justify-between bg-white z-20 relative" style="width: 500px;">
    
    <div class="h-max overflow-visible w-full flex flex-row">
        <div style="width: 70px; min-width: 70px;"><img src="doctor.png" alt="bot doctor" /></div>
        <div class="transition-transform" id="chatbox">
            <Chatbotintro />

            {#if $start}
                <!-- STARTING HEALTH EVALUATION -->
                {updateChatBoxPos() || ""}
                <Firstmsg />

                {#if $currentQuestion >= 2}
                    {updateChatBoxPos() || ""}
                    <Secondmsg />
                {/if}

                {#if $currentQuestion >= 3}
                    {updateChatBoxPos() || ""}
                    <Thirdmsg />
                {/if}

                {#if $currentQuestion >= 4}
                    {updateChatBoxPos() || ""}
                    <Fourthmsg />
                {/if}

                {#if $currentQuestion >= 5}
                    {updateChatBoxPos() || ""}
                    <Fifthmsg />
                {/if}

                {#if $currentQuestion >= 6}
                    {updateChatBoxPos() || ""}
                    <Sixthmsg />
                {/if}

                {#if $currentQuestion >= 7}
                    {updateChatBoxPos() || ""}
                    <Seventhmsg />
                {/if}

                {#if $currentQuestion >= 8}
                    {updateChatBoxPos() || ""}
                    <Eightmsg />
                {/if}
            {/if}
        </div>
    </div>
    
    <div class="w-full flex flex-row justify-between z-40 absolute bottom-0 left-0" style="height: 50px; width: 500px;">
                <input id="userTextField" class="shadow appearance-none border rounded-lg py-2 px-3 w-4/5 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" type="text" bind:value={text} on:input={writingHandler}>
                <button disabled={disabled} class={btnStyle} on:click={clickHandler}><img class="w-5" src="up-arrow.png" alt="send message" /></button>
    </div>
</div>

<div class="-m-16 w-96 p-16 flex flex-col justify-end relative overflow-hidden">
    <img src="athelas.png" class="absolute z-40 top-20 w-44" style="transform: translate(20px, 0px)" alt="athelas logo" />
    <img class="absolute" style="transform: translate(-50px, -15px) scale(1.3);" src="banner.jpg" alt="banner" />
</div>