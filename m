Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794193013;
	b=AKMYp0IzbQw+zvWnP1q6G7fPJbeInoSpZjDzO+AkKT/3CsZuYobHcYC77G7Hd7Ex5WN7
	 tJrXUJS7VJQ5fV2z6DzVSusmmhXASnnABr/p4mQcIPkTH+OVVwQYODvteBYvhr9kUUZ6z
	 9IL5gCoAdaWImNo9TMLOvn1HMEbCzief0dJbOX7HOH8V1h8RCrFqBABZFgABdQE6kX2Gd
	 rnMfqr4jeRNytwxY/cbryZLIaJNenAlcQowGuw4fSqYvK9/z0ko5Y8Koe+kIw2KoJaptj
	 8VOU+HmJdVazWJk42GvICKvIHhfiMgbHsBo5RBjRAVs1+qrGykDa4D8ydU0FA/S8mzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193013;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SlUmU7IWtcZPposdaR5XGZiwoPP/Z08ikoXRsT5wqmo=;
	b=zmDOZau/ZjGMS06AiesfvfPiVneDb0kWk5zsNON0LC8K6zg94QkIcLypLC+YOVNzI4h1
	 yTxEpWf3SEHr2hlZNNPj4Fg99XAWwUW8s7jDfoQ5dr6WM8DOCFVg7qvI5v24FujQhmQM+
	 owwYh0IJwb+kz8DLDT6IX0Q+7A/fMndp70IkgINy9KI7FLh9aJpB492vacptRsyvZXfzz
	 /npxbarzKGBECngPJ/KvJMwwNC65aDvv1ksIJxdzrFk/6wlWJSDBOPWIGXO0ITpxwYjgI
	 Kxacp2RqEcraW4I7dfc503pPHrFCYPNgE+yjtsSLRrUn9QPIefW3QNXWBH3QiFwtjYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=I9JDmSh2;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="XKCmIQ/K";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446B606A320;
	Mon,  9 Nov 2026 02:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5446B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=I9JDmSh2;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=XKCmIQ/K
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90GWum1255875;
	Sun, 8 Nov 2026 21:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=SlUmU7IWtcZPposdaR5XGZiwoPP/Z08ikoXRsT5wqmo=; b=I9JDmSh
	2mRHfJz1IuTHvs2vAL/WC2sr6kuMTVWjFiJBNugf0Qmk2tufOjiskHzMBSReQHAN
	ykHiKESn+S9rIAFTISyqNE1J/JEkRy4fdQs+vWzR9RBGvD3XQ1qiT7Q5Ny3Gx+uu
	oI/jPnvJu4aMGq3+z6D6QbLvTMtmwztByv0n9BVL4lWA8F2Rqoesc/wM00diI/rp
	NtlBwfrW2hlEAOzfscRkMtncqNhuQUQDjSGOub/EyV1RCc49+E27doqxQUTFro7r
	mDDQTq4GVsmXIBWTcz7xsXt6WSlKjSernUkBQyCeEPX8uT/db6+c5nCpxktFRDn1
	xfq6739TOT4X6tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SlUmU
	7IWtcZPposdaR5XGZiwoPP/Z08ikoXRsT5wqmo=; b=XKCmIQ/KbQq4jdT39znif
	HIIJW/xB+U6soRcUYLYgDRTNakWp4Ry5jLObPXnJ1LEEJTJQAbp8rdPm3RKk/SWM
	alC8paeVLq4eV4mknMbYbGo1/3b21oeX651ihwtSIv2h9OqCZrnGkncKp2s6QX8t
	zQLm7J2JdkCQmKt0iRnEg10IGbP+UcI5k5ymcPh8BDpKXG0tQHn2TPyxZbAMxTsN
	0G7fEYnLy354ILKxOn7VEzbfidG91yOIssHaIRtiBKuvldW4ap7iJMVv9berr/NK
	m5ftZ7+SuifN/XEjKezelpOYDMXdlzpLVW+ZC7wO8rSeH9C8GVlGnb1cytN4vSka
	w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4ht1g9qyxu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 08 Nov 2026 21:56:34 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Er4ytJ9uAN9PVNO/k9JlfXjFw2y0KZfHZrt2mmz8jtH3Xxy23jnI4Eod7KRaBWgTiehWgniyRImSt2qRRhGJo+nNyw1NoUnt/lxf6g4gUJPB70hvXMY5WpTpLb4c5FKblvEeRJACg6ADtKgld8EZyAvflrzNXg3hefDt37VjrS3G544catOB/hVC9denvfL6TKqxQpUblzbwpkqBp433ZKoDJ3JF0gLNMOIYUroHzLThx5KtrUNr9v1DYzDevmzdG9YgakakgJYDbS2tH9YZWf7CuQXEuWQeWfKKdR1xfHMr9M9RMJG4Ou7kyWtg+F8dACALT2c9PDprEE0IIjdOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlUmU7IWtcZPposdaR5XGZiwoPP/Z08ikoXRsT5wqmo=;
 b=U9Ep2RKdbI/js3ENG7cRGAtbkI5cSspdJDsZ4sFDHvykTxMPGWTYSL5dKrEC3ahaAsGIJaaTIdSEe5i19qfBUtX+CEaMV3yXxOT42yNWhd8hRK+Z9cUX+CezP6MyaHPSzrcHW7Vku1pqgylZUbstx5wQgnYLMva13PVdE1NaJjJs7ZfV+fJhZD9oW3kSVv1IBqWOrt8HFevGW3snkiF+A1XdLFZDDN4dKMITaYHQIft1+0a5sSCFbLJJmiD383WK2rw4bm5/m53ydH0fvqUaEIgmYp5oyT1OZo8Nc9JhKmMjLNuDnHnOWGrFJSByqLcXskWaOMGzlDMMNu/AcxFLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CY1PR03MB8122.namprd03.prod.outlook.com (2603:10b6:930:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 02:56:32 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 02:56:30 +0000
From: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4284 swap
 controller
Thread-Topic: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4284 swap
 controller
Thread-Index: AQHdb+U7h1RG8KOoWEmEvGAP6kSnSLck7UcAgAASEvA=
Date: Mon, 9 Nov 2026 02:56:30 +0000
Message-ID:
 <PH0PR03MB6351A92D63F979EAF9205A77F1732@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-2-14a270a38f7b@analog.com>
 <sashiko-outbox-204280@kernel.org>
In-Reply-To: <sashiko-outbox-204280@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CY1PR03MB8122:EE_
x-ms-office365-filtering-correlation-id: 489cac73-18af-4e07-43b0-08df3e0d0e4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|38070700021|4143699003|11063799006|261028144727099003|261022105027099003|261022075727099003|56012099006|261021123027099003|261026121527099003|261026140227099003|261009223027099003;
x-microsoft-antispam-message-info:
 Z/UEaTdawsgcBFUGZYBWJKu5dWp4QmDnKiyx2k2UfZQzJ0qyEVWoxN4kNd9yI/eFtRhgM2+J09cl8Pg5XjhnPbV/t0wDv227Zmk8Qz52WWqXJPj/mUsMWvUVOXjQHFmomzRf7zrBidBh417p0tgheEgNkgpxteLzh5zlTmDk51Eg8lhJ4UH87/m0NX+U79BzOrAYDQmUUDCgItrd6Vh6sNpcQWjYqtfyyHmHPLmt8a4/BsrLuuCpVqk6A93G5ZyR+CfmxfzdNYgtpciMzkqFvooh419bq4nQcgbQIM47lZjg08KfKQBAYV8RT0UcVH8JksTvpZUmBQWHvkMxG4r6LLCBQPYOk+G1FNd12OsqdxqA05sC7PCWkpiUxczQ9WCIV1uce73eiBUgGYPCVzy9LBjvvgkEbUWuqyVvCRLn6QtXFz6qILBr+3b5XtK90xfhv+Jodl4nhvaWrJrrgO5RXhbUH7r8TrUfMhs3F+t1plUCooV18tvrrhQKghE5HwxyYVSii0YcHalGpL4tIl3B4jC2W6d8ig2Yva9N4ublLwMqpWzMgmc2L+Kv5jdDCsycRcls56GZb6cMkBQbKQoHo5lG9o2qG0ueFZMfCKi3gdnnE7Y6oqkveUVJMaH6QaGGr/l3txpRepuEVzwl2tF9Dn6eFmxsZ6j5pbYj63/6mlEHZjdPyclsc7zAoyHGI2tj/mjgtHXRW4nxFhS0tRjFbtS1DQmg7srvp2rMp7g/z1I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(38070700021)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261022075727099003)(56012099006)(261021123027099003)(261026121527099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUFNTUdHMFpLYk1kVzdGL3NBcExra3grYXp4OU0vZTh2SkltcmdBRE5wMUQz?=
 =?utf-8?B?RnVDYmtkeVVUQnFwNmxmM1hITEVWdm5kdUdibHkrMVZ1WDJZYnRKVXpyM1pz?=
 =?utf-8?B?OHdtMjRtRU1YaUxUTUMzQzNTcFZvUStLV1R1ZG9hSEt5cHNZcy9pdDVQRkpa?=
 =?utf-8?B?YkR3SGYxVndVTGtkNzJJdy95UmVqRUR0NkhvcW82SkQ4VFZ3R1hnUllZdmF4?=
 =?utf-8?B?eHA1Wmt5N3pXUkk0Ujhtcmw4TjBIVlYveDUvTE9udlFnQWdOWTN0Sy9lalEw?=
 =?utf-8?B?NmZYTGRhR0lmZExrdTNsY05rRzY3aHh6OWpuM3kyK0NPUTZiUUY5WXJNdnQx?=
 =?utf-8?B?dldyM0g4UWI4SVFWdGVSRVQ2T21HLzVSWFFud1NHMUFSVGp3VkYwaVJHcXQz?=
 =?utf-8?B?WmpoNW5TTTB0dHlqWjlVUHNOZlVteElNWVJScjFuMTF0OFFqN2hXU0tnMnNW?=
 =?utf-8?B?dGNKTDdVdUYzTXJ1amhDdFBrUGpqbk4wSlJvTTUydFZ2d05qdGRMb0ZDZnUw?=
 =?utf-8?B?Y3Nod0F2bHBpVDkzeC9aQ0E1dnlZTTBNbXFqa011RzBMUTdTb1JmTXFtL2xC?=
 =?utf-8?B?aUV5R1VSbzZmV01UcGsyOGpZb0QzY20xQUJxVkk2TXZQUWFTcVJsaURQUkFm?=
 =?utf-8?B?dDN2V0MvYkcvMnFlNFpXVmdxSC9GZzlEdi9NbXNIdnp3R1hJeXlaQVBpeHE3?=
 =?utf-8?B?ZElFVGdyTjd4OEo5V2t1R2FuVGxwWGNJWER0cnFlT2gwTnR0dExUQitFM0RX?=
 =?utf-8?B?N3IxdFhiUXF3VitYRGtDZm1Jb0puZkFUZWtOT25hdkQxNmM2bEp6cm91TWt2?=
 =?utf-8?B?WWtKRWtZOEtaNktoaC9sZHRia3ZFTWZVb1o3SmI2Qkt4cVBlNkdCQWc3Z2dQ?=
 =?utf-8?B?WkVWVnFmZkxoOFpZcDczVzdGQkppLy84UVh4aFZaNHNkbUMyWldwWXlVZkRk?=
 =?utf-8?B?NTlqMTFyUmdzOW42UXF3WTNXeDJldTZmd1dIU3JZc3MrQmlyU0dXR2NheEpy?=
 =?utf-8?B?aGVVT2gwZzZGelRpNHdOUXFRdGtldThFZ1FjRVF0WkF0Ry81dm9vQ1dScWw5?=
 =?utf-8?B?anVQTFJDTnVPVUpoTlYrcksyVmNMV2F0ejlMNlNaQ3dxRzVQNlovSUdVT2xx?=
 =?utf-8?B?WjRoWTVDNzFPSmNEWUJzN05qT2ZHVFhjT2k5Q1BlK1ZESmd4TUc5dEcxTTV1?=
 =?utf-8?B?dWF0SkV2WjExZ3BuODVRMHc2UnYxZ0NUcHFUa3lhd3lDNVo1Z0ZTRzgxaTVB?=
 =?utf-8?B?ZDJCemhLM3hGcEU3VFJhS2d1ZWZZRk9TU0ZuWGRGSEM2RnhWUXY0Z29TOEUw?=
 =?utf-8?B?TDZpOFJCSzl2UERZMGdwZXZzTWpjUWxpVjlYY2E2RTFFRGhLZ2RzTG5qQ2s4?=
 =?utf-8?B?eWMzVjdWL1VMK08wMU9GM1lWM256Z2E0a2RNb0pmLzJZU2xTN2ZaaTE1b3dV?=
 =?utf-8?B?UUdVZTBEbGdBbXA1azRwQ3VmNVpuOEJ4SnlKd1pvOXlrU3Rnb0llbkh0QmJo?=
 =?utf-8?B?UGtIeXZjYS9oNmJxZGV4c1dDMitkcTNOWFFJeVpobWt0c3I4VCtaSEE0cnR1?=
 =?utf-8?B?RzNPcVhhSmpZK25hZE9maW5QVlNRVm9aRkQxSUw1K3NobVZ0SkJ1NFhBNTdu?=
 =?utf-8?B?TUF1eGxIOU1HcDlOYy9SSmpDRlNBckZMbWZ5Y0M4NGVOblU5aFpxTm9IVjI2?=
 =?utf-8?B?elFnemk3U1JIckVJbHpwaXMvTDdNTmt0Mkt4OFpNNkRjRnpqWDBrS3BTYllV?=
 =?utf-8?B?N1BaRitqVnBKT0p6VXNBRzYxclJpOFJYdXV1ODVrOEk2MUwvNTRWeW1BMmRy?=
 =?utf-8?B?RER3K3JjQUpxSjJIR2hXSVZiUFpEYVVBZnpBb3d0RGk0R1VEbXM2WDhxTnZW?=
 =?utf-8?B?bjZXNUs5dDgwaDhlM3Fqb0RSQzI4bjFWaVFzcjIyanV4NUdqYlQreVc3ZVRR?=
 =?utf-8?B?ekc3YmJkODlBS0JKa1JUL2pjOVV2Y1BsWmNYemFlZFJ5ZXR2NWtucjlGN0hq?=
 =?utf-8?B?bzhJenRmbld6aG5iSUJPSmVMeFI0T1hhb0hMZE5SODh2SWxObGFDY2YzVDVq?=
 =?utf-8?B?UXEyYkZyOGxBWXFGdEFGTWZpY3NEVkcwaktRVFNHTmZ6RzVUbTNtd0R3S2Rr?=
 =?utf-8?B?NmxuTjVLd2J3MEQxL1BGYXpsOWdFd1ZvMlRhWW9NWlh2bS9GbUt4Z3E2VjdX?=
 =?utf-8?B?ZFVWWStVOG5XQ21KZnRQZmx5d0dwQkpWaC9PRVc1WkdBVytXdndIYmg4R0tO?=
 =?utf-8?B?R1ZpbEFHL0pNeHZaNHY4a3Mwa1dzVWNFNjJsaFZZbEV2eHh3bGFvMGE0ZHhK?=
 =?utf-8?B?MDJ3M1ZTSnBkb0tOYWRrbDNvTDlyellYUUdKcGYxdTltN216ZFJEUEhBbWVR?=
 =?utf-8?Q?unkKOOWm1pvzD/tU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cW23Kc2oDORLaGJfGfKDK53Hsgw8wfj7IwjVcNTBdrNUlkhJ8owbb7gnK844PV2CYj+LDC6KvyijTV4MeIz38aTdAlzARb8R71br1jv/xeVvs7WtFzV52HBqm74LVug+wofE8mTmbQzx0AL3g7WTJ4liOHJGpFOOlOIpUlqtMw66wtnqDxjNuo9AozxedNvVLhsJFsykIsHSrITg5mLCqBby2VOjeuN0IVEvIrTkynuy5mvRkIv7mYDHao95cJBz76tiCB+N2hDNbRHJbV7/w7GB/KbH3TapP4s/IEMLk2ay+lhmix0sn/w3iSWAk/lbGcQ659hLnZJp87bSz5xB+w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489cac73-18af-4e07-43b0-08df3e0d0e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 02:56:30.5157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jjpO7d6R/v6NEsLS+WffgjngKpW6l3qIAEqpWiF6BkWYfoICX6FDFVH11l5ZkTgXkUTJfIkdV0rbmigBBSxMq4yJH6GUfAPnvE4OpjUm2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8122
X-Proofpoint-GUID: vv6-Eo6Y9j2wGYjqmJkg_PWbs2tjlDL-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxMSBTYWx0ZWRfX53PA2/2Xj2uD
 fO34FMRUDRvn1tj/HO1JySt1S70VB63H/GphZingAIrdxnmmWek7zJvLlaXVueEhLl0kc8tNDzn
 qrCcHw1ybH8KU2Kgy82PHZe7s+BOt2IckuEsYY82T0RCRF1VgVPj
X-Authority-Analysis: v=2.4 cv=Y9JtIReN c=1 sm=1 tr=0 ts=6af13662 cx=c_pps
 a=9JMNuyHA4Bc1wrbCcMLwMw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=_jAD5XSDOtq9-5Nde2OG:22 a=gAnH3GRIAAAA:8 a=FMUotB6RIPZoyDi_80UA:9
 a=QEXdDO2ut3YA:10 a=U8GPDbBLJVbL5tITwi47:22
X-Proofpoint-ORIG-GUID: vv6-Eo6Y9j2wGYjqmJkg_PWbs2tjlDL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxMSBTYWx0ZWRfX3j6QtMEdVXe0
 4zGrEumVw1Iqm3fw8umm3EP5cLwXcKIUzqpgjPnLAdAHCn03Zt1We2ffcW0QpxiF/WydzWnmJ43
 NpFtd6qzz5hSd+Fbk0Wpb1I073osiTKi7hKfaq0gjtSlkg63qf7ii/gdwIZSczuv37/nmqbkZIX
 rBRxz1ODEDUS5PAz2ggs7yszdpk9cs/Sjl5ZGpdTuZvNvKOtDSwJp52cHVE+iVliEIgs92r4X2h
 PVPk7JnGp08yRJAZH57sPIODusMs/c8AQjCEy+q+1yKYovXxtEcgDqOuWvdMKKju93jSbmqKkxw
 v/w3UZk7m/oVXhKhws/DeKoHI0ITqiBWXfUPYYg8lLmb3Iwy+RRHK0nZbxRmxy0AwrXkzSDcM5w
 V4v7WzxostWjNERJpqKd9gxrzqfroRJqMRuYy9h12DDJNrZy5nMm8qfb4Z98nsV97YnPKPtfIGT
 VDv/rIJlFsqf9hJtTTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090011

PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAxIHBvdGVudGlhbCBpc3N1ZSB0bw0KPiBjb25zaWRlcjoNCj4gLSBbTG93XSBod21vbjogbHRj
NDI4MzogbWlzc2luZyBkZWZhdWx0IHJhZGMgZmFsbGJhY2sgaW4gbHRjNDI4M19zZXR1cCgpDQo+
IC0tDQo+IA0KPiBjb21taXQgYzMyM2E1ZmI2M2Q5NzFjOWRmODNlNTc5ODA5MDJlZjBjMzlmN2Q5
Ng0KPiBBdXRob3I6IEFsZXhpcyBDemV6YXIgVG9ycmVubyA8YWxleGlzY3plemFyLnRvcnJlbm9A
YW5hbG9nLmNvbT4NCj4gDQo+IGh3bW9uOiBsdGM0MjgzOiBBZGQgc3VwcG9ydCBmb3IgdGhlIExU
QzQyODQgc3dhcCBjb250cm9sbGVyDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9y
IHRoZSBMVEM0Mjg0IGhvdCBzd2FwIGNvbnRyb2xsZXIgdG8gdGhlIGx0YzQyODMNCj4gaHdtb24g
ZHJpdmVyLCBoYW5kbGluZyBpdHMgZHVhbCBjdXJyZW50IHNlbnNlIGNoYW5uZWxzIGFuZCBkZWRp
Y2F0ZWQgQURDDQo+IHBvd2VyIHNlbnNlIHJlc2lzdG9yLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9od21vbi9sdGM0MjgzLmMgYi9kcml2ZXJzL2h3bW9uL2x0YzQyODMuYyBpbmRleA0K
PiA+IDllYzQwOWJjMjY0ODIuLmE4NTg3YmVlZDg1M2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9od21vbi9sdGM0MjgzLmMNCj4gPiArKysgYi9kcml2ZXJzL2h3bW9uL2x0YzQyODMuYw0KPiBb
IC4uLiBdDQo+ID4gQEAgLTEyNDAsNiArMTMzNSwyNyBAQCBzdGF0aWMgY29uc3QgdTMyIGx0YzQy
ODNfZmV0X2JhZF9kZWxheVtdID0gew0KPiA+ICAJMjU2LCA1MTIsIDEwMDIsIDIwMDUNCj4gPiAg
fTsNCj4gPg0KPiA+ICtzdGF0aWMgaW50IGx0YzQyODNfcmVhZF9yZXNpc3RvcihzdHJ1Y3QgZGV2
aWNlICpkZXYsIGNvbnN0IGNoYXIgKnByb3AsDQo+ID4gKwkJCQkgdTMyICp2YWwsIGJvb2wgb3B0
aW9uYWwpDQo+ID4gK3sNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0gZGV2aWNl
X3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgcHJvcCwgdmFsKTsNCj4gPiArCWlmIChyZXQpIHsNCj4g
PiArCQlpZiAob3B0aW9uYWwpDQo+ID4gKwkJCXJldHVybiAwOw0KPiA+ICsJCXJldHVybiBkZXZf
ZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIHJlYWQgJXNcbiIsIHByb3ApOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCWlmICgqdmFsIDwgTFRDNDI4M19NSU5fUlNFTlNFIHx8ICp2YWwgPiBM
VEM0MjgzX01BWF9SU0VOU0UpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlO
VkFMLA0KPiA+ICsJCQkJICAgICAiJXMoJXUpIHRvbyBzbWFsbCBvciB0b28gbGFyZ2UgWyV1ICV1
XVxuIiwNCj4gPiArCQkJCSAgICAgcHJvcCwgKnZhbCwgTFRDNDI4M19NSU5fUlNFTlNFLA0KPiA+
ICsJCQkJICAgICBMVEM0MjgzX01BWF9SU0VOU0UpOw0KPiA+ICsJKnZhbCAvPSBDRU5USTsNCj4g
PiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgaW50IGx0YzQyODNfc2V0
dXAoc3RydWN0IGx0YzQyODNfaHdtb24gKnN0LCBzdHJ1Y3QgZGV2aWNlDQo+ID4gKmRldikgIHsN
Cj4gPiAgCXUzMiB2YWw7DQo+ID4gQEAgLTEyNTIsMjQgKzEzNjgsMzggQEAgc3RhdGljIGludCBs
dGM0MjgzX3NldHVwKHN0cnVjdCBsdGM0MjgzX2h3bW9uDQo+ID4gKnN0LCBzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQo+ID4NCj4gPiAgCS8qDQo+ID4gIAkgKiBEZWZhdWx0IHRvIExUQzQyODNfTUlOX1JT
RU5TRSBzbyB3ZSBjYW4gcHJvYmUgd2l0aG91dCBGVw0KPiBwcm9wZXJ0aWVzLg0KPiA+IC0JICov
DQo+ID4gLQlzdC0+cnNlbnNlID0gTFRDNDI4M19NSU5fUlNFTlNFOw0KPiA+IC0JcmV0ID0gZGV2
aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgImFkaSxyc2Vuc2UtbmFuby1vaG1zIiwNCj4gPiAt
CQkJCSAgICAgICAmc3QtPnJzZW5zZSk7DQo+ID4gLQlpZiAoIXJldCkgew0KPiA+IC0JCWlmIChz
dC0+cnNlbnNlIDwgTFRDNDI4M19NSU5fUlNFTlNFIHx8IHN0LT5yc2Vuc2UgPg0KPiBMVEM0Mjgz
X01BWF9SU0VOU0UpDQo+ID4gLQkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwN
Cj4gPiAtCQkJCQkgICAgICJhZGkscnNlbnNlLW5hbm8tb2htcygldSkgdG9vDQo+IHNtYWxsIG9y
IHRvbyBsYXJnZSBbJXUgJXVdXG4iLA0KPiA+IC0JCQkJCSAgICAgc3QtPnJzZW5zZSwgTFRDNDI4
M19NSU5fUlNFTlNFLA0KPiBMVEM0MjgzX01BWF9SU0VOU0UpOw0KPiA+IC0JfQ0KPiA+IC0NCj4g
PiAtCS8qDQo+ID4gIAkgKiBUaGUgcmVzb2x1dGlvbiBmb3IgcnNlbnNlIGlzIHRlbnRocyBvZiBt
aWNybyAoZWc6IDYyLjUgdU9obSkgd2hpY2gNCj4gPiAgCSAqIG1lYW5zIHdlIG5lZWQgbmFubyBp
biB0aGUgYmluZGluZ3MuIEhvd2V2ZXIsIHRvIG1ha2UgdGhpbmdzIGVhc2llcg0KPiB0bw0KPiA+
ICAJICogaGFuZGxlICh3aXRoIHJlc3BlY3QgdG8gb3ZlcmZsb3dzKSB3ZSBkaXZpZGUgaXQgYnkg
MTAwIGFzIHdlIGRvbid0DQo+ID4gIAkgKiByZWFsbHkgbmVlZCB0aGUgbGFzdCB0d28gZGlnaXRz
Lg0KPiA+ICAJICovDQo+ID4gLQlzdC0+cnNlbnNlIC89IENFTlRJOw0KPiA+ICsJc3QtPnJzZW5z
ZSA9IExUQzQyODNfTUlOX1JTRU5TRSAvIENFTlRJOw0KPiA+ICsJcmV0ID0gbHRjNDI4M19yZWFk
X3Jlc2lzdG9yKGRldiwgImFkaSxyc2Vuc2UtbmFuby1vaG1zIiwgJnN0LT5yc2Vuc2UsDQo+IHRy
dWUpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCS8q
DQo+ID4gKwkgKiBGb3IgTFRDNDI4NCwgcnNlbnNlIGlzIGZvciBTRU5TRTEsIHJzZW5zZTIgZm9y
IFNFTlNFMiwgYW5kIHJhZGMgaXMNCj4gPiArCSAqIHRoZSBlZmZlY3RpdmUgc2Vuc2UgcmVzaXN0
YW5jZSBmb3IgQURDKy0gcGluLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoc3QtPmluZm8tPmlkID09
IElEX0xUQzQyODQpIHsNCj4gPiArCQlyZXQgPSBsdGM0MjgzX3JlYWRfcmVzaXN0b3IoZGV2LCAi
YWRpLHJzZW5zZTItbmFuby1vaG1zIiwNCj4gPiArCQkJCQkgICAgJnN0LT5yc2Vuc2UyLCB0cnVl
KTsNCj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCQly
ZXQgPSBsdGM0MjgzX3JlYWRfcmVzaXN0b3IoZGV2LCAiYWRpLHJhZGMtbmFuby1vaG1zIiwNCj4g
PiArCQkJCQkgICAgJnN0LT5yYWRjLCBmYWxzZSk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJ
cmV0dXJuIHJldDsNCj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBTaG91bGQgc3QtPnJhZGMgYWxz
byBkZWZhdWx0IHRvIExUQzQyODNfTUlOX1JTRU5TRSAvIENFTlRJIGFuZCB0cmVhdA0KPiAiYWRp
LHJhZGMtbmFuby1vaG1zIiBhcyBvcHRpb25hbD8NCj4gDQo+IFVubGlrZSBzdC0+cnNlbnNlLCBw
YXNzaW5nIG9wdGlvbmFsID0gZmFsc2UgaGVyZSBjYXVzZXMgYW4gTFRDNDI4NCBkZXZpY2UNCj4g
aW5zdGFudGlhdGVkIHZpYSBsdGM0MjgzX2kyY19pZCB3aXRob3V0IGZpcm13YXJlIHByb3BlcnRp
ZXMgdG8gZmFpbCBwcm9iZSBpbg0KPiBsdGM0MjgzX3NldHVwKCkuICBEZWZhdWx0aW5nIHN0LT5y
YWRjIHRvIExUQzQyODNfTUlOX1JTRU5TRSAvIENFTlRJIHdvdWxkDQo+IGFsbG93IExUQzQyODQg
dG8gcHJvYmUgd2l0aG91dCBmaXJtd2FyZSBwcm9wZXJ0aWVzIGp1c3QgbGlrZSBMVEM0MjgzIGFu
ZA0KPiB3b3VsZCBhbHNvIG1ha2UgdGhlIG9wdGlvbmFsIHBhcmFtZXRlciB0byBsdGM0MjgzX3Jl
YWRfcmVzaXN0b3IoKQ0KPiB1bm5lY2Vzc2FyeS4NCj4gDQoNCk9rIG1ha2VzIHNlbnNlLiBBcyBy
YWRjIGJlaGF2ZXMgbGlrZSByc2Vuc2UsIHdpbGwgbmVlZCB0byBhZGQgYSBkZWZhdWx0IHRvby4N
CldpbGwgYWxzbyByZW1vdmUgdGhlIG9wdGlvbmFsIHBhcmFtZXRlciBpbiBsdGM0MjgzX3JlYWRf
cmVzaXN0b3IoKS4NClNob3J0IGVkaXQgd2lsbCBzZW5kIHYzIHdpdGhpbiB0aGUgd2Vlay4NCg0K
VGhhbmtzLA0KQWxleGlzDQo=
