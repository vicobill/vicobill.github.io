package client;

type Session struct {
	id 				string;
	token 			string;
	expire_time 	string;
}


type Client struct {
	id 		int64;
	session Session;
}

