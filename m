Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2D339861;
	Mon,  1 Jun 2026 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339567; cv=fail; b=QlQeX6XFNV824/hMkYovxmyamzSC8IZiZzoMffIrMcKZG46pL+SY+zyeVnoSYTB3rr5u1ONxzU2KXTaraCfVP+gZJtNchCF6zxkNHYV9tpvpJXh9UPdX3VyM1GCOZuFD3eP6ouSb87K0+qQw97NL9aIpjwNV0nPOn7044KAVHGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339567; c=relaxed/simple;
	bh=B0HgmVZeaAUVbOzp0Jx01VqU7e6ITBJVTFazYJjEIMo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bF1m+zuMR4EIiGu79nvOZKjI2QbbWE666JhOqkLmtVsDHiC3dE3PAb7ijR0sW8YYwh0ijbndoyR2M+jH5YRro0ddUkWFeqQtupmEGW82uOJe+gO8pNsXSDkBZTHh/4hDpbPn4CDlWjy97Dtd7CvCfINlfFJ2iaHkmJGAUdKjcUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=lo+5RHuw; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="lo+5RHuw"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651HHN85134142;
	Mon, 1 Jun 2026 18:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=I8
	vQHcr5MIeINRKGdFYUaft/FRncLYDJEuMBGQ4c6zQ=; b=lo+5RHuwnCLl2gD7O/
	8BfKGCwXXF71V/71dL7/fe6WPLCy8wQrcE76ACr9XpeoSLv8CMS6q9qngszflTFA
	mQz9T1V3onXVJo0xh/XJhNVbtCoxyKauqy5rkucT8Zcuks5MMqY2gcO3KBpqQvgG
	dUME+IlxVibwCIK21Us8sww+Ba6MaBC6I4ZJsmqp0HqU9IyYlMUTCEp/jgjNiOAn
	kZE3LdZloxjjbONZBA77qICcxaXryxxcgUAytR6gANOpyMgYoSCPP2E/Z7X8Z/t8
	8OsXDA3YPUJrxVgF5lZgrj0YPQLORHC2FPCMJ5JBVdfFrygiNVAItLPmB3m0sBZU
	GImQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eh977we1c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 18:45:47 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 57C1D132CA;
	Mon,  1 Jun 2026 18:45:46 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Jun 2026 06:45:38 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Jun 2026 06:45:38 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Jun
 2026 06:45:38 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZtRwCTCWj+3DxhUZPSoX6l/Ksi1FSHIf7TTGe4Z7tI4ssUtqJkSuwUjKCeJZElr/pov8WnIOjt6zeNO9RTmiNLO/Sx6U3VWgFFljjfVirkgV2yhDRyzvLm/eCWJUhJoR7oi4OwnzAeQTrG5MgvFQtDfEAJIDm7pn1XWz1Y/HVceP3gvy7122jjTECdmBrUVFanjaIsJEW05ntlNCvOA+VDfmhA8qu4Trougi/k2rihIXz39jSLjGRbbY8L+XAasNlpa0AuVIQqLQ3ffaR3e94vTwRjcXQvdHtvmUUb/arictD+A4nAwJynS81SXDNVlprI5jiz95cNkIvoPOUWF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8vQHcr5MIeINRKGdFYUaft/FRncLYDJEuMBGQ4c6zQ=;
 b=t8aUVKPej/FhANDQT2LBFJvm+MkV8YMF7hxpDy6WXZWnthZw652ulJhe0dd1wdMEJyuXJ2gg1gX2R0SYMcYLY01cawJJFHMY7tzz9ao7CGlH1tFoQIIxbZBqKb7kADXC6AIWVIqHONBS+oLmZnA0lVXTTwBJvIkPUyuiNaRtNEOvZiJjgS3k+NIYfuwwIUrxq4J8+m0m9FpuM2JAxoFh3i7fd9J4qG888B6msDIgFerghg6p91iLiHZU2Ft5iwPISbldoZyynJwmX3F9D24Jqr4C6AHscMbOFn1ccHxpEz6+czQJ2Msx7bHLyvlVVWe5LKPPkfIW/teChFye9wk3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB2095.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 18:45:36 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:45:36 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "noname.nuno@gmail.com" <noname.nuno@gmail.com>,
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc8fbVSQ6G4ERqRE+l021qjWERhg==
Date: Mon, 1 Jun 2026 18:45:36 +0000
Message-ID: <20260601184516.919488-3-sanman.pradhan@hpe.com>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260601184516.919488-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB2095:EE_
x-ms-office365-filtering-correlation-id: 9ca812e3-a737-44b3-20e3-08dec00df813
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099006|38070700021|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: Mi3G94wRDBAD/HuorwfwRtKf9jViM0eSQSeX1adWwXtVKKwFpvQRr7qY0ccfK+vQtCb7Mgv53kzVIgiWQPqt8rKm8bmghkX83otrdeZMHKmwbAU8UaLFdk5yN0WkkcwAymFsZg+cOMyyMWjo1ZbU49EAWkwq9WxNmWAnacKEo/4fTmL9Jia/VDVCW+kSMNO4QREiMpQSKZQoLVXjmwYcb2WY7WVVQeAbiVeOY9V1xzVP479Dfu6m4SGfJ8jjhW2eMoFGijPmiPxNw4uovboVsRlJ4BkHY8/v0jYVm+7Ub0PmofmbWwDmksKOb2BuhQmvruF3p9E7RX0KK+Fzh121DmcslsRW8V+xFw5A/8uvlvfHRnLBf+xQiHdiXnsW2d8ddpWuAABPeswQGyzPYJb/+FsM9WBLOO8SC0D/iBYLUxRrfAL2xnzZH+59hzOm4g1Gv+tKqs0t65xY5dgyrnuy+UClRT6ObFAeO7VegTIdWQr7rkYKr29wPGd78NgtdsUdXjIfbvlVCh/Nb08KzoKi7i/xG2+a2TE8k+ysJ+V+447ktopw5E19c+S0MolNKxBjeVw8+zL44Aribc5j6+bGrMddjhoXYKQlhYwNZo2IYVdaHNXbc4T9bZD2Lde64JsjivSuAxSxO/FrcRQBP/mRzdmqlooi/za/4N2+TvQtmWic5VX4RmiZMfQWxPHGs1hBfUSC5NsM4Wxb+YXT6Nd8b6kzDYecYmBYbqNOTqnMEVMzaN1oCLEddvE00PJ2mDqz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099006)(38070700021)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0TjOJ0I5J4qrTJz2MoiRZuK5xu5ThW9k1qf2e9x5Dx0A9Uh8IL1stEYUk1?=
 =?iso-8859-1?Q?YfeOo1WYugZfGgkS7sGuarUn9ZI2NTJbl1HcSDIgoDNA0jg1mrkfDOzb62?=
 =?iso-8859-1?Q?lC2+jK8fnGL9hEaRgQoANJCmbR+O5QVn8EfE/jf+dER4kK1ycX66/swSER?=
 =?iso-8859-1?Q?t6MRvrvhyEsRak2et4N7rVzwsyDkMyp3qDEneVZL0tNyxZcOGqOtdVutt0?=
 =?iso-8859-1?Q?AktZXUV1Nq3qoazyEAcnny6rbxAmhpsrwE6lygQkGetTsg8OvDt/D389PC?=
 =?iso-8859-1?Q?uOxFxxB8iK1avgUz9QWjlScbhMRP9qkLFMarB+ufhgKSkPEVRPLVye0Qtl?=
 =?iso-8859-1?Q?KHeucjeLnpppWbdZi5C2TBHxI92WnvTbl/RRMD+6dAHrdn+BbWmjigoqoJ?=
 =?iso-8859-1?Q?7IcRwQy/vwcr5uJ9fCxAtPdBd5DN8AwiAzMYRSjzzf+dCbpTriT/BZWhzT?=
 =?iso-8859-1?Q?b23R+r0klyXMAayIoymyxmHPneXMbb3tdbz9N24Lb9qfqPBwqXkFhxq3Zi?=
 =?iso-8859-1?Q?DB70uNnzLRjshUzuMZK0V1C+NoO5A55QBksFQHtfg5qv57aWXkOJwAcfr0?=
 =?iso-8859-1?Q?cdd23rtJ1OLE6g0dVXEY2Ah1Z1H4M6Yxk4lt0tkCeZqqAX5X3MSqfdOJ9i?=
 =?iso-8859-1?Q?a0pGshVPn0We2rpLmz/syk51mM0rTchsZ1IImzujsHXXuhZof2Mt9WtH05?=
 =?iso-8859-1?Q?EFa6SZBZ11l6QEJuLo049ejOMKSpPam2IafMW6YMoAVai/wktHnHW+LmsP?=
 =?iso-8859-1?Q?g7G8ULS7Wxii+IkW+BfWfVP1s5xzrkJWPKSYPmeJchDXaHJoVl55O3r+Cr?=
 =?iso-8859-1?Q?tpooiuJdbsF+vTGzasF6lNejFbSZNml4n81fBVd22faHgLFqDh2cpoJKcg?=
 =?iso-8859-1?Q?KcOuB3sxRuSBvrHxPUsHn8SDXt2Tl6o70is/1FQGLck7y2GvAhthhmqCxg?=
 =?iso-8859-1?Q?dfAqKOb83sRhGJ/tp0PhX3lN6Vgl+UFfh2Cj1s/5wxzHIQZSaRCKIWp3HZ?=
 =?iso-8859-1?Q?iFtv/tSyHJ+BLmkURCp1np0dzvGtF4wtUQ5FL3Gcr3Ti0uw/Fcq1+K7Y1J?=
 =?iso-8859-1?Q?uaVOxCxITmnPEhH2w8MoG9HyrAbF2HMhQP6FfjNiKWHXC5+TIom0a6R+nk?=
 =?iso-8859-1?Q?speJsGlnjcPY9BEDPmhCbjce2HNAUSwh2wHyeFEC24285Q9Ooo01vGWkqZ?=
 =?iso-8859-1?Q?6I8/NdqX77GkIEm6vbaqon7vK8v0dgRftFdlYpDi0jLr/obp+SDIr/9ouC?=
 =?iso-8859-1?Q?xtWeGu2B9/jF5GAcW2c/DbE+RlDx15G2ZMQXZOPZKoLkLC7G+nF3+eDwBh?=
 =?iso-8859-1?Q?IfCY2C5Y1I6RF+VTq3GXHdtPy2ub9V2IdHpjf5XwFBkskRBDDdDEWHkx5D?=
 =?iso-8859-1?Q?bi7TdZTN3xLEOI0ACx+sUyYRGcQ9nq/7CDUQ3KjcKZV+QgTiNviUqe09EL?=
 =?iso-8859-1?Q?6H88ZkyGeRy/nEJChlTWjXhabHq1C49MF02dVBlph6ufsHNmXkaZd3Xc19?=
 =?iso-8859-1?Q?pRijjnoPbDfZEKtjRf4r0TwbhhldAuGt5xcyDC9kVvba6ApW8VjLM+Px67?=
 =?iso-8859-1?Q?coDUdiRCC31YEjeewGVvq4tOA+vq3QtFxkLRvaRrvlvMA8EfKVtO3NfVxk?=
 =?iso-8859-1?Q?7NwxFKVmFuu/MXFojFAO63w/cvmE/GTBr8+Q6Q7hQoD1P7vwtt8TSQ8rkq?=
 =?iso-8859-1?Q?fgrCbRUZZ0MzKOKAf47VHmXYdNRw0D7rl800gznu/6LXg82BovjFnzTXjB?=
 =?iso-8859-1?Q?21gIf3VxZjIsT9bu/PfFq4gBODGNfvTjFn4HGlgBDfop+wiOaTxG3gec5B?=
 =?iso-8859-1?Q?CdXqjXkPYw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PannzK+ON/COBLm1sQTkJmJqQt8k6NFgUW+bz15TAgbKRfTBVy1vi401HrM4rJ9SchP5f0vC1ie0iJd62FOz5mrVKiImLB7E840dZnsK1EHwCHrn5sDpj3bFuoK8FqTg21uF0Adh3+IZR51rENuzIOz3hrRNHJ5aIZ90otUT9Mwg9bP/M3/NsQ/yMJU7aXWOZb/t7U2GmoTLqDLHGuuUGMH8/z4yrazB89ALx0Tt23Vgfd5eFEtNAawwJud4C9Z+U1REXJhTdFM5FzPW5mDkvp0GglZ52o92XWbBElh+rD/onfai5t3ueBFb0+4rutbI7PMWvOOppUBhv4ECVRFFRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca812e3-a737-44b3-20e3-08dec00df813
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 18:45:36.1822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lS6fKtZ54bWQwXPKd1kaH0oPd4E0DSq8I5MvfdWRgkntxny+2+Jq+8dsVP79Kwi7A8RQ4dHyq8Ar9BMu8ZM1lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB2095
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a1dd35b cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=gAnH3GRIAAAA:8 a=MvuuwTCpAAAA:8 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=QFQsX31oA95WuY7O5AMA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: SdChk52YH4TEk64dX-UbWFcYIlWugOx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4NCBTYWx0ZWRfX0GMc+fyICqfP
 oTZ3Lqy+QJivEsgbe4Tsx/ObODVq1Qns2CeH7agprRBFakk3KTgd3APD6BVSWW72fATriyaCARp
 6m80FWdkgZM2TZVCh9caXivQH7J+1UauGF82a+Gs8NE0U8Ps5LClloE0WX4cBMh1CVJTFOy0GtG
 wGkTe85jf3yqD6z8TS18A0f1rlFFLN8lU5Rxzv16txlvHCHj7TLcYtERF8Znz11NZ1dG8pGIZcR
 eizliHCH1DDJ77qo/5FT8ASQI6w8oy9c9Uftdu9Decejeo9UNzZoYmTA6RPswRHuaJHzYpZBnXo
 f5+EjFrw2ZIlBrYaKYW3qBCC+6Gh/UZU8yX+yj0XR8PzavGdvG94TLUkNhOZH9zTSXOalWvaLZv
 5M2UuoPtdKUdFG7ZW0bt1Lk9040dMVtR9XYHcdeXPLIOnYdtJ44fhUBZgk3KvZZMS/7rP1EXH1i
 tdZjC7gwxBV2XhXGzCA==
