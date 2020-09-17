<?php
namespace Zumba;

/**
 * ZinLogin Class to verify if a username and password are valid ZIN credentials
 *
 * Usage:
 *   $ZinLogin = new Zumba\ZinLogin();
 *
 *   if($ZinLogin->checkStatus($_POST['zin_username'], $_POST['zin_password'])){
 *       valid ZIN member
 *   } else {
 *       not a valid ZIN member
 *   }
 *
 *   IMPORTANT:
 *   Do NOT store the users ZIN password or login
 *   Do NOT store any data you don't need to complete the order.
 *
 *   You may store the InstructorId, which you can use to retrieve the ZINs data without needing his username password:
 *
 *   $ZinLogin = new Zumba\ZinLogin();
 *   $ZinLogin->instructorID = {The zins ID};
 *   $ZinLogin->getUserDetails;
 *
 *   in both cases, the ZINs details will be available through
 *   $ZinLogin->instructorData (which will be an array containing all the data);
 *
 */

class ZinLogin {

    var $url = 'https://api.zumba.com/api/users/info.json';
    var $instructorID = '';

    function __construct(){
        $this->ch = curl_init($this->url);
        curl_setopt($this->ch, CURLOPT_POST, 1);
        curl_setopt ($this->ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt ($this->ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt ($this->ch, CURLOPT_RETURNTRANSFER, true);
    }

    function __destruct(){
        curl_close($this->ch);
    }

    public function checkStatus($username, $password){
        $data = array('username' => $username,
                      'password' => $password,
                      'action'   => 'verify_user');

        $post = http_build_query($data);
        curl_setopt ($this->ch, CURLOPT_POSTFIELDS, $post);

        $returnstring = curl_exec($this->ch);

        $result = json_decode($returnstring, true);

        if(isset($result['response']['error']) && $result['response']['error'] != ""){
            return false;
        } else {
            if($result['response']['instructor']['instructorStatusId'] == 4){
                $this->instructorID = $result['response']['instructor']['instructorId'];
                $this->instructorData = $result['response']['instructor'];
                return true;
            } else {
                return false;
            }
        }
    }

    public function login($username, $password){
        return $this->checkStatus($username, $password);
    }

    public function getUserDetails(){
        $data = array('userId' => $this->instructorID,
                      'action' => 'user_detail');

        $post = http_build_query($data);
        curl_setopt($this->ch,CURLOPT_POSTFIELDS,$post);

        $returnstring = curl_exec($this->ch);

        $result = json_decode($returnstring, true);

        $this->instructorData = $result['response']['instructor'];
    }
}