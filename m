Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923383F7AA8;
	Fri,  4 Sep 2026 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559764; cv=fail; b=hLZ+PrqvDrevbkW0Rhu7bfUdjo4cJLZ8St5dobWZay0W+NkXV0HBecetWxxX8U5+wpViq9MDOgq3CjmI2Dx+Q5TR+roJY0Yh3HhcX1eu4RmCvuaenfrnHvflfzLVJwUzsHUVQ7cISqyHnax+8UZ2SPnQn4f235JsUJa9OA+kEOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559764; c=relaxed/simple;
	bh=UzIF/EMQcKi336CRJLEYY0SFrukDthbtL3LnlaqO34s=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VyBlV8pdABfwMY0KLjCrz7Fo73ZMiKGvEcsqSobDh3nSeIh98nrFarR2cZu+/kHho2CvMWWgPKiTdnG68nHQob4XpghgQwrlIWnWeFO5FNgZRv/kCWLbtL6udNv49BOBpFJvUpsFmPVp/C7ieXc/VVUj2BbQG7NSmYZbrCTmTBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=GYw3ZwI5; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="GYw3ZwI5"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KkRA13091375;
	Fri, 4 Sep 2026 22:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=UzIF/EMQcKi336CRJLEYY0SF
	rukDthbtL3LnlaqO34s=; b=GYw3ZwI50VJoBnGclwLGf1tSFVN4peOeQksz8OnC
	zh7nG93Qhd5xVT/ObgGGt0afKrg6hL+D3Ty0jHtky7xlfPEQfi+4dWMlyBrn/gBz
	j2qcdQYFjwUgnoXwhEtfrwcxJ0E4zi7TJycckZ1Hu2vO33fc3Uoo9p6fR0Z+ZVhu
	XRpl/RRy6qT8NTSlsmfZSR7bgb1kIP+QbO8/OC76GHYwkv56ozCBG3KJ8iREanz8
	dK4EB+pugpKD+8FqHqnIF0IJ0YC9QjOvS1G86OQsUAl/fyL+bi/ONE33sPytYpnX
	fBOwftX0gUx5nfbL2DL/SgSX1gsLpOGVwceenzlpwELCpA==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4gg0bfcy6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 22:08:55 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 793A7806B23;
	Fri,  4 Sep 2026 22:08:54 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 10:08:54 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 4 Sep 2026 10:08:54 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 10:08:53 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCbuBwks5BB7gOIyh99Q3Sou74B5pdBInRvGKFewxq+9U/YU4BoFY/YE3lnYKaUoMN6DSyckjpS6/PtRKZolHIibdHTxGYXFwRbcOXn02zGDc+L2oiinn9rbcQgAKLaqRRwglGpXN3sYJoRJbWg4jtnhnlqqmeQjifOGmgTcasv70CRq6AWeFRVMXciwZWGANYbTJ9VY+39va6YNawMadLP14PosRXJJtOqfPl4y21ybE7UHlw7bKnw82UCfUkMThfP1xIICPV1UhZ8g7VUj5ZT5qRXzM3CJIvOYOUgvrxgKjLrDUvNVoFYE5xR1ZCSRHs54LrtwOsPYi4mey+kVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzIF/EMQcKi336CRJLEYY0SFrukDthbtL3LnlaqO34s=;
 b=MaKi24pmYESuAnNDg1AQkvke4QU1rnFX0zorxu61uutyiN5Gx0uRcWesxgk//R+iKVJHmhu4a4NKlrwzjZcjNBE/+hDSgve9jL1tvv7whP6YbvC4YtbCc/YVQKR4lZnAsBK6ERKZd+/OOVpHdRbN+JoJ8/wanRrE9Iri345TGHDnM6GbkNvNl1iuxY79D6eU5ut/vbsGKKHM4OqssgQXvQQ4vLOUXiCHHDsC45R8/1mKQHuk70BASw/aVUCKTyPOlhkK33K/fFlkaAUwks7RYXEOv7cnmlZS4REL+K4KHT9ktmbmDBVpOqATnKD1Mu7+oms75jMiWwCIi9PCyfZvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB2118.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 22:08:51 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 22:08:51 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 0/3] hwmon: (pmbus/tps53679) Add TPS536C7
