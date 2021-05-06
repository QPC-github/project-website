# this extracts all javadoc filenames from OpenSearch. Generates both the pseudo csv (to extract the files from the other script) and the markdown files (directly for jekyll)

cd $1
cd ..
ls -R OpenSearch | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }' | grep /javadoc/ > $3$2.csv

echo "---\nprimary_title: Docs\ntitle: '$2 JavaDocs'\njavadocs:\n$(ls -R OpenSearch | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print "  - "s"/"$0 }' | grep /javadoc/)\n---\n\n" > $4$2.markdown