X-Proofpoint-ORIG-GUID: SdChk52YH4TEk64dX-UbWFcYIlWugOx4
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010184

From: Syed Arif <arif.syed@hpe.com>=0A=
=0A=
Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC=0A=
switching regulator. The MAX20860A provides monitoring of input/output=0A=
voltage, output current, and temperature via the PMBus interface using=0A=
linear data format. Optional regulator support is available via=0A=
CONFIG_SENSORS_MAX20860A_REGULATOR.=0A=
=0A=
Signed-off-by: Syed Arif <arif.syed@hpe.com>=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
Changes since v3:=0A=
  - Added optional regulator support via CONFIG_SENSORS_MAX20860A_REGULATOR=
=0A=
Changes since v2:=0A=
  - Drop "maxim,max20860a" OF match entry=0A=
Changes since v1:=0A=
  - Removed WRITE_PROTECT write from probe=0A=
=0A=
 Documentation/hwmon/index.rst     |  1 +=0A=
 Documentation/hwmon/max20860a.rst | 57 ++++++++++++++++++++++++++=0A=
 MAINTAINERS                       |  8 ++++=0A=
 drivers/hwmon/pmbus/Kconfig       | 19 +++++++++=0A=
 drivers/hwmon/pmbus/Makefile      |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c   | 68 +++++++++++++++++++++++++++++++=0A=
 6 files changed, 154 insertions(+)=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst=