Thread-Topic: [PATCH 0/3] hwmon: (pmbus/tps53679) Add TPS536C7
Thread-Index: AQHdPLn3dkf0Wd3vgEOKQcPsTrYg/w==
Date: Fri, 4 Sep 2026 22:08:51 +0000
Message-ID: <20260904220843.495082-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB2118:EE_
x-ms-office365-filtering-correlation-id: 458ac593-28d5-4685-a5d1-08df0ad11a5b
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|38070700021|6133799003|10067099003|56012099006|18002099003;
x-microsoft-antispam-message-info: kNVV/QoL1RN5NoRJUFejHxV914Qr8ALtqp6C5VVauCXFCXJTA5jN5Hm30SQsFBqQolEmJI7bo+mzHeKrSNKxPc+SzWnqApz3QSddbn0V8ix/bmekAJEaPG+dapQ/NofUuB6RGrqrfxytzXKmbeFsoEYMuZb4lxDK/UNDP0+2DVfnPwGHcTzau0gkA9+pdqAx31+w0g6u5cK7i2+7sLOHnJXREFxuSLt7VEFJxEe+AUYEAeklk3dds7BLZXEvJAXp3zi1BYQtojPbIx9NdhR/QDBm4/RKfNU8f+G+cvBA2rc5JDHsT0J7tW2M/rj1C00JRoKoDA8NY/1DZwAIKF8WToTMq8ATIOQML1CNho4AG8Zu/eceur73ET/Pe/jOMvH+bYgx0noXebruHmMbfXQypnq7KH5Jv0+T91rq/xxAOgov/ToVAslcXMoqD8NcuBH6lpR4l3ngF9Tpfh6PEQD6qmB9PoBEOPXo+lJe3YrIvErzXcJ1U3K8eHup8TroCHWjq4wV4WK/Un0JkLOIkIZAtNgFAmlMNw6XkXFGn+O9H4EKJPfE7K9WfUJjhUgT2FFmdx4n7tHbvV7YNwp/j5Jw/o7BcJDmGb7UriNCJkmveRFEx7XPO/UaxGgvrjTX1m6A7GTqkzqkwss0FeBm/7+l6N8vHZ3nUmVVUN5r3M1DSHICct5obzrD2T5OYTzGdbJPBPabFPG4o3Oo1L1jFNVKLYaXAdOx+C7avEByiSke7iM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(38070700021)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1k5ak9EeC9VclhoYUcyRkRaMzdjNjljMVRwb3ZpaDYrei9WSU5Mc05RZEg2?=
 =?utf-8?B?UTdZVDByc3c0ak5FZnpmNWRlcTZQTS9tSk5RTkxTeHdVZEQ3MGdzZkFUUFZ2?=
 =?utf-8?B?WTJvWk95SThwSUY4bXdwSzkxU3c4REhoYVdGbHVsRDN2L0ltaUVnZkgyU1J5?=
 =?utf-8?B?ckI0Z1lHVG1UUU4weXdnemMra2QvZ0FDRS94UE5xa0dXekNkc2tDWGZnYzJa?=
 =?utf-8?B?UHhNZVJFSlExUmR1SWUrR2NWN2hEOURkOEJzNHJPcmp5d1NTUkh0UWhrUFh6?=
 =?utf-8?B?RkRhT2RJcHc2NHB6em5CeXViWFNZOElxRFFvYVZlbi9mOWxiekVkNVl1NzJ1?=
 =?utf-8?B?RGk3eGZoaldkelgzQlZld24xVVczZDRnY3JGVWMrTk1sMUNYcWhnazVjU2Uw?=
 =?utf-8?B?Sm5tRWlJMWxUUW5IZE1HeklPOWVrdFNWeUVNU2Z0SUV4OHROT1pCWVArTDA0?=
 =?utf-8?B?OHdBR3BXV25xcWlOK1dicUFKN3I5SGJCVDQ2UDVjRzROcFB1WHRETHpyWDd2?=
 =?utf-8?B?eXVyNGwzZnpZY0pTYUxIM3JpR3RZVGNuZEZGMGlCNUJsYU1ROFpxdk9kOTYz?=
 =?utf-8?B?NzFsaG8rZ2x6N053eGVoV3RTUitCVHFYTGRwcUtMSzI4L3RzalN1TTI2M1lR?=
 =?utf-8?B?amdyOXpCRlc3T1RkSWRFT2dmNGdxRk85dGhXY3hua28ydTd1bTZUcGYvVWpn?=
 =?utf-8?B?NjhYVGlqbWpGcXRNOElocGtWNGFMTVpRV2tOVUtXUXlKOEdJTmZ2RTdvcEJx?=
 =?utf-8?B?SEFucmt5OGtoRitpeW4zaTdTaFIxL0x1QWc3TGxMeXhxSTlPbURVUnVqSFJM?=
 =?utf-8?B?a3FjK2ZxM1liNkxpZndtS0d3UzFzaFhEY0grVy91Y2VDUHA1Zk5aVXRBeGta?=
 =?utf-8?B?UG1abkphWEw5cXJRVFJIWllxdUhaN3REZ3FLcS9yaG0wRXZKZVJGRkt6NWZG?=
 =?utf-8?B?SmJGN1R5SVNjaEdBcjFGWnF4NGxpY2RidWdUdHd1YmNIbGhDclJaMWpPdHhV?=
 =?utf-8?B?RFJzd3duS1RENStyWlltdXJpVmJpd0dQY2NjMzE5QjZkemtxRldMQllDU0tz?=
 =?utf-8?B?bE96RUlEcEdRNkVtNGplemg3WVdvZWxuZXhnREI1b0paVjBVcjlUZlF5aG53?=
 =?utf-8?B?QmtyZGxUbnkwSUN3R2JWM0habzcwVURZR2Erdjk0NzFDZXR4K1hGaCtHRVJw?=
 =?utf-8?B?bmJrYlRjM2x0L1JzWmRZZWNyN1dYYUVtY0NkUmQ5bm5YcFRrcU1xcVd0bUZw?=
 =?utf-8?B?SWFMaHRBNmhBbjZLV1A1YXBGUXhMZVdpVlpKeUxMZ2V1VVh2WFZJK01ubzNm?=
 =?utf-8?B?RGpRdkFHUHV3Y25rMzZWYU96RzVWZjBuMyttZTJzTUVEZFFsRVNwdVdIZXgv?=
 =?utf-8?B?R1FFcXR1YUhaZmo3OGZWOWliQ0dnT1hZeDROUjFCb01PVmZzcnZhV2Q0VGd6?=
 =?utf-8?B?U3JwcGJ3cEpJdjlmTm1wRmdMWko2VThqbk9IL2hjWThSem1ZcVhINlA1ZWUv?=
 =?utf-8?B?bzFQVzlxTVhESVhDek1scGZSbE40cUtvYW1nVmtLWk9neEdPRGRwdGxvUG1o?=
 =?utf-8?B?YkRZay9YcEwwM01QUkZqaGJULzFJTEY0K2oya3Z4NXRtOGlaS0VvS3ZGL1kx?=
 =?utf-8?B?TjB1ampQNWlLRG9uZVd3a2ovWEhka0Q3NGtVaXpWK2M5OTZ3eDdjcE9QV1p6?=
 =?utf-8?B?UFF1eE9tcjBLczNjbS9pYTIvU3g0dnpOZ2dEdFFEWi9PeHBXaFRBSTQxSy9y?=
 =?utf-8?B?d2xKMk90R0krY3E1RGtFY3VCVVZNMDd1aEtNY1dxK3NieGJnUWJPZ21KM2VE?=
 =?utf-8?B?QzU2dlJ0Nm1oNnRmancvYXc5V0VzYnhkaktRd2VJaWt0TUNKV1BXN3JvRUUr?=
 =?utf-8?B?NVlFbTlFQTB1MzN1Uk8rL2JmTkM4YnhBckFuWW9VbzZ0SXArMzlDSFQ4eVF0?=
 =?utf-8?B?a1ZhU2htcW45ZExnazFYMFVsVXAzTDdiL2I4a2dsemVHSXBXOTk0TEs1UE5K?=
 =?utf-8?B?K282ZXBHUWdsOVcxaGhyckJCNnptRDNGbkxDUmxzSlh6ekRXZjBEWGw4bFp2?=
 =?utf-8?B?MVJrVVZXcEhpaHYxQW1OckxjcTdEaE1FTndwSkZRT3ROYXVHNGVGTXBqSWE4?=
 =?utf-8?B?ai9COGhiRUZzbTZBTkgzdS9kUEtIL2VQcnUzNFJBdExteVQ2bk0rVVU4bytY?=
 =?utf-8?B?UUE5UlUrN2piM25tNlgwMStQUVYrSDRmTThzVmlRNmxCR0pHemVBMDdLUXRq?=
 =?utf-8?B?eTgwdkk1VkhBZmNIRFdaZUZ0dFdwZVlWRnA0UThMTTN5UjRIMWY2czA4TG9T?=
 =?utf-8?B?ZDNQdnFncUZINGRZb09rL1BObDhKcmt4bWdiMHlxeDl5amh6RE9RQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uuxF6Q1w0dbUc0gplP/z2sRqNUgkaRN2tKka4bWlbcdg8hLWUYaqIQjdQ+GSCBPti9H+vHi5BtasoyAD2zmv1aY4nEA/+sYAuj85MIXGYCHbbxIcfnvI8ZnDhgGOSJ7VTbWSLuysV89GnNjaoGYXyrLW1aqdFIslS+9QuxQjydfQNVcAPD/ugnLGhudQaaK7zm/TMtPFXgJE8GpxXIfWu/EM02+BxBgm+Jm/GEbKU+127nXaPIfmTIv+mIGqwaBjnxjhAhNcvcuT3a4gZzwaNrtlQ4FDXrkEhYK4aZkwHFbbDZF43Qq++Ym+5VW3Cl5d+bT9nb/uGg8U2lkxd17bnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 458ac593-28d5-4685-a5d1-08df0ad11a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 22:08:51.6029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYiYYlpo6lxonSQ6YaFK6FmxGY5x1DVuhA/QJRsR2Eott1GWzPr8HpHHS16MLiFvPQMyGQzfiTGyK+EVgfyxtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB2118
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIwNSBTYWx0ZWRfXy6Bw3bHn3fek
 o8YVKZn0cskS49VG+QKIlwGm0W8lQ2Z3z16ZvRiO0g0nsnLv4y4fo7shNQ2rBuJAELwxALGeNl7
 4TYKMq2odDjm53Tv14rYAsIof8rDtMlxpPlTovB4QyDPB/z9/X/BMywUWX8zMbSBIyJvDI+4mzS
 qwn0uV+y/0hjnmP00IiMWBzONHbviZH8mFSoEe9w9sZbD68bJNaL3FP9pmZ+2RMVb6YIQxZ0bcw
 8/LKSnB3IEhu4BgGUXejabNrLb+VePu9UvRfBd+DvdRXDSHKlXa7lnoQnJj3/NRjpXmxgXGi2OQ
 Dc/4v0L41aHOcDffQxvUqsVwbHDh8lAcjeFZUBVtVdriBOzRk2sX9WeDjM6DGILji6YtEfcOQKs
 OLdbzA6UPKaDO61FWM46GROIQlthKVhqEX6tzuN1Tv/Y01t0/7jaRUAok28W06z4tuwyqgMCruX
 OwCpdgHkQ7zPLslQfAg==
