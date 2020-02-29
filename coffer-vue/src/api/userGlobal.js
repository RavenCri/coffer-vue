
function alreadyLogin(){
    return getUserInfo() !== '{}' ? true:false
}
function getUserInfo(){
  
    return sessionStorage.getItem('user')==null?'{}':JSON.parse(sessionStorage.getItem('user'));
}

function setUserInfo(user){
    sessionStorage.setItem('user',JSON.stringify(user))
}

export default{
    alreadyLogin,getUserInfo,setUserInfo
}

