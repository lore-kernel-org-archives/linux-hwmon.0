Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCF237B3F5;
	Thu, 19 Mar 2026 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773964318; cv=fail; b=mz5PBjBmO8WRYv/l60Sr0gp04JsSDy86KcZ6XhHVAb9La8OAvSik2t80pIDhiEzFbzD5gpG+UrBJsSSFsISEIwEw+vf4hIzlryGFjENcqCZUhHVVzVUAIT3tMYJQdQcT2SNFkUGn/V9ayeC+tqpJ8Ibulnf/G6PIlgCLiaBn/pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773964318; c=relaxed/simple;
	bh=XGCovpdQUnlldDenh+pHltgMGFxTy6X+EXSv0JCViAA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oC7jggBUBi0B38mTTF4X+p85Xmeeu/mxeypuDQwWlPOupO54YvyLafUL3yFcbFtPG+jb2LoEdZ2T/s7NLEFAFJr4cZuUTnY+jqDEXO/y/Gh+Whbttx5yEM1YSipgjfvcX0BlcYBBOcgAmlmShvE3wcvegHUGTqNj5HzYLvU9VpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=HSel+kKZ; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="HSel+kKZ"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JN34XK3679067;
	Thu, 19 Mar 2026 23:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=XE
	IS1e2iBAZyRO6BrDvlhj5kVa4w1QV21CK5Z8a4FME=; b=HSel+kKZitNsTpbfV8
	VnfX0K2jJsmO7LXC25aG931wH1QWQahVNxuWMoTd8Woz5J/T5FT3/19ORkmrHTi1
	2TSLECBFT/oQTSD/a92FOYthjesWzNU2JEajgOTxBJ8LA3j5mX1oVROdyf/VhjVs
	fPmToiDv0q5l1MDYPS1kIZNMB+gEMzeOsBbCDaqeypR+vU5mCIudr2qfGT5T4AMS
	FDYpqHKroCqQC2nPakRRLosFj94RHgq7G9PQS7frVeVRpyxRTBGhePfmC3list7o
	1QGORf18XAxHk/o4Bp79uBeEV0Gna7+WdL+cpvpKlSrvzDC0I9/+zyWU4pSz78xU
	4yfA==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d0k8y5kg5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 23:51:38 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 5F288802BAF;
	Thu, 19 Mar 2026 23:51:38 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 11:51:12 -1200
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 11:51:12 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 19 Mar 2026 11:51:12 -1200
Received: from CO1PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 11:51:12 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV1MiZR5lKOD03L9Xpsl164LMfWRZYfbbX/2GqzXXB2o2CT2IsTTKaC1X72IwLUILKOJ68z2g+Ex7PjEIyv/EBi0s2eGpxoeWZNOoYbvpkePKGXJ7YWK+lYi8+Glx6cfRvn6wa2ex6kQUQK01Yky7lMMrbTyLPLFuKcMvGKw0UpvzrmSxsIyayH8F4H/XGZWh1xXKGm2szyds4hC3nzXXwage0jRlD8vqkpkz/nrwROLywZD5OMu6Hz5ckxrOCrJej0rWWv0j75uFZUpVO6mNfaKCiLIKd5njo8PaRg/n3o4mmJ3sWU6R3b9XiNyjIjslnv84vi+BQJjXnE2X7VAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEIS1e2iBAZyRO6BrDvlhj5kVa4w1QV21CK5Z8a4FME=;
 b=gAUv9yT5tn8cnq+WzNZnZTAlhmacCWp+1ghKQofURBW/MGwLBed+Si6catB09ZJ1F9eDH04ZoEvA3oG/SUDENwIGxR9lD3/p+nG4sm4m7nCdRogbvRv20L5kJF9MzCEu5Y7yPQskTqzaCZr2HkTeDRb4LVulPqLlCSJRQzJMT1NF5rkJqIZdVfCWMcY2ca9jV0dn2CULD4pFDSguQXysDi1NYWJxWlw8kUhsDvz+OFduWxmQwzKerzJ0KC/VPRnW3XCRp+s44AtQ/nx9OmGOsEbTgwjUW5NLyt+Q0iHOQy3Tk4YyUc0i9wWcnDm7JAUNtzx2HMUCq9r0MkKkJURaDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV3PR84MB3459.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Thu, 19 Mar
 2026 23:51:10 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 23:51:10 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v4 2/3] hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
