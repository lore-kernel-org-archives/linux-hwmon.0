Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1EE3815E9;
	Sun, 29 Mar 2026 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804222; cv=fail; b=Kdb3hJCaAcc9JbKWNk6jjeOhnAgfrk0Lr5vKfBn6QdcxNLWaNLvkEx5X5Idws2PO3+I4lUGmpIjjlEd2odkItUsNucLt3HhBFKhhJXg1p1XSh+zdMq5HIkp8g34S6iJDJd/KN1b1U9f+y+JKDYKz7KuJZT6bJwPj1K+UOujlejs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804222; c=relaxed/simple;
	bh=ZCp3Ud485CiDImoojh/VHpVkLndQF2RbUHq33ZkiM4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BYDZ5uPuzP2kiuEZmq+T7sO3wjdiBFGHnISg/niLx/T8bAJowXGpNU+dkiLnplZi1Yuw/30fIkdfJ94rN6KQSSuvCAMsiNKQ+XFP+UvTM/malBAF6KthZpZ75X3zIT5j4P/dgUCoTv07tawjIUqmdYQhC7rqll9gTA+TaOW5wms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Ddh8sus6; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Ddh8sus6"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T333W91185456;
	Sun, 29 Mar 2026 17:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=CP
	Aaku9dGUy4n1i4a7LFFxZ25e07OFj6trPDCPXtBkg=; b=Ddh8sus6qf2ji+dgOc
	R1ocw2InbK8cnH8wMLfBYxGbBjxqFVX7Y60xYY4oieSMC6aFPKawJwWppPii5HUh
	yObaWw4WxhXhKlfwB3/7yk6w/0gKKriFPMLJzhk4i4eTo7vueCW/yjDiHfrFRWPV
	aqTnZvEKlRmTBImY/W5CjWMiu0n8hvCF7+xg9aGBZf7Mslvs5cDAVWRKVnrfY/Bk
	ln8g+Lr0pRHU03reJuC3dU8EGzgGSGf4krv1nJh+vcYQH8Y0PkocdO+FhZ6vktBk
	7Y/W3qwY4JTvC1Z//UiCmy9Je5ZwWWd9jAr07vAzRrcrFYut1l9UhVAWJsK8cxwl
	0lPA==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d6utuc336-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 29 Mar 2026 17:10:05 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 372BF802BBA;
	Sun, 29 Mar 2026 17:10:05 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 29 Mar 2026 05:10:05 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 29 Mar 2026 05:09:58 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 29 Mar 2026 05:09:58 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 29 Mar
 2026 05:09:58 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdcR9hWCf7Y6ha7LGsiVqkB0W9ckOo2v3WIUoOfZJlertFZRq/SIlm7fedQPWn3FO7zaqO6R1+BB7JAR26fFhTSXMhPMw/uoqVW9Jwd7BAYQGSz3RDph6iieduVAQ1PJKV2oqgqyKsRL67KqVxCf/RDysq1WCMeWl7F1k94SszSPsgH/Rxd1M3+1EmkoiV4JAXzo37Hl+NU/aIzcEG6gTtnE/JOCsJ0SIo5YyWOU4GfnmkbuxzV8L3kbqt9+pPVZ8x/JQyzO/H/zTbsOOLdoD2fC6cWguB8ISK1lmJsUAzvZakZycx0aQBIxJTJ33XnUicll+yYphLrQRs9LduYsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPAaku9dGUy4n1i4a7LFFxZ25e07OFj6trPDCPXtBkg=;
 b=OmgCQd/rLscKv0llqvussX4yaUJcilakFPVmxZESke7dfOu2UKVTm03EX+0FNyEtSrHBw6nH1BfsR/BLd+T80RcSjx1xRbfmcN0MNyb9AdsU01DaTKjbPjUuSGrAiA62wI0NTbiUBeXrQfnnpa/xJyBs/KbAlDnP0u1FZVoQJTJP4TS45B3w2Vpcul8/56QJIw+I9cRNkQAVgxgGjzMGoKasz/FdMTrvJchsnkoT3AzxRZ8VTc3DkEmIXi07zeslkMIvpVLJVmw30qVvIi2p6XkrVphlH5MkCna1Tjpp3CkJXrO9Ov0DNBUKOayZ560BvhhhbCqA+dRQ0wKWLXa/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ0PR84MB1992.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Sun, 29 Mar
 2026 17:09:44 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Sun, 29 Mar 2026
 17:09:44 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "Delphine_CC_Chiu@Wiwynn.com"
	<Delphine_CC_Chiu@Wiwynn.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 2/4] hwmon: (tps53679) Fix device ID comparison and printing
 in tps53676_identify()
