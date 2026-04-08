Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFB529BDB4;
	Wed,  8 Apr 2026 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669004; cv=fail; b=fDVevq4jRV1iIFkZ6HHV8LuH4V6WJVy5jreRYfzHkwICsjylFMkaUEy+TmKFUFbh9a5lpp49HbnldBj/3R/2cDb2biuWDL4lp+rgpp4oQEo952XslJnwCizh+a/YYXrozgSXhc5UhTo2NPAkDQxzhzVDf5oZ+XeK6PHPsESI07g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669004; c=relaxed/simple;
	bh=MaIKM8s9ukSKE4lHRPKTXyLhi2EaqbiVSXRe4Ry9Bz8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qOMfiiftv59TPoCZgItz2rJRU8a0uM9vfRy1tonHGGMbXRRzLNgUZiw9pznvqJwQGXn5KaEN01cC2UgY81zPar+JdiOfHBDeLLkHBjjjIi5fDt41GGRb9psVv85Y3sVraOLWlJ25Uz3fwFv9YO3vWW8X8PcDYDSoE7vtFgjoqtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=HLZicLSk; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="HLZicLSk"
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638H2kPJ2568910;
	Wed, 8 Apr 2026 17:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Ma
	IKM8s9ukSKE4lHRPKTXyLhi2EaqbiVSXRe4Ry9Bz8=; b=HLZicLSkQFrW9YX+j/
	UjqzGzdkI7NxUshPZ1M+HJdyq7pVju4jFvs4fZ/rltoNouGFT/0E5UfGnA2RPlWZ
	TNnGtqygsHaQWPjgMFVdtvV53qjOWhZJiSALr2+1W79L+dGgB936YalPr4bfSK8s
	sYLOao+ES0JBU5eEIA8ip85GZTE9kXMgBc24C/2tOyP05T+itfw8Em4IeLonvMiY
	6oIAZg3r5KHkKeM7UB59HLvGV/10OQntiBfkDa7tz/CipCC3rkoqWwBI1m/8AMzv
	P8pkrisE7W67GRxcM6PsdS5+thSxhp1ySTBnyggazIM3VZQ2yPso7wuu/UWkjgjt
	EZHg==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ddrbyjm7u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 17:23:02 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id A3C8E80170E;
	Wed,  8 Apr 2026 17:23:01 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Apr 2026 05:22:54 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 8 Apr 2026 05:22:54 -1200
Received: from SN1PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 05:22:53 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxsCIs7d2SbV6Dnr6KKjW9zPt2yKpez9Y+oozPSx9jj6rS5MPwscz4IV//iY6gCc22P9QFZunVhmhCfl/+oPzDMEH3eMynWxZxVQ4hQoIs/nrV6EudOjph4eDPEdNnhgLbyfaGbjMmppTaRptJFkHiqIJmkCMA6kYkLXG+6Bk7bbN0rO+4iBHYFUvJtu9It/IWG8QIhF3v1h87uaDvMcODsIr4vFvHdomoxhiZcsXTKk/SVnJI5J3bkPa8NQHtb9bqrVAKy/uTwbRQDhLew2VzJAj2VfNnxnfaIQxwA6PK9+wIYxrhtQXMXOa7NzOYllI52wzAP1loyvVrT4y2cksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaIKM8s9ukSKE4lHRPKTXyLhi2EaqbiVSXRe4Ry9Bz8=;
 b=RXQK1fvFPYpVe4eHLa4NijcTq5C+SKY2NOSSaDAppflk5G1AOw2fx4paJ+AYeNvZswNxW/TQ+mqgxe/KL2FCgfBZLmrngHLSyTB3LBxy1HFsJnsOpjV8ULt13cqCrRy099RdVDqnlAT3Uvx1ZgIDlqRlY9HEzWDoU2kziZlneKGWkbvtE08J8fi20kQkBvEh6L7YeaoqAI8nvy9fqayCerQe4raHHsgWhMgqolrKhPXOaI3nZcJZdzMcKEvNMigDJ7EqQa8j2/rAdS3oNeyCfc8BkyL++iFTWfhNY0Bpzc+ZYhvy2RKFRJpdT7/1KMS3RO7Ps9jdnvMGNs9H1qQaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MN0PR84MB3890.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:4c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Wed, 8 Apr
 2026 17:22:50 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 17:22:49 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "cosmo.chou@quantatw.com" <cosmo.chou@quantatw.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH v3 1/3] hwmon: (pt5161l) Fix bugs in
 pt5161l_read_block_data()
