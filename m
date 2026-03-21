Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39612E92BA;
	Sat, 21 Mar 2026 00:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054406; cv=fail; b=OzfxbU9Eqd5pYrvC36gDfp3lmTQWpMeST/GvUzb/9UInix2a6kVqkoRYYgrQKdfC+bqs3KWvNuvzLrKRi42pHd0fJxhmmhBiBKViY4VZEF70xp+orsQ3yc8PRnOZFeO8j/6SptL4wmyZ+/KRX+UPXlVrQKsoh5r/rOPbtNTLy0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054406; c=relaxed/simple;
	bh=769dbJlFEFRJpICW66gfn/q2Ze4Kd5rp7UDlj0howhU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VbX1I9FSd2jkYSU/VL8vAmNz1dc/1Wfs1HTNflgfRpsv3T+Mv/PPKuexo4fiXquyF2c7vkTNFl/coLWnHoYzbhflS+jqwpmxTk4yUYiRxwYxwru2aeT71Yg2okCmWmuod9zRwaW1WczWYUudbks/678Lr+wYvHmHM5iTaDdrdso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Upu0D7bi; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Upu0D7bi"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KLLF671557050;
	Sat, 21 Mar 2026 00:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=opZUhxkV8MCdcj2mimS3duL0
	z5TVb7gysjc8Z3C4nhk=; b=Upu0D7biXPn8s55BuMufqH63nowsbEI5Z4i2BeUC
	WEaLU4L1T4CEqbn9KVxtJjYwV9hIa1sucstRRq2Oc1uFInh+dGX1MndajULZBha9
	IgBzY6qBPoDc0hi+omke6CkGGVyGHB0quKRpTsV/kGdcEt9tZLMYb6hF12Q9jA+x
	fdHfZQB4qv74F90q7G866abrCUCE/U2Zil5exrPkc3HuzYugGewvAARCWiAVVPU4
	nlxfkDmzjRieViSoDlR3HMlHMt5eh6r4vB28CbIO464EbScXTGjqSBfGuG9qXQjv
	Vepj8Zb37yfxBSwxg6QZhv8AX4pIGiYjhnf0cygzH7TJyA==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d1e2nhe22-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 00:53:03 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id D0E7F27671;
	Sat, 21 Mar 2026 00:53:02 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 20 Mar 2026 12:52:42 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 20 Mar 2026 12:52:42 -1200
Received: from CH4PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 12:52:42 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqbi262dqrINmZh2heS+ObNsNrxxfmrjb1dMEaFfSzxLca3Jn7uUENaz1JliO2VdtJck07vnPaFuv8n0YL8CWdFjZ5/eeAww5oiw2yTbZf1y3F9j/VEWPXzdLeGpcCZhkVd12YQPqoBts04Y8ciqdPkDzjhjv7sgk2gDa00ziMSKCHdbPIdLUWaEJTSk+upsoPQIeIYt3Nvcpahk+iXo5d0cDXCOguj2QWbvVWmc5iEoJO0tEcEBJkmAEYZTZJB9MuXisiJbgUZR3QFQws719bwgapNDbhnqZu8ianAhirg6EN1m7puUJyneZuNOpcWS65ZFY7TZT0W1MpCs00pDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opZUhxkV8MCdcj2mimS3duL0z5TVb7gysjc8Z3C4nhk=;
 b=wCV/Y3J+/dMAwvjT06rC4uDGnEBonfy6XF4mXk7TvLiIfr/eN3qwa4gvc/YShbjZM+E6x3AmU7FxHsLVu9yJ6/y1boAdK01vSH9rqtn77FhQtkyEWh6RPoIpb6/AQAu8nQcWSZomHqKItfc6pqheBVOnIsKPu307l8YTxYL/EayBA0vnvKvxXA7YpvNO1phjcEo3V/krtgztEL9vUjT/LbWVMDDoLS0Zv/bmJnGNK9VgkzVszrUAcLjZt7sMZPQUSFSwgr3U0qvIiUXHnFzpTihxldvU98OQZAJCmDmfAlnaTLeqki/2xZwIlb4TCCaKIrD3a4XEFvyjQw1Y+7RtvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV8PR84MB3772.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Sat, 21 Mar
 2026 00:52:40 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 00:52:40 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v5 0/4] hwmon: (pmbus/max31785) refactor inter-access delay
 handling
Thread-Topic: [PATCH v5 0/4] hwmon: (pmbus/max31785) refactor inter-access
 delay handling
