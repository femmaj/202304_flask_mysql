from app import app
from app.controllers.dojos import *
from app.controllers.ninjas import *

if __name__ == "__main__":
    app.run(debug=True)
