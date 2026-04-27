Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF351221FBB;
	Mon, 27 Apr 2026 22:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777329745; cv=fail; b=Q8ozPNKMwXN2qSJyUa0PGzTgP8y3tB+MMT2YGQLhwQ6xFEVgc+g5pTuXKwh994N3H9mDLW8Hm1uDxztS1sHMGizNUvDiZEWNIFr6pwopWr+3R0N5HYexV1SFawdw1Cy5qLDGzhlpmAl8O7Y13T/7u/0t21gl/HxrRfxOIAWQO1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777329745; c=relaxed/simple;
	bh=n45KwdSxVipIjl1X7pCsYx0ycIvvAkiXcVJo8eyWG/8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k4Wqv05YZQFkdeEIEdufQUMhAp3tr0t1xDPtgS3g0rzsx0kd+T8GUsZQGyV2+EUBBzriscEZZWcGgJ0Dnx6SN2Bj2tbf5n9nbGtYLnuK1V21x0BzD48kjg8t4WA9azGhcKjfLHoVACRJ26wGf3gXVatHfYNLPRZ+xRbJilqqyUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=DSXpq8FM; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="DSXpq8FM"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RK1OFD2241361;
	Mon, 27 Apr 2026 22:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=n4
	5KwdSxVipIjl1X7pCsYx0ycIvvAkiXcVJo8eyWG/8=; b=DSXpq8FM8GSo6sjNDp
	wZwnQszISKbz3IonHaj9uF2tv3WO6Kp75/ictxzw92tkbiVRSclakvYND4Paoxvh
	w/JXb4cOTn8AfNRZF6f8soeHGRHmdUTatkwaShEMqwGPyLaGhhrNuzCRGQ90TAyi
	82G67KdgAudNeOkPZDijK6peN/ydxq3GcSPTxGzMU1BTL4bDpOhRiFXHf+dedwTv
	AMSvvPiUONDvNvo0h8Tc/jUP3NNBLiODJoR0lqPC32VYwQWSUoKT9AynrFeTbDM5
	cS7Vd5jbplO2oYyT8tLdKeOw0hrYMckPfv/R+0vMRDQnG3sOBypUZ0jzyo9OYPN/
	iBIA==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dt3pshm8k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 22:42:07 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 44565814905;
	Mon, 27 Apr 2026 22:42:06 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 27 Apr 2026 10:42:05 -1200
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 27 Apr 2026 10:42:04 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 27 Apr 2026 10:42:04 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:42:04 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO7VrVRmQxPBdAtBLLNRBWUIwKID6SqxgEpACpQtCLbjXLzdI/QBx662lxTZ4YdYLvfNnJsVVll/mR2zy/gL5sGfwK0CUUH38dqxzH5wZaFwsmj8q0yomVFsFOTaBY7lVClEWpB76lbKVcTSdi1YA8iLzA9GbBQ2J8AghAznH8ZH89LyHqk8vVd7DV1Um/ZDZVnCGUHhjBPbLND2NS7Lf1IEy1+t8ilmMjs+VmuXYmRbMwFLBeaaUOVytJmaIsjXb3/42kclJRztSsxthVwKc1YnBInBPNx6zuliggk4P2rZSPR+F1NWQg+wJbhD2K0gwoQVIAtU4XS2pmIyD1hNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n45KwdSxVipIjl1X7pCsYx0ycIvvAkiXcVJo8eyWG/8=;
 b=doDpYx/dyRC3tMLl54Rg1/v5JnrVrlHRPQ9FQdidbDtzSVjpG3Zu6dD3H3ay4KRCADW9s5+QAIW/PcygNL9nK35WEAGoCZKjAuXrPJKar/r4yDkwnAIaWFSgFMaQQLbA97SPRyerhneUKOIcjYSqxoi9sABAxy+On+x36WtsXgn7Onjr3tq7Rx8y1Qr6yz2o/6VokMlCCxnjY+qAUMjqJxWVvKohcNCZGDT1ocg3BY/5AymZTOI4/IoR3NR9vKNt3/oebswxflXiWj3g7K1D8OPQINoQITmWPkRJrJQS1SVE3CurCpaHlvgKUsL9lYx+a/d5yQc8cggmssTqJwfgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by IA2PR84MB3902.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:4b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 22:41:58 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 22:41:58 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "alexandru.tachici@analog.com" <alexandru.tachici@analog.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH 0/2] hwmon: (ltc2992) Fix threshold write and power read
 overflow
