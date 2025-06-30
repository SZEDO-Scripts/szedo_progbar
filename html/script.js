window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.action === "start") {
        const label = document.getElementById('progress-label');
        const fill = document.getElementById('progress-fill');
        const container = document.getElementById('progress-container');

        label.textContent = data.label;
        fill.style.transition = `width ${data.time}ms linear`;
        fill.style.width = '0%';
        container.style.display = 'flex';

        setTimeout(() => {
            fill.style.width = '100%';
        }, 50);
    }

    if (data.action === "stop") {
        const fill = document.getElementById('progress-fill');
        const container = document.getElementById('progress-container');
        fill.style.width = '0%';
        container.style.display = 'none';
    }
});