Thread-Index: AQHcuM0E3rnANWjplEWX/g3NwMxHEQ==
Date: Sat, 21 Mar 2026 00:52:40 +0000
Message-ID: <20260321005206.6350-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV8PR84MB3772:EE_
x-ms-office365-filtering-correlation-id: 3122d4fd-bbca-4094-3a35-08de86e4273f
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: ovqGyQ4QIW1cJ6G51HeNWodXeoc3t14wMBerUZpCwyMbfx23doRJwDmqssdPjy95RVgFZELR67CdJSSdT4lUw1ER5t3hoc3a4kdQ962zPsBLuzhcw429BgEFUSDjJD7fldXptmALULwrxGLQBZlh4tkT0VLiCJNFAYB0K+37RNTiskHq25YGTURPrPk4atYsLLN4YoZYyUIMk9KbOqCuiTVtIaEh/+Wyhe5GO8r6Bo6Y0qgRwA6HB2NXy37jQjejbkH3XzEH22NKVeYdRJMoIgj//xsm19dg+prrygIOay4+lrgcjxVf0XNGuKYb2RmIqytktLl7AAhPOqBc8AXfVcw5Y9OeHsp2ruo/GJ8CH+252NWTEMqewtmL6Eq4NKwvS4R6akPgg0QnXx8IAdG4cbfakIcYdDQsUlpvtHgZAMUx2Vkh/Y04qY6vVDYKCpnq4Vp20ifc9WTJBuKl7OE4yxrfoGZCo5aq4+E4i7eOYmk6TluvtCW7r+BH6saiKUlPnrrPhba8uB/dGZJt6E/Z0Ykg6ZcWNf4mxnUJr8aTEVonWLDCL0FEHj6Wgdw0p34ggJOplntXnvdx/xNegkZQMeo3t87jZdTys9cTJSmtvJRd/VUnP8tT74tduRtKEULMho9EETTCtOStt3ZIjIjWYSDDogGXUGqbWFEzvMeiEEV8CMktSng55/i508tBrtfdaOYko8Kf6kbpuF6ee4MREycaTm3clzVmgnH7bo9iJ8UxGnz6hQmQA9cfRJZTIhfhNmdKTCrRMuz1FjlTQBLDJhtBqIrL+2LLkfKA0g1PmC8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oXt/IUPIl024zKU/YqLitidY/S6ECS4MyskUgbVaBQ/59qVMKmKCUAUOv9?=
 =?iso-8859-1?Q?j4Bp8fC4ZPYNczzu7fWRHhDD1LMRoni3C+Dz9Xk2Qrd54i6s2+iXX6ZIOo?=
 =?iso-8859-1?Q?tclMBmtqu8bhKHyF0hvfF/tHZ6E84u7MXp2m4mAIPIUfvXWnbqO99N09rM?=
 =?iso-8859-1?Q?04Qo9lOKBgbzBvHMP4Pq/YQ3c0XD64+4IlMUZogT7JxZcQixSlqgkvUysw?=
 =?iso-8859-1?Q?kZ4CHu2DQWbA/cAKdRhYTc+3OtsavMYGvywS5Z3JFfGXcTmqJL2NpwRjra?=
 =?iso-8859-1?Q?y7qUV8qba0CBuqR/4PPqpJ9epjMUAujtQqoL9gYfpnkj59GwDsXNbF4YNs?=
 =?iso-8859-1?Q?ICqGlLv0mMveFL5fEOgUChhy8my/b6+yetP2quHxz4IfLCl3KZ/NdsJMXe?=
 =?iso-8859-1?Q?Doe6Frdpkwo5EDPi8wFQtpvSB3gKn4hvs5E2bOKdyfH1WHvB20URorKF/X?=
 =?iso-8859-1?Q?jUhzikUpuo8OUXNnT45JqNkHksT4ARvMAoABi2djuRSBddAhre7LFfcbpe?=
 =?iso-8859-1?Q?stGG34jU8ZO1dNDSqEAHFVbBML/Q1Db2YBzhrU9ROrYJl7COZqSXZnhE0n?=
 =?iso-8859-1?Q?RErj9YRxeiab5bwGimL5sOIfMgBDwpyY+TRZp4CSlJH+Bk+DGMFGgcvyP0?=
 =?iso-8859-1?Q?/aLYmP02zCVeqHz1CLrKEhrGwgNwKtlahVzpJP+r3YgX/j8M+eNvSpsy4C?=
 =?iso-8859-1?Q?+8+p6MzRWJz/cAJj18ULxw5jjJJkszGUolVBcRKqwG4VZ+5o1tT1BP00SO?=
 =?iso-8859-1?Q?Gwfo8YZmxXUgmOZSh8F1WY9KIjUhk6wWnQMiFgg1MuK6pM/rQtQfZv9WUv?=
 =?iso-8859-1?Q?4niDs/jhkF5J3duEV+03nf0ifeMGaQvuZxYuDjkHigVaXtiT1NNYrXzqHn?=
 =?iso-8859-1?Q?44XRVUGQoak8P7Y8I7hSRA+UUGCFdIykxtaAfc1gQ2M+cEINVcXn7ieSWZ?=
 =?iso-8859-1?Q?ujJgT+kYx8HfP2jPVFnG9IHJIHzQXdMR3JHytTKi+CxAO2+8FByumF5+2K?=
 =?iso-8859-1?Q?E4qHKh+udjLHtXgDfxmloJeut3s7yVXYpPEWl2tjExHa+jRUcCrr3zAgmX?=
 =?iso-8859-1?Q?0vqosxRfbtj3WrAI5ksxTWzoA0szXFQk4gRoWLwFQzhW7cnn0q/LC99G25?=
 =?iso-8859-1?Q?0n6JA7Ik5Q7jzf4gsm6JB/mIsAb9kQqTc8ZPJvXu9Nm/k4NfCM7RWELXPG?=
 =?iso-8859-1?Q?BE4ISEjagU+BkeZHCbo1FhQwjYk3kK9XPtkNsH0wCZZh+ZNMReh483oySB?=
 =?iso-8859-1?Q?wE74HlTYICokO8bwYCWjkycuak+L4QfsCHW0F9GdMpxprEXKLJI4O6v9th?=
 =?iso-8859-1?Q?LqQAoIzBXYUcOe1vi79CDr44jjnahMG7hOErNQUNLFBQOVPdvSCbTVTHLl?=
 =?iso-8859-1?Q?0IfcqMGD/g4vqH5JQMIk/FGrmwPTTVj+niyLxS985Udy58GsirnIua8IIT?=
 =?iso-8859-1?Q?SwVDhV7ECutDtFK6L73/lP9cNXmxhZzONQ4lE+AXCIzCMq61+J/GMxhB5b?=
 =?iso-8859-1?Q?WVK6ccZEQDtkZeKbMYdc4ls6s6h0VQJAq9LmQza21g9Ac+nszQ/FbpdAfw?=
 =?iso-8859-1?Q?62x4+gEWrGhfQhJZSQaHTZcbksX5h7Nt1bed74QD8gUhKNtp6lZ/5C8PsV?=
 =?iso-8859-1?Q?2SP1I8jMIe4soZehNNgLHcspS0oqYtKPH2rjbq1A1B3ITuByojKrOwyC8V?=
 =?iso-8859-1?Q?m/SACwb32WGNB3yq5j+XMRjRkMik+6VNJPrJj+1kz6l3sc/Gky961vDW3/?=
 =?iso-8859-1?Q?faUxp04wnFBFBONT0IV7taegiPGW6pbM6ez5sMdTUlFE7DtXQw4eorb2CX?=
 =?iso-8859-1?Q?0EB+GZuUgw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: n7ckoiftFXTpSzp6nNrp8HBoBXw0Tyx12nqp+OQSymuCBhIOt2pRe+vCi51RH3ThxMU63jczX+zS5twZGSwCHlXDO25FpsaI1vBKDYUfMNwJvQKnRjd6YeTPJBbtszRz7JdzKVg/8KMVMSMlR39GG2+kC8lu/RVMjixeo+Ll/9MiULA0Y9G5jNVtXn5gj50iBYq5b3BdjyG7A/zq+WOFhxgEfrCyXvbmHBJAsL6mftYB0j2/rlssvmPcIdetuWLWOqK+5csWUi+iLIknHAiptheV4dN6z1QmciA2085h0g+3siaTlDxA6VX/067odh3KGu5JBfNS4bnbpEoF8V8XiA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3122d4fd-bbca-4094-3a35-08de86e4273f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 00:52:40.1837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9x+ukIqR6QOazG708pSAq0UJHn2BoSYMR5oV6apAyJsX7icusKTrAcV3LU7BlseZwrD1KhRkjYdqh2XwmJSoiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3772
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: -loGGPhpDQ5RSgl775OcuhCP8l887gfh
X-Proofpoint-ORIG-GUID: -loGGPhpDQ5RSgl775OcuhCP8l887gfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAwNSBTYWx0ZWRfX3EACwg9+SmIV
 uOuXc+IzYlIcynGOHi6wrz94IsalXxwxcU/JE2izlUn17HbKgjDUzkrpMvueKLOeyT2a1iatP3V
 AmRtdaDRQCOCXTUo6pT+K79z0mgO9ScRxE0f2suCBfwFg3vGnvSv9WZR4E4B0Ol8+WZj5RR205u
 44iaxytltUy7LzLlOCAob4gXXZ9cTZRxwbpfaoSq+fCubxhIoByaClstrIgCjaaGbWEPuM1KXPC
 If16FrnM0h91oC0XXyvUlFoS/bq6NSbbbtjsiWyu2+ZjGzrP/w7VZmEyuA/HOCeI2iQFO7fLX/D
 gfkbVDVcLy/gmXyv9har0lNCopx/TwAaEWewQZKFt21qmRMN8DihjDM5SQaZ9G1DIfcIcM33Q/t
 JMBwpeBsQgr7dtuOhAOKxLf08gi6Lhxlv9NUVy0Wfk6rK8c1xoUBJVABZluEjjOzmnT1v5L71v6
 CMgfMKPNB4PcDAIW8hQ==