Thread-Topic: [PATCH 2/4] hwmon: (tps53679) Fix device ID comparison and
 printing in tps53676_identify()
Thread-Index: AQHcv57WBISaMU9p50iwQJWEl89COw==
Date: Sun, 29 Mar 2026 17:09:44 +0000
Message-ID: <20260329170925.34581-3-sanman.pradhan@hpe.com>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260329170925.34581-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ0PR84MB1992:EE_
x-ms-office365-filtering-correlation-id: f5c9da0d-f4d6-4e02-548f-08de8db5f95a
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: erkkNOGfF0LMKH8TddksVE4oeDP8AvrIAH+rJkiXc1XVl0aB/cZB33Sh7ZZ2Hw6HlTU3yJEPPFqoTDRFfSSk3NDmjADoikdeyvikZj+/al5AnptA/lITdQ7VBXISt9kHloX3mlJ9tdBbJolknwQ6MaOoHz97SFGcYsXebH/XIcvS7D6OU6eGd4e+zCpyBxLVVpKlv+sFgYiOpD3HozAaF2SAAgOfKh7IdENpn32dERjKFVoofz1Y5XjxODEa6gpY4Ut0H3r+RDmHH+6Pg43ZtkjEWjkcvdEotZ6mtapde9eMvXJLGBNMPLnNUf4ecJvPJmsja/WWd8P4sa6WCeYzeBf8NHntwz4X7Eq/4vo0kHNOt0ESRSuqh5Kq1ybKExNz1evtghBytm009iTYYBDCNqgb2l7kvGmhHbD7s6YCymhbOT2JIpybZKYudXJK5k5gDW0JYqKVU1ymHrNg9SNufiHeqzwHldMuoHxNX+scBFK3cihtkb8Xik5aMYBuRrXPw/V/uK5rZECThybdPS0GDdQyJnQ9hf5ZzfE/TwOBNt1pxdra4X3uoYXgYOdIr2+7QHccblHh4rV3bl/iOweHyzrTuCEuDb3epan9cftwZ/7gqWM7nIROHhKcEK3hMOZSk7KNS6c4UV4z6pKsvEZ2pF+hK8l/Fes5Vy2rL0qMp8TscCwbMxtlm8ngbPguTe4/N4Ri/gZlpl9G1dkP+/CyOw43pqxTZDoEd0ByrL39OxPROnk4pxon4DrBb22DeJDbIe77yQvDcXjBACidiDJ5lH10nAChnUGFBb6qqTOjLX8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vqUgx/LLxpvwjptquNwFeE8yvncThe5JMo+W3xH6qb5y+geohtuJvoc/wA?=
 =?iso-8859-1?Q?t5kEUTcpxKru971LYwqAQGIXNSKtMdMdBvxbB2wFYOEqUQrujCEi9wMHIO?=
 =?iso-8859-1?Q?JhdrpXWTeb2PS6q72piOj+O6CgQidt9a5rDNfVuGPaRSToGKT1bpB3AZdF?=
 =?iso-8859-1?Q?N3Ce6igU1h9JvaCaKfco4bzjrqz1oNpGxbGdryM6xe5WHxfXyf8B1uIes8?=
 =?iso-8859-1?Q?NbrAk8TUdCidgo4e/RfPQxFQ5KtqHk8ewSf/wWj37N+L3mNutIT7WumN11?=
 =?iso-8859-1?Q?hG6y0nWnDjIPX5BzCG7EQZ1Yqt7aFGHzjB0IejDPVsnXBnT1B/BHLFmD9J?=
 =?iso-8859-1?Q?yhZwB8rPO36n9ezrfMDM5WHPugIY5+CFZa4p6ZL8EZVwmszHzM01D5etb+?=
 =?iso-8859-1?Q?sv8KlWNhXsxu3cGvxs7lseYwt08TkLe0R2tA4cyk8aUVyoOA3wdc7rxubN?=
 =?iso-8859-1?Q?ZOqalgJQ4gbxsbcJN0SaTiXBSyaYGQ84YzcnPCquPMEGZegYeHxMv9pfaq?=
 =?iso-8859-1?Q?oMnimM+cCmPqD3OzxeYHO/ptLfTCmGzkJndw9T9QWtg1B/3hPuAqdLEOgi?=
 =?iso-8859-1?Q?x3KRT1nZEWiRCRY3/+RN28b6YeG/kYwMqRWYxdjwT4UhoS22JxYKTgxDh9?=
 =?iso-8859-1?Q?55FHGRzDkUGJiKg+08HgqF2xNWDe3mKobcQNRKMC3GSGbYcqAzkFj2hsdi?=
 =?iso-8859-1?Q?LlfFm7W4UVkDLV4Ho34Io9Cpsalb3vY4JObyoFFBcxn+rNmbVf0dqwsBqo?=
 =?iso-8859-1?Q?hZACYreqrfHKk9gnTo6GYJOWFuY3Dmntt0PiIhc8LrgWt6xBDD3mzQXAPd?=
 =?iso-8859-1?Q?zeMofR9Wmxt/XK99hK7Wq6rxk5FcxdiO/NTMcpDfiWVmD9Tcl4FZjeYJRb?=
 =?iso-8859-1?Q?Sq/PtNS2a5rfTQMYCOlkDz1PdJYKEYaVcFA5MVwBsQ4xTFQh2yoJARLMgn?=
 =?iso-8859-1?Q?cdRuyOi4ak4+P/6c/J/iJB+OZWuSI0wjs4omo61wOY9kwKcHNaDoX2M6Uh?=
 =?iso-8859-1?Q?TlgsKDJdeiKhV3010UEqRjduZ9IurKXcoun3PtFC4WFe54EHUfQ052YA+2?=
 =?iso-8859-1?Q?4oOAXSQ/xC8buo27jYxqIvLVxhvKEVK5BidqDqbjbMwuunAvQZV2H4eH40?=
 =?iso-8859-1?Q?obYLZqCN6iBNYuZz7ef9cl+1sISidQjT4wXo+62c3uK7afJKYFwte1m5+R?=
 =?iso-8859-1?Q?mT6fqCtJtk1zTC3k6aKvTAYhoYlV7g4Fq7tz/BGreCr30hkDlMkW37vOAg?=
 =?iso-8859-1?Q?GGaVA/+lzyDXoC83DotTImSxXJrtpT62918d4Ziwd2IReu5rTY8wdQ5lkm?=
 =?iso-8859-1?Q?MpeQh4KGEg40CocSRbW9OnWtkeF4gcbWpzm4R5qRrbt8efC/tVbhScPBNi?=
 =?iso-8859-1?Q?IiYSEsPu4D2vQ0r28uK0iLkxrj5bWPVgTvRzFxVRFOhy/C0ltG6PE2gOcb?=
 =?iso-8859-1?Q?1gXxlNhcv7mLpCgR7/wsgqd00r8fmS756nr1IROSobrGa5TX/KTBcUUCo6?=
 =?iso-8859-1?Q?MGY6GblkJsCpRtBWFoEcRt02mnW829PZffQ0LHwjLpnZ5OiF9+F1HEmTgU?=
 =?iso-8859-1?Q?GXhE6v9bOSZ1qvxHJRoHT3GaOZY2tsoq2UzqilG0x+NhVZVTtImiZ7xvc9?=
 =?iso-8859-1?Q?O22JTWF9gL4HgRjXFXVVXmPD8LYaG51qm4hOl4tu97ACO3IfVP36Bm1Kkj?=
 =?iso-8859-1?Q?n8Mm63ukOe0wgHYya60RWDFy3PAOSUpfpLfrDG2oPdDT37/u8H6QyPRDZq?=
 =?iso-8859-1?Q?vR9la1sZt1ozafzT/xypzM0ytMslxGriPqBZS8YB2edrEAfuJPaVDV4uYQ?=
 =?iso-8859-1?Q?HeoQLvYrpg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uNcmfGeyKesR3hVEJHtLwiJxN5W5ag09hU/K4PYJ62KY0XKHO29LHIDvP0gY27ck0PvH7BAm+q71zYs/qD72xWMwbKEfUNa7fVBrmWDKmb4U79gRtQRwTXxnOA0TtljAzxXnhv4EqQHLtLJb7+UO0CKVpNwsPNaMCYUcKjvCWa5VIau2YKirsFsf8SbO+StlvA7mXc3LhOppXtE8NCYn29Dv6/iSqQW68Rf5u4D+U6N50gw/YdT7kU6sAq+Ti5xrJNt41fVMOE6RHu8tstkyOglTLJ5E9KdIzd6wEr9wcyhe/8RwRIK/Aae7RazN+Oc76gF/ktUsU6xSDUnPMFK+Dw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c9da0d-f4d6-4e02-548f-08de8db5f95a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 17:09:44.4919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gmFlgI8F+4loHuQhvmy88FPaVtuEdW+dQr5qQ8FTrIUFLUZlj/xprsedFVbImm0AbMHVo7ShhoVjPf8TiB8G3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1992
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: Cvnhj8k_1pRhyqVyQ2pwAwL4wEJT3hvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMyBTYWx0ZWRfX65GRdDQwrCIb
 k3xgUO0YAtDzS23N5uZEe54rrn7Gez6AihQsQ6zlnCa7sTMPPh0ZoDg2+hGmT78xIxRNgvjvYir
 /6OOnqgcobRrlA0P0IadH+UhdNc5dJSieHbZiTIpoPhHBUVCHu2AUBe0N0Lt0YcoOj4XaDes0xC
 XnO7CTS2EVOUzeB9NCzEQVJrQNPIgSpNPlB0fwvA6bpFXSThS3smDbhO9yDKTnLAiPP6qrpNe/p
 1W+XT11wsLzgESEkMCzVXfML/LK5MeAbsIEBLrisGLZOK/Q8D8raen/wnZiWGreOvtUco3vmlS5
 3GKbw6YEguwjtJ7wQJihvNJBd2ABJbJSBFtnbvdKYWdmoM2mbCpUkhxREvKdDgTh6/xXyN0Csi0
 vK/PSmhwz6ZiX3hGGwDeYftekTkcpQXSxwg/ZY2esaeewBuOT1g1nAaVu5dHqGSVdz63StlQC+0
 MBiJsDXyhS1CukDr08Q==
