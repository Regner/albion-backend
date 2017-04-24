

from .static_data_exports import StaticDataExports


def configure_resources(api):
    api.add_resource(StaticDataExports, '/sde/')

