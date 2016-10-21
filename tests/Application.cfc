component {

    this.name = 'TestBoxTestingSuite' & hash(getCurrentTemplatePath());

    this.mappings['/tests'] = getDirectoryFromPath(getCurrentTemplatePath());
    this.mappings['/root'] = REReplaceNoCase(this.mappings['/tests'], 'tests(\\|/)', '');;

}