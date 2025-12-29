{...}:
{
    # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dragonline = {
    isNormalUser = true;
    description = "Dragonline";
    extraGroups = [ "networkmanager" "wheel" ];
    packages =   [
    #  thunderbird
    ];
  };
}