Thread-Topic: [PATCH v4 2/3] hwmon: (pmbus) export pmbus_wait and
 pmbus_update_ts
Thread-Index: AQHct/tCaGT+elJL/Uq8a+EVVzKaJw==
Date: Thu, 19 Mar 2026 23:51:10 +0000
Message-ID: <20260319234945.151487-3-sanman.pradhan@hpe.com>
References: <20260319234945.151487-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260319234945.151487-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV3PR84MB3459:EE_
x-ms-office365-filtering-correlation-id: 1c1508ca-f668-4345-0404-08de86126566
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 6Bj/eCEvN46WU4mr738DXC7stmm7dF6uGObnlnoMCPAJ5F1P71bianCboDwiDMzrUlq1zY2/sHUPE6AZ31ZPhnPLSph4xed9cuAabFt+Lkf86QoilL46Z4+jQzek+4jdKp47FPxs2OiONpjUr49ABGlpsUNF8kYrDN4Id7sDhtz5DtMXy8N125xD+LjXdRhQDO2jUiARu8W2iyGUf+1OmhzpDbKwnX3MxThq6XPWWghQtxaZaisyYtCkM/zdZoBsBW3hTu8V+T2o9GtYDWjFPVcrvnZK/gsRO1XG6StQeVRQpNarU0Zln/seug+SR29o8Ldf0yc10NFvqRXx6MrA4ZROZQGuvwubLTckKKE2TsTVINVweiDdCcSQLjPI2KowTgQCQqzfEzQWNw3k/ssybxc4u8Z8as/zsCLqBrT4GMATwgElaYjjeL2VIxAVdi4BZSKKbjZUZYTp5N80UcL3JSah2WBgVurANshpDR8uCYTqzdZE7ULMw0QeRxsDrTv8Ex83TnDqFIMVI7gIivPDwMK7V4uljw5e1M6Q4ttQr7FWmLXeV8sMh9RgTb/Csp9wwoYITmVFFNanqRYuuaufG7LhNDl9jvGsIDRHhxLeLu8Yt+6UU+SMm94DY7sMGBtPYgQmZRZ4v1Q97+BzQR593K9uXLGMgcC3mVPodHcFdYxGCFB9VsV55ZK1pE3NAA/XsNPh4h8TvRGcwiJ/hQwQabfoYOH0KijcM2XNdUVDr3987+vlAeTArNX/fLGXOvWO/Jbk8pf9ghLE3TL2Bfu4lfORN/WFvBQdG/CcQ7qHa+I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tYw7O/2r6alEYZ0sxUy9lrsJcSULyjjAE3jfD1KuO7vbO3fIGVlVITWHRK?=
 =?iso-8859-1?Q?la2iLSF3SINoWAspyB0/MAfiQzM+YeNN0UIZVnHpFxg3DMnuTnyCASV2iV?=
 =?iso-8859-1?Q?+G4/I5Ke09D/E4/kRgrjv4fAzNbjsvqWgBoWgX66kysZOvbbb8QPTEKJXp?=
 =?iso-8859-1?Q?vGXGtUfHOHoXEYJfiA+AJHy2WZm0AOo9F93i+NoRwhFZTb8FXY6Cw5VQ91?=
 =?iso-8859-1?Q?47Wfm1e+novAL0T2mpTbQDWvw5WA5dDvtwvC4ojouFebKfhzQ9Lv+8LKay?=
 =?iso-8859-1?Q?eX8Tv+uaCYDsIxMIYynaVLryiZajDqAluwHmYzAtYosIiNtNP1MH8Z5WHA?=
 =?iso-8859-1?Q?2DU1vQJYOZG4nJR6fKQDJSms3YH5jo/AYPOUxPDwdem8DiMBW2YRamG4Z8?=
 =?iso-8859-1?Q?SiQg3ediuNNzp0HXvDRa6mFWwPnNN/06kRtQgZ878gAJ61WMY/KRvRECA+?=
 =?iso-8859-1?Q?wujA17d/e3bb8SAcYwma03JUWu6EUMcokDIAPF3BOZqdncRvNr1qY0LEI9?=
 =?iso-8859-1?Q?7FxGPiHOWxbeRk4NSMwT5rbQACw9gCk4YX7I0Ap8RfXSHpzcipO938FZL/?=
 =?iso-8859-1?Q?YrXj+OHIbwzT/+5ABJt5ZZE8aFVqkul4x07EkcneSbRgRbcXjiVY84QRdz?=
 =?iso-8859-1?Q?Q2dsw04V60qlXsRbViWLPpQTWEmAw3/6RfLj+JFpvT6cJSt5EFZyV772hi?=
 =?iso-8859-1?Q?dilzP+UR3KPh5hniTA3rtju2qjrcjK2XbkqOhZMJDMWfxBGbKwaCzDUypU?=
 =?iso-8859-1?Q?khCU2X3DG4NmE62yS3PmQV+zC66jnIFxwZW52joYUW/+MpOKUaTH/IEtth?=
 =?iso-8859-1?Q?E5ZXdZ/zGmdziOM11EpIgTqJmDrIAyGJOPEyYpZFe4XK/EYnOyeAV4keeR?=
 =?iso-8859-1?Q?XzZ9A94BybDrmKhA49jOzoCLOttxTmVK4lxrUkRp5006AEWNnOqXk/hxup?=
 =?iso-8859-1?Q?M+X7ay7LoxjIYz3CLj84oPcqFBg86zcQXUuWJWJpCXkfSnrmJuZ+6+Qosh?=
 =?iso-8859-1?Q?/TYqICs6g/ROOEd4zUcYov5/CYMrPQ1bNk8VGhB6ar1cuu05dkzdcV5bga?=
 =?iso-8859-1?Q?muivsxS0ggixNBvFhtbP+vUXafAnOM0Q5fGOK15TfPpd10Dvi52mxfwHWR?=
 =?iso-8859-1?Q?IiplbY0OyJzzX+g+hPKmiCYu0fUV/s2aZOiw0oVSWo1lh1z0f8COf9gKsg?=
 =?iso-8859-1?Q?YW3hwc65tWMWgwnUrwI68kbnqLNP+K1kRGkjtpqzw0uVQ4B7HGjTF01cYv?=
 =?iso-8859-1?Q?xwKWnha76fFstxR1PrX7/oRZf3+UZWdfxQd9G7b+hdzdTwY3GkSm27rVGT?=
 =?iso-8859-1?Q?sZIkz/HRqCqzY3wG0OGjEGLC4WG4SSa4ezz5XCvjM1SJSlvnelPWmLpBLP?=
 =?iso-8859-1?Q?6CLykCtt5289wg5g9yP2e44v1euAzYBK7+E1y2Q0FjOKq0DHACq/Q6Kkai?=
 =?iso-8859-1?Q?fYTYqlKTI5WI7G+2DzyZibXw7qo7R227FJk8z4RwGDa4MT6UHzzsqs+d4b?=
 =?iso-8859-1?Q?m7oX1wcwARWC3AWb/HXLGybJ1g7FvUcTWmJjTUCXY9CXGxnBQTtjrI8fOD?=
 =?iso-8859-1?Q?7SW+vIpPc+JtNbdnq4EnOKAwRRPSRzeRsH1l2dpvpiPYnq42VlaX/Vobgb?=
 =?iso-8859-1?Q?HlCv2b4yzwmO4+lCrMhl3yew8jqvbHWWJt51YE8HeD9WoXu0JXYP6M478L?=
 =?iso-8859-1?Q?cmgfIsKFedo2RAbSJvuxC+Cnxcb/5u9cj6OjcqYBpPMjPOFjDdbOaopjxs?=
 =?iso-8859-1?Q?Up101oZWCcPHnkMI/pyxXILiBTYnIUwH3D1t+EPzUBRj5Q1aOnTp/fn0vg?=
 =?iso-8859-1?Q?5RRjlSuDtg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ixCYwYG3lg6iTt0KtDOH0dJv4VIx0YVIQFmwqTX8eHE3heOczZLZxmSrJ9upG8Qc6XFT1im8XfgjnM/kERNpI4lACVVW97jIpTyg76+nZjVMJrP0+kMsKea5y8qxHs7mn5wI9DGHp8F4muc1UK/x85G12OvfxrSpjMtlSH+S2P2qRvTvQF+k9T7eKZFyLxD3zk1DT9ZCFnk/Hx/cj3zQ/0DWWZun4ygt+kLFGHLoLCJkJyYR67YNgN/jiPGq5BUbEtZhya4onO05HYpambyqruTj2nC0iHZJJYOHkfXRq1aiFsaXpTvfR5UuqxrgcbEWDi3Kni0ScixMzc8yTXv8CA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1508ca-f668-4345-0404-08de86126566
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 23:51:10.0868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfpve3JFSVWtsguMscK3uooCRXm/vORkqqGnG0kTOb+4wH7+PszKQN24tipzRYjJe+JCDGMPicSm0qqsgitBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3459
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: 5V86JwboIo27F4X8V5t4neFy9LNj0tFp
X-Authority-Analysis: v=2.4 cv=NprcssdJ c=1 sm=1 tr=0 ts=69bc8c0a cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=Z96ikUa0YlxGFgyCJhEA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE5MiBTYWx0ZWRfX4MuzxRDzgPqq
 QjnOL1W9pBeO/J4UwAyo4pvDbJgevfJPbzkTqx0dXJ5VRkeMLjzzghaHko/YzAsHENqaGWnF9zO
 Hl8nHucO5LAUDnv6K3S2gSZF5Ae2OyIdqoVmP1eSgkmvd1usQ9ZuX6H2FId4h9EtdCfnQ/OwtyV
 S7pJb2sImBJHoGWQ1iG8qUxK1EY6LuPaFDu5XHpO5KLs9hb4ad6C5zpYB5BUV18Yrm88/q/acLo
 Z8TD1QKDsaQeoS8STfVQ03jqN6xdg5+kGfhJR53BGWBbD9MklwSGeNlbNoRtdRjeIsdffAOqiba
 QQ248e8ukyTGoGsXorlrcYuG4q9rm32pSYqr0+J3xPrAf+twzDoxI5hqdM8533vfxTgaIlPzFrM
 O6RjnXVM7Pr36AvwY69k+1bVB1RQCNqQWmCud27AUfRcs7ES/KXdzYh+IurceigEgilUc84BJLD
 0LF7OQFIGjI/b2IFVzg==