Thread-Topic: [PATCH 0/2] hwmon: (ltc2992) Fix threshold write and power read
 overflow
Thread-Index: AQHczexHcT0jH1LS2UaUGZGqO/Jd5bXzkjcA
Date: Mon, 27 Apr 2026 22:41:57 +0000
Message-ID: <20260427224148.838187-1-sanman.pradhan@hpe.com>
References: <20260416215904.101969-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260416215904.101969-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|IA2PR84MB3902:EE_
x-ms-office365-filtering-correlation-id: 25936610-bbb8-4fa3-574b-08dea4ae30a6
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 5Bz5M5IcGXFI/yzMt4lOrJ5hePo/0GMp34rnGRbhtL1o1oAmRqVNJifxOZiGV3oFnDU5Gfjdjj/ljAjfVVQJjbMLY6gVEkEMdpBT7KyK3Y8MiujPBi5drlqomKtjDOywO7QkTi3zwODhZbMUwdLUcAYiG+uqlE9GGC+r1w2auPq8HF+BAgeaSUIIS8Q/yUf/nkUETkV4iH9kaHPS2K5LAquIlR9XPQZ+Qd/Htmu8iWXZpPHS2mb6cSfvhAVBCzxCBiSjdsK1CSr6iV52VqwnLTIzz7a/cWt45OTwfwZF8NnSYnx5w8GXXuyKMkOaCjRJs56tsmWMmDYbAlsE9hafe7whdp6IfYOXjtwRiq98u04Xe4lqC6+0wcVXQdwFiJq4yNqs+ilrkgGQdlV7mF5B+wcX60eyM0rLUEOzGAskI5tZuupC5EbtLO2W8hmYyyhOjdrRJmMEnzdAEPPsw5hV6naesphXhf0ZdF8BQQMdGiWvaKBlYL9gqeYAIxLiJL6R0RZ/KQKvGhrLeL+AXWTG1uQfvE3EcSueACAgjbf9G2SkONF9+WSRgXuPyAvB8rKQK8gSqBP86JJRdAGy7ayVV2txsO/01irA6nnbXIPrMz2OAUiBZa0loU84gVFWl+J2U1y5qrhIu6N0rTiyLBh5Huc6txpC9B7cwx6j6Fdv7U2Jj0X9LM4RztiG7g/MPokBZY+CwcG2sExKLJHvbAC56AYnalv4yZKh1Jby+8j2R04=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kuIcGWh5J4G6oGVdjt6//YW0Zh4+yJWivL++jXsBhk3Mqe0luMeLyZThzH?=
 =?iso-8859-1?Q?SX22lp3UyKKwKi+4xBCsim1hmctFgXajic+j96hM9Lbn0SsYPcM1XBsdN1?=
 =?iso-8859-1?Q?1I0fT0rRoXPlwwKDm7crBUcxpxOurJDpq+1LZXy1wHqtZ9Cldeo7xQnnpC?=
 =?iso-8859-1?Q?UTg1pTYKBCifZDlKmeRjQx5dYdTefrjJSmy3xZIAg9Ojj8Sb/FcftTSzZE?=
 =?iso-8859-1?Q?cx6pJrKlMeRBDbko46e/lqon9djwoX99eY7+DwAwP2n2kLXFESMPnh0Lwg?=
 =?iso-8859-1?Q?THmbK2YZz+uC3/21pSKYsq+hoSTM7RTBwOXbmsGVRx0Q637Mk6ezOtve1J?=
 =?iso-8859-1?Q?2r2QoG5QeX5UikvoT9NKitqBhoIxVrFseDloqzwUKHbCzUiMgFXOUyKTpv?=
 =?iso-8859-1?Q?3s9nXnTPDazk4lhh2aLFmFb8txlxqIiIF4SjpMsgHAQhLiVgPgBICMpBVe?=
 =?iso-8859-1?Q?7EZ/QLpEXkBJC3aaCt/EESS1Pqjp4GBQRzgdVdq9uwLXCwKc6LnkOz1bCV?=
 =?iso-8859-1?Q?ux7OaswvYErWZzF27AN7Kc5ZBkBYQX5y3GbXBALTEcybMj83AJBZ9c3wfA?=
 =?iso-8859-1?Q?VJ+lCwc8PGGG7qpCEOHjCQXavukGfXTXf/YWin6NfVNywUyiJ35Cw9qIvE?=
 =?iso-8859-1?Q?yaH1wddSCYHy0LfnxkWphs4a1z/j4SUmiFFhCZn2T8nJ56+N2D63F5GH7R?=
 =?iso-8859-1?Q?ODRA/ZETuWTpSUyF58KpNQpKKOHrAi91XRjLpp1gaEsX5iwimSQclfUrf6?=
 =?iso-8859-1?Q?SWzLpjUJa8JtcA9NJwTOdp+E0ikdP6UtXZxTwc7rS2YOaIF4+qRALSgatW?=
 =?iso-8859-1?Q?0SVEsBXAjrKLi3m3Lfesa3TBd99nmhwTlm1Z2anXdkMZ26chtNrGX+dM9H?=
 =?iso-8859-1?Q?EbJec9n0PsP7ydxyy2T0lkf44y0f4daibFxBbsBmRtdI8rPMGR5xJRHKHu?=
 =?iso-8859-1?Q?Z38p8XmocMfsY0/hqLH71jStp+hvBRYr8ULIHU1gs2+iHMx5IdFICoAmyY?=
 =?iso-8859-1?Q?kA6jlwqXfoVBIxn8fsUEDRq5heIgD63YBzn25eBsi7703MPH8P86bIM6w/?=
 =?iso-8859-1?Q?Xod2kNiJEj199Y0notrFn8grIYKIF/QmfAcWanPFn7vshm6OP6r5+9ykBW?=
 =?iso-8859-1?Q?CYDdJEmzd8muh9+2DJqIWShe64fqN1QFY55HHUl6cNQDenpid8eZeGUSQn?=
 =?iso-8859-1?Q?bxIgDhT5MobBFMbkuWGNi9/jCiTwHElCLXQb/E7jcDonJ+OiKktIRZ98uL?=
 =?iso-8859-1?Q?tiLPxGvTaC6SKqc/B0TVvT6xb65xZNVrjKgE+Fx/mGrefVRFtTSJ0Ar2vS?=
 =?iso-8859-1?Q?9XyWy6ATxvvU1BYqo82wEHdf/R5S4gP/nS7x9jgzRN3iv4A3mHkom7pHBc?=
 =?iso-8859-1?Q?H7eVxNvGfUqkgJbC3AmJ9A+ZSAc2tvgd3JU3Rt56Yp0cXRFN7jL4c9l7/w?=
 =?iso-8859-1?Q?UOhiM6mK9btJKGzNyx7TYvcOBsF/ULfJOurgAcKBEHmz6v7K/tbIXSq0Wi?=
 =?iso-8859-1?Q?RBWniDIVVZpaeozHeaMGnU3IzPFzhEhrHPQcumsTzlWdK/JY6Jpb2F3++S?=
 =?iso-8859-1?Q?itOpPsqSVPPzKYmE9yuSshPjarhvcTkkqDUPnqaIX9PrJuZNH1oJbvrT2X?=
 =?iso-8859-1?Q?2AAaDV0E+o1k937XQQNtfVITPbW8u8C4WQs3ospjqZCk4t8Rala6QuYhWl?=
 =?iso-8859-1?Q?yev1PVUgkPOfY4MuZAXzG6/2pyHSbSEjC+Lac3cplwXJHZZmqJ9wJ6GTbI?=
 =?iso-8859-1?Q?j7BmTvMEqgD00+0Vb6brfutBO9g+p/lBb90y7t1NhEm5OLxlhCnVlJabSP?=
 =?iso-8859-1?Q?3KbE7udtGQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: r9831hp1+6eckNr6D2JyoXJVzTnxrWFzdHwDQqL792X78CMIXTdLEznWqpgww/s9D7yIophYEIxSSxEEAZzJvvbGcsSCYcAWMaljUePNiI3oXFlW3WdqA4o2uFdNfXYbRSWveWpIYqRNlNUCHuNDgJ7daeSPfvK5XdDytS37hCKAhAlcUEcjt9Lnkv6buppzAtNdpxydZ+VvjgUqz5VgPeH2x4EGWCsKYzWmkL3Duj2hoIXp5su1c2I5u1FJQ66eCq1i28SdKGB9osk475ND6njsbdli5FMydd8z/S+cufqATpuc8U6TRbbBx+CF3FFu/IzqLXP2GHkM0RFvAqec8A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 25936610-bbb8-4fa3-574b-08dea4ae30a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 22:41:58.0047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ou51EkLKu1Smy39PMalkeDZV/rsehO5Si2Kdgyn9UaANEQolRD4QrnB7eR934AqEKjS6SZuXD6w2V0gCEGXYLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR84MB3902
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDI0MCBTYWx0ZWRfX8yy4foobm+fk
 2Jq8tL3OqXCqapdGkBiIrvvJdXIthu+oCGepIYoujgzlf5gGBk8zjTj9mH8DxwXxtpPLdoxdnhy
 vDCWOPqQBvS92lJ+sdYiTXZh/tEZRVcAXo5M84UalbjQhiEpFUWmaDaYxURKr7o8T/1Q6w1nQ9O
 3wFvohsldJiMzUfHrjGQTLvoqUnFE4gA6BZwatRYv46DYpcY+5B0KVLVhcealAm1vyNR1mpHoFO
 lLBut6zFv2xxuqVcx5MaSpA657X+ca9VFBeenAuY3lZ+ZaBL+AAVPo/orVJCiwsiaKcmpUz5hqc
 dl6+bKpLUZqE6JRp/GFbZcgAzeIXs2W9+mX2uR59zZUJQehV1f6wwQ06uRvKXBgprGnKubvTEhP
 BpYNlssskjrFiTdBw5Zk9qJy/3bpmXEmfAb+TCuBqx8785vqAbXvES/PJAbIbg3pdimKgthOarr
 XoFHJsyI9s1mYKiclzg==
X-Authority-Analysis: v=2.4 cv=V+NNF+ni c=1 sm=1 tr=0 ts=69efe63f cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=c92rfblmAAAA:8 a=MvuuwTCpAAAA:8 a=OUXY8nFuAAAA:8 a=wUoR1ENiE8Gkyg0IZdwA:9
 a=wPNLvfGTeEIA:10 a=VxAk22fqlfwA:10 a=GvGzcOZaWPEFPQC_NcjD:22
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: o_iOFUdpHVVRFrNHNYZkctrPyc4ghJKm
X-Proofpoint-GUID: o_iOFUdpHVVRFrNHNYZkctrPyc4ghJKm
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270240

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Hi Guenter,=0A=
=0A=
Friendly ping on this series. Please let me know if you have any=0A=
feedback or if there's anything I should rework.=0A=
=0A=
Sashiko AI has already reviewed the patchset:=0A=
https://sashiko.dev/#/patchset/20260416215904.101969-1-sanman.pradhan%40hpe=
.com=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
