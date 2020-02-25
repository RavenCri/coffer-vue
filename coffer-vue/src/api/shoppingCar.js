

function getShoppringCar(){
    return sessionStorage.getItem('shoppringCar')==null?'{}':JSON.parse(sessionStorage.getItem('shoppringCar'));
     
}
function setShoppringCar(shoppringCar){
  
    sessionStorage.setItem('shoppringCar',JSON.stringify(shoppringCar))
}
export default{
   getShoppringCar,setShoppringCar
}