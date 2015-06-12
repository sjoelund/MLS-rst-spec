REM Command file for local python installation

msiexec /a python-2.7.10.msi /qb TARGETDIR="%~dp0\python27"
python27\python.exe -m ensurepip
python27\python.exe -m pip install -U pip
python27\python.exe -m pip install -U sphinx
python27\python.exe -m pip install -U sphinxcontrib-inlinesyntaxhighlight

PAUSE
