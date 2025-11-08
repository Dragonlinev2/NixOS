{ inputs, ... }:
{
	services.foundryvtt = {
		enable = true;
		hostName = "myhostname.com";
		proxySSL = true;
		proxyPort = 443;
	};
}