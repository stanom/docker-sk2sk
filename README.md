# docker-sk2sk
This is dockerized utility sk2sk.

SK2SK is the application for transformation between following projections:
 - S-JTSK Krovak EastNorth (EPSG:102067) (EPSG:5514)
 - WGS84 (EPSG:4326)
 - S42-4 (EPSG:28404)
 - S42-3 (EPSG:28403)

EXAMPLES:<br>
docker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo 18 48 |/sk2sk -d J'<br>
docker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo 18 48 |/sk2sk -d 3'<br>
docker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo 18 48 |/sk2sk -d 4'<br>
docker run --rm --name some-sk2sk stano/sk2sk /bin/bash -c 'echo -390563 -1250645 |/sk2sk -d W'<br>
