Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E472E1C7C;
	Thu,  2 Apr 2026 23:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775174362; cv=fail; b=opR6AYvR2Ki5d1Ul0OgsKh6uN2Xv2RLCfdxC+b827IW2kMr5vIDeV/2kCSNjc1Du8vykUp2GDr3WxJm0udyZfk6FvLzOAxk8vCXTIF1O3e3dU5dVhEFFyHAR6DMCLh1nua6cbOE+adT99UIZZFiJI1A8acpTN/GML4rEkCfJL74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775174362; c=relaxed/simple;
	bh=ArN5eF5NKFuy68vxjJVU8mh7sg895oJs1xeYgktH2nk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UE6K5YJzKa07QUBBBpzv0ZI+xH+PvBg/X6eYL8lh52xGWkgGk1Ww2Hhk7QeeZK1wM/3TmZEauUkvVKuCg0Qw51NPs0XT6P9uSlwXvr+dIjxHT6+Nmu9T9jMZ+zp8Mr9T7kn35YKda7vafsZtq9DGpu5lsw3pSpK6/lLqZJWcgKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=RRyA2KxS; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="RRyA2KxS"
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632Jw04h2601531;
	Thu, 2 Apr 2026 23:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=ga6nhg7yKnW3FnHMMQoOJTip
	E3Ilc1eKtvWHZ1AwFfg=; b=RRyA2KxSUK7SenHcTyzki6aKSJnx0XGNgbNe0tWv
	3nfRMpRy3dpW1jSuJE5GST/Czs01pVdEUpt7b+Z0TEqdyGs+ON0EuNldEpvHw879
	k9ceMCGpIiWeaOsHOdfl8O/KPhX1d6Tmdwva/wpOODTkf6uL82gqiaNbVF6O5/UN
	cZ8POPruAcsByr1jGZvA3qIedSgNwPDySoAbYbuDm/TY8j/cBFKYoUtfGSrTHQrS
	vKxeiGEceLIEOq/embPR5j4VSCmMINsQVwqzgjkyU+KXV3TxmfQfc8B8Mtw0l/Eb
	TUOHimCAI5yzkUdx/PQ6nAJoyjmJdxFaBVzRSDZDdcEzXQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d9y30aakd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 23:58:54 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 1FCEE801ADA;
	Thu,  2 Apr 2026 23:58:54 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Apr 2026 11:58:37 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Apr 2026 11:58:37 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 2 Apr 2026 11:58:37 -1200
Received: from BN1PR07CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 11:58:36 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWq42TS/7/6W7kQztSx/QhD9FFZjPRn8f4cr2zmHdeO0TiX4ckJBLjH4a91a21hl5I7iJWwxW/Vs61TymH7LyqU5xn7UCMvKVG5kZp0ZQlB+5SNhw/Mxg/yY1EADrmbdSMojNj7UOBswKdj0I6hJOxh2BGqkSFe75tbInl7gtyemRnU35Mpq32t2HZrwpq11w71YUGZO7pSRe5LN1LVXSqZ1aCt+PJcEljMMq4Zl8cW3AOhHHCDZQ8vjAxtaiTr9GLij2/kZeKMTWyblY0EtJuUBbNOTlvnmp2/DO9xiOmT+v1xfhUuQodzuBsJw9KmgcjpN0GMZ01T3JRUAEk2MtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga6nhg7yKnW3FnHMMQoOJTipE3Ilc1eKtvWHZ1AwFfg=;
 b=vZRO/wzIDwqlefYQUysD0og4NjRJAhF7fVz5MSfh3lrt1yn33hbfRf1+PB1ZVKNwztwDa6YZ+4hFu4utNt+JaV4NxGqKMdpkeNi1ftQqX0wQuc2JcgZ3VFZnEqs1/Y5DDZotEcswVrawJkQ3nbJcmcOPcURvPIGx6s3IjuhkgtAGptPn7AbQItlFM+enGXdbntkxqnLlnT5s97JBNbsziTRNDrovZ/kk7f5e/xoOf04euQ+0hpqhB2f11Twqz+fKRYqKeL9IhjRaHt2JiSUqLSHN8afMf9dJbvhrqbZuP+BhVKy4TML6C1gdQqRO3FktOkba7NqyCdAmBDyHy/ZUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW4PR84MB2258.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 23:58:34 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9769.020; Thu, 2 Apr 2026
 23:58:28 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux@weissschuh.net"
	<linux@weissschuh.net>,
        "cosmo.chou@quantatw.com" <cosmo.chou@quantatw.com>,
        "mail@carsten-spiess.de" <mail@carsten-spiess.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 0/3] hwmon: Fix issues in pt5161l, isl28022, and powerz
