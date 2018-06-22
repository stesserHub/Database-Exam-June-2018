// Author: Christoffer Laurits Ravn Rahbek

// Questions 4.1
db.bbt.find(
    {
        "character.popularity" :
            {
                $lt : 70
            }
    },
    {
        "_id" : 1 
    }
)

// Question 4.2
db.bbt.find(
    {
        $and :
        [
            {
                "gender" : "Male"
            },
            {
                "country.name" : "United States"
            }
        ]
    }
)

// Question 4.3
db.bbt.find(
    {
        $and
            [
                {
                    "name" :
                        {
                            '$regex': 'J'
                        }
                    },
                {
                    "name" :
                        {
                            '$regex': 'S'
                        }
                }
            ]
    },
    {
        "_id" : 1, "name" : 1
    }
).sort(
    {
        "name" : -1
    }
)

// Question 4.4
db.bbt.aggregate(
    [
        {
            $project :
                {
                    $cmp : {
                        "gender" : "Male", "gender" : "Female"
                    }
                }
        }
    ]
)

// Question 4.5
db.bbt.aggregate([
    { "$group": { 
        "character.popularity" : {"$gt:80"}
        }, 
        {
            "character.popularity" : { "$avg" : "$character.popularity"}
        }
    }
])

