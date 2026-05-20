<script>
    import { onMount } from "svelte";

    export let items = [];
    export let intervalMs = 4000;

    let currentIdx = 0;
    let timer;

    onMount(() => {
        if (!items || items.length <= 1) return;
        timer = setInterval(() => {
            currentIdx = (currentIdx + 1) % items.length;
        }, intervalMs);

        return () => clearInterval(timer);
    });
</script>

<div class="rot-wrapper relative">
    <h1
        class="rot-headline max-w-3xl text-balance text-5xl font-black tracking-tight text-black dark:text-white sm:text-6xl lg:text-7xl leading-[1.08]"
        aria-live="polite"
    >
        {items[currentIdx]}
    </h1>
</div>

<style>
    :global(.rot-wrapper) {
        height: 18rem;
        overflow: hidden;
        display: flex;
        align-items: center;
    }

    @media (min-width: 640px) {
        :global(.rot-wrapper) {
            height: 21rem;
        }
    }

    @media (min-width: 1024px) {
        :global(.rot-wrapper) {
            height: 24rem;
        }
    }

    :global(.rot-headline) {
        width: 100%;
    }
</style>
