
#=
    exp_int[7] == exp(        FF(7))
=#
const n_exp_int = 256;
const exp_int =         FF[
            FF(2.718281828459045, 1.4456468917292502e-16),
            FF(7.38905609893065, -1.7971139497839148e-16),
            FF(20.085536923187668, -1.8275625525512858e-16),
            FF(54.598150033144236, 2.8741578015844115e-15),
            FF(148.4131591025766, 3.4863514900464198e-15),
            FF(403.4287934927351, 1.2359628024450387e-14),
            FF(1096.6331584284585, 9.869752640434095e-14),
            FF(2980.9579870417283, -2.7103295816873633e-14),
            FF(8103.083927575384, -2.1530877621067177e-13),
            FF(22026.465794806718, -1.3780134700517372e-12),
            FF(59874.14171519782, 1.7895764888916994e-12),
            FF(162754.79141900392, 5.30065881322063e-12),
            FF(442413.3920089205, 1.2118711752313224e-11),
            FF(1.2026042841647768e6, -1.5000525764327354e-11),
            FF(3.2690173724721107e6, -3.075806431120808e-11),
            FF(8.886110520507872e6, 5.321182483501564e-10),
            FF(2.41549527535753e7, -7.203995068362157e-10),
            FF(6.565996913733051e7, 1.4165536846555444e-9),
            FF(1.7848230096318725e8, 1.333018530234341e-8),
            FF(4.851651954097903e8, 4.880277289790406e-10),
            FF(1.3188157344832146e9, 8.043448618843281e-8),
            FF(3.584912846131592e9, -2.3519384005402157e-7),
            FF(9.744803446248903e9, -6.74501500127677e-7),
            FF(2.648912212984347e10, 7.670395527778119e-7),
            FF(7.200489933738588e10, -6.992440211033874e-6),
            FF(1.9572960942883878e11, -1.1364989227123904e-5),
            FF(5.3204824060179865e11, -2.8335783945658822e-5),
            FF(1.446257064291475e12, 7.602079742299693e-5),
            FF(3.931334297144042e12, 8.220112058084352e-5),
            FF(1.0686474581524463e13, -0.0007436345313492586),
            FF(2.9048849665247426e13, -0.0005501643178883202),
            FF(7.896296018268069e13, 0.007660978022635108),
            FF(2.1464357978591606e14, 0.002124297761531261),
            FF(5.834617425274549e14, 0.006402902734610391),
            FF(1.5860134523134308e15, -0.02187035537422534),
            FF(4.311231547115195e15, 0.22711342229285691),
            FF(1.1719142372802612e16, -0.6912270602088098),
            FF(3.1855931757113756e16, 0.22032867170129863),
            FF(8.659340042399374e16, 2.953606932719265),
            FF(2.3538526683702e17, -14.592100089250966),
            FF(6.398434935300549e17, 37.22266340351557),
            FF(1.739274941520501e18, 55.394681303611236),
            FF(4.727839468229346e18, 257.4744575627443),
            FF(1.2851600114359308e19, -12.1907003678569),
            FF(3.4934271057485095e19, 436.0347972334061),
            FF(9.496119420602448e19, 5929.133649117119),
            FF(2.5813128861900675e20, -15192.714199784727),
            FF(7.016735912097631e20, 30185.471599886117),
            FF(1.9073465724950998e21, -98786.90015904616),
            FF(5.184705528587072e21, 419031.45332293346),
            FF(1.4093490824269389e22, -614323.8566876298),
            FF(3.831008000716577e22, -661524.304512138),
            FF(1.0413759433029089e23, -7.520901270665062e6),
            FF(2.830753303274694e23, -4.711377645198593e6),
            FF(7.694785265142018e23, -3.868399744098706e7),
            FF(2.091659496012996e24, 5.079641515721467e7),
            FF(5.685719999335932e24, 2.0801558082063326e8),
            FF(1.545538935590104e25, 1.2092033491117463e8),
            FF(4.2012104037905144e25, -1.7624059056928084e9),
            FF(1.1420073898156842e26, 4.912247462314477e9),
            FF(3.10429793570192e26, 3.39761293411071e9),
            FF(8.438356668741454e26, 6.5719328084037315e10),
            FF(2.29378315946961e27, -7.566162968773138e10),
            FF(6.235149080811617e27, 1.3899738872492847e11),
            FF(1.6948892444103338e28, -6.61940830637628e11),
            FF(4.607186634331292e28, -2.37966706696394e12),
            FF(1.2523631708422137e29, 8.725173269482437e12),
            FF(3.404276049931741e29, -2.3689045745171566e13),
            FF(9.253781725587787e29, 4.1335361789492734e13),
            FF(2.515438670919167e30, 1.2647645018519611e14),
            FF(6.837671229762744e30, -2.8026814130938628e14),
            FF(1.8586717452841279e31, 9.331591492068494e14),
            FF(5.052393630276104e31, 2.4912292015869455e15),
            FF(1.3733829795401761e32, 8.003850355927158e15),
            FF(3.7332419967990015e32, 1.5538124781410182e16),
            FF(1.0148003881138887e33, -1.8313882415912828e16),
            FF(2.7585134545231703e33, -1.1490320660315066e17),
            FF(7.498416996990121e33, -4.7233584091570765e17),
            FF(2.0382810665126688e34, -5.7128185991424294e17),
            FF(5.54062238439351e34, 2.1811937023229343e18),
            FF(1.5060973145850306e35, -7.056987941853042e18),
            FF(4.0939969621274545e35, 1.852765937250624e19),
            FF(1.1128637547917594e36, -2.7961733453775843e19),
            FF(3.0250773222011426e36, -2.2396762302858075e20),
            FF(8.223012714622913e36, 4.083087026334775e20),
            FF(2.235246603734715e37, 7.328168204485786e20),
            FF(6.076030225056872e37, 2.4300525977303657e21),
            FF(1.6516362549940018e38, 4.5658363808236883e21),
            FF(4.4896128191743455e38, -3.034626837469501e22),
            FF(1.2204032943178408e39, -3.218018426639282e22),
            FF(3.317400098335743e39, -2.0594325391839645e23),
            FF(9.017628405034299e39, 4.119507937020878e23),
            FF(2.451245542920086e40, -1.809447119103778e24),
            FF(6.663176216410896e40, -3.5075886901816454e24),
            FF(1.8112390828890233e41, -6.613591371018036e24),
            FF(4.923458286012058e41, 1.3869835129739753e25),
            FF(1.3383347192042695e42, -3.8243050326463913e25),
            FF(3.637970947608805e42, -1.7059216189570308e26),
            FF(9.889030319346946e42, 5.152980735736938e26),
            FF(2.6881171418161356e43, -1.6101271449201627e27),
            FF(7.307059979368067e43, 3.81998468048638e27),
            FF(1.9862648361376543e44, -1.7687808052379885e27),
            FF(5.399227610580169e44, 1.6694477435363627e28),
            FF(1.4676622301554424e45, -5.683445805084399e28),
            FF(3.989519570547216e45, -4.528566832709381e28),
            FF(1.0844638552900231e46, -5.0737593474148365e29),
            FF(2.947878391455509e46, 1.522599815352173e30),
            FF(8.013164264000591e46, 4.4255712989469043e30),
            FF(2.1782038807290206e47, 6.40943286045652e30),
            FF(5.92097202766467e47, 3.6278506451438224e31),
            FF(1.609487066961518e48, -3.11348413350283e31),
            FF(4.375039447261341e48, 1.035824156236645e32),
            FF(1.189259022828201e49, -6.311799972004003e32),
            FF(3.2327411910848595e49, -1.6317210762547248e33),
            FF(8.787501635837023e49, 4.951878455668192e31),
            FF(2.3886906014249913e50, 1.5523479734981885e34),
            FF(6.493134255664462e50, 1.417967467778397e33),
            FF(1.7650168856917655e51, 3.659435419097009e34),
            FF(4.797813327299302e51, -4.832529827928807e34),
            FF(1.3041808783936323e52, 2.3598218061815903e35),
            FF(3.5451311827611664e52, 4.397256578106813e35),
            FF(9.636665673603202e52, -3.923912609184774e36),
            FF(2.6195173187490626e53, 9.508437015673215e36),
            FF(7.120586326889338e53, -2.2289404495948426e37),
            FF(1.9355760420357226e54, -1.8895773015758525e37),
            FF(5.261441182666386e54, -2.2391033592780024e38),
            FF(1.4302079958348105e55, -4.95219683040473e38),
            FF(3.887708405994595e55, 2.707966110366217e39),
            FF(1.0567887114362587e56, 1.0147572632726592e40),
            FF(2.872649550817832e56, -1.725105418010497e40),
            FF(7.808671073519151e56, -3.3393507820354276e39),
            FF(2.1226168683560893e57, 9.12124047520486e40),
            FF(5.769870862033003e57, 2.54679794252527e41),
            FF(1.568413511681964e58, -5.571295095061288e41),
            FF(4.263389948314721e58, 9.74205426058927e41),
            FF(1.1589095424138854e59, 3.107727800036786e42),
            FF(3.150242749971452e59, -9.643637210793454e42),
            FF(8.56324762248225e59, -5.908667317844348e43),
            FF(2.3277320404788622e60, -1.5410810390283507e44),
            FF(6.327431707155585e60, 2.9519976099018483e44),
            FF(1.7199742630376623e61, -6.6270661206611855e44),
            FF(4.675374784632515e61, 1.2938282778262074e45),
            FF(1.2708986318302189e62, -3.042168764740704e44),
            FF(3.454660656717546e62, 1.8553902103629043e46),
            FF(9.390741286647697e62, 8.372523060245978e46),
            FF(2.5526681395254553e63, -1.6889209515414619e47),
            FF(6.938871417758404e63, -4.174062699457691e47),
            FF(1.886180808490652e64, 8.75753845955151e47),
            FF(5.12717101690833e64, -1.848585500693908e47),
            FF(1.3937095806663797e65, 7.0244638077530874e47),
            FF(3.788495427274696e65, -1.6686420819293392e48),
            FF(1.0298198277160991e66, 8.608117819191599e49),
            FF(2.799340524267497e66, -8.50129047864975e49),
            FF(7.609396478785354e66, -1.2944224384739812e50),
            FF(2.0684484173822473e67, -2.743371829892203e50),
            FF(5.622625746075033e67, 1.4234908903412887e51),
            FF(1.5283881393781746e68, -8.309060391771288e51),
            FF(4.154589706104022e68, 2.1030987078913436e52),
            FF(1.129334570280557e69, -8.237338292837319e52),
            FF(3.0698496406442424e69, 4.375620509828095e52),
            FF(8.344716494264775e69, -5.967039946946015e53),
            FF(2.2683291210002403e70, 1.4059974118116153e54),
            FF(6.165957830579433e70, -5.480338773236432e54),
            FF(1.6760811125908828e71, -3.078670967159958e54),
            FF(4.556060831379215e71, 4.2683874443891194e55),
            FF(1.2384657367292132e72, -1.7417281417483923e55),
            FF(3.366498907320164e72, 1.8595557870731098e56),
            FF(9.151092805295634e72, 2.9278721984510905e56),
            FF(2.487524928317743e73, -2.269951231486326e56),
            FF(6.761793810485009e73, 6.044072970031212e57),
            FF(1.8380461242828246e74, 6.558763264761503e57),
            FF(4.996327379507578e74, 1.2022315866163456e58),
            FF(1.358142592474785e75, 6.293920858651693e58),
            FF(3.691814329580466e75, 1.5523424954077878e59),
            FF(1.0035391806143295e76, -1.600289359022275e59),
            FF(2.7279023188106115e76, 6.6492459414351406e59),
            FF(7.415207303034179e76, -4.678668371358611e60),
            FF(2.0156623266094611e77, 6.4049020966883044e60),
            FF(5.47913827473198e77, -3.839583545632845e61),
            FF(1.4893842007818383e78, 6.250487712624396e61),
            FF(4.048566008579269e78, 1.682018025551642e62),
            FF(1.1005143412437996e79, -6.764346497503176e62),
            FF(2.991508135761597e79, 1.1738879998058348e63),
            FF(8.131762205128143e79, -1.5057074349533377e62),
            FF(2.2104421435549888e80, -7.196700457953682e63),
            FF(6.008604711685586e80, -3.660345147820277e64),
            FF(1.633308100216833e81, -2.1239531351072146e64),
            FF(4.4397917290943824e81, -2.882962352721535e65),
            FF(1.2068605179340022e82, 7.151662509907955e65),
            FF(3.2805870153846705e82, -3.194753619685436e66),
            FF(8.917560070598843e82, -8.989668102219982e65),
            FF(2.4240441494100796e83, -3.8332753349400205e66),
            FF(6.589235162723882e83, -8.709570822927273e66),
            FF(1.7911398206275708e84, 5.99708494881663e67),
            FF(4.8688228266413195e84, 1.710917432346709e68),
            FF(1.3234832615645704e85, -6.425373409956827e68),
            FF(3.5976005001806814e85, -2.5813006529759342e69),
            FF(9.779292065696318e85, -6.6113382980943924e69),
            FF(2.658287191737602e86, 6.120064792143622e69),
            FF(7.225973768125749e86, 2.9945383505980016e70),
            FF(1.964223318681796e87, -1.0268429875036315e71),
            FF(5.339312554208246e87, -2.625028820065693e71),
            FF(1.4513756292567526e88, -2.884486923510417e71),
            FF(3.945247999276943e88, 7.221484370687266e70),
            FF(1.0724295945198918e89, 4.163246302178397e72),
            FF(2.9151658790851237e89, 2.656865521036125e73),
            FF(7.924242436060931e89, -4.347509662136458e73),
            FF(2.1540324218248465e90, 6.568050851363196e73),
            FF(5.855267190158109e90, 4.4915902036294956e74),
            FF(1.5916266403779241e91, 3.865065123172901e74),
            FF(4.326489774230631e91, 3.1789213685539743e74),
            FF(1.1760618534305e92, 5.894438850996908e75),
            FF(3.196867565323994e92, -1.9538627920591218e76),
            FF(8.689987010810322e92, -5.6063024973277287e76),
            FF(2.3621833781030834e93, -7.781526569884677e76),
            FF(6.421080152185614e93, -1.4034869476251672e77),
            FF(1.7454305496765193e94, 9.749159232851838e77),
            FF(4.744572146022966e94, -3.2789833020339664e78),
            FF(1.2897084248347162e95, 5.438670793036996e78),
            FF(3.505790975238748e95, 1.5415362493078123e78),
            FF(9.529727902367202e95, 9.833684415222857e78),
            FF(2.5904486187163903e96, -2.263041008869737e80),
            FF(7.041569407813597e96, -4.0828301614775564e80),
            FF(1.9140970165092822e97, -1.497464557916617e81),
            FF(5.2030551378848545e97, 4.749190808721398e80),
            FF(1.4143370233782872e98, 3.8946526873422757e80),
            FF(3.844566629966054e98, 2.2093533915053797e81),
            FF(1.0450615608536755e99, -5.337145484954864e82),
            FF(2.840771850489593e99, 2.7464976717218177e81),
            FF(7.722018499983836e99, -4.0996868440885443e83),
            FF(2.0990622567530634e100, 4.153001760319747e83),
            FF(5.705842789336087e100, -7.502847960571591e83),
            FF(5.705842789336087e100, -7.502847960571591e83),
            FF(1.551008877029636e101, -1.1711307176004477e85),
            FF(4.216079246208329e101, 3.4845354806957584e84),
            FF(1.146049160231141e102, 5.309475346149073e85),
            FF(3.115284606777059e102, 1.1305094460701447e86),
            FF(8.468221537080262e102, -2.2036277666109673e86),
            FF(2.30190127236108e103, -4.663183218411149e86),
            FF(6.25721639956588e103, -3.232721480812657e87),
            FF(1.700887763567586e104, 1.4773861394382237e88),
            FF(4.6234922999541146e104, 6.980490121714062e87),
            FF(1.2567955102985587e105, -1.5226136925021163e88),
            FF(3.416324397733485e105, -7.894999158901084e86),
            FF(9.286532530480224e105, -2.614355089326607e89),
            FF(2.5243412626998188e106, 7.770616368141536e88),
            FF(6.861870983226278e106, 2.54810635544448e90),
            FF(1.8652499202934394e107, 3.8378044485542437e90),
            FF(5.070274963868339e107, 1.2106757063676503e90),
            FF(1.3782436299574147e108, 8.797324501988005e91),
            FF(3.7464546145026734e108, -1.331977416683643e92),
            FF(1.0183919499749154e109, 3.760113287049303e92),
            FF(2.7682763318657856e109, -4.359593659827271e92),
            FF(7.524955249064026e109, 4.590038424351707e93),
            FF(2.045494911349825e110, 5.874933608518508e93),
            FF(5.5602316477276757e110, -2.3961412490467085e94),
            FF(1.5114276650041035e111, 1.4805989167614457e94)
];

