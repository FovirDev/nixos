{
  # Ensure this is unique among all clans you want to use.
  meta.name = "Fovir";

  inventory.machines = {
    # Define machines here.
    fovirbox = {
      deploy.targetHost = "fovirbox";
      tags = [ ];
    };
    foviros = {
    };
    iceyeah = {
      deploy.targetHost = "vps";
      tags = [ ];
    };
  };
}
