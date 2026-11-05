Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793856412;
	b=iVFm2ohwOOQTSUEFj/5VfNuK8wQcmMaFcD7JPiSXcA1uGoQNBbRHvtLDWgTjp+bmwqaY
	 o2g0YwMo7+wjwcjSWIxl3ftNOvLjMTcXD9XFxNmAYlRSh663VMIlR2+DzAl994EYwln71
	 nXeMq9H9ZUgjS+ugVzSK0mlnT/OW+yAW5/KaGpEJGWo7AvBGlb+B3WSdXKFTVhknJT0j0
	 MCtDDJBarqejdOhpc3niUszJDjCuHablPfHbewqJaJbK4Uu9lTmTAVXclPPKG1byWHi4a
	 r03Dd+tzh31QbulVwxWlVfhz3BPWc0yzqHH1BRY8ZKblwMBeyZhqdwWwr/xoPU5DQFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856412;
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ejNa08WX5UzYSndvW4u/6OFwEq2yNVg2UZn/XAdgHEY=;
	b=JHIMEgJuxdKb1uwClzhArgahgEOeTC8KBmv6XONRPw82ql79UmAAz8gl5Ld68tgpJci4
	 3QksFWR7Bp6HBmqJUHONsOsCfv0AuUprD6EAHqHpF9FkE0nTK4OAqsKD5X5VcjP4zKp8h
	 sN/SK7HFk2unxQ2Hk6R2xix+bjvQYR3XyKqrPC0OIT9BR63mh5n07MHv0T1s2SI6oFWJq
	 2bgLYaRu1k9Z8EIlC/5OiKHngC8COieJ3/8Q/JO62GqAL0ua5eQQ7kfzM2E9W2h9eonAW
	 xx8jPLEyHhuxAxKLCb1RcOFKuqmUfttk7SgDo6zUCCgokDLZA8JARcm78OUCFsz/y4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=tyPVXsyT;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=NI46SLrH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCAA606A31B;
	Thu,  5 Nov 2026 05:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FCAA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=tyPVXsyT;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=NI46SLrH
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A53v7Xd2462112;
	Thu, 5 Nov 2026 00:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=ejNa08WX5UzYSndvW4u/6OFwEq2yNVg2UZn/XAdgHEY=; b=tyPVXsy
	T/8DdHcLUMsd2woLLZUFUOq4sxw0pNvFgMQWx5Alwny+N/hPUanY7dC3WMsjd2UD
	+X04V7QHA6AKwHu8pY1np8eoZMVjchoummv5FG5W+mPgkuKtm3aSI/LcblYvlDOW
	K3zepK+9iuDbPvhVk66pz0s8w4yKszCqTqgaouyAUf7F4LHsPGGtK+ekFUnuwCcV
	JXBXxJDBKL9xTa09/qU7uIvMJMHVUw41Ek0UACHNJonuXIP1m2tQSWCSpHfvDZlE
	4x1iWpdOINhgSl/4ToRte3jG7lOntjo/p4HU/oBMa0L7TGUuyA5yBO7Xu+9NnHqW
	WPsbczlD5/wxxcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ejNa0
	8WX5UzYSndvW4u/6OFwEq2yNVg2UZn/XAdgHEY=; b=NI46SLrHfbETeI9O4JWj7
	uAkxvw8+dl974D0PlSn7Tgwks1cuWv6unm63WeRA3ILF2xYIO1jSuV99bGbOns42
	tD7nljux+X1GKi4UCF0FABTA2YOcbdizvuFbqZ4sGpHiUbW/gTVjzmk6o2cjEnx8
	Q+m2MQjoXLHqWsuiuk1o23S2r1rohS97QGkmuK5zyI/LDbSFIOG+B9OrdtD1g0Cd
	IRmO4kA6nfHC6GJTjNmU4K1EnArq2DOD/UMMDVFrJ82EnxH71ZxxHs1eo/JMPTE9
	3eqA6DSPK4f9/4k1VDb4LGvin7+9p8AeX7P5nOXvKXO8kLHd0pC1YtHakLze+HI/
	g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hreqn9knt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 00:26:35 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENeA0c20zgycWcyEq+asvG27h2jPcu2z8l2XqGvuFQATt+aTnLVdcwBgoUs8Mp7QU83tcFRBkbN+3rzbA7eOT83+wkfhxuMEmBX3TWGLKoA9acsHQHTzmce45Yg+ZM6FgajJKDjfnoZ18rCzKExQPnfgvxdV+G8nlKGEPMZC+6sPZYh9p3oUvDffCQDpb7w6YAZL+7p89vbe1EIBwuaH/BEsAcrYgTTzAHM7ztoTRpjkxo5iJyJcnF6jhhkHo3TOPJxcyOgS4cWPI5wgELkJ+xpv1ZR+cZn2soCeOuWrT0jZC2zZmGh+VH+qUVIiDvs02V0xaA2Q+ow0+McIkJL5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejNa08WX5UzYSndvW4u/6OFwEq2yNVg2UZn/XAdgHEY=;
 b=RR+xC7Dok9/DEgMqabeBvUb8/0eNjPFO2pBDsMQuoUze7bXjv8BBGs0MwOZOCZhjN2AvyedV+b+Ox+PLwHogolJyZlhP4AcdQEwmuiTvsyv+eJwbGTt7JhgYJSV+YEAEiKvTgq3BVHpnYfMJkhbIDcQ6/ZLju/85uwgoyZdpYCYQqp9T3Uz0b4BV2flrl1yEe3t5yulD7lYJsa82d2auEhyBYC8VPpb8lqqaDFrhUH5VSfN7Map7hztePyp3VCq7jli+SKewrdXWVz3aXGbZSWP5lbxEi6Pq9Db/KGcb5us3Cb7M0/q9fmlKRQ8GYP/ZaSHRRnHr1mPDX3rjtFdHHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY5PR03MB5297.namprd03.prod.outlook.com (2603:10b6:a03:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:26:33 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:26:32 +0000
From: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Topic: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Index: AQHdbAzfnJo8jtVgE0WD9mxm0YLL+rcdRDIAgAAFgxCAAZRmgIAAFS/A
Date: Thu, 5 Nov 2026 05:26:32 +0000
Message-ID:
 <PH0PR03MB6351885760C36F7A708DE45AF1772@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
 <sashiko-outbox-196618@kernel.org>
 <PH0PR03MB63510EDCF229B247474764C8F1682@PH0PR03MB6351.namprd03.prod.outlook.com>
 <33b55f47-c679-4592-b4e9-a14fb77b7236@roeck-us.net>
In-Reply-To: <33b55f47-c679-4592-b4e9-a14fb77b7236@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY5PR03MB5297:EE_
x-ms-office365-filtering-correlation-id: af60d4b4-ba94-4f6d-e28e-08df3afd5a70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|260925022911599003|260925021311599003|260925021911599003|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 9TNams3Gk8N4XriUnW6OROZ3zq9KF/qkYn4hMGuJRAE6PrI7BtxmpUayW5P5XUnsdtfAM+N0U3ds6GuS43XCJM3oD1x5iXTeemKteJugL83nVAYfCWMN2anP/MacKYnhWyVqccZXg1u4mQoRmCXcQSik/zDMzEAcxrT4hRwG2o8FBqSKAOlGQI86xCVgkCAENy5nEVsMoHOQTQk8O/kpe/2iUTnZQKgy789mO+5Z5IrLkxcjMxrQfYFdkpe872VXejG5kHNqJeRJWQNfhsjkgX/aujx0dKG+865T04+b6JvYf3oIOVBxKQZWpbFsbnUcfzkOpnZBRvfMtZX6SxwxAJC9mmySt0NSylAYEMj1HXH3K0fH2DaZnxkClI5BuDjFot9OrOrrTxQXl3HTkrEYPtMgON4PrZ3u/iqEs1Cfeq68npNGOQ831gOz3xlnAZ36xMOBmlx175SUA3C6yf8xskRJdXZ7UnqlhM6oZ5CrzGeHR4zqDorXb9eOTwyOlAoommdyuQnOyfQ8+5nXx0msJ9bJabck1YK08VEv9p9TnkmIWLg/bPhSS3eSJDnwt0QChLgifjLjK7yidWF26ErK0MRZWPhLzU6GWmBUllqmpdcPqWu36mix/AzLia2evJaXsxZKDjf16duiEsn1lMt5F+AzO21qiLw+Kki2E3k8UF/+ITuThu4gJZbktc3Jl03A/GOldFfVNS/pX0DylL3xPQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ME9jVk5FbUd3Zld5c2M3Sm5YMFdjaGNzTlIrSHdzU0UwWU12cWZMelJTQlB1?=
 =?utf-8?B?V3dYdE9JUWtaUERNa2FoSWtmR0pNRHVpR1lZMVpKUnlpSm9OUm1VWEVxZ29t?=
 =?utf-8?B?endROGcwM1N1NWpmdW1qOWJxQXR5Smg3bDRHdmMzY3dVQlFhR3daMTZxb2Qw?=
 =?utf-8?B?bnY2WmdOK0s5R0tSOFFEbUpWUTVvRCtVR0dSR09US0tNVkZ4UFNJeEN1ZWRo?=
 =?utf-8?B?MEovemp4R3hlYVkxMkhDN3owUjhsV1dCblRSeXhqMk9KMjJlbTdlbFJCcEhr?=
 =?utf-8?B?dDFoa0tTUGxDVGlyQlhUamxFYkpoVnExQ3BEYUtqZHhFRS9jM2xKdWt5c3pT?=
 =?utf-8?B?MnJacUgwMDB6L2JnNEJWSmFDeER3R3V1R2s4cGdsUEJpQmVHWjRSTmtnR0hS?=
 =?utf-8?B?cmw2ZGRza2JEeGdLY2dhcmlMSERjcTdtN2d4R0JTREFYSGg5NVB2UTNyU1lD?=
 =?utf-8?B?b0d2WGp6YldyR3hvU08xRm9yUmJSL3lFcXF0K1RaQ3RYWDRxTXFFRHlINkVW?=
 =?utf-8?B?VE1IT2pXNERsT1RwZlphbkI2LzdiWTB5WkM4cHMyaUtGOWNabXBHNlE4Qmsw?=
 =?utf-8?B?dzliTm1qMFVDZlNMQ0ZZZ1NTaXMxeW5LOEZSRmpZVzNYZkY0L3hPSWtET3p5?=
 =?utf-8?B?UFRLMXZmZEhkZ0owNEJ2bDEzL0xXd3A4bXJFMUxNU00zMVpjalJtekkrYWFw?=
 =?utf-8?B?UVFTNWdjU1R6Vnh4MC9KVmFkaEhSZXdMNElWazdjTmVab05oTkxTbE5YVnB3?=
 =?utf-8?B?Z2x3TzgrUUZ4QlRNLzBnbjlyT3gvcVNjNzhmam1uRU0zb3ZyeitOTkpHbWZ2?=
 =?utf-8?B?M21WVHZBYitDcVBYeHZnVWd4WXNNK2RpNkhZWldtT2oxbTk5YlRZdWdYbFhx?=
 =?utf-8?B?dVpKajdtQk9aOGZ6bTYvRnRmYUVRaU5NUGhjVnV1ZkczWlQ0dmo3NENmT3Nr?=
 =?utf-8?B?eDBnSUhPWVdlenpEdnhQMWxHOTVBMWZXVWgrNGlaYlczc0NUNysrMmNsZGpU?=
 =?utf-8?B?RlB3Yk1oYVFmNGI2RU5hNk1KSTJQdGRTa29hT3B6UktLa0pncHBHR2dSMVow?=
 =?utf-8?B?OGFpZnRCY2dxejlTZUFvdkRaZHBKb3ZmZVBnU2NrSWY3MHVaMkhvMktQM2ly?=
 =?utf-8?B?Q04wQlZXZmcwZlIrbDlHMkttblJWcjJ4elVEc0dpd2lDOVAvMDFXRjcrb1l3?=
 =?utf-8?B?SUJQMm15eXBDQnkrWW40TCtacjhoK0lqT1lWYmlkY1JBZkYzcjIya293MlNU?=
 =?utf-8?B?dGZlU2gzN2h6Y3dYWElqMFFXWHhucVRHd3NuL1o1QnhNT2NHM2FlWGdZeDFj?=
 =?utf-8?B?eVlRVmVKRXNhdVNMdXZOSURURzRKZVFXUzN1NDQ1QlJXSk0yQmJFWmpjR2Ji?=
 =?utf-8?B?bDhzUjZsNS91bXhNQy9ZSDYzOGV2MVAxd29nOE14YmI5OGhRT1Y0ZE9idGFS?=
 =?utf-8?B?djZ6UUxrWHN6Zy8zS2RvOTN1bnU1aFRXcTBHbWJDS2lNQVA2YUgyT1ArOWRr?=
 =?utf-8?B?dHRxM3d4aGgrUnduSVFMODhMOE5XR21ibkVaaXBFN08xNVBmdXRTa2cwTUta?=
 =?utf-8?B?eG41SmxhSVp2WDhHR1BpcXVkazNFTUF4b1JEUldRT2hHcnRMQThRcHZVRWlB?=
 =?utf-8?B?UXN3U2h5WEViNEExdXJZbW1iVVpVSEQrcXAyaDhmc0hmM2lVMFpHSm5FSGN6?=
 =?utf-8?B?MDRlMXFuazhROEJOejl2Q2xHb3poTnpDV0hVUStCQXJkVlM1MkdmQzlvNmRE?=
 =?utf-8?B?Z0Z1bHJ0M3N6VkQwQnI5QzdCYzB2VURBc2tRQ2dGWGM2WXNzQzFDeWkrSlpl?=
 =?utf-8?B?K3hBdGRKd0VCZ1VIdzdqS2ZzNFBRUGc0blk2cG8xVmJSR1dmL1NBeHp2Zllt?=
 =?utf-8?B?R2V1K0pJTHNQVGdIN0F1SUo5Y2JzYmc2bHRjV1Q0WmJ3bFRCWEhOL2RKQi9a?=
 =?utf-8?B?N2lHbUpSR211Y0tmbGxTTDZWM1Z4L0RrUGxNZzhxbUcrYjZLQk5KeTZrWG53?=
 =?utf-8?B?Y1JkRjVYL0xjSjdmWkZ0cWZrV1FiY3loK1MwdHdnUkdIRWtEV3lqdkcvbjNr?=
 =?utf-8?B?UDFFNitZZU5oZDRzRDcyTi9ONXVUZm5PYmw2N2pDQTJuLzgrZ2RFekZhRUhh?=
 =?utf-8?B?Y2Z4OVhXeFFYRkpGZjdIeko2d0RkU0t6d1FuRGlSZjNTYy9kWkZ3OFZzT0VZ?=
 =?utf-8?B?WVRVenpEWnBZclZSWUhjZWpma0VsallTd0ZMK1A1SmNPbjl1VFl6TFJLaVU5?=
 =?utf-8?B?Nm9uOGpqL2s2K0hOdG8wb041US85YUl3UDhPR2pSdm51eUJ5Zm80YUxCL1l3?=
 =?utf-8?B?bTcyMllxNVBRdHpYRXhhTGUvV3RNbm5aSTJmZHBhcXJYZkFaNXdTVVU0czdW?=
 =?utf-8?Q?tY3pUErwn75KwNis=3D?=
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
	SMgQ4ljED9s0Pvv3vB4CZpzxR7BcJgrBnlSHYMrC5FN6T+NXPm8x3GyiNwUvCjCZFoXYHyojFe6rFbpIOKxNqx0gEeTENmj16XEJDR0VDKhDL89LKzo21YRZkwhA1f8ljGYCJJ2F1h1czqPtxW+Eoi6bZckLWqJW0xlRmcGN7KZGNR2oXm1WMP5R4+kEXcPz1ilrZLa/G4d/lg/xwR4ZBHazKID4+aEbp4blIbwJgQ0BEGDbeYaGLD0jKOoky/W4yJcPgXVtEf0LWUZC6h0pUglHrmVQbaCnYxwPPAOxj5xoH9evhAJ40VG08PfZ4nE3/9QGml4g6iNDtvfSWukP7w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af60d4b4-ba94-4f6d-e28e-08df3afd5a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 05:26:32.8070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nvLv4YrPgNL6h58030KTkLmdFVWs9YSuW1GsbzWzarNLosjVwITInaSVHDOlpEa7JjHZ9KRqrtBGxtZQZmtVB1emgsQXTQBx2Xe5vtG7x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5297
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX0CEk2JZiDsxr
 gryhuhtmc3IR1kNm1aXzOSkhsfikDHhoMrJBuGK6VdKfED9K+L9kO6pb8HbpI/TgmTyNvosfHlW
 Qs5WzmrGHyNFrJVkpm53EhbWqnnQwAA2BUxVmagJK6rdVrDD9jTz
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6aec138b cx=c_pps
 a=04So32024hOmtaefayDOVw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ugNRTJOwpmtT476g4l8T:22 a=_jlGtV7tAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=HesijWgCDsqwQdAI5pcA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: BKzJLa9e0JzelYWq9sjJzrf2iWXpH-SF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX23hEhMAL+VT4
 r0NlfJ1mvdq+GGcWl/0jYz+nW35MxgVw9TUa8jtH/aIW/Zn/Echgiu154MAFmTBEuCc72XZZkRN
 QqZt6UFKt+fpahS+R+NeElpcLtgMPTRc/0P2NttqKvXS1N5CgtUZqVkCu4p3ReZQ85tuQtfQbts
 7pk3b/2CuQlbN2XctB3ZhrfmUJhY37Lg/O5nUb6wMFC7DJ75xR/fLZ8YnXXutJxaIHFJYimuXAw
 f79w9rv+REHJM1CFZU2BUqTcsXtEZ0NdbgMvOTIRGGmHYDWOf+hUxlMxRh/HXU2e5gfmCIE6cwv
 jJtItpP7Ql6+ArAcX4Fa2CQsi4idYeEXbz17yOvUxJS+sMj+WbVSgN6+Vbk9Ozbzceqaqm7kLU0
 iGsQIo9FWezvk9uMDzIgTLpxc01sBEjWWXHlauYH2HP2Q/TXfmvThlFy8KO4l2zLQwPRdu3SZHk
 +wvKM5fSeHrG3u65MRg==
X-Proofpoint-ORIG-GUID: BKzJLa9e0JzelYWq9sjJzrf2iWXpH-SF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050021

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
bGludXhAcm9lY2stdXMubmV0Pg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNSwgMjAyNiAx
MjowNyBQTQ0KPiBUbzogVG9ycmVubywgQWxleGlzIEN6ZXphciA8YWxleGlzY3plemFyLnRvcnJl
bm9AYW5hbG9nLmNvbT47IHNhc2hpa28tDQo+IHJldmlld3NAbGlzdHMubGludXguZGV2DQo+IENj
OiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtaHdtb25Admdlci5rZXJuZWwub3Jn
Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOyBjb25vcitk
dEBrZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogaHdt
b246IGx0YzQyODM6IGFkZCBsdGM0Mjg0DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiAxMS8z
LzI2IDIwOjA2LCBUb3JyZW5vLCBBbGV4aXMgQ3plemFyIHdyb3RlOg0KPiA+PiBbRXh0ZXJuYWxd
DQo+ID4+DQo+ID4+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkg
cmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsDQo+ID4+IGlzc3VlKHMpIHRvDQo+ID4+IGNvbnNpZGVy
Og0KPiA+PiAtIFtNZWRpdW1dIGR0LWJpbmRpbmdzOiBod21vbjogbHRjNDI4MzogcmVxdWlyaW5n
IHJzZW5zZTIgYnJlYWtzDQo+ID4+IHNpbmdsZS1kcml2ZXIgbW9kZQ0KPiA+PiAtIFtMb3ddIGR0
LWJpbmRpbmdzOiBod21vbjogbHRjNDI4MzogbHRjNDI4NCBleGFtcGxlIHNlbnNlIHJlc2lzdG9y
cw0KPiA+PiBiZWxvdyBtaW4NCj4gPj4gNTAwMDANCj4gPj4gLS0NCj4gPj4NCj4gPj4gY29tbWl0
IDk2NzZiMjk0Y2YyYWQxMTY4ZTVjZTBkOGRlNWMwY2Q1OGU2OGQ5ZWQNCj4gPj4gQXV0aG9yOiBB
bGV4aXMgQ3plemFyIFRvcnJlbm8gPGFsZXhpc2N6ZXphci50b3JyZW5vQGFuYWxvZy5jb20+DQo+
ID4+DQo+ID4+IGR0LWJpbmRpbmdzOiBod21vbjogbHRjNDI4MzogYWRkIGx0YzQyODQNCj4gPj4N
Cj4gPj4gVGhpcyBjb21taXQgYWRkcyBkZXZpY2UgdHJlZSBiaW5kaW5nIHN1cHBvcnQgZm9yIHRo
ZSBBbmFsb2cgRGV2aWNlcw0KPiA+PiBMVEM0Mjg0IG5lZ2F0aXZlIHZvbHRhZ2UgaG90IHN3YXAg
Y29udHJvbGxlciB0byB0aGUgYWRpLGx0YzQyODMNCj4gPj4gc2NoZW1hLCBpbmNsdWRpbmcgbmV3
IHByb3BlcnRpZXMgZm9yIGl0cyBzZWNvbmQgc2Vuc2UgcmVzaXN0b3IgYW5kIEFEQw0KPiByZXNp
c3RhbmNlLg0KPiA+Pg0KPiA+DQo+ID4gLi4uDQo+ID4NCj4gPj4+ICsNCj4gPj4+ICsgIGFkaSxy
c2Vuc2UyLW5hbm8tb2htczoNCj4gPj4+ICsgICAgZGVzY3JpcHRpb246DQo+ID4+PiArICAgICAg
VmFsdWUgb2YgdGhlIFNFTlNFMiBjdXJyZW50IHNlbnNlIHJlc2lzdG9yLiBUaGlzIHJlc2lzdG9y
IGlzIGNvbm5lY3RlZA0KPiA+Pj4gKyAgICAgIGJldHdlZW4gU0VOU0UyKyBhbmQgU0VOU0UyLSBw
aW5zLg0KPiA+Pj4gKw0KPiA+DQo+ID4gLi4uDQo+ID4NCj4gPj4+ICAgYWxsT2Y6DQo+ID4+PiAr
ICAtIGlmOg0KPiA+Pj4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4+PiArICAgICAgICBjb21wYXRp
YmxlOg0KPiA+Pj4gKyAgICAgICAgICBjb250YWluczoNCj4gPj4+ICsgICAgICAgICAgICBjb25z
dDogYWRpLGx0YzQyODQNCj4gPj4+ICsgICAgdGhlbjoNCj4gPj4+ICsgICAgICByZXF1aXJlZDoN
Cj4gPj4+ICsgICAgICAgIC0gYWRpLHJzZW5zZTItbmFuby1vaG1zDQo+ID4+PiArICAgICAgICAt
IGFkaSxyYWRjLW5hbm8tb2htcw0KPiA+Pj4gKyAgICBlbHNlOg0KPiA+Pj4gKyAgICAgIHByb3Bl
cnRpZXM6DQo+ID4+PiArICAgICAgICBhZGkscnNlbnNlMi1uYW5vLW9obXM6IGZhbHNlDQo+ID4+
PiArICAgICAgICBhZGkscmFkYy1uYW5vLW9obXM6IGZhbHNlDQo+ID4+DQo+ID4+IFtTZXZlcml0
eTogTWVkaXVtXQ0KPiA+PiBBcyBub3RlZCBpbiB0aGUgYmluZGluZyBkZXNjcmlwdGlvbiBhYm92
ZSwgdGhlIExUQzQyODQgc3VwcG9ydHMgZm91cg0KPiA+PiBoYXJkd2FyZSBvcGVyYXRpbmcgbW9k
ZXMgY29uZmlndXJlZCB2aWEgdGhlIE1PREUgcGluLCBpbmNsdWRpbmcgc2luZ2xlDQo+IGRyaXZl
ciBtb2RlLg0KPiA+Pg0KPiA+PiBJbiBzaW5nbGUgZHJpdmVyIG1vZGUsIG9ubHkgdGhlIGZpcnN0
IE1PU0ZFVCBwYXRoIChHQVRFMSBhbmQNCj4gPj4gU0VOU0UxKy9TRU5TRTEtDQo+ID4+ICkgaXMg
dXNlZCwgYW5kIG5vIHNlY29uZCBzZW5zZSByZXNpc3RvciBpcyBwb3B1bGF0ZWQgYmV0d2VlbiBT
RU5TRTIrDQo+ID4+IGFuZCBTRU5TRTItLg0KPiA+Pg0KPiA+PiBJZiBhZGkscnNlbnNlMi1uYW5v
LW9obXMgaXMgdW5jb25kaXRpb25hbGx5IHJlcXVpcmVkIGluIHRoZSBhbGxPZg0KPiA+PiBibG9j
ayBmb3IgYWRpLGx0YzQyODQsIHdvdWxkbid0IGJvYXJkcyB3aXJlZCBpbiBzaW5nbGUgZHJpdmVy
IG1vZGUNCj4gPj4gZmFpbCBzY2hlbWEgdmFsaWRhdGlvbiB1bmxlc3MgdGhleSBzcGVjaWZ5IGEg
bm9uZXhpc3RlbnQgYWRpLHJzZW5zZTItbmFuby0NCj4gb2htcyBwcm9wZXJ0eT8NCj4gPj4NCj4g
Pg0KPiA+IEkgc3VwcG9zZSBJIGNhbiBtYWtlIHJzZW5zZTIgb3B0aW9uYWwgKCsgY29ycmVzcG9u
ZGluZyBkcml2ZXIgY29kZSBjaGFuZ2UpPw0KPiA+IE9yIGNhbiBpdCBiZSBrZXB0IGFzIGlzPw0K
PiA+DQo+IA0KPiBJJ2Qgc3VnZ2VzdCB0byBjaGFuZ2UgaXQuIEkgZG8gbm90IHNlZSB0aGUgcG9p
bnQgb2YgbWFraW5nIGl0IG1hbmRhdG9yeSBpZiBpdCBpc24ndC4NCj4gDQoNCldpbGwgbWFrZSBp
dCBvcHRpb25hbCwgdGhhbmtzLg0KDQo+ID4+PiBAQCAtMjY5LDQgKzMwMywxOSBAQCBleGFtcGxl
czoNCj4gPj4+ICAgICAgICAgICAgICAgI2dwaW8tY2VsbHMgPSA8Mj47DQo+ID4+PiAgICAgICAg
ICAgfTsNCj4gPj4+ICAgICAgIH07DQo+ID4+PiArDQo+ID4+PiArICAtIHwNCj4gPj4+ICsgICAg
aTJjIHsNCj4gPj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+Pj4gKyAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4+PiArDQo+ID4+PiArICAgICAgICBzd2FwLWNvbnRy
b2xsZXJAMjAgew0KPiA+Pj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGx0YzQyODQi
Ow0KPiA+Pj4gKyAgICAgICAgICAgIHJlZyA9IDwweDIwPjsNCj4gPj4+ICsNCj4gPj4+ICsgICAg
ICAgICAgICBhZGkscnNlbnNlLW5hbm8tb2htcyA9IDwxMDAwPjsNCj4gPj4+ICsgICAgICAgICAg
ICBhZGkscnNlbnNlMi1uYW5vLW9obXMgPSA8MTAwMD47DQo+ID4+PiArICAgICAgICAgICAgYWRp
LHJhZGMtbmFuby1vaG1zID0gPDUwMD47DQo+ID4+PiArICAgICAgICB9Ow0KPiA+Pg0KPiA+PiBb
U2V2ZXJpdHk6IExvd10NCj4gPj4gSW4gZHJpdmVycy9od21vbi9sdGM0MjgzLmMsIGx0YzQyODNf
c2V0dXAoKSB2YWxpZGF0ZXMgdGhlIHNlbnNlDQo+ID4+IHJlc2lzdG9yIHByb3BlcnRpZXMgYWdh
aW5zdCBbTFRDNDI4M19NSU5fUlNFTlNFLCBMVEM0MjgzX01BWF9SU0VOU0VdLA0KPiA+PiB3aGVy
ZSBMVEM0MjgzX01JTl9SU0VOU0UgaXMgNTAwMDAgbmFuby1vaG1zICg1MCBtaWNyby1vaG1zKSBh
bmQNCj4gPj4gTFRDNDI4M19NQVhfUlNFTlNFIGlzIDE2Nzc3MjE1OTkgbmFuby1vaG1zOg0KPiA+
Pg0KPiA+PiAgICAgIGlmIChzdC0+cnNlbnNlIDwgTFRDNDI4M19NSU5fUlNFTlNFIHx8IHN0LT5y
c2Vuc2UgPg0KPiBMVEM0MjgzX01BWF9SU0VOU0UpDQo+ID4+ICAgICAgICAgIHJldHVybiBkZXZf
ZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwNCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgImFkaSxyc2Vuc2UtbmFuby1vaG1zKCV1KSB0b28gc21hbGwgb3IgdG9vIGxhcmdlIFsldQ0K
PiAldV1cbiIsDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0LT5yc2Vuc2Us
IExUQzQyODNfTUlOX1JTRU5TRSwNCj4gPj4gTFRDNDI4M19NQVhfUlNFTlNFKTsNCj4gPj4NCj4g
Pj4gVGhlIGV4YW1wbGUgYWJvdmUgc2V0cyBhZGkscnNlbnNlLW5hbm8tb2htcyA9IDwxMDAwPiwN
Cj4gPj4gYWRpLHJzZW5zZTItbmFuby0gb2htcyA9IDwxMDAwPiwgYW5kIGFkaSxyYWRjLW5hbm8t
b2htcyA9IDw1MDA+ICgxDQo+ID4+IG1pY3JvLW9obSBhbmQgMC41IG1pY3JvLSBvaG0pLCB3aGlj
aCB3aWxsIGNhdXNlIGx0YzQyODNfc2V0dXAoKSB0byBmYWlsDQo+IHByb2JlIHdpdGggLUVJTlZB
TC4NCj4gPj4NCj4gPg0KPiA+IFRoaXMgd2FzIGp1c3QgcmFuZG9tIG51bWJlcnMgdG8gc2hvdyB0
aGUgZXhhbXBsZS4gSSBjYW4gY2hhbmdlIHRoZQ0KPiA+IHZhbHVlcyB0byBhIG1vcmUgcmVhbGlz
dGljIHNhbXBsZSBpZiBwcmVmZXJyZWQuDQo+IA0KPiBSYW5kb20gbnVtYmVyIG9yIG5vdCwgdGhl
eSBzaG91bGQgYXQgbGVhc3QgYmUgdmFsaWQuDQo+IA0KPiBOb3RlIHRoYXQgdGhlIGV4aXN0aW5n
IGV4YW1wbGUgZm9yIGx0YzQyODMgYWxzbyBsaXN0cyA1MDAgbmFuby1vaG0gYW5kIGlzIGp1c3Qg
YXMNCj4gYmFkLg0KPiANCg0KT2ssIHdpbGwgY2hhbmdlIGl0IHRvIHNvbWV0aGluZyB2YWxpZCBh
dCBsZWFzdC4NCg0KUmVnYXJkcywNCkFsZXhpcw0K
