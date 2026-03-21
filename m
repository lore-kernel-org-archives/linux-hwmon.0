Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBDE1FBC8C;
	Sat, 21 Mar 2026 00:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054429; cv=fail; b=jGZZoNgAo9A6OIYsdbPhJ3Ggr4+kU9mY25OMnEZdXyMzYdISHg3uZ6wSh5oZZaI9V7kfZBQ40E4ll1y6jQuXf8xjNSkFJUwTNMZpTuI0fHqAgmqVgayWpaTML59NEKD++KDnGl0h+2vpsY9OQ0apJOV2nt/RwQiRxjke2ba6KIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054429; c=relaxed/simple;
	bh=7p8wz90UKqTccDNz+MasB/B+WTJ/OUg7rEyBUqJ/ES0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cri298OhZCZhrErczXTgFXWLe3kbM7w6Sbmbz1NwGBNTlcsv9wMzqZIrV15MqSEvXGymjtM2wWLi9i4YvlgXI9zZIvGUkgL2sfzSPDsnozZHeBu5s3wKY0A3E1Pins+dWDKVZ5/TgRpgeKOyVgyi8/A2Md4iZn5r09YKLrQmpX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=FmMjGB8Q; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="FmMjGB8Q"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L0YRUS2107377;
	Sat, 21 Mar 2026 00:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Jw
	HwNeoc0UbUU+aoo03JiyikU/f/JrM7vBKLdExfWPg=; b=FmMjGB8Q+aqmBfIUzW
	0CdRFZdXZVUvt60ICZ3wOPiPaWaXOdcluZaLgw5+HWg+IqvScLRpW2z+4EF9IYGI
	HnRYTa7Izn9niYlIBqvtXc1lM6wl6+sdrZszrjuR11IBpcLRXmLvQ941WY5w4a6Q
	/ddEfEOWp0Om4b8h6o4ZBqKz/mO9nCFopDeJ+uX9PGP2ARDE/9rdQ5svY5wrv14C
	pRWV3gMdA9Pf59/kCqnMdm84/BynVfi5kDNKiLs4Wj247yE7/zazlAyPW3ocOOXs
	1+/8/FFwUNRI5gNXOBTzwQvL/WBDGIp6hhb2ZLM29hv131E0uwo7OYxYvN9tw0xM
	X1tw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d1gw6r2xn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 00:53:33 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 358DE295C6;
	Sat, 21 Mar 2026 00:53:33 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 20 Mar 2026 12:52:58 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 20 Mar 2026 12:52:58 -1200
Received: from CH4PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 12:52:58 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sr94ex/tZvnu0fNUmfnOA9DnTFCYvJ/nhXetctNiK8TcSrDD5RSDkpAI74eOCMuWQ1yyy/RXydOqPmx8TavWgGTC6ZDkhYo0pC6PC65q5iuHtyuNV9vyeuwI5Iqyn8K1r4LxRFWUWcZz+kxKDRsfsn46Lp+ES7OIn5I4aI+MLF51F4DhKasH3HVKCIS9WJJ2V0XlnANZjbpMwc1T4ekHe9kxPILaSAmGql8JkvMhKbTlGN8JxGpMkRJ/qc2p6QhPN9MJB5KPjhBb6e7S91t5N1vWL8dW4fVnmu8DuVIhzq4Qt6wV8Ldip8TDRopNysrFlzPa4oPHtlT2jGdft8JcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwHwNeoc0UbUU+aoo03JiyikU/f/JrM7vBKLdExfWPg=;
 b=mtXXZ8Lcs7rmNZCcPIsKG/rSjsd9bRgaq8W5O4LNLE+/Ea2qiXCFhg6q0clHbZV0p6SdjcFRjYTvyHTBaQMcbovx77ma5qQBdPuwnqCwEeDQUcyz68opsIOxNls5HZ2V9YBHgH16C1JDNzsMXZipdOF072SJOGjmh1angPtLViOk9Go6v4zMSTZg8+6pp70JawqfwITtLZcfsSQNUakYsUt0RZnxpt2hha1sz/8QXvh393Uy0K3Wf2CAPqjYwqgYGHwS/8lSQVY83vDO98I9x5TshtTiDaKxO7iu42FolB0fIUHt357h9jAvtInfeZI81UVI33dh1mfBSuoBIIhjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV8PR84MB3772.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Sat, 21 Mar
 2026 00:52:57 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 00:52:56 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v5 1/4] hwmon: (pmbus) add missing mutex_lock in regulator ops
