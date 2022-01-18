
var time = 3600; // 1 hour

const timerContainer = 'timer';

const timer = () => {
    let timerblock = document.getElementById('timer');
    let hours = parseInt(time / 3600);
    let timeLeft = time - hours * 3600;
    let minutes = parseInt(timeLeft / 60);
    timeLeft = timeLeft - minutes * 60;
    let seconds = timeLeft;

    hours = hours.toString();
    minutes = minutes.toString();
    seconds = seconds.toString();

    if (hours.length == 1)
        hours = '0' + hours;
    if (minutes.length == 1)
        minutes = '0' + minutes;
    if (seconds.length == 1)
        seconds = '0' + seconds;

    timerblock.innerHTML = hours + ':' + minutes + ':' + seconds;

    timerblock.style.display = 'block';
    if (time <= 59) {
        timerblock.style.color = 'red';
        setTimeout(() => {
            timerblock.style.display = 'none';
        }, 500)
    }

    if (time <= 0) {
        clearInterval(interval);
        alert('end');
    }
    time--;

}

var interval = setInterval(timer, 1000);
