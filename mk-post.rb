usage = "ruby mk-post.rb 文章标题 分类,分类,..."

if ARGV[0] == nil then 
    p usage
    return
end
title = ARGV[0]
categories= ARGV[1] or "blog,common"
today = Time.now
header = """---
layout: post
title: #{title}
categories: #{categories}
date: #{Time.now}
---
"""
prf = './_posts/'
date = today.strftime("%Y-%m-%d")
mdfilename = "#{prf}#{date}-#{title}.md"


File.open(mdfilename,'w') do |f|
    f.write header
end

system "code #{mdfilename}"