Thread-Topic: [PATCH v5 1/4] hwmon: (pmbus) add missing mutex_lock in
 regulator ops
Thread-Index: AQHcuM0Onve+LRo/4kiM8frHCLYbwQ==
Date: Sat, 21 Mar 2026 00:52:56 +0000
Message-ID: <20260321005206.6350-2-sanman.pradhan@hpe.com>
References: <20260321005206.6350-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260321005206.6350-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV8PR84MB3772:EE_
x-ms-office365-filtering-correlation-id: f129eb17-3635-44b5-c7de-08de86e43137
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: BTl4OBHA6UN56jviA/dc/5UoF1sBJmZ1uwy6wVhZCtDNHt21xZyg/qqWblAjjPNRVkaGVmvE4ZbNcgDBTcXaidujLt0mc6ZMK09TEiUYGqkzzJBDlnvdrE/7I3YopcsJBPNK8WeiHLwLKClzhWn2Ll8OfNGLRO0yF1urLoiqUZqcZ1zQ/VswehDfbP8/YD18jiy1m5eKM3Q9JLLbu6Bp4hTkOukNu/vc7sAey0vG+U5bKZgtsJU+CfVBG69D7rZeSR6uGeNaaZEe7/y6B6SC164o3h8PZTbahD+YvAaEcHFEcLj2imwM1PlbvMylAo1thHPNQ4ZsQhC+URFvqi1+K+6zMC5sNDLHh6Q0CcK8boq+/dlhrzeea6PNpitIg6O12+EsICgjh+f5PFud6uXivPcVWxD1xq1gyhXfhcguKjmhN2KU764yLmnJCnz11Imv3HMTVHaVCAWdudIs9NU1N/TsUV9hRkbrVE9UYyPc5WYdn3vYCc3VfTykrasLPEZOJQAcrhTmuv8QacFnNdxePJr/pYpmMmYEXM+de4iqtUeUrT9JY4a0opRiudHkV3DeTXXV5ZnnT8VzMxp8Pgs02q1gS2MXAsY4ndqvnFWYc2BC1xqOEEe9Pev0rp2Nb+cl129tDSvS+PK2vJ8KjlZAfAuGdHnUKHWXYv3dvcYWpUtzbx0iOf4BzhPWOczSMM2JHlBWKpsZWwbmUAx5E9DqdBUjekBH0rPNmygNQvQ1Ifa3ZJTDhFnlqFJNco01hQAAQ5I4zXfSqAgPa+M4h7dX5xmzShRIrka5cvj8brKmZ8A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DPb/D8JlQpyOI78Ri8poDeLkj0vffI307KmahsWua0IkgXYY66gN508w+3?=
 =?iso-8859-1?Q?73CtQIefE5Wu1YBZvWf2R0WWSaL7QK9Ar2jkvPXZrnJ3709NeUbNBxfVHm?=
 =?iso-8859-1?Q?bS2zDokeUfs3dKuxhsPzAN8uw6oFHaEuHKX6CnSp5mAmimAkWa0kjB/G7P?=
 =?iso-8859-1?Q?2P2BX44s4PZ+EEmd8D9A/vLYhn1VXpCxXomhL1aj850p/3VmCdkoFCP2u3?=
 =?iso-8859-1?Q?1ZoBTce1+AcSAnlccI9nRKId8sC0K99XjE4CEVQ828K6hqCTTalyBG/zgz?=
 =?iso-8859-1?Q?X1pruRoMIqEo/NY/RA5rBaWMrdLRGz5LZggIHN7sIwfxiNUSpx4JMf5xAt?=
 =?iso-8859-1?Q?TV28Hhq9fXLDfZzjmrHMNOXmH+xCQBmOdmqnKc+FcPGDkrw85tRa2UqX8N?=
 =?iso-8859-1?Q?DRP3TpDT0kzsdzZtvtltqbOqMEpau+xwu+o1faHovCzRSq/zbaTwGPiRpW?=
 =?iso-8859-1?Q?H5JkXCaaE1QNcuHratIP45E2bREDzA1gQMISnhj22Jdkefov7cGZnN29kv?=
 =?iso-8859-1?Q?nLeTBZSGA1v/c39ruXmKEo1WZTP9AGI/3AiJgoRFeS0bUHY+FdU78SgLJb?=
 =?iso-8859-1?Q?hSGWNaEGkTDw73uzEMKhioqezC0WmlA9sOXqihahM1ZsuKIp5s+gmi6aMK?=
 =?iso-8859-1?Q?cMZoV50nZV3wAL9DW67rI7j6MtVluvX/XFlBNM852UNu4U6C5y4EI1gzVh?=
 =?iso-8859-1?Q?v2hiicQfF0jUB4lDVYQGypNIrTIvlnwo45dw1vcYwhKkLT9rsvyXoa3gDD?=
 =?iso-8859-1?Q?EXY7cAMRVys/ia46HUJMbcP0WuxodV97661xQLR1nV1A5yRIzeRgf5HbYi?=
 =?iso-8859-1?Q?6dv5NMia9W1P/eoJ1p0Kxnwx9mqsUTFsS2vJTRvM8UNwsXiCmk54X90PvR?=
 =?iso-8859-1?Q?yEZVuS0fnIZ6LMQ2IK4XPIBWoK/P68rRHMij1ZRviyXfIILhI2t9gXt7Du?=
 =?iso-8859-1?Q?8YC/kMjTnXyzFEcOoKxXQAEHGDnIPnfqf2dgSB9ziDDjr384244Av/9WdA?=
 =?iso-8859-1?Q?3t5IytQub06m6xk49Qrc3q1CxE4jjF6wjkMckvstEygh4rVQ7GY5EUD6u2?=
 =?iso-8859-1?Q?Ip8zVsbTCII/9nqNbct3HUeDVuH5MtsDX6wsVWKH35fXPYCtNq7vZI5q9N?=
 =?iso-8859-1?Q?y7tLnSGbeIkqBA1zhVfgLhAVgAbd+yugM26WjBHkO3ytpsZ+V8dXIv53fS?=
 =?iso-8859-1?Q?tlEWD0tOwznUKctuooxLm0r1o3YFFkEXsC4NhlcRgIpB9M2R/LTLNuAAnr?=
 =?iso-8859-1?Q?4OsJkUr0icE2RwilNd+WDTOEh0N83qOau7iRGGA6tCeEIjONFPtws8JwU+?=
 =?iso-8859-1?Q?7fNFqJuQrVsEzvCX7OnXG/xV9TwwVYAVuV8uRwj4cpxqarjGtuYm6wrxYV?=
 =?iso-8859-1?Q?6wWkxGFj9rH6gQJemg0Sz0GT1pEjP/zVR4v0FDaVQecRHjyi8RpC3LBAkb?=
 =?iso-8859-1?Q?d4Jga67p31l7VC+V+5ZcxJhCLtQH+PnTcUeiVVSWNQNBtiNB9yNeI3Enfg?=
 =?iso-8859-1?Q?7Ny9/TxKGPq5foY0APE9Kg2yfTwI1bNCBH/oODw7p6wU//PPbqqHRJ9oB+?=
 =?iso-8859-1?Q?QPl33wmkk16JdFO1zeKV44BoMGecn7w/D0Q11L7bUsJ9T2JgN8knpQ7Bc0?=
 =?iso-8859-1?Q?8IhLR3xKRXwvGZQ6yRz/xXJUCpiIqSNu63MDHYEXJ0i24kIEj6uxhC5FbO?=
 =?iso-8859-1?Q?3GTKhh0M/w1v9+MynKi97JA89rfWdl02WWU43SjIAcOww5rRG+OWNj3TeH?=
 =?iso-8859-1?Q?PwVDOOH6YMa5/Hhs5PP3n/Qd1VC7JpPSrhqyVuNDKZ1WxoVYl8HheSTdCc?=
 =?iso-8859-1?Q?+UhQ1qK2kA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SdtlOQTtvoDp/tYuC2TALXThEOz63NT3ZBW5PCgZ8lI7vCVkYtK+K5gDq2ILYGH8btrVto/nMsL5wKANwLEKQ3E2UmwU14nTD5akwOyAA63DFnZ4fJqlMswe4dlI3CL+crSkyBnCAbhvRLxkV+x80Z3og8lbm9RRf+Vdt8q004kefcxIVv6CDundPeo2E75pKYhezZjeYgxSZs2OKNuBQ+fye5iETX9UwPUC6lvVX04ZJmWQ7yK2fZWplvpq/UGTBRm05NqSnaUyVJbfHl72qQIfIEPCufbNV6ae0oIvOGZfgsrGw6HdRtJZR+I7A0cTNVDFIcatF2FfpPR7Cc6q7Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f129eb17-3635-44b5-c7de-08de86e43137
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 00:52:56.8557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ph0QS5mVsB9Mynam+tKy6eRbOIOI2MUrkqK+9XXbCIjB+aK/5YOzxev9HUDhs/zkMaradAmbQ9CyYUG/eVJ6eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3772
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 8aTy0qaNpG0h-WneMz4kQo5S3T-sDZuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAwNSBTYWx0ZWRfX2KvPrYsOonZ4
 fe3X1pAnCOy+JZ3XcuoL+Tc8JJF8c14gB7jWrMN4lPOZS1DoVWcXwP0CxHiaOOaNeZ5SlZ7pJXl
 YMz4UiVGzOUapm0fjfdyFfIZrHE+myZBYwq0Flxf9cOJV0csEuRA16iTm7p/FEdZu8k4GHIXGCX
 PNDFz8qdVzFmZH5vLFdeL+OyUjhUAzgBjVWyACEXr+cWC/lMr3jAGGbSqG+DNJrEkxXkkkHxMsA
 8lznhjTaSEjGA1fYZkHQzPu6IKNJMA78Nq9l6of57NNNffCv5PXbM8KJUEQLw0k7sQwV8ZCep0U
 d5dId8Nq5SN3fBEQBf9Yi/ybksdPOsvQO3zUpjRCFYwDXvgHQJfgOruHZTDBPcYZ+z5AS5EMbS5
 L+wIpnsfhp/+iJlbmRrPG3uXNdXUdSIYWj8XYYCpDcRRz111ZsM7x8VH1XQhJYDBBBAvGuHUQvQ
 Qi7+yxfPg/AvSOb91Jg==
