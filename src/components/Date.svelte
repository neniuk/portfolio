<script>
    const today = new Date();

    const formatted = today.toLocaleDateString("en-FI", {
        year: "numeric",
        month: "long",
        day: "numeric",
    });
</script>

<span>{formatted}</span>
