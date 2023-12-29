#! /bin/zsh

export SRC=/Users/arkper/projects/office-forms-ui/dist/office-forms-ui
export DEST=/Users/arkper/projects/scheduler/src/main/resources/static
export API_HOME=/Users/arkper/projects/scheduler
export UI_HOME=/Users/arkper/projects/office-forms-ui

npm run build

rm -rf $DEST/*

cp -a $SRC/* $DEST

cd $API_HOME

mvn clean install -DskipTests

git add -A
git commit -m "new UI build"
git push origin HEAD

cd $UI_HOME
git add -A
git commit -m "new UI build"
git push origin HEAD