X-Authority-Analysis: v=2.4 cv=RZ+dyltv c=1 sm=1 tr=0 ts=69bdebef cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=OUXY8nFuAAAA:8 a=BW2jTdla0pPB6Aj41EEA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210005

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This v5 series addresses the feedback on v4. The timestamp spinlock=0A=
approach was dropped in favor of fixing the missing PMBus transaction=0A=
serialization in regulator voltage paths.=0A=
=0A=
Patch 1 adds the missing mutex_lock(&data->update_lock) to the PMBus=0A=
regulator voltage operations get_voltage, set_voltage, and list_voltage.=0A=
These paths perform multi-step PMBus transactions that must not be=0A=
interleaved with concurrent PMBus users, since page selection and the=0A=
subsequent register access operate on shared core state.=0A=
=0A=
Patch 2 exports pmbus_wait() and pmbus_update_ts() so PMBus device=0A=
drivers performing raw I2C transfers outside the core helpers can keep=0A=
the PMBus delay bookkeeping in sync. PMBUS_OP_WRITE and=0A=
PMBUS_OP_PAGE_CHANGE are moved to pmbus.h for use by device drivers.=0A=
=0A=
Patch 3 refactors the max31785 fan controller driver to use the PMBus=0A=
core access_delay mechanism instead of driver-local PMBus timing=0A=
wrappers. The raw i2c_transfer() in max31785_read_long_data() is=0A=
bracketed with pmbus_wait() and pmbus_update_ts() so the PMBus core=0A=
timing state remains consistent.=0A=
=0A=
Patch 4 fixes a pre-existing bug in max31785_read_long_data() where=0A=
partial i2c_transfer() completion was treated as success. If only the=0A=
write message completes, the read buffer is left uninitialized and may=0A=
be interpreted as valid data.=0A=
=0A=
v5:=0A=
- Dropped the spinlock patch entirely.=0A=
- Added a new patch to serialize the missing regulator voltage paths=0A=
  with update_lock.=0A=
