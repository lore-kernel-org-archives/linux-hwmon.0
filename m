Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793765179;
	b=jb61MKQd22e2XT06YvhZHDtIhuioBjlRwyfnBUokqFZJkP7GOzOJ09ByoqkAqnysrRen
	 PFrczQ7tBzYNnRiB12h4Of/Lj3DMcvkulWisKd2St8jPElqPquOnUf2snjcnGZc4psE7W
	 iYhQizDCRIxO7C8Mngg+3/Jfr405DvQb1rnUG3gjPtHy0AAbHaJpNDRewVz8vvlBpYN+J
	 9JW9kYRHvSt2eyX7B2YoNdAVJmMYRlzVz+Op0OIxaVmETpKJ5RyaXQNtUnEH5zMnUbLiV
	 7wtjHXfd66T423nVweoC7NRw+uGHFiKOpzRfMYeyB2FrOGjS0zxquoSKgcl/ZtS2hUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765179;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gd6ts8k+0IfdjG0vpUozm9tUa9gA+wDck2ckN+A8Cl4=;
	b=48EM8gknXh/JgXwUH4L3y6ihgpyhIQ64ZOgdeNgRmAK/qsoj+QO1jF9DMH6zWfgaUBqw
	 6v22/K6rNUsrmBNxuKolqnn7bq0h1UWHYISRZYsztIj/9PNZdLayj9TPR3n2WNZq2qJTA
	 OSATeA6M3/LykM2+HrQ1/PIvsjY2c6psD4Qkh0vuEpLPuK6bVhGWbwg5ZzKFPjks/+Jmb
	 7XOHK3PhiCT2/r5rW3mq4z22NAKhQaU382zUopko2PL42OQlY04M99tdVoACwJjow228x
	 MNE56V59d33wMKiNXueLWGek/xhpmXx7BZb/Psk+zn0CtMZf/dPZzBK/hf2J7JTgZpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=UDx2EtRK;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=E3eV7tnv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A0E606A326;
	Wed,  4 Nov 2026 04:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=UDx2EtRK;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=E3eV7tnv
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43HLWU1936764;
	Tue, 3 Nov 2026 23:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=gd6ts8k+0IfdjG0vpUozm9tUa9gA+wDck2ckN+A8Cl4=; b=UDx2EtR
	KW9EQyGlFVzD8ZE52Ad83GvF+YbeYlSHzVs8WIEC/AyK1/7OX5V3ImoPMGoeORAV
	8sOEPS1FuCHHmg4pQU9r7U3u8r3U5Vgl89h2b/zYrQmIny7SuENXSpYry6blYrBg
	eKIYbysanL4IhQN+pYBoThlxo9n2lzNs1AapnnKDO0Z8In0w3QZHaKO+xQJhw8WM
	2bdx1GasRY9cNjSyicgyfT4GByVDrJ9rAL5Lr6/jNoJBNH86ENSDjj1OfdleWTdA
	JPouaKg7TgJvUsddLJ9TgsviqsgVFwJV6iBcyNR2WPHDd4kjDl7KE1VHPiZg3LJM
	4oxySAIMEeCCwyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gd6ts
	8k+0IfdjG0vpUozm9tUa9gA+wDck2ckN+A8Cl4=; b=E3eV7tnvRUuBd00HIsoXg
	4z6Lwibt+CC9qW82/gMSs44chsqjJhmTMozPHmghBlopDbrhyPy76HqsgLVpMQdK
	v7nn3sPiXnQlh56TryBh+85jooD3yOHPRQlxbF2Cgd4o13J9rYl2PTbrrnwrvWzX
	lLKAJXoLsGmL+HKBleACOSFg3pxrirhx7RmkQqERiDjNk7PXI5JMRvzrSGyA2bXK
	tUe+zsQuXv/4+QCv+z4eytIn0+v+1+pa6tk/quFN3AbVOWVvUvSErzchOLI55Wxl
	QMzkC0/HJ61+vsgbpTkKbbkRecANgo8YunXF5JsDCXQaiRWq4BX5an7z3k5sbxIU
	w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hqh16456v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 23:06:16 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bafvZUM++yNYIw++k5VPenbOUm2CKPm2JBVsdReX4xpXoUClKCblRRdeVgLJX7/Ps0eh0W5Ngfxg4+fUhFJAq8YgMJmDwkEk/0LP73zFwzuiH9su1Dz4A50rRN4CwZT3sA7M1V28egSy6Ja26lrrDr/yonuKGmJY/O2xfWg/idZLvDI7UBen8yZVijGVhArEFlDJ0ulvTPMWWjeyBJXNEsogK5eqySevToj8wiDI3MYLM6PysuX9+aHrvTLvITwjy3951lZZBlHQVer5LcPM1LMRXLxuJ3KB0Y587seEwxJAGGhazprcVKBQA//m470wj5HilUPo0UYld6aSQBZxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd6ts8k+0IfdjG0vpUozm9tUa9gA+wDck2ckN+A8Cl4=;
 b=NblHw7IDxTd6w0kcSDsOzxeriPHxeLOWQslJVaG7/l+ySiGykYdrVFqKxDGAeOB8IEMnU53DWC7CdrP5ZZ+2/0TxdYyLwp++fTKwyxtUOpiPFGU6Fh4wYroTbUE3CkRjzcjpF82Y0gt7O1z+sYesslwC9xlbKz1PVRe8uvcdEUFJOs6WZCYNql4HfMqVxj5HXhJIdrtclcV5uQaJQeX13QLk0k5/fbEUNAnq/TJD4ptUcHnP4w674+OuzKO5ZjLEIEdiFrwYaT8fHOVtb+8hWbeZ3twbUL/BHMtfKNXNBqNnmVRLsJ2y3pELAvKnQKIcw3gEKibCB8Wf9+mvWQYN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA6PR03MB7567.namprd03.prod.outlook.com (2603:10b6:806:43e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 04:06:14 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 04:06:14 +0000
From: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Topic: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Index: AQHdbAzfnJo8jtVgE0WD9mxm0YLL+rcdRDIAgAAFgxA=
Date: Wed, 4 Nov 2026 04:06:13 +0000
Message-ID:
 <PH0PR03MB63510EDCF229B247474764C8F1682@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
 <sashiko-outbox-196618@kernel.org>
In-Reply-To: <sashiko-outbox-196618@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA6PR03MB7567:EE_
x-ms-office365-filtering-correlation-id: 9d02b0e7-d736-4c58-141e-08df3a28f7d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|260925021911599003|260925022911599003|260925021311599003|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261022105027099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 hYgeq90O8xbMTm+BJxDK14Ur/1fKs7WBFx9JzRVGt/tJisdxyhuKDJVYCsVbY3cmK1I8ADUyjT4nm2MB/IevyYsPrIUWqUHc0AY4rRR1tBN14YBogN8NA3Sylj9Zz4yIZylKd1hCpPnAa2smMa5lAvAUFo+DPDFI2eKqhK4whPPtGlJ2PyzMTG3pRekM7dScG4l1t0UaH6VFSDgPkMjqQOfATrOoZjtc31O74Mca7OZM+ygcVOl/YQmwAU2XYeRdwYvBbJ+g3xQfpQQMY7JvZrPVB62TJdDf/WlSItTNNbkYbMSqBVTAJ1CN+O2T+fCtyhtK/JEQF/7CBOgx1E7KQypRhFiNwIJcK5A2qUg5ynT7OU+Ebh0tY2paHoNO5MlqLFgKwaYjp/sv8cMHkJlR2dFy+OZB+f2t4J4wArsnBW5n/fRSfaLleDoxBITqQoEVFMY6ZKFDKGTKr4O9sYBcknLXxcYuVID3345wkzovts+HtnrC2w29q51lw7Tt/AsG3ym1sURlUNpUuVxSHpGmkRGfUPJXadjW7vVIBXG9hI3Wh5PYVHFY7d3vDRHyKT9waIImLH8nZW8eCHEf3uxqL3BuVwt4NkP3Mp6bVVGrrWhtA8G2YqaMoGF3J3gm+wRPtYEQXrvKEtqyhJ6mrDrdfkJOADJZFuNM0ILkOk3YQ8VjSAUzxqgfihmFe8y9NnDkuWStg7qj2k7mtF/UZiFYdE/wYR1W3+amGHEP2ddx9HQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEhkbXkxbU03UEE0YzdlSFRJN2JkV2dvbmpYalpWaUcrNE5tL25xeFhaUUtM?=
 =?utf-8?B?b2lRRWl5TnlMQ3VKQmxrK053WFhYcFdrZVBvd2duaHZhbkFJOFhrOE9scGhR?=
 =?utf-8?B?VUZjZkl4c1JUcndSYzIyWjBzRFYzak1HS3dCdU1pc0IrS3ozR1lxeE4zTFE5?=
 =?utf-8?B?cytMSFdKNlNrOHRLTXFBL2NjdWRuWC9ZZWFyc3NBR3BsSTYrSVZLNkI5UHY4?=
 =?utf-8?B?L0c3Uk96ZEswRUhqZEdnWityL0pxUjVoV01wOWhadWZobGg3SlFZSzQ2aFV5?=
 =?utf-8?B?SVNSdjlMZG9UV2V0NEFtVEh2aFZVOVQ2OFBjU2E4R1ZnSkQxazhxZ0l5MkVJ?=
 =?utf-8?B?Sm0yVTBNWTRORGV6SjBmUy8yM1VRRm9qUjhLaXMvMUZXMDZNRURseWQxK21N?=
 =?utf-8?B?SFUxbTVrUnBSd2lhWnVyOW8zY0JYUUVsTGZFbjZ2OVRMWGphbXR0bHArV3cr?=
 =?utf-8?B?N2NjaG1qRlltSWUzUVYxVTQ4Q1llS0Q2aGxXRUpNWXVpaG93ZE9YVUtQeXI0?=
 =?utf-8?B?bmttZCsrRFdmZHBNVlFEOElqZC8vOXJIZkNGT3Nmc2VXb3VyMU1rck5WNVpX?=
 =?utf-8?B?TFQ2YS9EaU01bER3eC9hVnRHTTN0RlM3OURpUmNzaG1DZE9DaWlYS2FGemRv?=
 =?utf-8?B?VlRGMjdDdGppUGcyWnhVSlQ0bWVkTGMzaWwrNEZzd29Zd1Q5cGhvSkZRZVlQ?=
 =?utf-8?B?RDVNWVRUbHJIRXFYeDB4c1pkZk1DUURXQ25LS3ZuRjU3Y2RjbmRmVGcxc3Fy?=
 =?utf-8?B?QzY1bUxteXc5MkFEendOT1FXQis4dmJRZ2ZrU1ovbzlMTS95aSt1VVNJK2Nq?=
 =?utf-8?B?Mk5tQzgxL3JvaFJkTWg4aW9GNlloNnZveFI3VnE2cGFwdGlWVzlUeGU0dmpH?=
 =?utf-8?B?TWZUTmRxTjhqejlLcTd1RmhrRllZUklWOHFtc3RSUXRsNTZYQkZXWmMwQmZt?=
 =?utf-8?B?KzE0NnNBVlN0Z2hhSFIvOUlXTGpxeXZDd3k5ZlArRUllZVorT21FYnhGOXJH?=
 =?utf-8?B?dk9rTXF2YUhxa2M1RmtyaG5zOFQ0aFBYckhwWmtRS1hmR24xRG9IeXYyazBp?=
 =?utf-8?B?YTZ3OXRLbFNtNEljUmJ5SGNDeVg2THRpUmFGL0lET2IzQmlndFEwMVpsNmhF?=
 =?utf-8?B?WFNWUXpVNS9SaFMvZjNTa2NFbTRYblBGczZEN2xadCtpTlpvWUhwamZFdnJu?=
 =?utf-8?B?N2lKZHRVTWpLdUcxUW5wNnlJNU9JZG9KUWw0MzJidGhOSVM4VDdkQzJrakZB?=
 =?utf-8?B?YkFRS3RzeXJOL3JIN054M0FVd09UYnNXRkpsY0hlRWVTTGNIRVdFMldZT2Uz?=
 =?utf-8?B?aHhQWlh3VVlRUDNBdTViWVJJY3ZOZjJ6TEpQcWxiZWtKeExMNmhvZi9FaWlk?=
 =?utf-8?B?OGMzUkg1bmFUVkdHTGE3YkMrekE2REM3SmNWQnVHN2FJay9EYm82ckZFTlN3?=
 =?utf-8?B?ZWxPNTdiR0ZQVGRQa04wOU95NjZ3R29EVmg0T1JIN0o0emZUdGlHYjFUQlNJ?=
 =?utf-8?B?WnUwUndTZFV5c3gxaVZkM1lBdXF2VkxrVDRJNWI5elljZzloRCtqR1JiTW1s?=
 =?utf-8?B?MU05Njk5ZTNrY1NCVU1JUlAvYWtrUWZYaDlvWDN5OUwzN2RsTHRhSHRjL1NV?=
 =?utf-8?B?UmJ4R2FQYlF2Y0JHQi9KMlpvdW9rbGRPa2duZ0tXWWsraUlZZXMwbGh6UzhJ?=
 =?utf-8?B?cEl4ZEllQXlQQjBvaTNoL21tb3poeE55cmFhZDlqQUwrS3E3OWkwaEJOYzJE?=
 =?utf-8?B?bUt4YVJOWUt6Wi9VN0lRK0tGbk5iZGpIbEFscVJ5amh6dFY4dzM4WUxHQWRR?=
 =?utf-8?B?dzYrRDMzTXk0emZrSWRkaDRJbXYyQW1SekZGQk5rNTFvSkpPeE1XaFFhcnVZ?=
 =?utf-8?B?aEZTYm43ZnNWNlorM2dHcHdPUzFtajhpY1djTzNOL285b01rS3lPSzF1Z09h?=
 =?utf-8?B?aDBwbXJNVFNTdDNuRGhlWm5KNFgrNkNEYXFNZkJoTmF1MCt1UzJ1bURtMTZF?=
 =?utf-8?B?UlFobWw3NjNDeTQ3S09BNngrOFhDMDF1SjU3eExJSlFCRm1GcFlQNzJBY2Np?=
 =?utf-8?B?SWd3akdRdWhnQ2tMaWJRalk4U2J6UExPMEdVdE1EL1JWeHpXRHRtNDNJdXZH?=
 =?utf-8?B?MndFZUpOUjdIRnRxb0kxcmwvWmRRMnBNdndNUHZIWnhnelZHV1Y5dWFaaENC?=
 =?utf-8?B?TXFOZjRxajhsUFo5M2Z5WjJwYWpzamVoS0R0QXUrWDM2WkRCcjRyNjhhZS9O?=
 =?utf-8?B?YU80QUZVNW96UThSU0FteFRtaWEraGFZSjg5Nkg4UVorcXZobndjQ3h0M0Jr?=
 =?utf-8?B?dkRnTStWQmEyd3laNEs0Ynp4M2pJc1NYMUZaQnV6VnZRTklaWG1uMjVxbWNW?=
 =?utf-8?Q?BntrYk4kCE+YBxGA=3D?=
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
	wr+D3PcUXhMGBG69ds9OsMj4JJqQI9P6kF69vshXkE7VRbyx920upQigFqfAvxMInWyoANTsqNri4MFOttNUzrTBKBTV3fB8HqH/dZrvuRTddR7/J7SgDvgrdJKQN5pPvuP5LPQPbfzEvfPJzBSQu3A1CHHyx73lkUKyXCbxDhxcUW1ID0gGGUiULuCkGwThLGt8A4xDl82Du9RJRZTsDOVNHzTpKWued1UJHyJrDirb8RUQ6eZJj/DRblbj0Thi/Bpt8rDFyB4rhbAVmDIhP+x5HuP7DHyH85MvWVPel6jsjgweOr6HKyvdytk8tJfP7ZWz3A+glZw2OErSO90EfA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d02b0e7-d736-4c58-141e-08df3a28f7d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 04:06:14.0826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJVFeMTG0WzkcZ6FVqV7A9dtjNa1gkZzMH0Suk9PJ/ugLkBur2qke0xhLkj3XG6rxHUaYxvkGDStL46/mvhJagEDyBQz6xANjA9TfpXYd0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7567
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxNiBTYWx0ZWRfX4F67V1+BDKsx
 0Y5iPMa6DE94lOoREoWH0wb3dQi6+qD0MIDFnbozXUvBlvTtYRWNy8/X4f9SyfeJ54o25Ek3WGN
 mEfcFYKP0Vg6ExjE5SgwoaUJoG/6o2JXxETCgaHMlJathW3tH2Vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxNiBTYWx0ZWRfXz8p2OHALmDv8
 d0TrICOiQxxkpEVSoGENZ8x72Je5mYt/7wM0eKgm9L20UoDYiJcqIALX2hv60eTiFMD+2IwPKJ7
 U6/sJApv8V+XBHnL1I2WDXXnv5q5yukk/n3Rp9XeKVroMQCi1zBoeJP0KDGSreUbQghgSdZG9q9
 luxX3cb3wqFNIC/3zioBE0/EKfvFK1Zxr+cpdahgByNXZjVKuUPPdGPaCctej90vqyymuzITZI9
 xKh3oo5pw4VzSMsOJ/wo6eYmg0wVuwZU2G2Ap5uUDnD7h1DvDlH1xwRyAeIxEojxQm5l4/SHFrB
 1AkhTUdkfQWIB38Vt47ZLaGT1DNDD9TiLLaAe+MMx7Q56a7rbLle5qm79hOdHcdjBitEoLAXyuL
 F9zHJVDNeyml0zzugVmBjuC9NOY+mneSIYolEsMZhi+AGt182avDG+VvH48p3U/g9jOWhfVRp15
 fReqTiYIGEXFk6H/bSw==
X-Proofpoint-ORIG-GUID: QncC8osB80jcqg8YQg8zko9b8R_e5pLd
X-Proofpoint-GUID: QncC8osB80jcqg8YQg8zko9b8R_e5pLd
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6aeaaf38 cx=c_pps
 a=8o+REoaIO3XrXU6fRoneHA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=zjPpCkIGgXIpaTFMz8cA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040016

PiBbRXh0ZXJuYWxdDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNo
aWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoN
Cj4gLSBbTWVkaXVtXSBkdC1iaW5kaW5nczogaHdtb246IGx0YzQyODM6IHJlcXVpcmluZyByc2Vu
c2UyIGJyZWFrcyBzaW5nbGUtZHJpdmVyDQo+IG1vZGUNCj4gLSBbTG93XSBkdC1iaW5kaW5nczog
aHdtb246IGx0YzQyODM6IGx0YzQyODQgZXhhbXBsZSBzZW5zZSByZXNpc3RvcnMgYmVsb3cgbWlu
DQo+IDUwMDAwDQo+IC0tDQo+IA0KPiBjb21taXQgOTY3NmIyOTRjZjJhZDExNjhlNWNlMGQ4ZGU1
YzBjZDU4ZTY4ZDllZA0KPiBBdXRob3I6IEFsZXhpcyBDemV6YXIgVG9ycmVubyA8YWxleGlzY3pl
emFyLnRvcnJlbm9AYW5hbG9nLmNvbT4NCj4gDQo+IGR0LWJpbmRpbmdzOiBod21vbjogbHRjNDI4
MzogYWRkIGx0YzQyODQNCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgZGV2aWNlIHRyZWUgYmluZGlu
ZyBzdXBwb3J0IGZvciB0aGUgQW5hbG9nIERldmljZXMgTFRDNDI4NA0KPiBuZWdhdGl2ZSB2b2x0
YWdlIGhvdCBzd2FwIGNvbnRyb2xsZXIgdG8gdGhlIGFkaSxsdGM0MjgzIHNjaGVtYSwgaW5jbHVk
aW5nIG5ldw0KPiBwcm9wZXJ0aWVzIGZvciBpdHMgc2Vjb25kIHNlbnNlIHJlc2lzdG9yIGFuZCBB
REMgcmVzaXN0YW5jZS4NCj4gDQoNCi4uLg0KDQo+ID4gKw0KPiA+ICsgIGFkaSxyc2Vuc2UyLW5h
bm8tb2htczoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBWYWx1ZSBvZiB0aGUg
U0VOU0UyIGN1cnJlbnQgc2Vuc2UgcmVzaXN0b3IuIFRoaXMgcmVzaXN0b3IgaXMgY29ubmVjdGVk
DQo+ID4gKyAgICAgIGJldHdlZW4gU0VOU0UyKyBhbmQgU0VOU0UyLSBwaW5zLg0KPiA+ICsNCg0K
Li4uDQoNCj4gPiAgYWxsT2Y6DQo+ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoN
Cj4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4g
KyAgICAgICAgICAgIGNvbnN0OiBhZGksbHRjNDI4NA0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAg
ICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSBhZGkscnNlbnNlMi1uYW5vLW9obXMNCj4gPiAr
ICAgICAgICAtIGFkaSxyYWRjLW5hbm8tb2htcw0KPiA+ICsgICAgZWxzZToNCj4gPiArICAgICAg
cHJvcGVydGllczoNCj4gPiArICAgICAgICBhZGkscnNlbnNlMi1uYW5vLW9obXM6IGZhbHNlDQo+
ID4gKyAgICAgICAgYWRpLHJhZGMtbmFuby1vaG1zOiBmYWxzZQ0KPiANCj4gW1NldmVyaXR5OiBN
ZWRpdW1dDQo+IEFzIG5vdGVkIGluIHRoZSBiaW5kaW5nIGRlc2NyaXB0aW9uIGFib3ZlLCB0aGUg
TFRDNDI4NCBzdXBwb3J0cyBmb3VyIGhhcmR3YXJlDQo+IG9wZXJhdGluZyBtb2RlcyBjb25maWd1
cmVkIHZpYSB0aGUgTU9ERSBwaW4sIGluY2x1ZGluZyBzaW5nbGUgZHJpdmVyIG1vZGUuDQo+IA0K
PiBJbiBzaW5nbGUgZHJpdmVyIG1vZGUsIG9ubHkgdGhlIGZpcnN0IE1PU0ZFVCBwYXRoIChHQVRF
MSBhbmQgU0VOU0UxKy9TRU5TRTEtDQo+ICkgaXMgdXNlZCwgYW5kIG5vIHNlY29uZCBzZW5zZSBy
ZXNpc3RvciBpcyBwb3B1bGF0ZWQgYmV0d2VlbiBTRU5TRTIrIGFuZA0KPiBTRU5TRTItLg0KPiAN
Cj4gSWYgYWRpLHJzZW5zZTItbmFuby1vaG1zIGlzIHVuY29uZGl0aW9uYWxseSByZXF1aXJlZCBp
biB0aGUgYWxsT2YgYmxvY2sgZm9yDQo+IGFkaSxsdGM0Mjg0LCB3b3VsZG4ndCBib2FyZHMgd2ly
ZWQgaW4gc2luZ2xlIGRyaXZlciBtb2RlIGZhaWwgc2NoZW1hIHZhbGlkYXRpb24NCj4gdW5sZXNz
IHRoZXkgc3BlY2lmeSBhIG5vbmV4aXN0ZW50IGFkaSxyc2Vuc2UyLW5hbm8tb2htcyBwcm9wZXJ0
eT8NCj4gDQoNCkkgc3VwcG9zZSBJIGNhbiBtYWtlIHJzZW5zZTIgb3B0aW9uYWwgKCsgY29ycmVz
cG9uZGluZyBkcml2ZXIgY29kZSBjaGFuZ2UpPw0KT3IgY2FuIGl0IGJlIGtlcHQgYXMgaXM/DQoN
Cj4gPiBAQCAtMjY5LDQgKzMwMywxOSBAQCBleGFtcGxlczoNCj4gPiAgICAgICAgICAgICAgI2dw
aW8tY2VsbHMgPSA8Mj47DQo+ID4gICAgICAgICAgfTsNCj4gPiAgICAgIH07DQo+ID4gKw0KPiA+
ICsgIC0gfA0KPiA+ICsgICAgaTJjIHsNCj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAg
c3dhcC1jb250cm9sbGVyQDIwIHsNCj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGks
bHRjNDI4NCI7DQo+ID4gKyAgICAgICAgICAgIHJlZyA9IDwweDIwPjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgIGFkaSxyc2Vuc2UtbmFuby1vaG1zID0gPDEwMDA+Ow0KPiA+ICsgICAgICAgICAg
ICBhZGkscnNlbnNlMi1uYW5vLW9obXMgPSA8MTAwMD47DQo+ID4gKyAgICAgICAgICAgIGFkaSxy
YWRjLW5hbm8tb2htcyA9IDw1MDA+Ow0KPiA+ICsgICAgICAgIH07DQo+IA0KPiBbU2V2ZXJpdHk6
IExvd10NCj4gSW4gZHJpdmVycy9od21vbi9sdGM0MjgzLmMsIGx0YzQyODNfc2V0dXAoKSB2YWxp
ZGF0ZXMgdGhlIHNlbnNlIHJlc2lzdG9yDQo+IHByb3BlcnRpZXMgYWdhaW5zdCBbTFRDNDI4M19N
SU5fUlNFTlNFLCBMVEM0MjgzX01BWF9SU0VOU0VdLCB3aGVyZQ0KPiBMVEM0MjgzX01JTl9SU0VO
U0UgaXMgNTAwMDAgbmFuby1vaG1zICg1MCBtaWNyby1vaG1zKSBhbmQNCj4gTFRDNDI4M19NQVhf
UlNFTlNFIGlzIDE2Nzc3MjE1OTkgbmFuby1vaG1zOg0KPiANCj4gICAgIGlmIChzdC0+cnNlbnNl
IDwgTFRDNDI4M19NSU5fUlNFTlNFIHx8IHN0LT5yc2Vuc2UgPiBMVEM0MjgzX01BWF9SU0VOU0Up
DQo+ICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJhZGkscnNlbnNlLW5hbm8tb2htcygldSkgdG9vIHNtYWxs
IG9yIHRvbyBsYXJnZSBbJXUgJXVdXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0LT5yc2Vuc2UsIExUQzQyODNfTUlOX1JTRU5TRSwgTFRDNDI4M19NQVhfUlNFTlNFKTsNCj4g
DQo+IFRoZSBleGFtcGxlIGFib3ZlIHNldHMgYWRpLHJzZW5zZS1uYW5vLW9obXMgPSA8MTAwMD4s
IGFkaSxyc2Vuc2UyLW5hbm8tDQo+IG9obXMgPSA8MTAwMD4sIGFuZCBhZGkscmFkYy1uYW5vLW9o
bXMgPSA8NTAwPiAoMSBtaWNyby1vaG0gYW5kIDAuNSBtaWNyby0NCj4gb2htKSwgd2hpY2ggd2ls
bCBjYXVzZSBsdGM0MjgzX3NldHVwKCkgdG8gZmFpbCBwcm9iZSB3aXRoIC1FSU5WQUwuDQo+IA0K
DQpUaGlzIHdhcyBqdXN0IHJhbmRvbSBudW1iZXJzIHRvIHNob3cgdGhlIGV4YW1wbGUuIEkgY2Fu
IGNoYW5nZSB0aGUgdmFsdWVzDQp0byBhIG1vcmUgcmVhbGlzdGljIHNhbXBsZSBpZiBwcmVmZXJy
ZWQuIA0K
