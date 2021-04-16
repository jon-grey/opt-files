
# PYPI

pypi_upload_latest() {
	echo "### [INFO] BUILD setup.py"
	python setup.py bdist_wheel --universal
	python setup.py sdist

	echo "### [INFO] GET latest build"
	local latest=$(find dist | grep .whl$ | sort --version-sort --reverse | head -n 1)

	echo "### [INFO] LATEST build version is ${latest}"

	echo "### [INFO] INSTALL in pip"
	pip install ${latest} --upgrade

	echo "### [INFO] UPLOAD to PyPi"
	twine upload ${latest} --verbose 

	echo "### [INFO] INSTALL package $(basename $PWD) from PyPI"
	pip install $(basename $PWD) --upgrade

	echo "### [INFO] UPLOAD new package to git"
	git add -A
	git commit -m "$(basename $PWD): new version for pypi: $latest"
	git push

}