X-Proofpoint-GUID: 5V86JwboIo27F4X8V5t4neFy9LNj0tFp
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190192

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Some PMBus devices require strict inter-transaction delays to avoid=0A=
NACKs or communication faults. The PMBus core manages this automatically=0A=
for standard PMBus accesses via pmbus_wait() and pmbus_update_ts().=0A=
=0A=
However, when a device driver performs raw I2C/SMBus transfers (e.g.,=0A=
for long reads or custom commands) that bypass the PMBus core, the core's=
=0A=
timing state machine is unaware of the transaction. This can cause the=0A=
next core-mediated PMBus access to violate the device's required delay.=0A=
=0A=
Export pmbus_wait() and pmbus_update_ts() to the PMBUS namespace so=0A=
device-specific drivers can explicitly synchronize their raw transfers=0A=
with the core's delay management.=0A=
=0A=
These helpers rely on the caller to bracket raw transfers correctly:=0A=
pmbus_wait() before the transfer and pmbus_update_ts() after it.=0A=
=0A=
Additionally, move the PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE bitmasks=0A=
into the drivers/hwmon/pmbus/pmbus.h header so callers can accurately=0A=
report the nature of their raw transactions.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v4:=0A=
- No changes to logic; standardized on the Juniper email address to =0A=
  resolve the From/SOB mismatch.=0A=
