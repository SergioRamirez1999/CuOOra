Class {
	#name : #MyFileLibrary,
	#superclass : #WAFileLibrary,
	#category : #'CuOOra-resources'
}

{ #category : #uploaded }
MyFileLibrary >> stylesCss [
	^ 'body {
    padding: 0px 70px 0px 70px;
    background-color: #000;
}
a {
    text-decoration: none;
    color: inherit;
}
h1, h2, h3, a {
    color: #fff;
}

a:hover {
    text-decoration: underline;
}
/*###########################*/
/*##### HEADER SECTION ######*/
/*###########################*/
.header-container {
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #D2D4D4;
    margin-bottom: 30px;
}
.header-title {
    color: #FA1440;
    font-size: 32px;
}
.header-title:hover {
    text-decoration: none;
}
.header-right-content {
    font-size: 18px;
}
.header-right-content > span {
    margin-right: 15px;
}
.header-right-content .btn-logout {
    background-color: #FA1440;
    padding: 10px 20px 10px 20px;
    color: #fff;
    border-radius: 5px;
    transition-duration: 0.4s;
}
.header-right-content .btn-logout:hover {
    background-color: rgba(250, 20, 64, 0.5);
}
/*###########################*/
/*### NEW QUESTION POST ###*/
/*###########################*/
.btn-new-post {
    position: fixed;
    width: 60px;
    height: 60px;
    bottom: 40px;
    right: 60px;
    background-color: #FA1440;
    color: #FFF;
    font-size: 35px;
    border-radius: 50px;
    text-align: center;
    box-shadow: 2px 2px 3px #999;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition-duration: 0.4s;
    border: 1px solid #fff;
}
.btn-new-post:hover {
    background-color: rgba(250, 20, 64, 0.5);
}
/*###########################*/
/*###### BACK BUTTON ########*/
/*###########################*/
.btn-back-button {
    padding: 10px;
    background-color: #F7C920;
    color: #FFF;
    border-radius: 5px;
    margin-top: 10px;
}
/*###########################*/
/*###### FOLLOW BUTTON ######*/
/*###########################*/
.btn-follow-unfollow {
    padding: 10px;
    color: #FFF;
    border-radius: 5px;
    margin-top: 10px;
}
/*###########################*/
/*## LIKE/DISLIKE BUTTON ####*/
/*###########################*/
.btn-lk-dlk {
    width: 50px;
    padding: 5px;
    color: #FFF;
    background-color: #007bff;
    border-radius: 5px;
    margin-right: 12px;
    cursor: pointer;
    border: none;
    outline: none;
}
/*###########################*/
/*###### BODY CONTAINER #####*/
/*###########################*/
.body-container {
    text-align: center;
}
/*###########################*/
/*##### POSTS CONTAINER #####*/
/*###########################*/
.posts-container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

/*###########################*/
/*##### POST CONTAINER ######*/
/*###########################*/
.post-container {
    flex: 50%;
    text-align: center;
    padding: 20px;
    max-width: 40%;
    background-color: #FA1440;
    border-radius: 10px;
    box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
    margin-top: 30px;
    margin-bottom: 30px;
    color: #fff;
}
/*###########################*/
/*##### FORM CONTAINER ######*/
/*###########################*/

.wrapper{
    position: absolute;
    top: 53%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    max-width: 550px;
    background: rgba(0,0,0,0.8);
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}

.new-question-form{
    display: flex;
    align-content: center;
}
.new-question-form > form {
    width: 100%;
}
.input-fields{
    display: flex;
    flex-direction: column;
    margin-right: 4%;
}
  
.input-fields .input,.msg textarea{
    margin: 10px 0;
    background: #000;
    border: 0px;
    border-bottom: 2px solid rgba(217, 0, 36, 0.8);
    padding: 10px;
    color: #FFF;
    width: 100%;
}
.msg{
    margin-right: 4%;
}
.msg textarea{
    height: 212px;
    resize: none;
}

.btn-accept {
    background: #FA1440;
    text-align: center;
    padding: 15px;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    text-transform: uppercase;
    border: none;
    outline: none;
    width: 100%;
}

@media screen and (max-width: 600px){
  .new-question-form{
    flex-direction: column;
  }
  .msg textarea{
    height: 80px;
  }
  .input-fields,
  .msg{
    width: 100%;
  }
}'
]
