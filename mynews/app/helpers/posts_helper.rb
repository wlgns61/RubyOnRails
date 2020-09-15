module PostsHelper
    def longtitle(title, size)
        if(title.length > size)
            title = title[0..size].concat("...")
        end
        return title
    end
    
    def maskname(name)
        last = name.length - 1
        name = name[0,last].concat("*")
        return name
    end
end