=0A=
index e880c6ca84f0..ffaacda416e7 100644=0A=
--- a/Documentation/hwmon/index.rst=0A=
+++ b/Documentation/hwmon/index.rst=0A=
@@ -163,6 +163,7 @@ Hardware Monitoring Kernel Drivers=0A=
    max20730=0A=
    max20751=0A=
    max20830=0A=
+   max20860a=0A=
    max31722=0A=
    max31730=0A=
    max31760=0A=
diff --git a/Documentation/hwmon/max20860a.rst b/Documentation/hwmon/max208=
60a.rst=0A=
new file mode 100644=0A=
index 000000000000..ea6d2228fafc=0A=
--- /dev/null=0A=
+++ b/Documentation/hwmon/max20860a.rst=0A=
@@ -0,0 +1,57 @@=0A=
+.. SPDX-License-Identifier: GPL-2.0=0A=
+=0A=
+Kernel driver max20860a=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+Supported chips:=0A=
+=0A=
+  * Analog Devices MAX20860A=0A=
+=0A=
+    Prefix: 'max20860a'=0A=
+=0A=
+    Addresses scanned: -=0A=
+=0A=
+    Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+Author:=0A=
+=0A=
+  - Syed Arif <arif.syed@hpe.com>=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+=0A=
+Description=0A=
+-----------=0A=
+=0A=
+This driver supports hardware monitoring for Analog Devices MAX20860A=0A=
+Step-Down Switching Regulator with PMBus Interface.=0A=
+=0A=
+The MAX20860A is a fully integrated step-down DC-DC switching regulator.=
=0A=
+Through the PMBus interface, the device can monitor input/output voltages,=
=0A=
+output current and temperature.=0A=
+=0A=
+The driver is a client driver to the core PMBus driver. Please see=0A=
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.=0A=
+=0A=
+Usage Notes=0A=
+-----------=0A=
+=0A=
+This driver does not auto-detect devices. You will have to instantiate=0A=
+the devices explicitly.=0A=
+=0A=
+Sysfs entries=0A=
+-------------=0A=
+=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+in1_label         "vin"=0A=
+in1_input         Measured input voltage=0A=
+in1_alarm         Input voltage alarm=0A=
+in2_label         "vout1"=0A=
+in2_input         Measured output voltage=0A=
+in2_alarm         Output voltage alarm=0A=
+curr1_label       "iout1"=0A=
+curr1_input       Measured output current=0A=
+curr1_alarm       Output current alarm=0A=
+temp1_input       Measured temperature=0A=
+temp1_alarm       Chip temperature alarm=0A=
+temp2_input       Measured temperature (secondary)=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index b71acb130395..1d9651947ee3 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -15688,6 +15688,14 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/a=
di,max20830.yaml=0A=
 F:	Documentation/hwmon/max20830.rst=0A=
 F:	drivers/hwmon/pmbus/max20830.c=0A=
 =0A=
