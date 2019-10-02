component {

    this.name = 'TestBoxTestingSuite' & hash(getCurrentTemplatePath());
    this.sessionManagement = true;

    this.mappings['/tests'] = getDirectoryFromPath(getCurrentTemplatePath());
    this.mappings['/root'] = REReplaceNoCase(this.mappings['/tests'], 'tests(\\|/)', '');;

}
