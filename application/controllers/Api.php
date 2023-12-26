<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . '/libraries/JWT.php';
// require APPPATH . '/libraries/ExpiredException.php';
// require APPPATH . '/libraries/BeforeValidException.php';
require APPPATH . '/libraries/SignatureInvalidException.php';
require APPPATH . '/libraries/JWK.php';

require APPPATH . "libraries/format.php";
require APPPATH . "libraries/RestController.php";

    use chriskacerguis\RestServer\RestController;
    use \Firebase\JWT\JWT;
    use \Firebase\JWT\ExpiredException;

class Api extends RestController {

    function configToken(){
        $cnf['exp'] = 360; //milisecond
        $cnf['secretkey'] = '2212336221';
        return $cnf;        
    }

    public function index(){
        echo "api ready";
    }

    public function getToken_post($username,$password){  
        $data = json_decode(file_get_contents("php://input"), true);
        // echo json_encode($data);             
        $exp = time() + $this->configToken()['exp'];
        $token = array(
            "iss" => 'apprestservice',
            "aud" => 'pengguna',
            "iat" => time(),
            "nbf" => time() + 10,
            "exp" => $exp,
            "data" => array(
                "username" => $username,
                "password" => $password
            )
        );       
    
        $jwt = JWT::encode($token, $this->configToken()['secretkey'],'HS256');
        $output = [
                'status' => 200,
                'message' => 'Berhasil login',
                "token" => $jwt,                
                "expireAt" => $token['exp']
            ];      
        $data = array('kode'=>'200', 'pesan'=>'token', 'data'=>array('token'=>$jwt, 'exp'=>$exp));
        $this->response($data, 200 );       
    }
    
    public function login_post (){
        $data = json_decode(file_get_contents("php://input"), true);

		$username = $data['username'];
		$password = $data['password'];

		$user = $this->db->get_where('user', ['username' => $username])->row_array();
		// var_dump($user);


		// user ada
		if($user) {
				// cek password
				if(md5($password) == $user['password']){
				$this->getToken_post($username,$password);	
				} else {
					$this->response('failed', 501 ); 
				}
			
			
		} else {
			//tidak ada user
			$this->response('failed', 502 ); 

		}
	}

    // public function authtoken(){
    //     $secret_key = $this->configToken()['secretkey']; 
    //     $token = null; 
    //     $authHeader = $this->input->request_headers()['Authorization'];  
    //     $arr = explode(" ", $authHeader); 
    //     $token = $arr[1];        
    //     if ($token){
    //         try{
    //             $decoded = JWT::decode($token, $this->configToken()['secretkey'], 'HS256');          
    //             if ($decoded){
    //                 return 'benar';
    //             }
    //         } catch (\Exception $e) {
    //             $result = array('pesan'=>'Kode Signature Tidak Sesuai');
    //             return 'salah';
                
    //         }
    //     }       
    // }

    public function register_post(){
        $data = json_decode(file_get_contents("php://input"), true);
        $insert = $this->db->insert('user',$data);

        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    public function user_post(){
        $data = $this->db->get('user')->result();

        if ($data) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }


}