from pyramid.scaffolds.template import Template # API
import logging #logging
import os
import re

def underscore_to_camelcase_uppercase(var):
    return ''.join([word.capitalize() for word in var.split('_')])

def underscore_to_camelcase(var):
    var_camelcase_uppercase = underscore_to_camelcase_uppercase(var)
    return var_camelcase_uppercase[:1].lower() + var_camelcase_uppercase[1:] if var_camelcase_uppercase else ''

class PyramidTemplate(Template):
    """
     A class that can be used as a base class for Pyramid scaffolding
     templates.
    """
    def pre(self, command, output_dir, vars):
        """ Overrides :meth:`pyramid.scaffold.template.Template.pre`, adding
        several variables to the default variables list (including
        ``random_string``, and ``package_logger``).  It also prevents common
        misnamings (such as naming a package "site" or naming a package
        logger "root".
        """
        if vars['package'] == 'site':
            raise ValueError('Sorry, you may not name your package "site". '
                             'The package name "site" has a special meaning in '
                             'Python.  Please name it anything except "site".')
        package_logger = vars['package']
        if package_logger == 'root':
            # Rename the app logger in the rare case a project is named 'root'
            package_logger = 'app'
        vars['package_logger'] = package_logger

        vars['package_dirname'] = os.path.dirname(vars['package_full_name'])

        vars['test_package_full_name'] = re.sub(r'\/', '/test_', vars['package_full_name'])
        if vars['test_package_full_name'][0:3] != 'test' and vars['test_package_full_name'][0:4] != '/test':
            vars['test_package_full_name'] = re.sub(r'^', 'test_', vars['test_package_full_name'])

        vars['test_package_dirname'] = re.sub(r'\/', '/test_', vars['package_dirname'])
        if vars['test_package_dirname'][0:3] != 'test' and vars['test_package_dirname'][0:4] != '/test':
            vars['test_package_dirname'] = re.sub(r'^', 'test_', vars['test_package_dirname'])
        if vars['package_dirname'] == '' or vars['package_dirname'] == '.':
            vars['test_package_dirname'] = '.'

        vars['package_full_name_dot'] = re.sub(r'\/', '.', vars['package_full_name'])

        logging.warning('command: ' + repr(command))
        logging.warning('output_dir: ' + repr(output_dir))
        logging.warning('vars: ' + repr(vars))
        vars['project_camelcase'] = underscore_to_camelcase(vars['project'])
        vars['project_camelcase_uppercase'] = underscore_to_camelcase_uppercase(vars['project'])
        return Template.pre(self, command, output_dir, vars)

    def post(self, command, output_dir, vars): # pragma: no cover
        """ Overrides :meth:`pyramid.scaffold.template.Template.post`, to
        print "Welcome to Pyramid.  Sorry for the convenience." after a
        successful scaffolding rendering."""
        self.out('Welcome to Pyramid.  Sorry for the convenience.')
        return Template.post(self, command, output_dir, vars)

    def out(self, msg): # pragma: no cover (replaceable testing hook)
        print(msg)

class AngularProjectTemplate(PyramidTemplate):
    _template_dir = 'angular'
    summary = 'angular project'

class JadeProjectTemplate(PyramidTemplate):
    _template_dir = 'jade'
    summary = 'jade project'

class JadeTemplateProjectTemplate(PyramidTemplate):
    _template_dir = 'jade_template'
    summary = 'jade_template project'
