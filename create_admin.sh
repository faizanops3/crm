#!/bin/bash

# === Variables ===
MONGO_CONTAINER="growcrm_mongo"
DATABASE="growcrm"
COLLECTION="users"

# === Super Admin JSON ===
read -r -d '' SUPER_ADMIN_JSON <<EOF
{
  "password": "$2b$10$Oc9yXMC5K.Dw4cP4P2SUXuILUsaWi9vtPZOksfmDkLHBzI8GtIGq.",
  "firstName": "Test",
  "lastName": "Test",
  "username": "admin",
  "phone": "9784354333",
  "city": "hyderabad",
  "CNIC": "65671-1742567-3",
  "email": "example@gmail.com",
  "role": "super_admin",
  "uid": "admin001"
}
EOF

# === Insert into MongoDB ===
echo "Inserting Super Admin into MongoDB..."

docker exec -i $MONGO_CONTAINER mongosh $DATABASE --eval "db.$COLLECTION.insertOne($SUPER_ADMIN_JSON)"

echo "Super Admin inserted successfully!"