#=
  exp_intOver256[7+1] = exp(7/256)
=#
exp_intOver256 = FF[        
        FF(1.0, 0.0),
        FF(1.0039138893383475, 1.0855789505997833e-16),
        FF(1.007843097206448, -6.872774751042842e-17),
        FF(1.0117876835593316, -8.278704058938848e-17),
        FF(1.0157477085866857, 2.0530467874932267e-17),
        FF(1.0197232327137742, -3.107041301297292e-17),
        FF(1.023714316602358, 1.8124461803844703e-17),
        FF(1.0277210211516217, -1.410242148707184e-17),
        FF(1.0317434074991028, -8.944417741043132e-17),
        FF(1.035781537021624, -9.45278318287887e-17),
        FF(1.03983547133623, -1.0991845821564372e-16),
        FF(1.0439052723011284, 9.979972163579526e-17),
        FF(1.0479910020166328, -5.327900898877614e-17),
        FF(1.0520927228261099, -9.156622795949872e-17),
        FF(1.056210497316932, 2.011958971782554e-17),
        FF(1.0603443883214314, 9.147676267275945e-17),
        FF(1.0644944589178593, 1.0872888143211957e-16),
        FF(1.0686607724313482, -5.18310159612873e-17),
        FF(1.0728433924348775, -2.976174935473522e-17),
        FF(1.0770423827502449, 6.63926317281595e-17),
        FF(1.0812578074490395, 6.013904942011385e-17),
        FF(1.0854897308536195, -7.721135452849312e-17),
        FF(1.0897382175380932, 4.0889548002981385e-17),
        FF(1.0940033323293055, -3.9968233067798244e-18),
        FF(1.0982851403078258, 9.070644949793751e-17),
        FF(1.1025837068089421, 8.479848211026838e-17),
        FF(1.1068990974236574, 4.184587797682552e-17),
        FF(1.1112313779996905, -2.939036920133703e-17),
        FF(1.1155806146424807, 5.298211318168963e-17),
        FF(1.1199468737161973, -8.054667728786771e-17),
        FF(1.1243302218447506, 9.612226558381532e-17),
        FF(1.1287307259128108, 8.75900061079084e-17),
        FF(1.1331484530668263, -5.370737708558031e-18),
        FF(1.1375834707160497, -9.095634030541664e-17),
        FF(1.1420358465335656, -1.2069701773647767e-17),
        FF(1.1465056484573242, -1.0922701811065973e-16),
        FF(1.1509929446911764, 3.7613173622701076e-17),
        FF(1.1554978037059165, 4.118004862885387e-17),
        FF(1.160020294240325, 1.0201936124800025e-16),
        FF(1.1645604853022191, 5.3492746704852434e-17),
        FF(1.1691184461695043, 6.945488167320411e-17),
        FF(1.1736942463912328, -5.794879001697034e-17),
        FF(1.1782879557886632, 5.439076284168112e-17),
        FF(1.1828996444563278, 6.748437661125926e-17),
        FF(1.1875293827631006, 6.415816207759217e-19),
        FF(1.1921772413532716, -5.31119252432565e-17),
        FF(1.1968432911476248, -5.89991778046089e-18),
        FF(1.2015276033445204, -7.578540004801503e-17),
        FF(1.2062302494209807, 3.9295715071105525e-17),
        FF(1.2109513011337818, 2.2409741519864956e-17),
        FF(1.2156908305205474, 6.879874701654399e-17),
        FF(1.2204489099008486, 8.521219650141163e-17),
        FF(1.2252256118773075, 8.279379001181868e-17),
        FF(1.2300210093367046, 4.004910701616866e-18),
        FF(1.234835175451091, 1.1071186581338978e-16),
        FF(1.2396681836789056, -4.7994204533968734e-17),
        FF(1.2445201077660952, -7.440512295261056e-17),
        FF(1.2493910217472401, -1.0124287886297454e-16),
        FF(1.2542809999466837, 1.3050032175111173e-17),
        FF(1.259190116979667, -8.474358701905648e-17),
        FF(1.2641184477534664, -1.541497933603795e-17),
        FF(1.2690660674685372, -8.943787078850751e-17),
        FF(1.274033051619661, -3.187472928105996e-17),
        FF(1.2790194759970976, -9.959774306810153e-17),
        FF(1.2840254166877414, 8.968972781793724e-17),
        FF(1.289050950076283, -7.274834625626314e-17),
        FF(1.2940961528463732, 6.099134468130705e-17),
        FF(1.2991611019817952, 1.0108672110228085e-16),
        FF(1.3042458747676378, 1.7093578107981658e-17),
        FF(1.3093505487914747, -8.462944613649643e-17),
        FF(1.3144752019445491, -8.822975545119247e-18),
        FF(1.3196199124229622, 7.374921135751109e-18),
        FF(1.3247847587288655, 9.422682377542367e-17),
        FF(1.3299698196716598, 1.9169612911035527e-18),
        FF(1.3351751743691969, -6.730265897120855e-17),
        FF(1.3404009022489867, 8.442843318418044e-17),
        FF(1.3456470830494105, 3.415854209639032e-17),
        FF(1.3509137968209362, -2.13634858773943e-17),
        FF(1.3562011239273402, 7.556508411024971e-17),
        FF(1.3615091450469345, -9.736544581776452e-17),
        FF(1.3668379411737963, 5.1449446596411544e-17),
        FF(1.3721875936190053, 1.0197283362037364e-16),
        FF(1.3775581840118836, 1.0177365319881731e-16),
        FF(1.3829497943012412, 1.7893646397872916e-17),
        FF(1.3883625067566268, 6.691963657219203e-17),
        FF(1.3937964039695832, -5.606005133328185e-17),
        FF(1.3992515688549068, 7.81643582994171e-17),
        FF(1.4047280846519141, 4.945615321000382e-17),
        FF(1.4102260349257107, -4.1758810273684196e-17),
        FF(1.4157455035684665, 1.052379536622793e-16),
        FF(1.4212865748006966, 1.106882170775812e-16),
        FF(1.4268493331725458, -6.48883372712743e-17),
        FF(1.4324338635650782, -6.53862212642198e-17),
        FF(1.4380402511915735, -2.956706187758589e-17),
        FF(1.4436685815988268, 3.498028055367327e-17),
        FF(1.449318940668454, -2.8277944703993215e-17),
        FF(1.4549914146182013, 8.517923078996071e-17),
        FF(1.4606860900032628, -3.494965559942888e-18),
        FF(1.4664030537175992, -1.6437899268967155e-17),
        FF(1.4721423929952648, -5.93293280098494e-17),
        FF(1.4779041954117385, -2.493763123963775e-17),
        FF(1.4836885488852596, -4.184916647478262e-18),
        FF(1.4894955416781699, 9.201614291862741e-17),
        FF(1.4953252623982605, -5.57329850074821e-17),
        FF(1.5011778000001228, -4.5384955300459954e-17),
        FF(1.5070532437865074, -1.033046085127696e-16),
        FF(1.5129516834096854, -8.224118718860027e-18),
        FF(1.5188732088728176, -9.394854724177123e-18),
        FF(1.5248179105313266, 5.66961782226858e-17),
        FF(1.5307858790942768, -8.071281551405296e-17),
        FF(1.5367772056257567, 9.177556035624967e-17),
        FF(1.542791981546271, 6.971900281065642e-17),
        FF(1.5488302986341331, -3.110014802562223e-17),
        FF(1.5548922490268668, 7.362309307876042e-17),
        FF(1.5609779252226124, 9.297371551907651e-17),
        FF(1.5670874200815372, -7.715723803805166e-17),
        FF(1.573220826827253, -6.314292058750392e-17),
        FF(1.5793782390482385, -6.034489991710238e-17),
        FF(1.5855597506992676, -8.71615102320957e-17),
        FF(1.5917654561028425, -8.914527420660205e-17),
        FF(1.5979954499506333, 1.6864630310268093e-17),
        FF(1.604249827304923, -6.353312614292423e-17),
        FF(1.6105286836000576, 2.7683467168782117e-17),
        FF(1.6168321146439029, 1.4581426300210106e-17),
        FF(1.6231602166193055, 6.968741123163187e-17),
        FF(1.6295130860855618, 6.865490812235637e-17),
        FF(1.63589081997989, -7.384180964185857e-17),
        FF(1.64229351561891, -7.472794602194202e-17),
        FF(1.6487212707001282, -4.731568479435833e-17),
        FF(1.6551741833034281, 1.0489007314037115e-16),
        FF(1.6616523518925677, 2.357950965990088e-17),
        FF(1.66815587531668, 9.16797559969902e-17),
        FF(1.674684852811784, 7.208416581778037e-17),
        FF(1.6812393840022961, 9.70654691080313e-17),
        FF(1.6878195689025528, 3.467516298533344e-17),
        FF(1.694425507918335, -8.01399253225914e-17),
        FF(1.7010573018484008, -8.072967635944199e-17),
        FF(1.7077150518860233, 7.518088982576039e-17),
        FF(1.7143988596205357, 7.40404924474698e-17),
        FF(1.72110882703888, -4.861284615670381e-17),
        FF(1.7278450565271632, -1.957322111748573e-17),
        FF(1.7346076508722215, -9.934899404046567e-18),
        FF(1.7413967132631865, -8.741148460384636e-17),
        FF(1.7482123472930606, 3.0613559352227126e-17),
        FF(1.7550546569602985, 5.915225890357474e-17),
        FF(1.7619237466703928, -2.6507093130408878e-17),
        FF(1.7688197212374674, -5.742490672815448e-17),
        FF(1.7757426858858776, 5.830166562396945e-17),
        FF(1.782692746251815, 1.0723622568193281e-16),
        FF(1.7896700083849195, 7.531949406095745e-17),
        FF(1.7966745787498977, 7.793231819697347e-17),
        FF(1.8037065642281471, -3.795840270074599e-17),
        FF(1.8107660721193872, -6.251493697502345e-17),
        FF(1.8178532101432967, 4.1834194504975154e-17),
        FF(1.8249680864411575, 1.813022849494957e-17),
        FF(1.832110809577504, 7.466298042734531e-17),
        FF(1.8392814885417808, 1.0948049043845242e-16),
        FF(1.8464802327500045, 8.944196824220801e-17),
        FF(1.8537071520464343, 5.487794936798846e-17),
        FF(1.8609623567052476, -2.6222658889101968e-18),
        FF(1.8682459574322223, 8.036849362605154e-17),
        FF(1.8755580653664274, -1.0410631340415645e-16),
        FF(1.882898792081917, -1.080089814122494e-16),
        FF(1.8902682495894338, -1.104793225347488e-16),
        FF(1.8976665503381187, 4.349228803307586e-17),
        FF(1.9050938072172259, 5.612269203988057e-17),
        FF(1.9125501335578454, -1.5247002187496222e-18),
        FF(1.9200356431346326, 1.0242989873824124e-16),
        FF(1.9275504501675447, -6.540853129828781e-18),
        FF(1.9350946693235824, 5.5237303298201534e-17),
        FF(1.9426684157185412, 6.769386174301529e-17),
        FF(1.9502718049187666, 3.0191454651462874e-17),
        FF(1.957904952942918, 8.800611189667709e-17),
        FF(1.9655679762637392, 3.3106538962443093e-17),
        FF(1.9732609918098354, -3.9442583050750985e-17),
        FF(1.980984116967457, 1.0926377292307747e-16),
        FF(1.988737469582292, -8.571894776669697e-17),
        FF(1.9965211679612622, 7.278036234705616e-17),
        FF(2.0043353308743312, -1.2045412711742185e-16),
        FF(2.0121800775563137, -1.4844285956302747e-16),
        FF(2.0200555277086965, 1.2139170362360318e-16),
        FF(2.0279618015014655, 1.7832466081640128e-16),
        FF(2.0358990195749382, 2.0704008068624745e-16),
        FF(2.0438673030416052, -1.6691392183064087e-16),
        FF(2.0518667734879767, 7.632211812059116e-17),
        FF(2.059897552976441, 1.0286233029126379e-16),
        FF(2.067959764047124, -9.394578045775951e-17),
        FF(2.0760535297197595, 6.312851078222168e-17),
        FF(2.0841789734955687, -7.168107284090928e-17),
        FF(2.092336219359141, 6.425446637084625e-17),
        FF(2.1005253917803293, 5.859491980422232e-17),
        FF(2.1087466157161465, 1.9247210702132047e-16),
        FF(2.117000016612675, -1.1571006249440234e-16),
        FF(2.1252857204069766, 4.340455313120194e-17),
        FF(2.13360385352902, 3.701891065616114e-17),
        FF(2.1419545429036044, -4.224507724271529e-17),
        FF(2.1503379159523, -2.163549840434791e-16),
        FF(2.1587541005953903, -9.901273800391257e-17),
        FF(2.1672032252538247, -8.889266474641609e-17),
        FF(2.175685418851178, 1.917032324183932e-16),
        FF(2.184200810815618, 2.5424224894086933e-17),
        FF(2.1927495310818794, -1.247819533669949e-16),
        FF(2.2013317100932475, -1.5702453972320208e-16),
        FF(2.2099474788035476, 1.1488479457144387e-16),
        FF(2.218596968679145, -1.288459544606015e-16),
        FF(2.2272803117009485, 1.9661200687648256e-17),
        FF(2.2359976403664263, 1.4179645666404735e-17),
        FF(2.244749087691627, -1.098618221516593e-16),
        FF(2.2535347872132085, -7.513914099665834e-19),
        FF(2.262354872990478, -1.9376112533971031e-16),
        FF(2.2712094796074336, 2.1967526256195915e-16),
        FF(2.280098742174823, 1.6221353283271856e-16),
        FF(2.289022796332201, -1.5388782094965688e-16),
        FF(2.29798177825, 1.273247871919294e-16),
        FF(2.3069758246316097, 1.901986697871839e-16),
        FF(2.3160050727154613, -1.8826655701437223e-16),
        FF(2.325069660277121, 1.997942766139441e-17),
        FF(2.334169725631395, -4.1916781194707777e-17),
        FF(2.3433054076344373, 2.0011070530170252e-16),
        FF(2.35247684568587, 1.1635367135984083e-16),
        FF(2.3616841797309096, -2.14089340079054e-17),
        FF(2.3709275502625027, -1.5584425053251004e-16),
        FF(2.3802070983234693, 1.3637164280695614e-16),
        FF(2.389522965508657, -4.2730461940211245e-17),
        FF(2.398875293967098, -1.7324110869068432e-16),
        FF(2.408264226404181, -5.608955026519115e-19),
        FF(2.417689906083828, 1.6530675915070284e-16),
        FF(2.4271524768306802, 1.2349586415058277e-16),
        FF(2.4366520830322917, 1.3013980393717514e-16),
        FF(2.4461888696413343, 6.566343632122443e-17),
        FF(2.455762982177808, 1.1965853177388928e-16),
        FF(2.4653745667312625, -8.153240511597116e-17),
        FF(2.475023769963025, 1.2616055811901818e-16),
        FF(2.4847107391084404, -1.0841958953748963e-16),
        FF(2.4944356219791146, -5.4432284189979724e-17),
        FF(2.504198566965173, -1.6367444789696698e-16),
        FF(2.5139997230375233, -4.518933324679106e-18),
        FF(2.523839239750129, -2.1239069299343285e-16),
        FF(2.53371726724229, 1.5599394544645568e-17),
        FF(2.5436339562409365, 1.467212589721461e-16),
        FF(2.553589458062927, 6.431266858673776e-17),
        FF(2.563583924617356, 1.629315561579352e-16),
        FF(2.5736175084078754, -1.7779506868939194e-16),
        FF(2.5836903625350174, 6.790328991080385e-17),
        FF(2.593802640698535, -2.0239290245686278e-16),
        FF(2.6039544971997426, -1.8253335135762355e-16),
        FF(2.6141460869438746, 7.089747938209302e-17),
        FF(2.6243775654424475, -1.3489988297571656e-16),
        FF(2.6346490888156313, -2.0079668677960811e-16),
        FF(2.6449608137946337, 1.0116818147772678e-16),
        FF(2.655312897724092, -1.4930501042923346e-16),
        FF(2.665705498564471, -2.1084021320689323e-16),
        FF(2.676138774894477, -1.2856858481609066e-16),
        FF(2.686612885913475, 3.404202235746767e-17),
        FF(2.6971279914439186, 2.1983026329550905e-16),
        FF(2.70768425193379, 1.4021298588212657e-16),
        FF(2.718281828459045, 1.4456468917292502e-16)
        ];

