function [Pr] = R134PR(TL)
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

PR= [4.5576
4.5395
4.5217
4.5040
4.4865
4.4691
4.4520
4.4350
4.4182
4.4016
4.3851
4.3688
4.3527
4.3367
4.3209
4.3052
4.2897
4.2744
4.2592
4.2441
4.2292
4.2144
4.1998
4.1854
4.1710
4.1568
4.1428
4.1289
4.1151
4.1014
4.0879
4.0745
4.0612
4.0481
4.0350
4.0221
4.0094
3.9967
3.9842
3.9717
3.9594
3.9472
3.9351
3.9232
3.9113
3.8996
3.8879
3.8764
3.8650
3.8537
3.8424
3.8313
3.8203
3.8094
3.7986
3.7879
3.7773
3.7667
3.7563
3.7460
3.7357
3.7256
3.7156
3.7056
3.6957
3.6860
3.6763
3.6667
3.6572
3.6477
3.6384
3.6292
3.6200
3.6109
3.6019
3.5930
3.5842
3.5754
3.5668
3.5582
3.5497
3.5412
3.5329
3.5246
3.5164
3.5083
3.5003
3.4923
3.4844
3.4766
3.4689
3.4613
3.4537
3.4462
3.4387
3.4314
3.4241
3.4169
3.4098
3.4027
3.3957
3.3888
3.3819
3.3752
3.3685
3.3619
3.3553
3.3488
3.3424
3.3361
3.3298
3.3236
3.3175
3.3114
3.3054
3.2995
3.2937
3.2879
3.2822
3.2766
3.2711
3.2656
3.2602
3.2549
3.2496
3.2444
3.2393
3.2343
3.2294
3.2245
3.2197
3.2149
3.2103
3.2057
3.2012
3.1968
3.1925
3.1882
3.1841
3.1800
3.1760
3.1721
3.1682
3.1645
3.1608
3.1572
3.1537
3.1504
3.1471
3.1438
3.1407
3.1377
3.1348
3.1320
3.1293
3.1267
3.1242
3.1218
3.1195
3.1173
3.1152
3.1133
3.1115
3.1098
3.1082
3.1068
3.1055
3.1043
3.1033
3.1024
3.1017
3.1011
3.1006
3.1004
3.1003
3.1004
3.1006
3.1010
3.1017
3.1025
3.1035
3.1048
3.1063
3.1080
3.1099
3.1121
3.1145
3.1172
3.1202
3.1235
3.1271
3.1311
3.1353
3.1399
3.1449
3.1503
3.1561
3.1623
3.1690
3.1762
3.1839
3.1921
3.2010
3.2104
3.2205
3.2312
3.2427
3.2550
3.2682
3.2822
3.2973
3.3133
3.3305
3.3490
3.3687
3.3899
3.4126
3.4371
3.4634
3.4917
3.5223
3.5553
3.5912
3.6300
3.6723
3.7184
3.7688
3.8240
3.8849
3.9521
4.0266
4.1097
4.2029
4.3080
4.4274
4.5641
4.7222
4.9071
5.1264
5.3905
5.7151];

[p,S,mu] = polyfit(T,PR,5);
Pr = polyval(p,TL,S,mu);
end