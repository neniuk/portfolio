<script>
    import { onMount } from "svelte";

    export let intervalMs = 500;

    let currentIdx = 0;
    let timer;

    // const frames = [
    //     "|( *ˊ ᵕ ˋ* )|",
    //     "\\( *ˊ ᵕ ˋ* )/",
    //     "⟍( *ˊ ᗜ ˋ* )⟋",
    //     "__( *ˊ ᗜ ˋ* )__",
    // ];

    const frames = [
        { leftArm: "|", mouth: "ᵕ", rightArm: "|" },
        { leftArm: "\\", mouth: "ᵕ", rightArm: "/" },
        { leftArm: "⟍", mouth: "ᗜ", rightArm: "⟋" },
        { leftArm: "__", mouth: "ᗜ", rightArm: "__" },
    ];

    onMount(() => {
        if (!frames || frames.length <= 1) return;

        let direction = 1;
        timer = setInterval(() => {
            if (currentIdx === frames.length - 1) direction = -1;
            else if (currentIdx === 0) direction = 1;

            currentIdx += direction;
        }, intervalMs);

        return () => clearInterval(timer);
    });
</script>

<!-- <span class="pl-4 inline-flex w-[18ch] justify-center whitespace-pre font-mono">
    {frames[currentIdx]}
</span> -->

<span class="inline-flex items-baseline whitespace-pre font-mono">
    <span class="inline-block w-[2ch] text-right"
        >{frames[currentIdx].leftArm}</span
    >
    <span>( *ˊ </span>
    <span class="inline-block w-[1.5ch] text-center"
        >{frames[currentIdx].mouth}</span
    >
    <span> ˋ* )</span>
    <span class="inline-block w-[2ch] text-left"
        >{frames[currentIdx].rightArm}</span
    >
</span>
