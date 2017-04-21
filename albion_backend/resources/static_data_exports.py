

from collections import defaultdict

from flask import current_app
from google.cloud import storage
from flask_restful import Resource

from ..extensions import cache


class StaticDataExports(Resource):
    @cache.cached(key_prefix='sde_data')
    def _get_sde_data(self):
        bucket_name = current_app.config['SDE_GCS_BUCKET']

        client = storage.Client()
        bucket = client.get_bucket(bucket_name)
        blobs = list(bucket.list_blobs())

        data = defaultdict(list)

        for blob in blobs:
            version, _ = blob.name.split('-')

            data[version].append({
                'name': blob.name,
                'url': blob.public_url,
            })

        return data

    def get(self):
        return self._get_sde_data(), 200