+MAX20860A HARDWARE MONITOR DRIVER=0A=
+M:	Sanman Pradhan <psanman@juniper.net>=0A=
+L:	linux-hwmon@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
+F:	Documentation/hwmon/max20860a.rst=0A=
+F:	drivers/hwmon/pmbus/max20860a.c=0A=
+=0A=
 MAX2175 SDR TUNER DRIVER=0A=
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>=0A=
 L:	linux-media@vger.kernel.org=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index 64f38654f4e7..f330dc3f21fe 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
+++ b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -402,6 +402,25 @@ config SENSORS_MAX20830=0A=
 	  This driver can also be built as a module. If so, the module will=0A=
 	  be called max20830.=0A=
 =0A=
+config SENSORS_MAX20860A=0A=
+	tristate "Analog Devices MAX20860A"=0A=
+	help=0A=
+	  If you say yes here you get hardware monitoring support for Analog=0A=
+	  Devices MAX20860A step-down converter.=0A=
+=0A=
+	  This driver can also be built as a module. If so, the module will=0A=
+	  be called max20860a.=0A=
+=0A=
+config SENSORS_MAX20860A_REGULATOR=0A=
+	bool "Regulator support for MAX20860A"=0A=
+	depends on SENSORS_MAX20860A && REGULATOR=0A=
+	help=0A=
+	  If you say yes here you get regulator support for Analog Devices=0A=
+	  MAX20860A step-down converter.=0A=
+=0A=
+	  This enables the MAX20860A to be used as a regulator device,=0A=
+	  providing voltage control through the regulator framework.=0A=
+=0A=
 config SENSORS_MAX31785=0A=
 	tristate "Maxim MAX31785 and compatibles"=0A=
 	help=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index 1f2c73b71953..ffc05f493213 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
