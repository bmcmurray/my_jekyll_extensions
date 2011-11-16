module Jekyll
  class CacheManifest < StaticFile
  
  end

  class CacheManifestGenerator < Generator
    safe true

    # Generate a customized cache.manifest file which
    # accounts for all of the static files
    def generate(site)
    end
  end
end
