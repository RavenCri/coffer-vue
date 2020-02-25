
function getUserInfo(){
  
    return sessionStorage.getItem('user')==null?'{}':JSON.parse(sessionStorage.getItem('user'));
}

function setUserInfo(user){
    sessionStorage.setItem('user',JSON.stringify(user))
}

export default{
    getUserInfo,setUserInfo
}