+++ b/drivers/hwmon/pmbus/Makefile=0A=
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MAX17616)	+=3D max17616.o=0A=
 obj-$(CONFIG_SENSORS_MAX20730)	+=3D max20730.o=0A=
 obj-$(CONFIG_SENSORS_MAX20751)	+=3D max20751.o=0A=
 obj-$(CONFIG_SENSORS_MAX20830)	+=3D max20830.o=0A=
+obj-$(CONFIG_SENSORS_MAX20860A)	+=3D max20860a.o=0A=
 obj-$(CONFIG_SENSORS_MAX31785)	+=3D max31785.o=0A=
 obj-$(CONFIG_SENSORS_MAX34440)	+=3D max34440.o=0A=
 obj-$(CONFIG_SENSORS_MAX8688)	+=3D max8688.o=0A=
diff --git a/drivers/hwmon/pmbus/max20860a.c b/drivers/hwmon/pmbus/max20860=
a.c=0A=
new file mode 100644=0A=
index 000000000000..905f916f6c08=0A=
--- /dev/null=0A=
+++ b/drivers/hwmon/pmbus/max20860a.c=0A=
@@ -0,0 +1,68 @@=0A=
+// SPDX-License-Identifier: GPL-2.0-or-later=0A=
+/*=0A=
+ * Hardware monitoring driver for Analog Devices MAX20860A=0A=
+ *=0A=
+ * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Developmen=
t LP=0A=
+ */=0A=
+=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/regulator/driver.h>=0A=
+#include "pmbus.h"=0A=
+=0A=
+#if IS_ENABLED(CONFIG_SENSORS_MAX20860A_REGULATOR)=0A=
+static const struct regulator_desc max20860a_reg_desc[] =3D {=0A=
+	PMBUS_REGULATOR_ONE("vout"),=0A=
+};=0A=
+#endif=0A=
+=0A=
+static struct pmbus_driver_info max20860a_info =3D {=0A=
+	.pages =3D 1,=0A=
+	.format[PSC_VOLTAGE_IN] =3D linear,=0A=
+	.format[PSC_VOLTAGE_OUT] =3D linear,=0A=
+	.format[PSC_CURRENT_OUT] =3D linear,=0A=
+	.format[PSC_TEMPERATURE] =3D linear,=0A=
+	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |=0A=
+		PMBUS_HAVE_STATUS_VOUT |=0A=
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |=0A=
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |=0A=
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_INPUT,=0A=
+#if IS_ENABLED(CONFIG_SENSORS_MAX20860A_REGULATOR)=0A=
+	.num_regulators =3D 1,=0A=
+	.reg_desc =3D max20860a_reg_desc,=0A=
+#endif=0A=
+};=0A=
+=0A=
+static int max20860a_probe(struct i2c_client *client)=0A=
+{=0A=
+	return pmbus_do_probe(client, &max20860a_info);=0A=
+}=0A=
+=0A=
+static const struct i2c_device_id max20860a_id[] =3D {=0A=
+	{"max20860a"},=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, max20860a_id);=0A=
+=0A=
+static const struct of_device_id max20860a_of_match[] =3D {=0A=
+	{ .compatible =3D "adi,max20860a" },=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, max20860a_of_match);=0A=
+=0A=
+static struct i2c_driver max20860a_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "max20860a",=0A=
+		.of_match_table =3D max20860a_of_match,=0A=
+	},=0A=
+	.probe =3D max20860a_probe,=0A=
+	.id_table =3D max20860a_id,=0A=
+};=0A=
+=0A=
+module_i2c_driver(max20860a_driver);=0A=
+=0A=
+MODULE_AUTHOR("Syed Arif <arif.syed@hpe.com>");=0A=
+MODULE_AUTHOR("Sanman Pradhan <psanman@juniper.net>");=0A=
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20860A");=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