Thread-Topic: [PATCH v3 1/3] hwmon: (pt5161l) Fix bugs in
 pt5161l_read_block_data()
Thread-Index: AQHcx3UXpqFH/jPqO0CU/2nuRJrWLrXVZdIAgAAD3gA=
Date: Wed, 8 Apr 2026 17:22:49 +0000
Message-ID: <20260408172240.357487-1-sanman.pradhan@hpe.com>
References: <20260408163029.353777-2-sanman.pradhan@hpe.com>
 <20260408170851.86E78C19421@smtp.kernel.org>
In-Reply-To: <20260408170851.86E78C19421@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MN0PR84MB3890:EE_
x-ms-office365-filtering-correlation-id: 7e617ba6-1901-4261-6948-08de95937596
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: L137NXFs1LylUs3qAzGjXphfzW9k7CmUvEjaxmnTLasbeww8Zt13m85LBs4dZumnXhMh8bvBCE6H7JOBhoOL4n8QHih/pHScwUvbtQPGEKAF1oAs3ggrT/39wrprbilSs5XRwH1JT4s4OOUY2D6CWRv3L2FFJ/3NuKHt43QmK5aEQ8u4+FNt4srnC7ARBmHmKdbcSg1kBDVLZ6vqYf6jOGu2J+8ySeAzzfPB0FnHfTEfV+9W5v4yVR/2UwmpJOiDnXa5+7TVQIMuliPpH+PzUM/PoOQdOfO34VrthDAMCY8TmeXCoptzaD/1uwKq8k4bsN0+RUfcqiT9TdcXqleeLIu0oM0DRqCFaCZlym0janrzRS9FNWBh+0jbb36NS4VtAIH+oP7fxyC0P6Btfqt2ZrS8iVyhQJ79/eD8u7UZd0l68zzaoBzqVZqdXAHdM1Wbd0+wKMoofhyM6OxixQiUiDH+ehL4Tlpr+ys9Wlx6QxS+Hh3QcIwRTnMnzPbJ9FS9UPDPqdic9WkN9OuPvGPH/dqVss986s2KkyWXLBg54IK5lFT7Uxn8pYfcgCgYP+HM+YIiMtGa0e/h2jOZigKA+H4RLupdTrQeoY7tzCwJOI8/j7rGm4B5F+VEq1B1Dsi7Vvtuq1No8t211sI8DlACOajvtL1k7FfEHweP+8vHZv/cTQhAKsCuG4zpA53fk48JImiv3+IOuqHcJZ98BBg7zG6MUgvYuow7NSuq3sXDzQlXlA5fomjQ6dJsa22Seqn9nMgTUM3V82e9HEA9aoEAEyT5PdOit7b3x1piBzQmpaI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pgBFQmG+6VxfYsD3meTJhhc2HTTqKis1U/rHZbFxgA3rxeWuSUwfvzSS9p?=
 =?iso-8859-1?Q?EZCevI6rHEvNenex0wpbHQJp8BUyxFy4IO2kLSrZQQJcs+qhBCEupZx6c+?=
 =?iso-8859-1?Q?3ud9GWpprBaVp1v8ap1vR1s82dx2zjF6WqisvHgAF7hErlq3lVlzOacm5T?=
 =?iso-8859-1?Q?UMYK1nM1QUOkkjlRE3TkZ8AmgwA7/nJIxmC8fg3kRFKITaTDR3548jPTOh?=
 =?iso-8859-1?Q?5Sxkwazp2hohe34290QNf3Jhlr+csUyE1eW5i7Gub0Qdc1J1ImTZb7Y1BV?=
 =?iso-8859-1?Q?DPwBMYwQ9iXQHSSeYHoP1h7OEg00UFD1lQJ16NrXVN20qSNw6qj+0oYx1T?=
 =?iso-8859-1?Q?ovkp1Y3JaICvAqP5dwNqHO0M66O1lMsS38VZuZ8CROpTxMycByE1EkUIfc?=
 =?iso-8859-1?Q?Vxq9DFIQZoEoV5v0cZidFt2SdfJspkc4WFAy/wG2kauOs83z3dlRhu/5+R?=
 =?iso-8859-1?Q?fxQm6lO1IQc3zfWuAKxBC6bHbpnqVSLjuS6awFy+IiqyvNgCtNOFNdNpNz?=
 =?iso-8859-1?Q?CUa6DAqL+Yh7cS3h9AyTfaqhTsoDsauLLNGJmkmLzA/RdK2qfgGR8WAELu?=
 =?iso-8859-1?Q?YsI4+xm5K7BOOizaPXPOzsUJ5f7mcP77o9K/FHXS/n6HkKQQtzKShFqTED?=
 =?iso-8859-1?Q?pskbwdLb7M+7ZD6Tg+WYR4QEX8goECF0twCCSxTH4lxZqakxlQTFrFMUdj?=
 =?iso-8859-1?Q?FzhARB5nG1Z/sN8ZAUFuZ/YXUGoaNq/TkU5oBvE4Ebx51sbFSamV2zHRIt?=
 =?iso-8859-1?Q?QCpbqjIMIxz0mk65udkQV06qK5jThuNjDK+CELkXTbhbQroZYjnP3qNv0g?=
 =?iso-8859-1?Q?79Xbcb/8wDXbZ9xZUqo982xEbs2BYcuNbaS2g05f0fpP2tGtpDebCIY+Og?=
 =?iso-8859-1?Q?M9dignRtAsuycD4EGZFilwbaZDkVFnygcNVvxLZznOoKTPbwg6/eHn6sgy?=
 =?iso-8859-1?Q?g/GAkBaQ3EU9q+MO3dpOohMF6g5UZea0clBiZY/NG7dlmrgAFlMQhdCV4e?=
 =?iso-8859-1?Q?QLfz8nUpHxXAwl/+nPrPOTfpVq2bgihzpqT1lWEyMjAN/Y3ae0R8FtMSyO?=
 =?iso-8859-1?Q?IoaXojIXQjOHtZg2s5y93ASYZrw++1MYTEboOFvC5k+zHAr4wQmgFAYbVt?=
 =?iso-8859-1?Q?rRY9uAvAEMHcYK/v6v28wb5lmenXtuE8woCia39hurJmFM8jBrKRf34tKV?=
 =?iso-8859-1?Q?JKC+T97SLaRETetCZhCFnvKd/xmLv6DMNycQFCci68bTTDRDmVgb1JQDV4?=
 =?iso-8859-1?Q?/tAalfV1qHjw5raUdx2r8I+yjgL4bOjephvEZjnKJEPCPGc9HPqQSunY23?=
 =?iso-8859-1?Q?aYe7wMXJK/t7zi9OMRyiI/IfsdpR+1xDhTV6MnDhnzc/51ZySlb7EdN6jv?=
 =?iso-8859-1?Q?yhxj3Vm6JBewPFdSLBG9X7FJpQdCyQ87SqC+THgtZkJcbsFaFB9oXpqnX6?=
 =?iso-8859-1?Q?gnRbK048K5x0B+PCg2rWOF9oFmAZNRU2zEkPS1idaE+fakfpzyuuh4StaH?=
 =?iso-8859-1?Q?Lmzlg7djtO9ovi/3p8iFGrlmBpJKt4dKx/b3MhxeNj9eSjmde2J33esEQ5?=
 =?iso-8859-1?Q?KLg4SZhlC3ufbYzRMTNWgSceg/GtkcBrfij4/qmj2mNO3PNvoGw2Eyixyt?=
 =?iso-8859-1?Q?1WllTVCq4KApP41PV+zrwikHOKjSl4mlQwFx/38kF6VLg6XumYH3hqqvVZ?=
 =?iso-8859-1?Q?jfqkYyqWddEFfcRtIwLOZa/4en0st4Rogu1nB95g3VOZlC7517XehDfa9D?=
 =?iso-8859-1?Q?SeJqwmJImbDmChbZ7DECxObj4MyBa4tC2NwI7I1TFEEsJcMm5tQf9zsdUX?=
 =?iso-8859-1?Q?Z1/pgEJZpw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BOSyeNersDnsDF6CvYyUmQPUfkfKMhnu3rDCkeZbXN/IQDDWWMstAiAMvzqFkGeNJj+GTsDL6trBParxP+Rkrj2MoMw/PRfk8bN6+j6xuAWNww72GDmYefAoMlCgC4ZIRHAenPpVN2p3o14QTH4aEilK9OgxWoMYZV8w4I3VvnVd31wQ0ZCDcusNEVoidDbUueQLITnZ05lc1/nwmXkmSNvdOVi57gk/25e4Gz21mVIIguEEmf8u9+xBRQN1ac6iCfch1ZJ1h5G2kEaOlQ5UGyIU31huxhwqegYYDh2nvE5OZG42YoHjnQ/HY7fyOcJkOn/KIJ2MvOxJkczl8ym52g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e617ba6-1901-4261-6948-08de95937596
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 17:22:49.8165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8uWZHql1T+RXKE9ScTjKX5qCyaRrwQr0ashqccaTwplHGSvvg6Pq7SXgf9tJ6La+klpC30XTKPscfyCFf9jsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR84MB3890
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 2nxg1nmdAyNATjAzYBzKAnfl5bZ5BhM9
X-Authority-Analysis: v=2.4 cv=YIOvDxGx c=1 sm=1 tr=0 ts=69d68ef6 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6XKncaru_qjgLvANlS_8:22
 a=OUXY8nFuAAAA:8 a=OXsy7-2igK9VxsMQsYQA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MSBTYWx0ZWRfX2KaoFFPp+qYS
 8J8hxaZdWjECf7aNjXBgyanlN3VmqxWkC5LulrW096YcCJVVvoJmgSlPQ5LleAEWnreBmb2wGoE
 qJYEsvosj4zKyjFPEyo2V0ivycxx2/Llhe6vzpYNgKWANdbORHvjcgLhGRj/Bd+4mpi8uAcZVKI
 syTlYneyU0cdPwJ7dS1XQap6yFeJQ2OSYFcUUSnYh+Pi9f9ufqRXuSS1YyLjeja679ZI5uHwV9f
 oBtBmHqUgV/fXs3SldpgQKQpHt4ig5O3ECdJA1sqYGdfu9XRiq088mJ90HzBq29nB5UAw7DgGkS
 gRgdzSiiYimSCcCmt1ymSy/jF8qI9J5uglw1pSVQbjw69nNrS5A3efO2GNASEqugp65LgUf+32J
 V1x65lIVN9X2FESaJHuQS+Dz3YRRM1m5uput761vKjWvk3m58pVTxN6NZqr5Dh4UdRFEnPvOVbf
 yb1T+Tz95JSpI19yw3g==
X-Proofpoint-ORIG-GUID: 2nxg1nmdAyNATjAzYBzKAnfl5bZ5BhM9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080161

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
I think in this case as well, the feedback from the AI, would be a broader=
=0A=
pre-existing locking question in the driver rather than something introduce=
d=0A=
by this patch. This patch is only fixing the buffer size and unexpected=0A=
positive return in pt5161l_read_block_data().=0A=
=0A=
I'd prefer to keep this fix focused, if that's ok, and look at the=0A=
debugfs/hwmon locking usage separately if needed.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
