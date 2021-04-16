

alias mhelp='echo https://rmca.epk.ericsson.se/wiki/index.php/Run_and_build_RMCA'
alias mci='mvn clean install'
alias mcig='mvn clean install -P gui' #build backend and gui
alias mcist='mvn clean install -DskipTests' #skip tests
alias mcigst='mvn clean install -P gui -DskipTests' #build gui and skip tests
# Fastest full RMCA build" +128%
alias mf='mvn clean install \
-DskipTests \
-Dmaven.javadoc.skip=true \
-Dmaven.site.skip=true -T 4' 
# Fastest full RMCA build without packaging RPM, CLI-jar etc. +173% : mvn fast noassembly
alias mvnfa='mvn clean install \
-DskipTests \
-Dmaven.javadoc.skip=true \
-Dassembly.skipAssembly=true \
-Dmaven.site.skip=true -T 4'
# Fastest basic RMCA build +249%
alias mvn_fast_basic='mvn clean install \
-DskipTests \
-Dmaven.javadoc.skip=true \
-Dassembly.skipAssembly=true \
-Dmaven.site.skip=true -T 4 \
-pl \
!jivetest,\
!selenium,\
!standalone,\
!standalone/standalonefeature,\
!standalone/cuspackage,\
!standalone/config,\
!standalone/deploy,\
!avensitegenerator'


mvn_build_run_target_jar() {

        if [ -n "$PROJECTDIR" ]; then
     cd $PROJECTDIR
  fi
        if [ "$(find . | grep pom.xml | wc -l)" == "1" ]; then
    python -c "print('#'*100, 'DO: mvn clean install...')"
    mvnfa
    if [ "$?" == "0" ]; then
    if [ "$(find target | grep 'jar-with-dependencies.jar$' | wc -l)" == "1" ]; then
       python -c "print('#'*100, 'DO: java -jar *jar-with-dependencie.jar...')"
       java -jar $(find target | grep 'jar-with-dependencies.jar$')
    elif [ "$(find target | grep '.jar$' | wc -l)" == "1" ]; then
       python -c "print('#'*100, 'DO: java -jar *.jar...')"
       java -jar $(find target | grep 'jar-with-dependencies.jar$')
    else
       echo "Not found any jar in target dir."
    fi
    else
    python -c "print('#'*100, 'mvn failed...')"
    fi
    return 0;
  else
    echo "Not Maven Project"
    return 1;
  fi

}

java_build_run() {

        echo FILEDIR=$FILEDIR
  echo FILE=$FILE
  echo FILEW=$FILEWE

  if [ -n "$FILEDIR" ]; then
     cd $FILEDIR
  fi

  if [ -n "$FILE" ] && [ -n "$FILEWE" ]; then
  javac $FILE
  if [ "$?" == "0" ]; then
  java $FILEWE
    IdentitiesOnly yes # see NOTES below
  fi
  else
  echo "No FILE and FILEW variables provided to run java."
  fi

}

mvn_build_run_target_jar_or_java() {


   if (! mvn_build_run_target_jar); then
      java_build_run
   fi

}


