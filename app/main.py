from flask import Flask, jsonify, request, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# Create Database
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///hatchdragons.db"
db = SQLAlchemy(app)

class Dragon(db.Model):
    __tablename__ = "dragons"
    name = db.Column(db.String(64), primary_key=True)
    dragon_set = db.Column(db.String(64), nullable=False)
    rarity = db.Column(db.String(64), nullable=False)
    essence = db.Column(db.String(64), nullable=False)
    dragon_type = db.Column(db.String(64), nullable=False)

    def to_dict(self):
        return {
            "name": self.name,
            "set": self.dragon_set,
            "rarity": self.rarity,
            "essence": self.essence,
            "type": self.dragon_type
        }

# Create Routes
@app.route("/")
def home():
    return render_template("dragons.html")

@app.route("/dragons", methods=["GET"])
def get_dragons():
    results = Dragon.query.all()
    return jsonify([d.to_dict() for d in results])

if __name__ == "__main__":
    app.run(debug=True)
