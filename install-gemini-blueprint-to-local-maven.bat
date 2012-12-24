REM @echo off
REM if a suitable repo would be found, this step could be done easier to use that directly
REM see instructions at http://stackoverflow.com/questions/4157170/maven-command-to-install-remote-dependency-locally

set GEMINI_VERSION=1.0.2.RELEASE

set ARTIFACTFILENAME=org.eclipse.gemini.blueprint.core-%GEMINI_VERSION%.jar
wget "http://ebr.springsource.com/repository/app/bundle/version/download?name=org.eclipse.gemini.blueprint.core&version=%GEMINI_VERSION%&type=binary" -O "%ARTIFACTFILENAME%"
if exist "%ARTIFACTFILENAME%" (
  set POMFILEPATH=META-INF/maven/org.eclipse.gemini.blueprint/gemini-blueprint-core/pom.xml
  jar xf org.eclipse.gemini.blueprint.core-%GEMINI_VERSION%.jar %POMFILEPATH%
  call mvn install:install-file "-Dfile=%ARTIFACTFILENAME%" "-DpomFile=%POMFILEPATH%"
  del "%ARTIFACTFILENAME%"
  rd /s /q META-INF
) else (
  echo Couldn't download %ARTIFACTFILENAME%, wget missing?
  echo ...
)

set ARTIFACTFILENAME=org.eclipse.gemini.blueprint.io-%GEMINI_VERSION%.jar
wget "http://ebr.springsource.com/repository/app/bundle/version/download?name=org.eclipse.gemini.blueprint.io&version=%GEMINI_VERSION%.RELEASE&type=binary" -O %ARTIFACTFILENAME%
if exist "%ARTIFACTFILENAME%" (
  set POMFILEPATH=META-INF/maven/org.eclipse.gemini.blueprint/gemini-blueprint-io/pom.xml
  jar xf "%ARTIFACTFILENAME%" %POMFILEPATH%
  call mvn install:install-file "-Dfile=%ARTIFACTFILENAME%" "-DpomFile=%POMFILEPATH%"
  del "%ARTIFACTFILENAME%"
  rd /s /q META-INF
) else (
  echo Couldn't download %ARTIFACTFILENAME%, wget missing?
  echo ...
)

set ARTIFACTFILENAME=org.eclipse.gemini.blueprint.extender-%GEMINI_VERSION%.jar
wget "http://ebr.springsource.com/repository/app/bundle/version/download?name=org.eclipse.gemini.blueprint.extender&version=%GEMINI_VERSION%.RELEASE&type=binary" -O "%ARTIFACTFILENAME%"
if exist "%ARTIFACTFILENAME%" (
  set POMFILEPATH=META-INF/maven/org.eclipse.gemini.blueprint/gemini-blueprint-extender/pom.xml
  jar xf "%ARTIFACTFILENAME%" %POMFILEPATH%
  call mvn install:install-file "-Dfile=%ARTIFACTFILENAME%" "-DpomFile=%POMFILEPATH%"
  del "%ARTIFACTFILENAME%"
  rd /s /q META-INF
) else (
  echo Couldn't download %ARTIFACTFILENAME%, wget missing?
  echo ...
)