- Updated the export patch to remove the spinlock-based timestamp=0A=
  handling.=0A=
- Kept the max31785 access_delay refactor unchanged from v4.=0A=
- Added a new patch to treat partial i2c_transfer() completion in=0A=
  max31785_read_long_data() as an error.=0A=
=0A=
v4:=0A=
- Introduced a spinlock to protect 64-bit next_access_backoff accesses=0A=
  on 32-bit architectures (dropped in v5).=0A=
- Standardized all commits and signatures on psanman@juniper.net.=0A=
=0A=
v3:=0A=
- Dropped the u16 -> u8 wrapper type fix (already applied upstream).=0A=
- Fixed a comment style nit in max31785_read_long_data().=0A=
=0A=
v2:=0A=
- Export pmbus_wait() and pmbus_update_ts() from the core.=0A=
- Use core timing helpers in max31785 to replace local boilerplate.=0A=
=0A=
Sanman Pradhan (4):=0A=
  hwmon: (pmbus) add missing mutex_lock in regulator ops=0A=
  hwmon: (pmbus) export pmbus_wait and pmbus_update_ts=0A=
  hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses=0A=
  hwmon: (pmbus/max31785) check for partial i2c_transfer in=0A=
    read_long_data=0A=
=0A=
 drivers/hwmon/pmbus/max31785.c   | 197 ++++++++++---------------------=0A=
 drivers/hwmon/pmbus/pmbus.h      |   6 +=0A=
 drivers/hwmon/pmbus/pmbus_core.c |  55 ++++++---=0A=
 3 files changed, 109 insertions(+), 149 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
