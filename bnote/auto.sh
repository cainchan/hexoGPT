#!/bin/zsh
#source ~/.zshrc

# 读取Title,文件名
temp=$1
title=${*/$1/}
title=`echo $title|sed -e 's/^[[:space:]]*//'`
filename=`echo $title |sed -e 's/[^A-Za-z0-9*]/-/g'|sed -e 's/[-][-]*/-/g'| sed -e 's/-$//g' |awk '{print tolower($1)}'`
filepath=source/_posts/$filename.md

# 新建文章md
if [ -e $filepath ];then
    filename=$filename-`date +%Y%m%d%H%M%S`
    filepath=source/_posts/$filename.md
fi

echo title=$title
echo filepath=$filepath

docker run -i --rm --volume $PWD:/data:rw --volume $HOME:/root:rw --workdir /data hkccr.ccs.tencentyun.com/zhengkai/hexo:20-alpine hexo new $temp -s $filename $title

# 用chatgpt生成内容并追加到文章中
data="{\"message\":\"${title}, 500字以上\"}"
echo $data
curl -s -X POST -H "Content-Type:application/json" -d $data https://p2qe9s.laf.dev/send |python3 -c "import sys,json;ret=json.load(sys.stdin);print(ret.get('text',{}))" >> $filepath
echo $filepath Done
# 部署 hexo s -g