const   n_inv_fact = 32;
const   inv_fact =   FF[
    FF(1.0,0.0),
    FF(0.5,0.0),
    FF(0.16666666666666666,9.25185853854297e-18),
    FF(0.041666666666666664,2.3129646346357427e-18),
    FF(0.008333333333333333,1.1564823173178714e-19),
    FF(0.001388888888888889,-5.300543954373577e-20),
    FF(0.0001984126984126984,1.7209558293420705e-22),
    FF(2.48015873015873e-5,2.1511947866775882e-23),
    FF(2.7557319223985893e-6,-1.858393274046472e-22),
    FF(2.755731922398589e-7,2.3767714622250297e-23),
    FF(2.505210838544172e-8,-1.448814070935912e-24),
    FF(2.08767569878681e-9,-1.20734505911326e-25),
    FF(1.6059043836821613e-10,1.2585294588752098e-26),
    FF(1.1470745597729725e-11,2.0655512752830745e-28),
    FF(7.647163731819816e-13,7.03872877733453e-30),
    FF(4.779477332387385e-14,4.399205485834081e-31),
    FF(2.8114572543455206e-15,1.6508842730861433e-31),
    FF(1.5619206968586225e-16,1.1910679660273754e-32),
    FF(8.22063524662433e-18,2.2141894119604265e-34),
    FF(4.110317623312165e-19,1.4412973378659527e-36),
    FF(1.9572941063391263e-20,-1.3643503830087908e-36),
    FF(8.896791392450574e-22,-7.911402614872376e-38),
    FF(3.868170170630684e-23,-8.843177655482344e-40),
    FF(1.6117375710961184e-24,-3.6846573564509766e-41),
    FF(6.446950284384474e-26,-1.9330404233703465e-42),
    FF(2.4795962632247976e-27,-1.2953730964765229e-43),
    FF(9.183689863795546e-29,1.4303150396787322e-45),
    FF(3.279889237069838e-30,1.5117542744029879e-46),
    FF(1.1309962886447716e-31,1.0498015412959506e-47),
    FF(3.7699876288159054e-33,2.5870347832750324e-49),
    FF(1.216125041553518e-34,5.586290567888806e-51),
    FF(3.8003907548547434e-36,1.7457158024652518e-52)
];



