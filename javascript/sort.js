const arr = [3, 20, 5, 100, 1,0.00000001, 0.00000002,-1, 90, 200, 40 ,29,2,1];

for(let item of arr){
    setTimeout(() => console.log(item),item)
}