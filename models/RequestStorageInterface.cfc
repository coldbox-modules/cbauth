interface name="RequestStorageInterface" {
    public any function getVar( required string name, any defaultValue );
    public void function setVar( required string name, required any value );
    public boolean function deleteVar( required string name );
    public boolean function exists( required string name );
}
