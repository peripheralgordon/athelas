import { writable } from 'svelte/store'

// current visualized page
export const currentPage = writable(0);

// current bot question
export const introQuestions = writable(0);
export const currentQuestion = writable(1);

// startchatbot analysis
export const start = writable(false);

// user answers
export const answers = writable([]);
export const currentAnswer = writable(0);
export const score = writable(0);
export const username = writable("");
export const agreement = writable("");
export const exit = writable(false);

// wellness score
export const wellnessScore = writable(0);