// y = ax^m + bx^n + c

var a = 0;
var b = 0;
var m = 0;
var n = 0;
var c = 0;

//user input


var xVal = [1, 2, 3, 5, 7, 11, 13, -1, -2, -3, -4, -5, -7, -11, -13];

document.getElementById("submitButton").onclick = function() {
    //User input

    a = document.getElementById('inputBoxA').value;
    b = document.getElementById('inputBoxB').value;
    c = document.getElementById('inputBoxC').value;
    m = document.getElementById('inputBoxM').value;
    n = document.getElementById('inputBoxN').value;

    let isEven = checkIfEven(a, b, m, n, c, xVal);
    let isOdd = checkIfOdd(a, b, m, n, c, xVal);

    if (isEven == true) {
        var result = "Function is even.";
    } else if (isOdd == true) {
        var result = "Function is odd.";
    } else {
        var result = "Function is neither even nor odd.";
    }

    console.log(result)
    document.getElementById('paragraph').innerHTML = result;
}

document.getElementById("resetButton").onclick = function() {
    //User input
    clearInputs();
}


function checkIfEven(a, b, m, n, c, xVal) {
    let i = 0;
    let yOfPlusX;
    let evenMightBeTrue = 0;

    while (i < xVal.length) {
        currentXVal = xVal[i];
        yOfPlusX = a * Math.pow(currentXVal, m) + b * Math.pow(currentXVal, n) + c;
        yOfMinusX = a * Math.pow(-currentXVal, m) + b * Math.pow(-currentXVal, n) + c;
        
        if (yOfPlusX == yOfMinusX) {
            evenMightBeTrue += 1;
        } else {
            break;
        }
        
        i+=1;
    }

    if (evenMightBeTrue == xVal.length) {
        console.log("function is even")
        return true;
    } else {
        console.log("function is not even")
        return false;
    }
}

function checkIfOdd(a, b, m, n, c, xVal) {
    let j = 0;
    let yOfPlusX;
    let minusYOfPlusX;
    let oddMightBeTrue = 0;

    while (j < xVal.length) {
        currentXVal = xVal[j];
        yOfPlusX = a * Math.pow(currentXVal, m) + b * Math.pow(currentXVal, n) + c
        minusYOfPlusX = -1 * yOfPlusX;
        yOfMinusX = a * Math.pow(-currentXVal, m) + b * Math.pow(-currentXVal, n) + c;
        
        if (minusYOfPlusX == yOfMinusX) {
            oddMightBeTrue += 1;
        } else {
            break;
        }
        
        j+=1;
    }

    console.log(oddMightBeTrue);

    if (oddMightBeTrue == xVal.length) {
        console.log("function is odd")
        return true;
    } else {
        console.log("function is not odd")
        return false;
    }
}

function clearInputs() {// this is insanely inefficient but I haven't figured out class selectors so fuck it
    document.getElementById('inputBoxA').value = "";
    document.getElementById('inputBoxB').value = "";
    document.getElementById('inputBoxC').value = "";
    document.getElementById('inputBoxM').value = "";
    document.getElementById('inputBoxN').value = "";
}