import graphlab
## data_json is carrying the json
dat_json = graphlab.SFrame({
        'user_id':["0","0","0","1","1","1","2","2","2","3","3","3","4","4","4","5","5"],
        'item_id':["a","c","f","b","c","f","a","c","f","c","d","e","a","d","f","a","e"],
        'rating':[1,3,5,2,3,4,5,4,1,2,3,5,1,1,4,3,2]})
dat_json = graphlab.SFrame(dat_json)
model_dat_json = graphlab.ranking_factorization_recommender.create(dat_json, target='rating')
users = dat_json['user_id'].unique()
string = model_dat_json.recommend(users=['user_id'=='0'])