X-Authority-Analysis: v=2.4 cv=N4Mk1m9B c=1 sm=1 tr=0 ts=69c95ced cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=PDycEKfu8UU9aoxfwVMA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: Cvnhj8k_1pRhyqVyQ2pwAwL4wEJT3hvc
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290133

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
tps53676_identify() uses strncmp() to compare the device ID buffer=0A=
against a byte sequence containing embedded non-printable bytes=0A=
(\x53\x67\x60). strncmp() is semantically wrong for binary data=0A=
comparison; use memcmp() instead.=0A=
=0A=
Additionally, the buffer from i2c_smbus_read_block_data() is not=0A=
NUL-terminated, so printing it with "%s" in the error path is=0A=
undefined behavior and may read past the buffer. Use "%*ph" to=0A=
hex-dump the actual bytes returned.=0A=
=0A=
Also add a short-read guard: if fewer than 5 bytes are returned,=0A=
report -EIO (protocol/hardware failure) rather than -ENODEV, since=0A=
a truncated response is not the same as a wrong device ID.=0A=
=0A=
Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 drivers/hwmon/pmbus/tps53679.c | 8 ++++++--=0A=
 1 file changed, 6 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.=
c=0A=
index 1a6abc32afe2..d6600502d6b0 100644=0A=
--- a/drivers/hwmon/pmbus/tps53679.c=0A=
+++ b/drivers/hwmon/pmbus/tps53679.c=0A=
@@ -175,8 +175,12 @@ static int tps53676_identify(struct i2c_client *client=
,=0A=
 	ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);=0A=
 	if (ret < 0)=0A=
 		return ret;=0A=
-	if (strncmp("TI\x53\x67\x60", buf, 5)) {=0A=
-		dev_err(&client->dev, "Unexpected device ID: %s\n", buf);=0A=
+	if (ret < 5) {=0A=
+		dev_err(&client->dev, "Short device ID read: %*ph\n", ret, buf);=0A=
+		return -EIO;=0A=
+	}=0A=
+	if (memcmp(buf, "TI\x53\x67\x60", 5)) {=0A=
+		dev_err(&client->dev, "Unexpected device ID: %*ph\n", ret, buf);=0A=
 		return -ENODEV;=0A=
 	}=0A=
 =0A=
-- =0A=
2.34.1=0A=
=0A=
