

import os


class AppConfig(object):
    """Config object for the app that pulls from the environment."""
    DEBUG = True
    SDE_GCS_BUCKET = os.environ.get('SDE_GCS_BUCKET', 'albion-sde')

    # Caching
    CACHE_DEFAULT_TIMEOUT = os.environ.get('CACHE_DEFAULT_TIMEOUT', 600)
    CACHE_TYPE = os.environ.get('CACHE_TYPE', 'simple')
