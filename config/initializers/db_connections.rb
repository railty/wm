db_conf = YAML::load(File.open(File.join(Rails.root,'config','database.yml')))

ALP = db_conf["alp"]
OFC = db_conf["ofc"]
OFMM = db_conf["ofmm"]
OFCD = db_conf["ofcd"]
OHS = db_conf["ohs"]
OHS_POS = db_conf["ohs_pos"]