X-Authority-Analysis: v=2.4 cv=ZMjnX37b c=1 sm=1 tr=0 ts=6a9b4177 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=Y_q7eNfZWviZvd2xqFYA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIwNSBTYWx0ZWRfX5Xa4ZuGlme7g
 +qzNgFAIkZGXsXKflFIU4EvYKfisdPTQMk82mg+oHLo2/0GTtWhXD9NcsQEYjFIYIBRoZs1scNn
 IHa36nKEkE0QFYz3TEcliHCqA6re6PI=
X-Proofpoint-ORIG-GUID: faxNIS5vU_aQFu-P77Lg_qvhLjocIIz8
X-Proofpoint-GUID: qPPTwIQuiOyf5m1zkACJPO6rm3X6MQfy
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040205

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUUFM1MzZDNyBpcyBh
IFRJIGR1YWwtY2hhbm5lbCBELUNBUCsgc3RlcC1kb3duIGNvbnRyb2xsZXIuIEl0cyB0d28KY2hh
bm5lbHMgYXJlIGRpc3RyaWJ1dGVkIGFjcm9zcyBhIGNvbmZpZ3VyYWJsZSBudW1iZXIgb2YgcGhh
c2VzIChOK00sCnVwIHRvIDEyIHRvdGFsKSwgYW5kIHdoZXRoZXIgY2hhbm5lbCBCIChQTUJ1cyBw
YWdlIDEpIGV4aXN0cyBkZXBlbmRzIG9uCnRoZSBwaGFzZSBjb25maWd1cmF0aW9uLCBzbyB0aGUg
cGFnZSBjb3VudCBpcyBkZXJpdmVkIGF0IHByb2JlIHRpbWUuCgpQYXRjaCAxIGZpeGVzIGEgcHJl
LWV4aXN0aW5nIFRQUzUzNjc2IGJ1ZyBpbiB0aGUgcGhhc2UtY29uZmlndXJhdGlvbgpwYXJzZXIg
KGl0IHRlc3RlZCB0aGUgZmlyaW5nLW9yZGVyIGJpdCBpbnN0ZWFkIG9mIHRoZSBQQUdFIGJpdCks
IHdoaWNoCm1pc2NvdW50cyBjaGFubmVsLUIgcGhhc2VzIG9uIGR1YWwtY2hhbm5lbCBwYXJ0czsg
aXQgaXMgYWxzbyBhCnByZXJlcXVpc2l0ZSBmb3IgcmV1c2luZyB0aGF0IHBhcnNlciBmb3IgVFBT
NTM2QzcuIFBhdGNoIDIgYWRkcyB0aGUKY29tcGF0aWJsZSBzdHJpbmcuIFBhdGNoIDMgYWRkcyB0
aGUgZHJpdmVyIHN1cHBvcnQgdmlhIGEgc2hhcmVkIGhlbHBlciwKZXhwb3NpbmcgYWdncmVnYXRl
IHBlci1jaGFubmVsIHRlbGVtZXRyeSBvbmx5IChUUFM1MzZDNyBjYW4gZXhjZWVkClBNQlVTX1BI
QVNFUywgc28gcGVyLXBoYXNlIHRlbGVtZXRyeSBpcyBub3QgcmVwb3J0ZWQpLgoKVGVzdGVkIG9u
IGEgVFBTNTM2QzcgaW4gYSBRRlg1MjMwIHVzaW5nIGEgTGludXggNS4xNSBiYWNrcG9ydCBvZiB0
aGlzCmRyaXZlcjsgdGhlIHBhcnQgd2FzIGNvbmZpZ3VyZWQgZm9yIGNoYW5uZWwgQSBvbmx5LiBD
QVBBQklMSVRZIHJlYWQgYmFjawoweGQwOyBibG9jayByZWFkcyBvZiBJQ19ERVZJQ0VfSUQgYW5k
IFVTRVJfREFUQV8wMyBmYWlsZWQgd2l0aCAtRUJBRE1TRwp3aGVuIFBFQyB3YXMgZW5hYmxlZCwg
d2hpbGUgdGhlIHNhbWUgcmVhZHMgd2l0aG91dCBQRUMgcmV0dXJuZWQgdGhlCmV4cGVjdGVkIDYt
IGFuZCAyNC1ieXRlIHBheWxvYWRzLCBhbmQgYnl0ZS93b3JkIHRlbGVtZXRyeSBrZXB0IHdvcmtp
bmcKd2l0aCBQRUMuIFRoZSBzZXJpZXMgaXRzZWxmIGlzIGJ1aWx0IGFuZCBjaGVja2VkIGFnYWlu
c3QgaHdtb24tbmV4dC4gVGhlCmR1YWwtY2hhbm5lbCAocGFnZSAxKSBwYXRoIGlzIGV4ZXJjaXNl
ZCBieSBpbnNwZWN0aW9uIG9ubHksIGFzIG5vIHN1Y2gKcGFydCB3YXMgYXZhaWxhYmxlLgoKTm90
ZTogU2VudGhpbCBNdW5peWFwcGFuLCBjcmVkaXRlZCBpbiBwYXRjaCAzLCBoYXMgbGVmdCB0aGUg
Y29tcGFueS4KClNhbm1hbiBQcmFkaGFuICgzKToKICBod21vbjogKHBtYnVzL3RwczUzNjc5KSBG
aXggVFBTNTM2NzYgcGhhc2UgcGFnZSBkZWNvZGluZwogIGR0LWJpbmRpbmdzOiB0cml2aWFsLWRl
dmljZXM6IEFkZCBUSSBUUFM1MzZDNwogIGh3bW9uOiAocG1idXMvdHBzNTM2NzkpIEFkZCBzdXBw
b3J0IGZvciBUUFM1MzZDNwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNl
cy55YW1sICB8ICAgMiArCiBEb2N1bWVudGF0aW9uL2h3bW9uL3RwczUzNjc5LnJzdCAgICAgICAg
ICAgICAgfCAgMjMgKysrLQogZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnICAgICAgICAgICAg
ICAgICAgIHwgICAyICstCiBkcml2ZXJzL2h3bW9uL3BtYnVzL3RwczUzNjc5LmMgICAgICAgICAg
ICAgICAgfCAxMjggKysrKysrKysrKysrKysrKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDEzNiBpbnNl
cnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogYmEwODQzMmJkYTY2YTc4
ODlkOGYzZDE1ODFkYWJmMTBmNTliMjVlYgotLSAKMi4zNC4xCgo=
