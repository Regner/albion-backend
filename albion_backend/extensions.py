

from flask_cache import Cache

cache = Cache()


def configure_extensions(app):
    cache.init_app(app)