function exp_taylor_series(a::FF)
  x = a
  x2 = x*x
  x3 = x*x2
  x4 = x2*x2
  x5 = x2*x3
  x10 = x5*x5
  x15 = x5*x10
  x20 = x10*x10
  # x25 = x10*x15

  z = x + inv_fact[2]*x2 + inv_fact[3]*x3 + inv_fact[4]*x4
  z2 = x5 * (inv_fact[5] + x*inv_fact[6] + x2*inv_fact[7] + x3*inv_fact[8] + x4*inv_fact[9])
  z3 = x10 * (inv_fact[10] + x*inv_fact[11] + x2*inv_fact[12] + x3*inv_fact[13] + x4*inv_fact[14])
  z4 = x15 * (inv_fact[15] + x*inv_fact[16] + x2*inv_fact[17] + x3*inv_fact[18] + x4*inv_fact[19])
  z5 = x20 * (inv_fact[20] + x*inv_fact[21] + x2*inv_fact[22] + x3*inv_fact[23] + x4*inv_fact[24])
  (((z5+z4)+z3)+z2)+z + one(FF)

  # z6 = x25 * (inv_fact[25] + x*inv_fact[26] + x2*inv_fact[27])
  # ((((z6+z5)+z4)+z3)+z2)+z + one(FF)
end

function exp_taylor01(x::FF)
    if x.hi <= 0.5
       exp_taylor_series(x)
    else   
       sqr(exp_taylor_series(divby2(x)))
    end
end
          
function exp01(x::FF)
   i = floor(256.0*x)
   ix = trunc(Int,i.hi)
   t = exp_intOver256[1+ix]
   w = x - i/256.0
   expw = exp_taylor_series(w)
   expw*t
end

function exp(x::FF)
    isneg, aa = signbit(x.hi), abs(x)
    if aa > 1.0e-34
        if aa.hi <= 1.0
           aa = exp01(aa)
        elseif aa.hi <= 256.0
            ddidx = FF(floor(aa.hi))
            idx = floor(Int,aa.hi)
            expint = exp_int[idx]
            dlt = aa - ddidx
            expdlt = exp01(dlt)
            aa = expint*expdlt
        else
            t = aa / 256.0
            ipart = floor(t).hi
            fpart = t - ipart
            fpart = fpart * 256.0
            intpart = trunc(Int,ipart)
            aa = exp_int[256]^intpart * exp(fpart)
        end
        isneg ? one(FF)/aa : aa    
    else
       one(FF)
    end
end