Thread-Topic: [PATCH 0/3] hwmon: Fix issues in pt5161l, isl28022, and powerz
Thread-Index: AQHcwvyaVx7P09FPDUK3qMFQPgPrXQ==
Date: Thu, 2 Apr 2026 23:58:28 +0000
Message-ID: <20260402235819.86456-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW4PR84MB2258:EE_
x-ms-office365-filtering-correlation-id: 2b758e21-2596-4381-1fd8-08de9113bc9a
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: fcl4XjJmSnbGVHGQWVILEcN5riOA31lwehe72fPH/I/+wcubYjiJ7ZAQMXid/7M8ELcEgVne6fBIDZ9Oc2uLw8SwxlAmKepizL/yxmL2J2lmi3jjzb1Q61zKmcm/qlv35PpYRNTuAqo4xwayPBnWr5RIbLUnXQmfmvtthC04pD38Nb72tm2zPftzscfS/VaLoFVo5v03Vu+Lb73mYQzQ1qKypVxIEnFGYeyv/2TbgXmJuluYgJxZXxYEnUdGtKFOmXFIkiBzzLcwOYU/V4XpSuZilTLK8QF7QL9ocXnqkv0yBN8vgVSpPyOkiJNj2nrcIxlawXYV/+ib57inuUUn+EbnHTwwytMJkH6IcEiwqDAEQSBNdNfod/GNVdkhuA6WodMfcNmuHlUxbuO6ulN3RBn4q5xocrXFOBa0nyLC5ioDN7+XkSnBJ3+tLJUyDfiW2Q5rz0EdrEArhimvyr/WLWxXAoC+GvkLi28IQDGePDhOL3My9iARK5o4FUTd3BAr5jFXLjp+oFs8wVMLjlgY4TeJ9dDcFJzlzKqYAoLEWZ6uMVjBjTcIQE5Ydstguq6Hxp7/G3nXVr7tIIx7GiuwmFqTHW5NKt+Mx+trbUHQ+MjOnZzyDhMpeD/ATprhF/X8p8nIgf8NZSqNfgnw0OeluyeNjyJHhMK8Fim0REp99wSl93ZDBWXm3xYFE27vkkRQsUmhjgxHdnrvObikuJMsjg3E2ffgja8jJkNg0RV7zkjJWzWTGLDF6TMB/6vs4QYw9IzzTy46FFv56+PPR5ezJThgf/WSnKwsrTuhwIyvD7Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AQSm2ZW/iuW+jLOjL3MKRywNcZaLrCLZxUCyE30XcInYZqBBmXvhsDxmBM?=
 =?iso-8859-1?Q?67gVfv9If8N7Au2IpZwHNlTeL5yMZwx1OPmmQ5sI7bpRW9n5L2aN/HhE1T?=
 =?iso-8859-1?Q?UgsPdk0gXy+SMZJSfz9yPKpYbQqs7D9MutGCzLv7dh06WhjXHUS8T5Ewlt?=
 =?iso-8859-1?Q?OeOXJgSOVpgPBvYzlDL/EenWgqClYqvSbr+rfpDavXya3BOylMvcPAztEC?=
 =?iso-8859-1?Q?5HbvlIzWoQRVHQT2886maSPUXeXUyCQbsqNFTPl+porZ8HRzZOxVRYMjEI?=
 =?iso-8859-1?Q?KxcUtlWI2RPXjnmRo1ySJ3P3zbhT99xwGycloJgbPErjgfJw9GzIUwTe+y?=
 =?iso-8859-1?Q?uaY39nA6XBJEUhWcKgkuEfBzsX/2VyECi0vAQ5yX0AX4LMD0/2cliKhoHL?=
 =?iso-8859-1?Q?lm3VTSCUS1jLkfiDFqevEMUkjDn0j+VavVObAsYn2//Xa7k5E+Uo2iTGCz?=
 =?iso-8859-1?Q?plg2Jrg9qaM6ApLKJqcW12ege4i7rGMhWfadsXeO/1xfu+AhFR61dlrSzh?=
 =?iso-8859-1?Q?p30hpUd1niVEaKtHmkDckRza0YPwHEXdMsApYJT/p8WBlVVY2FtRFwtbmZ?=
 =?iso-8859-1?Q?q9ofWVuzhz8rTOEbEgkaBqqlxQVSvLz8wzAQ+74eHB/2LU5Q6CkpaLwylu?=
 =?iso-8859-1?Q?Xy+Aj2rHKyAQAYJ2JTnBL0VRcDnWdIp7+wQ8lpiKe2u8f2q0GVFZpp5PKW?=
 =?iso-8859-1?Q?QPM9KtzljRlF5OWMNGbwQkQYFF/xicc/FxszqenNEwtuA7reD7Whx9jeyZ?=
 =?iso-8859-1?Q?5uU+UFr5mJJmBRLvVBgV3LTr+mQ5Cyy/irkMF3A4UGYA6+3iQjs7vYacbz?=
 =?iso-8859-1?Q?VnAZGIklu6auKyDigYDHOSMd0mN0jK2QvdYW6fuSiFubgqmQ/Mpi/v+IhR?=
 =?iso-8859-1?Q?OC93jecT+qi5sNydLXThefPiIncHEhpLafTiNsB+dJ/pEL0TJ9AJk/JnmB?=
 =?iso-8859-1?Q?O3Iy3BnQAxHmDMt3LRDjUxghk7PcREhrl+fjCEKu7YazdLzEkQQ9L2uH9e?=
 =?iso-8859-1?Q?6djIqr17vZ9W4rGnY/J3zR7NXsoqzd3WZ/HwXTzv2LVlPcL3MkmPWJNq2U?=
 =?iso-8859-1?Q?PqHuFO14EZBIPzl40WlYYk4dMTPk9FAoAZHgRXJyWWb/eVlL1mPan5JhqJ?=
 =?iso-8859-1?Q?LgmqN2neXoi4GY/6wscL5Ga/2R3VvK2YeTfp2t7xooIsfZGKcqWkAV9Ejj?=
 =?iso-8859-1?Q?H7ykKH+GsOPWg9tGiD6bqqE5tzWosltkLFlsz+7uy9uixX/11G1Sin+DMQ?=
 =?iso-8859-1?Q?DDtT3oBmEpHPjVnUhdiVS0yv0HTCbQIzLtvDsJuIGSJsqBBc/d7X4z4Wb+?=
 =?iso-8859-1?Q?OWsbT71/uwVUfF0C3pLuQWfUkq8KTxO0bMvyOmf/FtyiV5aV10/5Xi+c8u?=
 =?iso-8859-1?Q?5vpfwT/STqE3GO8qtkO4tiSPIvRAVWuIDnGsJuW48ovPp49jsN09Ye/LP+?=
 =?iso-8859-1?Q?M+LL696nbJQ6wCYSPDx6VX9vbC8qTAqpOpJi6r1qN3H2L9suBsm7cpkLPH?=
 =?iso-8859-1?Q?yElWdNlqGe4BEDN4ZxZxLJXSgbH6+LIWjvbv3YuGnG3+7vjrTiNDN4gA78?=
 =?iso-8859-1?Q?VyxKIWOJ2vOZgJqtK0T0yjYS/QXErkWbIdQ2A5DCfj/4h4uMU2KZXDyRQ+?=
 =?iso-8859-1?Q?IxLjriR1svmeurqMNWUhPW72YxFjRsBS/0JJxoMcY4+s6v1HSW8KX1DqRl?=
 =?iso-8859-1?Q?8zObri+Q28cXFXLZ2IT5QgYnIOQu8EzDBHUNeqlJ7bUNsVGDfmFQBA3Fxv?=
 =?iso-8859-1?Q?QhY3+wyMHy1/pTvGEBH1uimWYKLfzk5ExHRIOF30le35T8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pw5M7SiRU2AZ/2BHcuA84Q/YGEneNTPPkB2TJJjGa3fmV7Vf/ppn/onGZZISDTexf6u43+awapiB/FXHtlwrgDZnC4ZMhPdxU2/PPy57ZQl1ZR4/rayIdTJAgZTK4yGl3jR7oxXSxl4spr/+KLfYwilhB70QYDGybXX4O2+CkP1WvMcwvMV05oC6UT48ks/2EC42TA57CgkMyB9l9aJr3t90LBs6bvytaoWwVmLSfAvlsBcexNeORNoxXc0DvglmoDbzOxYfglBrePDdDCwpEBSrQ+LnbWEFaiQL8hZdddDasj2H8xN4wcR6DZsgAyhOIP+iDrTp0FiaVcIO6tVPFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b758e21-2596-4381-1fd8-08de9113bc9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 23:58:28.7795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gGhk1M1ZzL3kpJmXpdICR8nbAPYilk92iKLLlbxqFnybBTKgfUv17j+XFGzdAvHIhqj7oxr4n3zp7b0UofG1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB2258
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: nL7da_pNRdHoYQpoi11cBPru1QVgmSiv
X-Authority-Analysis: v=2.4 cv=P/I3RyAu c=1 sm=1 tr=0 ts=69cf02bf cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ModqzXLkJJ0tFyq98apW:22
 a=OUXY8nFuAAAA:8 a=XCXDZ5Rph9kFRwBUh4cA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDIxNCBTYWx0ZWRfX+X9/WcAvFY2+
 HRIMmdU8qv6yHEtuk0ipkeOKDbXc6pOOqh0KI7ddulMS88cgiXHRsEA70yrLDoUOW7Rd1M+EFvz
 xGZXZqmVltNruVUnZyKDFd1FJ779kAfio7YnK4Iioaml86wT3hZFJOJyP6bH1hzHDQdb17+a1F1
 mjeRc/JgyFNkmdxIGv+v+PsB2pYlfPRJrxyAplQCASFd5S70ETIixbQqsn3XSrk6tUAH/ilcnh/
 vscPbwCZ2mI6iORKV6OpkVVgoIIpCZXLL8n8JGREiRZ/M3Dr1PeZfDr8zQ+SVMZL9bGbAHmSXyo
 ORs7vxjcyebg26rTj4+yvLSUMGBWmKs6ti+E+0JuTxnOyvpZ1TLPlp50+I1qRIBOphYg0a+F4Yt
 I4J+oFokKqfhVcQVuFvndWP4AArW0zNspcNZjmdcrVs/3lokx8gJpPrFz82s7axKSHhA4dINMz7
 nvzSwPRhH+Lenv/fWng==
