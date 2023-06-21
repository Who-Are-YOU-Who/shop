Morris.Bar({
  element: 'graph',
  data: [
    {x: '등록자', y: 3, z: 2},
    {x: '미등록자', y: 2, z: null}
  ],
  xkey: 'x',
  ykeys: ['y', 'z'],
  labels: ['정상', '이상발열자']
}).on('click', function(i, row){
  console.log(i, row);
});