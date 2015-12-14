module Scripture

using LightXML

typealias String UTF8String

bible_dir = joinpath(splitdir(@__FILE__)[1], "../deps/morphhb/wlc")
bible_books = readdir(bible_dir)

function load_book(file::AbstractString)
  println("Loading $file...")
  xdoc = parse_file(file)
  xroot = root(xdoc)
  println(name(xroot))
end

function load(name::AbstractString)
  for b in bible_books
    ismatch = true
    for i = 1:3
      if !(name[i] == b[i])
        ismatch = false
      end
    end
    if ismatch
      load_book(joinpath(bible_dir, b))
    end
  end
end

end # module