X-Authority-Analysis: v=2.4 cv=cpmWUl4i c=1 sm=1 tr=0 ts=69bdec0d cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=4pkxegZISdZCCt_r8m8A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: 8aTy0qaNpG0h-WneMz4kQo5S3T-sDZuY
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210005

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The regulator voltage operations pmbus_regulator_get_voltage(),=0A=
pmbus_regulator_set_voltage(), and pmbus_regulator_list_voltage()=0A=
call PMBus access helpers without holding update_lock. These helpers=0A=
perform multi-step PMBus transactions involving shared core state such=0A=
as page selection and transaction timing. Without serialization, a=0A=
concurrent PMBus access can interleave with those operations and cause=0A=
reads from or writes to the wrong rail.=0A=
=0A=
For set_voltage(), this is particularly dangerous because the=0A=
VOUT_COMMAND write could be directed to the wrong regulator output.=0A=
=0A=
Add mutex_lock/unlock around the affected regulator voltage paths,=0A=
following the pattern already used by other PMBus regulator operations=0A=
such as _pmbus_regulator_on_off() and pmbus_regulator_get_status().=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v5:=0A=
- New patch in the series. Adds the missing update_lock mutex to the=0A=
  three regulator voltage ops that were missing serialization.=0A=
---=0A=
 drivers/hwmon/pmbus/pmbus_core.c | 46 ++++++++++++++++++++++++--------=0A=
 1 file changed, 35 insertions(+), 11 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c=0A=
