import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README.txt')).read()
CHANGES = open(os.path.join(here, 'CHANGES.txt')).read()

requires = [
    ]

setup(name='chhsiao1981_angular-brunch-seed-livescript',
      version='0.0',
      description='chhsiao1981_angular-brunch-seed-livescript',
      long_description=README + '\n\n' + CHANGES,
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pyramid",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='',
      author_email='',
      url='',
      keywords='web pyramid pylons',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      tests_require=requires,
      test_suite="chhsiao1981_angularbrunchseedlivescript",
      entry_points="""\
      [pyramid.scaffold]
      angular = templates:AngularProjectTemplate
      jade = templates:JadeProjectTemplate
      jade_template = templates:JadeTemplateProjectTemplate
      """,
      )
