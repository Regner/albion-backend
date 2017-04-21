

from flask_script import Manager, Server

from albion_backend import create_app

app = create_app()
manager = Manager(app)

manager.add_command("runserver", Server("localhost", port=8000))

if __name__ == "__main__":
    manager.run()
