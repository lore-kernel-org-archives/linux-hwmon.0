Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794477696;
	b=4hDjmSTzIZX7vMqlJUlkj0fS/DMIJ2XgjNRbRoHPVugUItwYK3eli4Urs4zHpMaRU3sI
	 boaGiNdc1a642cfRsjM/4vRa1o1eS10CBJDEcrlRUzWCrvl41XuGtCT7sJAkCdgjoKxkE
	 SdeLGcE8leEoqvkFiDVmRBVQBqvlDoE1UTTsLGmmmnWhITuQGL672xoJxbmU9yDEy1VM6
	 M/UjPPpctgPIa9pOWZ2NEGPp9K9QpEiBBa6rQEPDTDiMs32YnyiWt9lq0aXrq7TEyNJOE
	 msIa12lqPmo6XIYodx17dylKyK63iI69n5mLpYvHSc9L1ZWGObfraGYeVSp2rgU4Tdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kLIZAFxDRLo7Lec8SZ4oNYmdyRL2VlVC8WEErD4QmaE=;
	b=ngdtOgSpeMrscqQXGHUgWA3GiZWBLQb96sdbjHjhOgZsYx8mnLBFqtUNAdpvB+G7LFJe
	 9PctRkBSAC1tImliZrc2Y3R2zwMcjNvyXTIeudc9LMZ9D4gZZ26RvX2Jgch8hEOIK7X+U
	 D/F+6ELpPVlrwp3dxGKDfE7X3xfBJg78QBkqa+f1g7Wq7fna6ntMP7eXBEsLv8FaPJpU+
	 4Kihd5xeJNGAvn8TCrsvjLZH7DHXbvGm56rrzenTE+zems/qQTHRmNZBVeJ7zgwqgedQe
	 REtv7vm/UYZq3pYL/e+JsxUY0Ug0TCery0MSsON4X7ZkzPC4ufbxOll+sA0SSDMf2/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=q10t8pL9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.104
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0F606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 10:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=q10t8pL9
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9IKEl1150774;
	Thu, 12 Nov 2026 10:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=kLIZAFxDRLo7Lec8SZ4oNYmdyRL2VlVC8WEErD4QmaE=; b=q10t8pL9AJC8
	OGraoHfyShk19jngso+684zTJtQzApo3+I2ZbCRBqXCg9ty9QnVA+q0gvqm6M66i
	hGAfy7FCT+hvh1Y0vFA9A694jPgT46PSU0qp0EzgcOMPaEP+Q+syPnwlaRDq/IWo
	OS/WIdPQjgwtDOkWLnZ5IStE5dB6C3n5+1kP9uYrJzhee9rRRw7th9BuHzklUgda
	tDF1oXKxFVCs5Y/pUOftCCV9BIMlK0lM2WwBMXJtSN/MkJsuFV7NbUIYvBzBrOlM
	u9+q5p9NWQgtzHykC0/PfDnbbu2lVCYD2+2eM7pT0hUQP2cdvzktlbdbR4AYRZyW
	aWr/WCcsaQ==
