function [H] = R134H(TV)
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

HH = [215033.452142
214699.878978
214365.496685
214030.296859
213694.271060
213357.410817
213019.707623
212681.152935
212341.738174
212001.454723
211660.293926
211318.247088
210975.305470
210631.460293
210286.702735
209941.023925
209594.414951
209246.866850
208898.370611
208548.917175
208198.497428
207847.102207
207494.722292
207141.348409
206786.971225
206431.581349
206075.169332
205717.725661
205359.240761
204999.704990
204639.108641
204277.441940
203914.695040
203550.858026
203185.920907
202819.873617
202452.706013
202084.407875
201714.968900
201344.378703
200972.626814
200599.702677
200225.595646
199850.294985
199473.789866
199096.069362
198717.122454
198336.938020
197955.504835
197572.811574
197188.846801
196803.598973
196417.056435
196029.207418
195640.040037
195249.542286
194857.702038
194464.507042
194069.944918
193674.003156
193276.669113
192877.930009
192477.772925
192076.184801
191673.152428
191268.662452
190862.701363
190455.255497
190046.311032
189635.853983
189223.870196
188810.345351
188395.264951
187978.614324
187560.378614
187140.542780
186719.091593
186296.009627
185871.281259
185444.890664
185016.821807
184587.058442
184155.584108
183722.382117
183287.435560
182850.727291
182412.239928
181971.955847
181529.857174
181085.925781
180640.143280
180192.491016
179742.950063
179291.501213
178838.124976
178382.801566
177925.510902
177466.232592
177004.945934
176541.629902
176076.263142
175608.823964
175139.290330
174667.639850
174193.849771
173717.896968
173239.757937
172759.408780
172276.825201
171791.982495
171304.855532
170815.418754
170323.646158
169829.511286
169332.987216
168834.046545
168332.661379
167828.803321
167322.443453
166813.552328
166302.099950
165788.055763
165271.388631
164752.066829
164230.058017
163705.329231
163177.846861
162647.576632
162114.483588
161578.532069
161039.685690
160497.907323
159953.159071
159405.402247
158854.597349
158300.704034
157743.681094
157183.486428
156620.077013
156053.408877
155483.437065
154910.115610
154333.397497
153753.234631
153169.577801
152582.376640
151991.579587
151397.133844
150798.985338
150197.078670
149591.357071
148981.762353
148368.234857
147750.713399
147129.135212
146503.435891
145873.549324
145239.407634
144600.941104
143958.078110
143310.745041
142658.866225
142002.363836
141341.157816
140675.165774
140004.302892
139328.481818
138647.612561
137961.602372
137270.355622
136573.773676
135871.754751
135164.193775
134450.982232
133732.008000
133007.155174
132276.303888
131539.330115
130796.105461
130046.496939
129290.366741
128527.571977
127757.964410
126981.390168
126197.689433
125406.696114
124608.237490
123802.133831
122988.197991
122166.234965
121336.041418
120497.405173
119650.104658
118793.908315
117928.573946
117053.848017
116169.464898
115275.146032
114370.599036
113455.516716
112529.575988
111592.436705
110643.740362
109683.108673
108710.142005
107724.417650
106725.487910
105712.877975
104686.083564
103644.568286
102587.760710
101515.051054
100425.787483
99319.2719225
98194.7553223
97051.4322753
95888.4348840
94704.8257392
93499.5898483
92271.6253169
91019.7325378
89742.6015861
88438.7974427
87106.7425719
85744.6962518
84350.7298868
82922.6973105
81458.1987809
79954.5369577
78408.6625792
76817.1067462
75175.8955727
73480.4412840
71725.4013624
69904.4935756
68010.2488868
66033.6749319
63963.7874393
61786.9408787
59485.8433327
57038.0544006];

[p,S,mu] = polyfit(T,HH,5);
H = polyval(p,TV,S,mu);
end