index 4d7634ee61484..3dad455448d05 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus_core.c=0A=
+++ b/drivers/hwmon/pmbus/pmbus_core.c=0A=
@@ -3181,7 +3181,9 @@ static int pmbus_regulator_get_voltage(struct regulat=
or_dev *rdev)=0A=
 		.convert =3D true,=0A=
 	};=0A=
 =0A=
+	mutex_lock(&data->update_lock);=0A=
 	s.data =3D _pmbus_read_word_data(client, s.page, 0xff, PMBUS_READ_VOUT);=
=0A=
+	mutex_unlock(&data->update_lock);=0A=
 	if (s.data < 0)=0A=
 		return s.data;=0A=
 =0A=
@@ -3202,16 +3204,23 @@ static int pmbus_regulator_set_voltage(struct regul=
ator_dev *rdev, int min_uv,=0A=
 	};=0A=
 	int val =3D DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */=0A=
 	int low, high;=0A=
+	int ret;=0A=
 =0A=
 	*selector =3D 0;=0A=
 =0A=
+	mutex_lock(&data->update_lock);=0A=
+=0A=
 	low =3D pmbus_regulator_get_low_margin(client, s.page);=0A=
-	if (low < 0)=0A=
-		return low;=0A=
+	if (low < 0) {=0A=
+		ret =3D low;=0A=
+		goto unlock;=0A=
+	}=0A=
 =0A=
 	high =3D pmbus_regulator_get_high_margin(client, s.page);=0A=
