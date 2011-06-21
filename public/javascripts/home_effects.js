var numBoxes = 18;

function initGlobals(){
    up = new Array();
    fadeToValue = new Array();
    currValue = new Array();
    brightestRGB = new Array();
    tileArray = new Array();
    
    // Gray Fade
    brightestRGB[0] = 0xaaaaaa; // light gray
    brightestRGB[1] = 0xb2b2b2;
    brightestRGB[2] = 0x666666;
    brightestRGB[3] = 0x3d3d3d;
    brightestRGB[4] = 0x444444;
    brightestRGB[5] = 0x222222;
    brightestRGB[6] = 0x111111;
    brightestRGB[7] = 0x999999;
    brightestRGB[8] = 0x828282;
    brightestRGB[9] = 0x414141;
    brightestRGB[10] = 0x444444;
    brightestRGB[11] = 0x222222;
    brightestRGB[12] = 0x252525;
    brightestRGB[13] = 0x1e1e1e;
    brightestRGB[14] = 0xbbbbbb;
    brightestRGB[15] = 0x777777;
    brightestRGB[16] = 0x444444;
    brightestRGB[17] = 0x2e2e2e;
    brightestRGB[18] = 0x333333;
    brightestRGB[19] = 0x2e2e2e;
    brightestRGB[20] = 0x111111;
    brightestRGB[21] = 0x999999;
    brightestRGB[22] = 0x333333;
    brightestRGB[23] = 0x222222;
    brightestRGB[24] = 0x111111; // dark gray

    // Red-Yellow
//    brightestRGB[0] = 0xff0000;
//    brightestRGB[1] = 0xff0f00;
//    brightestRGB[2] = 0xff2300;
//    brightestRGB[3] = 0xff2d00;
//    brightestRGB[4] = 0xff3700;
//    brightestRGB[5] = 0xff4100;
//    brightestRGB[6] = 0xff4b00;
//    brightestRGB[7] = 0xff5500;
//    brightestRGB[8] = 0xff5f00;
//    brightestRGB[9] = 0xff6900;
//    brightestRGB[10] = 0xff7300;
//    brightestRGB[11] = 0xff7d00;
//    brightestRGB[12] = 0xff8700;
//    brightestRGB[13] = 0xff9100;
//    brightestRGB[14] = 0xff9b00;
//    brightestRGB[15] = 0xffa500;
//    brightestRGB[16] = 0xffaf00;
//    brightestRGB[17] = 0xffb900;
//    brightestRGB[18] = 0xffc300;
//    brightestRGB[19] = 0xffcd00;
//    brightestRGB[20] = 0xffd700;
//    brightestRGB[21] = 0xffe100;
//    brightestRGB[22] = 0xffeb00;
//    brightestRGB[23] = 0xfff500;
//    brightestRGB[24] = 0xffff00;

    for(i=0; i<numBoxes; i++) {
        fadeToValue[i] = brightestRGB[i];
        up[i] = 1;
    }
}

function tileFadeSetup() {
    var startRGB = 0x101010; // dark gray
    var i;

    for(i =0 ; i<numBoxes; i++) {
        j = i + 1;
        tileArray[i] = document.getElementById('box'+j);
        tileArray[i].style.background = "#"+startRGB.toString(16);
        currValue[i] = startRGB;
    }
    updateTiles();
}

function resetValues() {

//    var contrast = 0x222222;
    var ceilingRGB = 0xbcbcbc; // light gray
    var floorRGB = 0x101010; // dark gray

        /*pick a random number between 0 and 24*/
        for(var nextIndex in tileArray){

            if(up[nextIndex] == 1){
                fadeToValue[nextIndex] = ceilingRGB;
            }else{
                fadeToValue[nextIndex] = floorRGB;
            }

            currValue[nextIndex] = brightestRGB[nextIndex];
        }
}

function updateTiles() {
    var j;
    var step = 0x010101;
    var numDone = 0;
    var posNeg = new Array(-1, 1);

    for(var i in tileArray) {
        if (currValue[i] != fadeToValue[i]) {
            j = up[i];
            currValue[i] += step*posNeg[j];
            window.tileArray[i].style.backgroundColor = "#"+currValue[i].toString(16);
        } else if (fadeToValue[i] != brightestRGB[i]) {
            fadeToValue[i] = brightestRGB[i];
            j = up[i];
            up[i] = up[i] + -1*posNeg[j];
        } else if (fadeToValue[i] == brightestRGB[i]) {
            numDone += 1;
        }
    }

    if(numDone == numBoxes){
        numDone = 0;
        resetValues();
    }

    setTimeout("updateTiles()", 30);
}

function initIndex() {
    initGlobals();
    setTimeout("tileFadeSetup()", 1);
}

window.onload = initIndex();

