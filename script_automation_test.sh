for collection in ./test-postman/Flows/*;
 do node_modules/.bin/newman run "$collection" --environment ./test-postman/Environments/environment_postman.json --reporter-html-export ./test-postman/; 
 done