-	if (high < 0)=0A=
-		return high;=0A=
+	if (high < 0) {=0A=
+		ret =3D high;=0A=
+		goto unlock;=0A=
+	}=0A=
 =0A=
 	/* Make sure we are within margins */=0A=
 	if (low > val)=0A=
@@ -3221,7 +3230,11 @@ static int pmbus_regulator_set_voltage(struct regula=
tor_dev *rdev, int min_uv,=0A=
 =0A=
 	val =3D pmbus_data2reg(data, &s, val);=0A=
 =0A=
-	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)va=
l);=0A=
+	ret =3D _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)v=
al);=0A=
+=0A=
+unlock:=0A=
+	mutex_unlock(&data->update_lock);=0A=
+	return ret;=0A=
 }=0A=
 =0A=
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,=0A=
@@ -3231,6 +3244,7 @@ static int pmbus_regulator_list_voltage(struct regula=
tor_dev *rdev,=0A=
 	struct i2c_client *client =3D to_i2c_client(dev->parent);=0A=
 	struct pmbus_data *data =3D i2c_get_clientdata(client);=0A=
 	int val, low, high;=0A=
+	int ret;=0A=
 =0A=
 	if (data->flags & PMBUS_VOUT_PROTECTED)=0A=
 		return 0;=0A=
@@ -3243,18 +3257,28 @@ static int pmbus_regulator_list_voltage(struct regu=
lator_dev *rdev,=0A=
 	val =3D DIV_ROUND_CLOSEST(rdev->desc->min_uV +=0A=
 				(rdev->desc->uV_step * selector), 1000); /* convert to mV */=0A=
 =0A=
+	mutex_lock(&data->update_lock);=0A=
+=0A=
 	low =3D pmbus_regulator_get_low_margin(client, rdev_get_id(rdev));=0A=
-	if (low < 0)=0A=
-		return low;=0A=
+	if (low < 0) {=0A=
+		ret =3D low;=0A=
+		goto unlock;=0A=
+	}=0A=
 =0A=
 	high =3D pmbus_regulator_get_high_margin(client, rdev_get_id(rdev));=0A=
-	if (high < 0)=0A=
-		return high;=0A=
+	if (high < 0) {=0A=
+		ret =3D high;=0A=
+		goto unlock;=0A=
+	}=0A=
 =0A=
 	if (val >=3D low && val <=3D high)=0A=
-		return val * 1000; /* unit is uV */=0A=
+		ret =3D val * 1000; /* unit is uV */=0A=
+	else=0A=
+		ret =3D 0;=0A=
 =0A=
-	return 0;=0A=
+unlock:=0A=
+	mutex_unlock(&data->update_lock);=0A=
+	return ret;=0A=
 }=0A=
 =0A=
 const struct regulator_ops pmbus_regulator_ops =3D {=0A=
-- =0A=
2.34.1=0A=
=0A=
