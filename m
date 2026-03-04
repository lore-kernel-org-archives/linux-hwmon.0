Received: from mx0b-00273201.pphosted.com (mx0a-00273201.pphosted.com [208.84.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD451C28E;
	Wed,  4 Mar 2026 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.84.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772586091; cv=fail; b=YxTJD4eLDf1r+g4auNmJemUILv5mRjeip9xhqQ02pySumw4HnwqvfSTwJ/QPPWKZoWe3c/p6UEbUQVsSHSl46O7T9SzjApTw/IGvaH/ebVuxiTBgiXWNGlaCQ0F5CwiGtVemJpr6oLQwVGOKKgDczC1JE8Pjhnbs8nEDJWg8shc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772586091; c=relaxed/simple;
	bh=O9CNCGv+HhOVBMb67leWWBf4oGeFkgM/m6Bk7G7jEtQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BHDsQTldjrRbQZEtAp43vHPxRD4it0CksZkGwPEOYC1C4QqKJfrx+QjugOZx3FvcxtyZi9iJ7A/n8usmHyNJ8+pfkEzmcRfI+GaKtOh63ycA/DYb20Gf4nEfJvEe0fnVmYlLSDzID4gnZzHgEMl/RSqj8y9lxwFFidSWbmGGnE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=juniper.net; spf=pass smtp.mailfrom=juniper.net; dkim=pass (2048-bit key) header.d=juniper.net header.i=@juniper.net header.b=i6p9d+is; dkim=fail (0-bit key) header.d=juniper.net header.i=@juniper.net header.b=KX0gAI0O reason="key not found in DNS"; arc=fail smtp.client-ip=208.84.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=juniper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=juniper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=juniper.net header.i=@juniper.net header.b="i6p9d+is";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=juniper.net header.i=@juniper.net header.b="KX0gAI0O"
Received: from pps.filterd (m0108157.ppops.net [127.0.0.1])
	by mx0a-00273201.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623Nhul21409866;
	Tue, 3 Mar 2026 17:01:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juniper.net; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS1017; bh=x1lytjGATh09qQpfU7UhMHyM
	zsF2Fvl+wGjbHAahbuk=; b=i6p9d+isZiHjgyNBpUx8d0E4ZNvYk6RVvFF6BQQP
	mQYdTWn/NhLqLZJ0A/mZeRefOjXqJzBRU5bIQC1UWFBNIiAq1T3onfHBiK2OwUJU
	fCURcjZ8CXUtX3QQs2btsajsOSnDRMrbNdH0wFFHHZp/QvUIEpFxkrPXKB7obz1k
	cogXdsG4CewV8D+0IJqt7hRkWwf/lqgiN44asH1eIqwx0MYFPw16uiz4GMv5HfUO
	T8dUupa1UC/REVnb7w23SqTs5Dl9A8qq5X61dX+PDn8bBxxfkqtsNOadBD4spnJa
	77RX0nS/VS13n83NCiFeVNQ7/zbEGWdC3T99nAN/yNbpKg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
	by mx0a-00273201.pphosted.com (PPS) with ESMTPS id 4cp38at9dn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 17:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzQIhd8kj5lHClDCFpMsc4ArYA4kSqhiR483nWzEXAfUcBglg3t7Cd/ejsl3l+iIZumT5sjfvJYldSPOUGJIbwA8BEoOVYu0/stvWwil+wALYTj0dI+Vpq73KVKz2rczy91+wyKLyHbX2Dfunx2BJQnYHCIKPjiVfDqZrE1pAMwNCI9CQ5YZtS0uzWMccLJoiPBsZYf+vQr1dM98lB6+I66bSsa6t3Q+dpbE9UyCTl+L80TJrWip3CQCf0TG2gB8vESfUEQOMV8uC/1LGiTAxktq0abEqq4iK+UwyfC+AljJIvlD4zGTzX+epugKIaR+WrNuSk4oNtywCBaQ+OJryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1lytjGATh09qQpfU7UhMHyMzsF2Fvl+wGjbHAahbuk=;
 b=uroslJxsVDoj474Zhyox3QXtHOk6eYSGhnNgBngOdlRdVPPGeX22Jec73WvpEEvbZ1MUss6SHGu2xov+bt4T+K+pLnKtz7rXb+EJDb/ptMoSoeeVhAXAU+y+1Zk6UQM3snDMLbhSYcNSzOoaYTVWNVQD9ES8Pg/371wefUpLJ+1iPklxBVFN5NfuAarZD2yooEYcIKW4aoQZLqMMBSOn2uevpR3/xlyERNMBgdgmdE/W0DTGlswcfwTc4DD6R/a34lMJWu7GwXWzPjwa/8MnczAHbGTXN2HM/hHTUC65Vy+GKMCY/lVqeE8OwRPPwLpmzIdPyxICUxY/XAf9GTTGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=juniper.net; dmarc=pass action=none header.from=juniper.net;
 dkim=pass header.d=juniper.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juniper.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1lytjGATh09qQpfU7UhMHyMzsF2Fvl+wGjbHAahbuk=;
 b=KX0gAI0Oa8pvqU3UoRGHhnBPk4l9kHe/z5GiVhw6c7e+0fnbsrpX+c1P/BQ8wonnxexMx3/eb8BBh5qwc4v8tgvdo+J95B1eGGlloEsssvHdDCxCnsFE7DPQ0c6FK1S1IteTBKOoj4cAP1LPOLK3D9RSSc8L2wCrQZZS8qcwDo4=
Received: from SA1PR05MB8708.namprd05.prod.outlook.com (2603:10b6:806:1cb::17)
 by MW4PR05MB8521.namprd05.prod.outlook.com (2603:10b6:303:120::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:00:56 +0000
Received: from SA1PR05MB8708.namprd05.prod.outlook.com
 ([fe80::4233:c6d8:b4:2416]) by SA1PR05MB8708.namprd05.prod.outlook.com
 ([fe80::4233:c6d8:b4:2416%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:00:55 +0000
From: Sanman Pradhan <psanman@juniper.net>
To: Guenter Roeck <linux@roeck-us.net>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andy
 Shevchenko <andriy.shevchenko@intel.com>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Subject: [PATCH] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
Thread-Topic: [PATCH] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs
 read
Thread-Index: AQHcq3Dq2YzGTeT1jkeGQl1SYqwBJQ==
Date: Wed, 4 Mar 2026 01:00:55 +0000
Message-ID:
 <SA1PR05MB8708FB8CDA1A57DE77D158A7BA7CA@SA1PR05MB8708.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0633b888-ae0d-4341-a75f-06e04137d755_Enabled=True;MSIP_Label_0633b888-ae0d-4341-a75f-06e04137d755_SiteId=bea78b3c-4cdb-4130-854a-1d193232e5f4;MSIP_Label_0633b888-ae0d-4341-a75f-06e04137d755_SetDate=2026-03-04T01:00:54.760Z;MSIP_Label_0633b888-ae0d-4341-a75f-06e04137d755_Name=Juniper
 Business Use
 Only;MSIP_Label_0633b888-ae0d-4341-a75f-06e04137d755_ContentBits=1;MSIP_Label_0633b888-ae0d-4341-a75f-06e04137d755_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR05MB8708:EE_|MW4PR05MB8521:EE_
x-ms-office365-filtering-correlation-id: abb219a8-8865-4217-c70b-08de79897d74
x-ld-processed: bea78b3c-4cdb-4130-854a-1d193232e5f4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 3RQgvKsWZkUPWtawYJtgxf8RHFSP2fV9qKABi3u0OGjog7MnfbCjhzJMcTOkIQzwdoNtB9GjgUBq3kmLNc+93jnhpVPAKxy/LenfHKehFjCTanqQsB6VLrpxhrfWrRucd3Bk0tIiiE5LrpF00lZsoaEmYn1hSNq2w7705GN9fTTZvDH4jL5Kw34J+QEVHW9XThyxw5FESe06bDaXxpgqs6glRV9kjXzsVmmVrCumcbOcKTMz1kWI1GYZh579PmOTq4qie/bBJPBA1GrqI727f/dKi+1fiPEllJDYrkdScW1tdd5t5kEy8mrfNSBBDZCP9Q3nw5HAPd8pzIjfOzhSB2yZwj3LYUvET17XffwKlxzudhu8VoZeOKaiIlqObltvcq0WSMSSZa+hobIByA8BoaDLgH64lDO74iBpOfc6Tnau574WKIRQpGV04X9H2s33WrPFNCMg5erNSx3R/pjJt8+vVx8hXKzpniycsGMdX9htBHFNrijZ8yyfH+zQTcQ5qmPn8bC6uz1vk7aCGgWFdG4WAyva0Y166NLgoIMrbrlRU7GtxEwhRzwH+HHxzekrxHsp6BnEbqzn1QhBltlnJjALJ2OP8RMUztBslT/EZXE5cyO4gTwlhGiKe0kGmVj9nNLyiNYNYBhnukcrIk04zc3SlsXXgQsBe7+/h6+MEM5erZhOS/8oewL4wrVG7bYCfImNXxyFHrqNwcOD4nVh+Z7yXOdJsriMldg7/XKUXwXDWROQFA6PIJc6GsUV1QrSFRWzfmJRYJ6OyCQtHvonMnJIIrk8RFhjHubORoXYrYA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR05MB8708.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6+HGHE8V1a1pwxl6S7dUR9lbrf90xEPMc/zYO4d8vqMUYnzZgNwabfF2B6?=
 =?iso-8859-1?Q?XfeZZiSAyrrylGUSxvmEIDBiK8hOu0eENILcSj+etnJ740i2HZKQ/OOmNh?=
 =?iso-8859-1?Q?5RQ5Prp/NJQ4fwgRzcmCNIxGpB5yEJ7v4bfRigUHyP/gj8FvkefI2Faso4?=
 =?iso-8859-1?Q?+pddwe/uvBHdaD30LdhNQloHcCoHqq0F5b5B8jjlpE2cqLSV4pD6wZJUDK?=
 =?iso-8859-1?Q?fRpMbC1RgO6Nokef/zg3y0VAr2g5piV6VpEReXOC5yFpBsi6J3NYnCyyFs?=
 =?iso-8859-1?Q?eajLgW10y/l47lJ8Cf+cggrH5SgT16ybqO6v4acZeQbR3M+yxM1IcwlId/?=
 =?iso-8859-1?Q?pSPuwq4pBK8hq1On/UKvUpZsvbAe3R5Nvjie4CIiBjWHFxvKfcV9Izc8JP?=
 =?iso-8859-1?Q?mlYjglJoIKi4YXp07ZqUJDwf/qjoGTpOiJQ6ApWArLccRonMp7Ax/E0g3p?=
 =?iso-8859-1?Q?ZNR1CO2B1mEWoKk5FwlAl7voB1Ltk/AJ4uNEXavRPEQzfgoVikTKaBxQZa?=
 =?iso-8859-1?Q?yAImaI/4GhfRyp6W70x26uj9HeGcppzymgTpV3QFrGOXc9yZBxGIetZnNQ?=
 =?iso-8859-1?Q?EJLv8beJOGFal+05noNSoOUBN0GdRCzcJz5lzxNXf6j0YIg5XexJ5m4O74?=
 =?iso-8859-1?Q?gQZYvmrUpC0iclnwe9XRe4+FFQS8BDB5lXi1RdjaiJ6S9FbhZGEaVB1Trf?=
 =?iso-8859-1?Q?9x2gV2O0PsBPsIGNCE7P/uNHpaV+nsIjvw7FNOnOdGAJAOrLL9DlRprljI?=
 =?iso-8859-1?Q?rhL3JmAuJycs3qh8Ez9YLgFuahP5wWw8G1DAhuffqo/VONDD2NxW6WcGHq?=
 =?iso-8859-1?Q?v7TXzsJ9TLNdj9cI2vxdeatDgKFkQhQWFa65UD1A+lIHW+3TuWU8foVloa?=
 =?iso-8859-1?Q?u5m7arSLs0ne3bOpar7MJbaqXyvG+TrHdqMlRKRq4jWie2uAjGpckeJhat?=
 =?iso-8859-1?Q?L4vJT2xjoTsflLGv40yio5ry15bXv2xioKZUX1a1aB4toNpMZigyXVr7NN?=
 =?iso-8859-1?Q?GpoIBmpmxt1jpG4uM4C8jn5stf9YOHeDjnw/Q42xyLDBYvWRA3/TI3nwt6?=
 =?iso-8859-1?Q?C28sVpxVehqm0s5s8tIhEjf1jiALsNoY9LF8ctvAv10k5ZQHuY0pCnIJzL?=
 =?iso-8859-1?Q?0LpJiGTHCzifVD7qD9IXHoLv43YBdSJx6i19BtFz3Rv/ykAS9zrUUihuRG?=
 =?iso-8859-1?Q?EYHcp5Mj51f/XTT39hn41qKcLmwnKjCDMM7dTbr+jiSurVhkEWERSj4be0?=
 =?iso-8859-1?Q?e2bXF8KSBqykkqbtns7icK9agt6h5YLX1qIor8TvGTqmZ4Fa3xjQaVDq4Y?=
 =?iso-8859-1?Q?LKSonynepA8WNXBkxcSugJ/OayXGZpr85zg/UNsEKu2kwENJCumEWDqidE?=
 =?iso-8859-1?Q?Sp1G2+sxHNCI3dRQ8jNIjXVusoYAktgCnYF0yCweTDFSSdupEpFMj7JMmD?=
 =?iso-8859-1?Q?LKbNcBsm2wrJwqVi7NZqw7vbRxaYmjne39VxCcZCiafhaOnKSGvA19VMqF?=
 =?iso-8859-1?Q?9aj8feIIG8uJWvjHww/zLiqe8Lv919ZX9NEsxpRJBfbBxblyHjXJNd9ZmG?=
 =?iso-8859-1?Q?p9lNoEb9yfGX5JFLwsE7VEV5issqRBynD8DaEwf2f4NvYcEjZepTpB8qQW?=
 =?iso-8859-1?Q?IqMp8z9jSl2ghK1das46MJOf2/0iwy0kcACFLCYy1nocWLnOj5v9t8b808?=
 =?iso-8859-1?Q?lTHvdu3I21tPc+AuSv3LKPwcCM0BX6Xzu3UOUuMo6t8dziHsoe2h6QYjev?=
 =?iso-8859-1?Q?JVIbAsWbhNKYNYY8qChgnMsduGu5KhaM3dfKAUBZ5gW5Ux?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	khvMWXvJLMlYYqBRh3gpWfo7LHz3TY5n8/AX0AvsO97fUKu1xqNsND3IxtLMOQCCIvZH93QZX6iqYe2/He9oMU1lvxGrKW3UiIEDn3lFHQ8LM4tQ4HqhaC6LSOYpt+LS8lUAeDe21ASh0oD9cG9Kzalk8Dq4j87PVVLG9b39lz9w7mIVD3RlxugC+MR8QmjXm8n/8R6zsMAuM8yWctuMH0SFwUWyI2B9NbEJPOLXsuq1EA5gGK7IXEmTF1lp0eUcYvIeN/V/X03n5QF2y9JVrsc6Hzaytgdacxa9Y9l++mWLUAtuSaGOAEeFcGELsVxUO5JLwoc++qpMYwj4bncGOA==
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR05MB8708.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb219a8-8865-4217-c70b-08de79897d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 01:00:55.5155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTvQCXisGeKCosvcsdgAPGFn0CI9X4hIjkdbK6d1U/Z25T7krEQwgwdzb9Sb1FFbQbhVsETBgeU+VvN8rb8yAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR05MB8521
X-Proofpoint-GUID: wde7Yo85VMI58dKHbDBZrLC6I7Fvi4cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAwNSBTYWx0ZWRfX3vmM5q133jOP
 6BuZxmDUPYT6wWA/jS7o7FgfW2pBhTurcVGnJGvz0II5Kkz4K9oZBLBTcNoLMrLUH7wiLrKMj97
 4I4ENPMYj8dEUdwkFv88pzTvgomETQ12O+ASNXeXOm2xZBcdP17qx2nIuFvXsAt9SoiXz3flLiG
 ag4C0xW12LoJkLshs7zK3Yd/uJjEViYKP25cybKtme3VMxp87oAsug4CVsMZbjIEmOo7+1tnLyJ
 WYf6WjApn7F4nEthInOoFCUspIKu+PLUPhYEGX5O+NkDAfe1lfLoPjy776/nuSH4qYP6xvdno+j
 JEZU8mpmH4mpcOA088nPmZvRe0Q4ydJip42VuMUtVwxOByDnx6+51eVeF0F/sYjp0KYIODAOFYb
 R1ODXy9Kx/HhdVmjjwLF6Hmp53zynaEP2diAgw8uCVgaMVNwls6a957Q5OGiumaozmaTpJFc8/D
 HlD0SGAO5cNyXlLR4/A==
X-Authority-Analysis: v=2.4 cv=UfhciaSN c=1 sm=1 tr=0 ts=69a78450 cx=c_pps
 a=q0rL5DqQyazLQqY8Xi1ihA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=rhJc5-LppCAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7vL3O5uBSuztJ3xaqtyr:22 a=O1S9G-DnkxobS-ZkPuRe:22 a=OUXY8nFuAAAA:8
 a=VwQbUJbxAAAA:8 a=XEP7nfSnI9DmOhtiKToA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: wde7Yo85VMI58dKHbDBZrLC6I7Fvi4cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam
 score=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040005

From 166d8a9220dc783b752cb212937a31e6e1adc811 Mon Sep 17 00:00:00 2001=0A=
From: Sanman Pradhan <psanman@juniper.net>=0A=
Date: Tue, 3 Mar 2026 16:22:08 -0800=0A=
Subject: [PATCH] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs re=
ad=0A=
=0A=
The q54sj108a2_debugfs_read function suffers from a stack buffer overflow=
=0A=
due to incorrect arguments passed to bin2hex(). The function currently=0A=
passes 'data' as the destination and 'data_char' as the source.=0A=
=0A=
Because bin2hex() converts each input byte into two hex characters, a=0A=
32-byte block read results in 64 bytes of output. Since 'data' is only=0A=
34 bytes (I2C_SMBUS_BLOCK_MAX + 2), this writes 30 bytes past the end=0A=
of the buffer onto the stack.=0A=
=0A=
Additionally, the arguments were swapped: it was reading from the=0A=
zero-initialized 'data_char' and writing to 'data', resulting in=0A=
all-zero output regardless of the actual I2C read.=0A=
=0A=
Fix this by:=0A=
1. Expanding 'data_char' to 66 bytes to safely hold the hex output.=0A=
2. Correcting the bin2hex() argument order and using the actual read count.=
=0A=
3. Using a pointer to select the correct output buffer for the final=0A=
   simple_read_from_buffer call.=0A=
=0A=
Fixes: d014538aa385 ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ1=
08A2")=0A=
Cc: stable@vger.kernel.org=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 drivers/hwmon/pmbus/q54sj108a2.c | 19 ++++++++++---------=0A=
 1 file changed, 10 insertions(+), 9 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj10=
8a2.c=0A=
index fc030ca34480..d5d60a9af8c5 100644=0A=
--- a/drivers/hwmon/pmbus/q54sj108a2.c=0A=
+++ b/drivers/hwmon/pmbus/q54sj108a2.c=0A=
@@ -79,7 +79,8 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file,=
 char __user *buf,=0A=
	int idx =3D *idxp;=0A=
	struct q54sj108a2_data *psu =3D to_psu(idxp, idx);=0A=
	char data[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };=0A=
-	char data_char[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };=0A=
+	char data_char[I2C_SMBUS_BLOCK_MAX * 2 + 2] =3D { 0 };=0A=
+	char *out =3D data;=0A=
	char *res;=0A=
 =0A=
	switch (idx) {=0A=
@@ -150,27 +151,27 @@ static ssize_t q54sj108a2_debugfs_read(struct file *f=
ile, char __user *buf,=0A=
		if (rc < 0)=0A=
			return rc;=0A=
=0A=
-		res =3D bin2hex(data, data_char, 32);=0A=
-		rc =3D res - data;=0A=
-=0A=
+		res =3D bin2hex(data_char, data, rc);=0A=
+		rc =3D res - data_char;=0A=
+		out =3D data_char;=0A=
		break;=0A=
	case Q54SJ108A2_DEBUGFS_FLASH_KEY:=0A=
		rc =3D i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, data=
);=0A=
		if (rc < 0)=0A=
			return rc;=0A=
=0A=
-		res =3D bin2hex(data, data_char, 4);=0A=
-		rc =3D res - data;=0A=
-=0A=
+		res =3D bin2hex(data_char, data, rc);=0A=
+		rc =3D res - data_char;=0A=
+		out =3D data_char;=0A=
		break;=0A=
	default:=0A=
		return -EINVAL;=0A=
	}=0A=
 =0A=
-	data[rc] =3D '\n';=0A=
+	out[rc] =3D '\n';=0A=
	rc +=3D 2;=0A=
 =0A=
-	return simple_read_from_buffer(buf, count, ppos, data, rc);=0A=
+	return simple_read_from_buffer(buf, count, ppos, out, rc);=0A=
 }=0A=
=0A=
 static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __us=
er *buf,=0A=
-- =0A=
2.34.1=0A=
=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=
