exports.displayData= function () {
   return "Function is Called";
};

exports.genSum= function (n) {
    var sum=0;
    for(i=0;i<=n;i++){
        sum = sum+i;
    }
    return "Summation is"+sum;
 };