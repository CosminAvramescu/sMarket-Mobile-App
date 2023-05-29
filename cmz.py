from flask import Flask, request, jsonify

app = Flask(__name__)

# Sample data (can be replaced with a database)
products = [
    {'id': 1, 'name': 'Product 1', 'price': 10.99},
    {'id': 2, 'name': 'Product 2', 'price': 19.99}
]

# GET method to retrieve all products
@app.route('/products', methods=['GET'])
def get_products():
    return jsonify(products)

# POST method to add a new product
@app.route('/products', methods=['POST'])
def add_product():
    new_product = {
        'id': len(products) + 1,
        'name': request.json['name'],
        'price': request.json['price']
    }
    products.append(new_product)
    return jsonify(new_product), 201

if __name__ == '__main__':
    app.run(host='172.21.132.167')
