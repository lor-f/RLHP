function [c_pl] = R134CPL(TL)
T = [250.00
250.50
251.00
251.50
252.00
252.50
253.00
253.50
254.00
254.50
255.00
255.50
256.00
256.50
257.00
257.50
258.00
258.50
259.00
259.50
260.00
260.50
261.00
261.50
262.00
262.50
263.00
263.50
264.00
264.50
265.00
265.50
266.00
266.50
267.00
267.50
268.00
268.50
269.00
269.50
270.00
270.50
271.00
271.50
272.00
272.50
273.00
273.50
274.00
274.50
275.00
275.50
276.00
276.50
277.00
277.50
278.00
278.50
279.00
279.50
280.00
280.50
281.00
281.50
282.00
282.50
283.00
283.50
284.00
284.50
285.00
285.50
286.00
286.50
287.00
287.50
288.00
288.50
289.00
289.50
290.00
290.50
291.00
291.50
292.00
292.50
293.00
293.50
294.00
294.50
295.00
295.50
296.00
296.50
297.00
297.50
298.00
298.50
299.00
299.50
300.00
300.50
301.00
301.50
302.00
302.50
303.00
303.50
304.00
304.50
305.00
305.50
306.00
306.50
307.00
307.50
308.00
308.50
309.00
309.50
310.00
310.50
311.00
311.50
312.00
312.50
313.00
313.50
314.00
314.50
315.00
315.50
316.00
316.50
317.00
317.50
318.00
318.50
319.00
319.50
320.00
320.50
321.00
321.50
322.00
322.50
323.00
323.50
324.00
324.50
325.00
325.50
326.00
326.50
327.00
327.50
328.00
328.50
329.00
329.50
330.00
330.50
331.00
331.50
332.00
332.50
333.00
333.50
334.00
334.50
335.00
335.50
336.00
336.50
337.00
337.50
338.00
338.50
339.00
339.50
340.00
340.50
341.00
341.50
342.00
342.50
343.00
343.50
344.00
344.50
345.00
345.50
346.00
346.50
347.00
347.50
348.00
348.50
349.00
349.50
350.00
350.50
351.00
351.50
352.00
352.50
353.00
353.50
354.00
354.50
355.00
355.50
356.00
356.50
357.00
357.50
358.00
358.50
359.00
359.50
360.00
360.50
361.00
361.50
362.00
362.50
363.00
363.50
364.00
364.50
365.00
365.50
366.00
366.50
367.00
367.50
368.00
368.50
369.00
369.50
370.00];

CPL = [1286.46129980
1287.49133549
1288.52688543
1289.56800732
1290.61475997
1291.66720329
1292.72539834
1293.78940734
1294.85929363
1295.93512177
1297.01695751
1298.10486780
1299.19892084
1300.29918607
1301.40573421
1302.51863727
1303.63796858
1304.76380280
1305.89621594
1307.03528540
1308.18108999
1309.33370993
1310.49322691
1311.65972410
1312.83328618
1314.01399934
1315.20195137
1316.39723163
1317.59993111
1318.81014246
1320.02796001
1321.25347981
1322.48679967
1323.72801919
1324.97723980
1326.23456478
1327.50009932
1328.77395055
1330.05622759
1331.34704158
1332.64650572
1333.95473534
1335.27184791
1336.59796311
1337.93320288
1339.27769148
1340.63155548
1341.99492391
1343.36792822
1344.75070243
1346.14338308
1347.54610941
1348.95902330
1350.38226945
1351.81599534
1353.26035139
1354.71549095
1356.18157043
1357.65874935
1359.14719042
1360.64705960
1362.15852622
1363.68176303
1365.21694631
1366.76425593
1368.32387548
1369.89599232
1371.48079773
1373.07848696
1374.68925937
1376.31331853
1377.95087231
1379.60213303
1381.26731754
1382.94664739
1384.64034891
1386.34865336
1388.07179709
1389.81002162
1391.56357386
1393.33270620
1395.11767669
1396.91874921
1398.73619360
1400.57028587
1402.42130838
1404.28954999
1406.17530626
1408.07887969
1410.00057987
1411.94072373
1413.89963572
1415.87764811
1417.87510116
1419.89234338
1421.92973183
1423.98763231
1426.06641971
1428.16647827
1430.28820184
1432.43199425
1434.59826960
1436.78745260
1438.99997891
1441.23629552
1443.49686112
1445.78214648
1448.09263487
1450.42882251
1452.79121896
1455.18034764
1457.59674627
1460.04096741
1462.51357895
1465.01516469
1467.54632490
1470.10767694
1472.69985582
1475.32351497
1477.97932681
1480.66798353
1483.39019784
1486.14670375
1488.93825736
1491.76563778
1494.62964800
1497.53111584
1500.47089498
1503.44986594
1506.46893727
1509.52904663
1512.63116202
1515.77628310
1518.96544249
1522.19970718
1525.48018006
1528.80800146
1532.18435084
1535.61044847
1539.08755736
1542.61698513
1546.20008613
1549.83826356
1553.53297181
1557.28571887
1561.09806893
1564.97164508
1568.90813221
1572.90928010
1576.97690665
1581.11290135
1585.31922894
1589.59793335
1593.95114180
1598.38106924
1602.89002310
1607.48040823
1612.15473234
1616.91561162
1621.76577691
1626.70808019
1631.74550153
1636.88115659
1642.11830459
1647.46035685
1652.91088600
1658.47363585
1664.15253194
1669.95169295
1675.87544297
1681.92832467
1688.11511356
1694.44083329
1700.91077229
1707.53050166
1714.30589456
1721.24314724
1728.34880182
1735.62977099
1743.09336491
1750.74732044
1758.59983295
1766.65959112
1774.93581477
1783.43829639
1792.17744645
1801.16434323
1810.41078739
1819.92936204
1829.73349887
1839.83755108
1850.25687393
1861.00791392
1872.10830756
1883.57699114
1895.43432282
1907.70221873
1920.40430496
1933.56608780
1947.21514460
1961.38133845
1976.09706009
1991.39750125
2007.32096426
2023.90921376
2041.20787714
2059.26690213
2078.14108099
2097.89065308
2118.58199983
2140.28844906
2163.09120933
2187.08045957
2212.35662497
2239.03187736
2267.23190780
2297.09803058
2328.78969360
2362.48748951
2398.39678859
2436.75214824
2477.82270027
2521.91877856
2569.40013365
2620.68619619
2676.26901082
2736.72968797
2802.75954204
2875.18755009
2955.01644944
3043.47081705
3142.06203616
3252.67748931
3377.70519725
3520.21146882
3684.19981090
3874.99792545
4099.85314182
4368.87972624
4696.62623886
5104.79230311];

[p,S,mu] = polyfit(T,CPL,5);
c_pl = polyval(p,TL,S,mu);
end