=0A=
v3:=0A=
- No changes to this patch in this version.=0A=
=0A=
v2:=0A=
- New patch in the series.=0A=
- Export pmbus_wait() and pmbus_update_ts() to the PMBUS namespace.=0A=
- Relocate PMBUS_OP_* bitmasks to the subsystem header.=0A=
---=0A=
 drivers/hwmon/pmbus/pmbus.h      |  9 +++++++++=0A=
 drivers/hwmon/pmbus/pmbus_core.c | 13 ++++---------=0A=
 2 files changed, 13 insertions(+), 9 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h=0A=
index 3ddcb742d289e..56620ed4ac9cf 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus.h=0A=
+++ b/drivers/hwmon/pmbus/pmbus.h=0A=
@@ -424,6 +424,13 @@ enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd6=
25mv, nvidia195mv };=0A=
 #define PMBUS_REV_12 0x22	/* PMBus revision 1.2 */=0A=
 #define PMBUS_REV_13 0x33	/* PMBus revision 1.3 */=0A=
 =0A=
+/*=0A=
+ * The type of operation used for picking the delay between=0A=
+ * successive pmbus operations.=0A=
+ */=0A=
+#define PMBUS_OP_WRITE		BIT(0)=0A=
+#define PMBUS_OP_PAGE_CHANGE	BIT(1)=0A=
+=0A=
 struct pmbus_driver_info {=0A=
 	int pages;		/* Total number of pages */=0A=
 	u8 phases[PMBUS_PAGES];	/* Number of phases per page */=0A=
@@ -555,6 +562,8 @@ int pmbus_update_byte_data(struct i2c_client *client, i=
nt page, u8 reg,=0A=
 void pmbus_clear_faults(struct i2c_client *client);=0A=
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int re=
g);=0A=
 bool pmbus_check_word_register(struct i2c_client *client, int page, int re=
g);=0A=
+void pmbus_wait(struct i2c_client *client);=0A=
+void pmbus_update_ts(struct i2c_client *client, int op);=0A=
 int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *in=
fo);=0A=
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client=0A=
 						      *client);=0A=
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c=0A=
index 42bd62f1e2e40..8043bd1730db4 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus_core.c=0A=
+++ b/drivers/hwmon/pmbus/pmbus_core.c=0A=
@@ -33,13 +33,6 @@=0A=
 #define PMBUS_ATTR_ALLOC_SIZE	32=0A=
 #define PMBUS_NAME_SIZE		24=0A=
 =0A=
