from pyramid.scaffolds.template import Template # API
import logging #logging

def underscore_to_camelcase(var):
    return ''.join([word.capitalize() for word in var.split('_')])


class Connect4PyramidTemplate(Template):
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

        logging.warn('command: ' + repr(command))
        logging.warn('output_dir: ' + repr(output_dir))
        logging.warn('vars: ' + repr(vars))
        vars['project_camelcase'] = underscore_to_camelcase(vars['project'])
        return Template.pre(self, command, output_dir, vars)

    def post(self, command, output_dir, vars): # pragma: no cover
        """ Overrides :meth:`pyramid.scaffold.template.Template.post`, to
        print "Welcome to Pyramid.  Sorry for the convenience." after a
        successful scaffolding rendering."""
        self.out('Welcome to Pyramid.  Sorry for the convenience.')
        return Template.post(self, command, output_dir, vars)

    def out(self, msg): # pragma: no cover (replaceable testing hook)
        print(msg)

class AngularProjectTemplate(Connect4PyramidTemplate):
    _template_dir = 'angular'
    summary = 'angular project'

class JadeProjectTemplate(Connect4PyramidTemplate):
    _template_dir = 'jade'
    summary = 'jade project'

class TestProjectTemplate(Connect4PyramidTemplate):
    _template_dir = 'test'
    summary = 'angular project'
