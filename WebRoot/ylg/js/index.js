window.onload = function() {
    var boxSlider = document.getElementById('viewPort')
    var list = document.getElementById('boxSlider');
    var prev = document.getElementById('prev');
    var next = document.getElementById('next');
    var target = 0;
    var timer;

    function animate(offset) {
        var newLeft = parseInt(list.style.left) + offset;
        list.style.left = newLeft + 'px';
        if (newLeft > -1920) {
            list.style.left = -3840 + 'px';
        }
        if (newLeft < -3840) {
            list.style.left = -1920 + 'px'
        }
    }

    function play() {
        timer = setInterval(function() {
            next.onclick();
        }, 5000)
    }

    function stop() {
        clearInterval(timer);
    }
    prev.onclick = function() {
        animate(1920);
    };

    next.onclick = function() {
        //由于上边定时器的作用，index会一直递增下去，我们只有5个小圆点，所以需要做出判断
        animate(-1920);
    };
    boxSlider.onmouseover = stop;
    boxSlider.onmouseout = play;
    play();

    var siderMenu = document.getElementById('siderMenu')
    var menulist1 = document.getElementById('menuList1')
    menulist1.onmouseover = function() {
        siderMenu.style.opacity = "1";
    }
    siderMenu.onmouseover = function() {
        siderMenu.style.opacity = "1";
    }
    menulist1.onmouseout = function() {
        siderMenu.style.opacity = "0";
    }
    siderMenu.onmouseout = function() {
        siderMenu.style.opacity = "0";
    }
}