-/*=0A=
- * The type of operation used for picking the delay between=0A=
- * successive pmbus operations.=0A=
- */=0A=
-#define PMBUS_OP_WRITE		BIT(0)=0A=
-#define PMBUS_OP_PAGE_CHANGE	BIT(1)=0A=
-=0A=
 static int wp =3D -1;=0A=
 module_param(wp, int, 0444);=0A=
 =0A=
@@ -175,7 +168,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg=
, bool update)=0A=
 EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");=0A=
 =0A=
 /* Some chips need a delay between accesses. */=0A=
-static void pmbus_wait(struct i2c_client *client)=0A=
+void pmbus_wait(struct i2c_client *client)=0A=
 {=0A=
 	struct pmbus_data *data =3D i2c_get_clientdata(client);=0A=
 	ktime_t backoff;=0A=
@@ -189,9 +182,10 @@ static void pmbus_wait(struct i2c_client *client)=0A=
 	if (delay > 0)=0A=
 		fsleep(delay);=0A=
 }=0A=
+EXPORT_SYMBOL_NS_GPL(pmbus_wait, "PMBUS");=0A=
 =0A=
 /* Sets the last operation timestamp for pmbus_wait */=0A=
-static void pmbus_update_ts(struct i2c_client *client, int op)=0A=
+void pmbus_update_ts(struct i2c_client *client, int op)=0A=
 {=0A=
 	struct pmbus_data *data =3D i2c_get_clientdata(client);=0A=
 	const struct pmbus_driver_info *info =3D data->info;=0A=
@@ -208,6 +202,7 @@ static void pmbus_update_ts(struct i2c_client *client, =
int op)=0A=
 		spin_unlock(&data->timestamp_lock);=0A=
 	}=0A=
 }=0A=
+EXPORT_SYMBOL_NS_GPL(pmbus_update_ts, "PMBUS");=0A=
 =0A=
 int pmbus_set_page(struct i2c_client *client, int page, int phase)=0A=
 {=0A=
-- =0A=
2.34.1=
