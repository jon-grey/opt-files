
export M2_HOME=/opt/apache-maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms2048m -Xmx1024m"
export PATH=$M2:$PATH

export JAVA_HOME=/opt/oracle/jdk
export J2SDKDIR=${JAVA_HOME}
export J2REDIR=${JAVA_HOME}/jre
export JAVA_HOME=${JAVA_HOME}
export DERBY_HOME=${JAVA_HOME}/db
export PATH=$PATH:${JAVA_HOME}/bin:${JAVA_HOME}/db/bin:${JAVA_HOME}/jre/bin

export DOT_M2="/opt/.m2/repository/com/ericsson/"


# Recommended Maven opts
export MAVEN_OPTS="-Xms1024m -Xmx4096m -Xss1024m \
-Djava.io.tmpdir=/tmp/ \
-XX:+TieredCompilation \
-XX:TieredStopAtLevel=1 \
-Xverify:none"