X-Proofpoint-GUID: nL7da_pNRdHoYQpoi11cBPru1QVgmSiv
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020214

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Three fixes found during review of hwmon drivers on hwmon-next.=0A=
=0A=
Patch 1 (pt5161l): The receive buffer passed to=0A=
i2c_smbus_read_block_data() is 24 bytes, which is less than the=0A=
I2C_SMBUS_BLOCK_MAX (32) bytes the helper may write.  Resize to=0A=
I2C_SMBUS_BLOCK_MAX.=0A=
=0A=
Patch 2 (isl28022): The power reading computation can overflow a=0A=
32-bit 'long' with certain gain and shunt resistor configurations.=0A=
Widen the arithmetic to s64 using div_s64(), multiply before dividing=0A=
for better precision, and clamp the result to LONG_MAX before=0A=
returning through the hwmon callback.=0A=
=0A=
Patch 3 (powerz): A window exists between URB teardown in=0A=
powerz_disconnect() and devm-managed hwmon device removal during=0A=
which sysfs reads may reference a freed URB.  Clear the interface=0A=
data and URB pointer so concurrent readers return an error instead.=0A=
=0A=
Sanman Pradhan (3):=0A=
  hwmon: (pt5161l) Fix undersized buffer for i2c_smbus_read_block_data()=0A=
  hwmon: (isl28022) Fix integer overflow in power calculation on 32-bit=0A=
  hwmon: (powerz) Fix potential use-after-free on USB disconnect=0A=
=0A=
 drivers/hwmon/isl28022.c |  7 +++++--=0A=
 drivers/hwmon/powerz.c   | 11 +++++++++--=0A=
 drivers/hwmon/pt5161l.c  |  2 +-=0A=
 3 files changed, 15 insertions(+), 5 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