Received: from os8pr02cu002.outbound.protection.outlook.com (mail-japanwestazon11012037.outbound.protection.outlook.com [40.107.75.37])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4htguf87s6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 10:01:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfBOoKX4LJ5i0p7rcVwQ5n1PJ+02km+1GXpcFpzb5Zj/DLLLBnH1TS9zTL976hoWfun7RZ4PuX+bFhmThDAUmUHilNPM+C7XW/QKD1/klhTf+VjJCRKC/Gu2Sq564FIYofWsdzFFHKq654Rcj1G4u9CwrIlFY+HXKn7xZQExt1sGbXXnoLJtKMszh5NrByfNoAHkZARAKsJG4XHsDTspd70OWOIjyN0S7pvbN7u5nAdl9A8XhY6Ygc/0Chti0SugbUuYdRCMm9hFkZyo4kc1FupXK0kbOFA8e2E8u1KUbovLJ9XC64WphT4Zjrme6xZfZcMzIR0uqGQHD4dUxhetgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLIZAFxDRLo7Lec8SZ4oNYmdyRL2VlVC8WEErD4QmaE=;
 b=yXwkC5OhroEoigt5bcMg3HRgqA5qB7RIYpaIRgd3yWFH43R6lEcbrzD1+XlPNqxaPhc+bEobVPMiyuy/1J7ML2FTP76UW8cIEePN8pnvflXMqPDRCFVrjwuRB69DRf8yTTexwtrfc8asoSeJteUo8UsQvw5rqkIG9ctz93nsK13NTTjxNWSdx8JOKMl40lrCr/QmwlqAXw1w7LbQYZ21afhl4+SUlXJYbOgGajvNthn3z1Kgk+rzVSb72B4Xky4s+7nmtMraMdgQqrvE19CqG1/EeJfuJ+inbTZdh3LOvAONsvAcKq+Kg1RRViw2Md1lsp/xbq2NbqSHwzg27xKZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SEYPR03MB7625.apcprd03.prod.outlook.com (2603:1096:101:149::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:01:11 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 10:01:11 +0000
From: Jiqi JQ9 Li <lijq9@lenovo.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
CC: "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [External] Re: [PATCH v1 1/2] hwmon: nct6683: Add support for
 NCT6801D
Thread-Topic: [External] Re: [PATCH v1 1/2] hwmon: nct6683: Add support for
 NCT6801D
Thread-Index: AQHdcbzzkulIHARxQUibulrUWAfyu7cpBfoAgAEgoDU=
Date: Thu, 12 Nov 2026 10:01:11 +0000
Message-ID:
 <JH0PR03MB8637F25BD6B91A6A868E5EE383702@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20261111091338.799889-1-lijq9@lenovo.com>
 <20261111091338.799889-2-lijq9@lenovo.com>
 <a3f77c44-12be-4845-996a-013117f8f33a@roeck-us.net>
In-Reply-To: <a3f77c44-12be-4845-996a-013117f8f33a@roeck-us.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lenovo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SEYPR03MB7625:EE_
x-ms-office365-filtering-correlation-id: 3d97ddc2-c2a4-497a-d45c-08df40a3e118
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|261022075727099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 v8p/6vhdiXnkGXzIj/JVsORQHmDkkFGnrqj6cqkNRLIAIgYpIfw5qZrQkebKeWdoI/J0BREljsoRUL5Q7g2CXTN5Sb0PqDFqsEooowVoN9gZlZzD1KFJho/lrLJ5t288MptZCxcOpFSBiM9Hl/dN1+Ab2XBVrTkp7oz09s7biBhO5z57otVTCGg02QnKE43+SZ/iLTvNwY8tXyLqmLumOuzbRGMBu1pV/Qa0tc/mmaE7qe1Z/zTbdugVu6CrooKBxo/OAIze1svvtgBERO1KHlnqXcfRpjRwJqkXfBWolw3Ivl3L+RMuzmlGtDt+2Nu4nbXTSHH8H33/8vmEhyF+w3K5fiG+4oZBgAk9q/mFhdJjYAKhBkOqaaFXB+CBCiG5kG2DJTaVXAk7YjFz93pHyCN/EC5BX7jxgRdOUMz1VuybsGDHegnGEQ7tUcW/wBHbTHc4Rwj22484hgRmNbQ76yBRxQg4dclNh4kj1Fs9ACY8hNkL3iRQn76haCYj1eRqnsFQM2tDkHKJbxSNJsb9A1sWeytustHaqxs07yCHPc4Zb/+2q9JPH3JOJDEyNcpE/RtDGFdQ14Fd3S63SbkXpluwSbO2xzvMM2xU0/LbPOKFd/zfGYeM92fDO9GDkgB8D6/qkxUw1p++EBTzKJInwGnb8pMTzYBBzW+1dh6PGtJuXwU8osSU7gC3LVrM6fQsrj0FRcHHmrNJ9aREhDoXdYeYdTBTmf2J3jgHNm4E2fw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0gr0WQ/HxiL+q6jTZNDFxVeJNwPAkDokcx0LwiAcOx1KciQwWqAXNSWAEP?=
 =?iso-8859-1?Q?A6dnsk6TiiXCvntjQg+FrDNucErM/02ZmbR5HznQcnMxBlF/nkC2ADIL8b?=
 =?iso-8859-1?Q?K5KcMK0WZsj8Cu27Gleg7cmDvSJnpjqNXYLX2H1g6YlC52QBBbXVkonti0?=
 =?iso-8859-1?Q?3MeT+/LFrDYRQd257NVNeUjVoY7MLVC+KHeQuYcEgz3eBJQp9L63gSlgTt?=
 =?iso-8859-1?Q?C62KLcopP1/cAyWoXZg+JYmB6j0aSouC81UrKrw7F8UDj5yzBhSY+NHqu5?=
 =?iso-8859-1?Q?PwNiZbDJELF3797b+90hmwHu7bY5mI3SU68MZi7m9rS/wYoRuzr7d4BU+A?=
 =?iso-8859-1?Q?SU+vZv6SYarFlnTJRK7dLGjf1GdHSO+ovzXuP78hvvTtlufKH+r9G8DlUW?=
 =?iso-8859-1?Q?xVtpdwc+ejb1XvVMXA8zhib0AuA2e16OD0T2FjHQX8PXbuG9ryj67xuFvQ?=
 =?iso-8859-1?Q?j2+aZmSx92Xs8N039Y6g7kWAcNI6y5NKF8iYk8l3mIe7+1+dc3j8Em8jJz?=
 =?iso-8859-1?Q?ryEtc7KQU0aB4iL7Adg/aKgrlSmFSAs16W5cAqspgC5r/WANK+sGAYn2Kk?=
 =?iso-8859-1?Q?4GZjABDWapjxTE4g7/ZjRumV7kkh3HK2lLnpg1eTeQRDcba+Oce9p5exEi?=
 =?iso-8859-1?Q?swdY+aVWEals9pwVxRhXkHvSsAbztD8fSLHHQGzx3Bwj4qN9KVOZwz7aBK?=
 =?iso-8859-1?Q?dWr6wXRpifG/Ku1ENrQfTQq5YDQR2xlw5r8rrWyjv5i+UXplBXzK5zWdbZ?=
 =?iso-8859-1?Q?KXcA2zHB5pT7xge3PiMbG+UbO6OPqrfndvsDbdbcCsT9OoDqT6pOj0Xj4E?=
 =?iso-8859-1?Q?KWULWsGk2pWLr1hMXcwzAajP/khGmlRVSAVnXUEJixtWMBIqbP20+TDZYb?=
 =?iso-8859-1?Q?xdVr8b1o6wHBBu+L+JCg0gTE8dMxGlbFk9IEYPdC0vW+J+nxMAJUlCvMBC?=
 =?iso-8859-1?Q?nPvlOwFGCiDBzfh+7WtPj8vVIQQhyWbVcrW9rpCRJZh/jX+krvmkAKXjrd?=
 =?iso-8859-1?Q?rygVS5ea8++EJDcqXAYyMTlxuAELRWfb8uMa0WjuW/G1dhgA4GixFFy5Y4?=
 =?iso-8859-1?Q?tEW1IUbBpn5hdOPaEgYzwdbnq72Q9JcllgPChGmWqhKo/rAyclcdsAuVUb?=
 =?iso-8859-1?Q?v8I9ALaqOogvNPVZwHJBkCfj8REPMI4IWtUbIhJ8C/ITksmicJ33gzR3mI?=
 =?iso-8859-1?Q?kEdEoo+sloC/1lZ+MAdfjeNPVrXF2jWZBOKRjkuAO8vD+09eLdLrGNLNBi?=
 =?iso-8859-1?Q?vADydE9Dv26kxM6I9/yZ7hN8nRuDIxCwfuEbzi2fgIP5kVf0XTIFEWRaGl?=
 =?iso-8859-1?Q?0B2XMGiisxoh8a7wYDeSmMLU4Rha+7gFeh6SmG+T77NDCSx/kkGjjm6uqU?=
 =?iso-8859-1?Q?jelYyatGqpJWp1dq5C0wsfbAVUb07ZqkwslQ2Wnfl3m/UgOB48y2C+i4Hi?=
 =?iso-8859-1?Q?R/4eBY3+2FKukrhXJ5weA1qDhW+/WKiEONiLaz91RCMIUTFNm9uBiRuMUo?=
 =?iso-8859-1?Q?soEoLvt9oYj5UESfh/HWg7/e0QiWOccw6a/ZVSbeVAWG0XmnXwE3xIGxM+?=
 =?iso-8859-1?Q?6V/rlhlSidDJWA5LIWhm+alnbkcn2fxwhihDUK85A+9x3HoVMeiMjt8Txj?=
 =?iso-8859-1?Q?XmUU0T00nFzPTmT3nH1+sRNzU5kXzhJfUtCp8XOnwUigVVWIWl93AjJ/V4?=
 =?iso-8859-1?Q?xr+AByGL/oWKdehCqNBHklWRCsa7IUooF67P6Ji044rCFR2tsEeH0zYiE3?=
 =?iso-8859-1?Q?YQQPulcnFLLIkOenc/eiQ4MF5cqfg/lw3aHM7ICzwXZyXL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
	PVg5pTvr6Kd/ek4m0Z5C3gmUAP/pY9kwuV+AhNXS7IOcgL4VPBkcApzD6b/eb6lOEyg7x+oo8nAIa9shMrvkQOSEm4zB9VZAJUw59hUgk6Mmlo91ty4vP0sDRbepp+ZKC/Q/IDKWrGJuvxf2282KB5oQYpPG67upCBK3a2LmppO14NeLaVLsrLdk3jOj1cxW1L0CgTv3IPeMKkKfa7OgO5hPJWRgeGoeIaTli51fP/pVIYyDfNAqKwBgM6Kj2OPL/1xKzdGmpt9HcvNU6sdBacTWNRGiC+5Tfm4KEbLLuOQuY6lymkYzbnWEtinDYlWTz1NDKHcmVooJKqZt+wCR0A==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d97ddc2-c2a4-497a-d45c-08df40a3e118
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 10:01:11.0111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BmESCrMM85hQSUFTUR9zPV5oZ6kne3XNEC98rsjDTkO+PW+2wnW7AUL73Sow3laPkw2uJUkLRLJ9EpJoMc8HnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7625
X-Proofpoint-GUID: VT9OKAnyv_-VfLx_RP78f7Zmkkw5Ly2X
X-Proofpoint-ORIG-GUID: VT9OKAnyv_-VfLx_RP78f7Zmkkw5Ly2X
X-Authority-Analysis: v=2.4 cv=drFOmFg4 c=1 sm=1 tr=0 ts=6af58e6c cx=c_pps
 a=lh0JsUOnMSdUJwwljgij0g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=qMr132F7aASziHDET4f3:22 a=8k6WQxmsAAAA:8 a=_jlGtV7tAAAA:8
 a=OmY30huK10Fq70ogVnsA:9 a=wPNLvfGTeEIA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX6+2YjTa9mD+Q
 PKTzgVhXM+ltCiqmQGEboixC2i9LVzTM53i/JAGfeHgG1Yg7h0nv95Qt2O9qaICM5BmSv8soTJ6
 3lrnT1yOTEyVPYG4XL4enh3iODxqRHoMmQUS+jcyqQZ3KAtPer1nx0/u+NwAwOr18cs+Jz+QWxF
 LSFwio8K6HGIcojVgroYONf/25oQZArK4kgb1DAjIr5uM3QeBRReR6joVM48ylzgeKL1OMjWAEa
 dsJajyqT5eETMW5gd+f5v9VcKeNZjF20YGn+NErbqmKxQzlJ/gmQ1KK/pmp4FUFJhSIEsATKe0G
 0nd9mQfHzyG6nSak44bm3aLKmo+hKch9AOzeKY4ZeKb8k4pnhdY/XFOeYqoyHC8r4yRXvnZIcw4
 64+X5h1k550H0AcEUZ3FSA6jXJMxHD0hqBMWyZdiiFWQBBxekO3vtK+hID3lsAjXUdbyXHC3MFz
 hsTGRB/cJJQOKS1S9Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX8TXfZOGmrlGU
 0RfcdSfM5hoiH171KXdZ1mbb5vslrg0TEVwGt2YIT43h6P1eipN0sPy3e3nX5RwIXbV7aiwLM4n
 QHf3rMUdhjmlOVcGS9URi043KLLWheY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120039

>>> Add support for the Nuvoton NCT6801D embedded controller used in the=0A=
>>> Lenovo P3 TWR G2.=0A=
>>>=0A=
>>> The NCT6801D reports 0x0113 in the Super-I/O ID registers (20h/21h).=0A=
>>> Unlike the existing chips, the device variant is encoded in the lower=
=0A=
>>> nibble of that ID, which SIO_ID_MASK clears. Compare the full 16-bit=0A=
>>> value so the chip is actually matched.=0A=
>>>=0A=
>>> While here, also reject a fully unset base address (0xffff). Without=0A=
>>> this the driver would happily register a platform device at 0xfff8=0A=
>>> (0xffff masked by IOREGION_ALIGNMENT) and expose bogus sensor values.=
=0A=
>>>=0A=
>>> Signed-off-by: Jiqi Li <lijq9@lenovo.com>=0A=
>>> ---=0A=
>>>   drivers/hwmon/nct6683.c | 21 ++++++++++++++++++---=0A=
>>>   1 file changed, 18 insertions(+), 3 deletions(-)=0A=
>>>=0A=
>>> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c=0A=
>>> index e1c36c95affb..42ad2c175de3 100644=0A=
>>> --- a/drivers/hwmon/nct6683.c=0A=
>>> +++ b/drivers/hwmon/nct6683.c=0A=
>>> @@ -1,7 +1,7 @@=0A=
>>   // SPDX-License-Identifier: GPL-2.0-or-later=0A=
>>   /*=0A=
>>    * nct6683 - Driver for the hardware monitoring functionality of=0A=
>> - *        Nuvoton NCT6683D/NCT6686D/NCT6687D eSIO=0A=
>> + *        Nuvoton NCT6683D/NCT6686D/NCT6687D/NCT6801D eSIO=0A=
>>    *=0A=
>>    * Copyright (C) 2013  Guenter Roeck <linux@roeck-us.net>=0A=
>>    *=0A=
>> @@ -14,6 +14,7 @@=0A=
>>    * nct6683d     21(1)   16      8       32(1) 0xc730=0A=
>>    * nct6686d     21(1)   16      8       32(1) 0xd440=0A=
>>    * nct6687d     21(1)   16      8       32(1) 0xd590=0A=
>> + * nct6801d     21(1)   16      8       32(1) 0x0113=0A=
>>    *=0A=
>>    * Notes:=0A=
>>    *  (1) Total number of vin and temp inputs is 32.=0A=
>> @@ -34,7 +35,7 @@=0A=
>>   #include <linux/platform_device.h>=0A=
>>   #include <linux/slab.h>=0A=
>>=0A=
>> -enum kinds { nct6683, nct6686, nct6687 };=0A=
>> +enum kinds { nct6683, nct6686, nct6687, nct6801 };=0A=
>>=0A=
>>   static bool force;=0A=
>>   module_param(force, bool, 0);=0A=
>> @@ -44,12 +45,14 @@ static const char * const nct6683_device_names[] =3D=
 {=0A=
>>       "nct6683",=0A=
>>       "nct6686",=0A=
>>       "nct6687",=0A=
>> +     "nct6801",=0A=
>>   };=0A=
>>=0A=
>>   static const char * const nct6683_chip_names[] =3D {=0A=
>>       "NCT6683D",=0A=
>>       "NCT6686D",=0A=
>>       "NCT6687D",=0A=
>> +     "NCT6801D",=0A=
>>   };=0A=
>>=0A=
>>   #define DRVNAME "nct6683"=0A=
>> @@ -71,6 +74,7 @@ static const char * const nct6683_chip_names[] =3D {=
=0A=
>>   #define SIO_NCT6683_ID              0xc730=0A=
>>   #define SIO_NCT6686_ID              0xd440=0A=
>>   #define SIO_NCT6687_ID              0xd590=0A=
>> +#define SIO_NCT6801_ID               0x0113=0A=
>>   #define SIO_ID_MASK         0xFFF0=0A=
>>=0A=
>>   static inline void=0A=
>> @@ -1394,6 +1398,17 @@ static int __init nct6683_find(int sioaddr, struc=
t nct6683_sio_data *sio_data)=0A=
>>               sio_data->kind =3D nct6687;=0A=
>>               break;=0A=
>>       default:=0A=
>> +             /*=0A=
>> +              * The NCT6801D reports its device variant in the lower=0A=
>> +              * nibble of the ID register, which SIO_ID_MASK clears, so=
=0A=
>> +              * it cannot be a labelled case above. Only the switch=0A=
>> +              * expression is masked: val still holds the value read=0A=
>> +              * from the register.=0A=
>> +              */=0A=
>=0A=
=0A=
Hi Guenter,=0A=
=0A=
>I disagree. The case statement can check for SIO_NCT6801_ID & SIO_ID_MASK,=
=0A=
>or better for something like SIO_NCT68XX_ID which would be 0x0110,=0A=
>followed by a secondary check for the actual ID.=0A=
=0A=
=0A=
Agreed on the approach, but the patch is dropped in v2: nct6683 cannot=0A=
drive this part, so there is no point in teaching it the ID at all.=0A=
=0A=
>Also, not having the datasheet, question is if this is really correct=0A=
>and documented or just an assumption.=0A=
>=0A=
=0A=
I do have the Datasheet. Its register table in 6.1.9 lists 20h =3D 01h and=
=0A=
21h =3D 13h, and the hardware on the Lenovo P3 TWR G2 reads back 0x0113,=0A=
which matches. Calling the low nibble a "device variant" was my reading=0A=
of the observed value rather than something the document states. That is=0A=
another reason not to keep the patch.=0A=
=0A=
Thanks,=0A=
Jiqi=0A=
