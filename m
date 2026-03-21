Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341C225417;
	Sat, 21 Mar 2026 00:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054430; cv=fail; b=oNtFp6m9pSQBWU4DLKo/qCS0PybskXPLFwCXj6ZP+uwMZ6KmrQzl/CMQDchCqrCJkmhHyrvPEGl0O96Mqx9es53cbirY/D7l2z4cBe3VHz/VZBXtD6NneCP0NIpuslv5YEe8hPZhW+uDwfN3/0tcpYugSB8wZHs/g/0YxpJovNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054430; c=relaxed/simple;
	bh=PZ4nO902J2sjezuWx8aUxqhfx/VCESg/++AXqopvm5s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e/JLZd3LG7AZktL1/z4r00jrX/nj5UBFvUAQZhIz2svZLvpYwfo/9mWWMjrnuJP55ooJAFtBKQ92WOxCwVj9W+O8iEcMuuwwIDtqfBoX0QhAH2HDeGKR36fZvNGumNywKf7cw4qrS76KkZa8+EYX6ADZm/TYAcWaqTXGOaSqIM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=P5mQVSrH; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="P5mQVSrH"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L0TcMK1717082;
	Sat, 21 Mar 2026 00:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Q9
	uRmFIZfSB8Vefpl3g65MPHaKyxLfppCQN7Yxewznw=; b=P5mQVSrHy935p47Lrs
	Frbi2NRwwJUx1W5zaVWQaXveeaSzFNPFbva0Z2jWDr2CYob0e+CMZV9YZ6MLxEqa
	Ln7AcYdGX3unSkZqb1TCio5ZvFVs7AVaqvQjNFx28GIW8ROgMzP0T5/EAnStcQx8
	UPmEkPSeQ5+yzyQf45wuxN9hhO4XA7Cz2MS30zSWwHqivB6/TTbtxyD7JYy0jeYc
	8BMgMz05ni0mclSbdRIdzqnRlz96wpJdWiM/jya2O7Z9BJr/Ak7ND2qNYtY5wWMK
	N9rPqoNc7QpKAu+83hbZwPxUXr3XT753CdhX+RYU3KZljquK/fLUOgkfxbRiTfV7
	Muug==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d1gu704gv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 00:53:31 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 5BA98801605;
	Sat, 21 Mar 2026 00:53:31 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 20 Mar 2026 12:53:16 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 20 Mar 2026 12:53:16 -1200
Received: from CH4PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 12:53:16 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdyQDANuG+AVVMiIFa5ZQuq764n5UcZVgEZpwMkrFQqUcudwP14cM5/PJpxaOe6r8HsTMlowuWb5ZqBu8yy4gU7sELOExJDNSrPFostWTNmP3wVaqdZcpd51xZYhFDLyyWqvm/wr4C7U+TYfxlPlL7iPX3irvVZtxyGBzS4+9eTGuKQNqlFlXEYG9+L9JRBtW+TMhwRhnFROquJU179vNN9njKjwgOvG6N18TXkE/M/q2okCep+p/3IsXHsncyoTBHiC6E3IuHLvpmiW0YgKqLJLRquF412ydp1oZAAR5lSCWIWJk76ImJ8JjMaS1NevCHKsLWfBlOEaCMNSeoOArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9uRmFIZfSB8Vefpl3g65MPHaKyxLfppCQN7Yxewznw=;
 b=DkiNW0uFLFmGcno9T3zmPSyf+nMYYkGuWura3DO0Xcir16FZ7XCCYJo2+djaryBwjQ7LI4Rn40WOzcxbQhcNTUeLEzZjsBevC9KByBt+Cq2UWFXrLURx87X/05dRddg2hMubc6xLyHRq6To9W7dinepvvrfR8UPxq5Z57d+jm9MMUf4CsE7++W78Z28iAZczU/+6zoqWJ/ADiV2iZZ2df8C9ga84JBVn45OerbTsh2yr15GjN5is4f0OKxyl+JTJoBI4/UNnLj8hsNWa39N51XYy6bTv58iSyL7h/T3C0eYeWdpZH6gOop1L39W3ChZ9m1AE+chsbMpZ/ystHqArIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV8PR84MB3772.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Sat, 21 Mar
 2026 00:53:13 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 00:53:13 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v5 2/4] hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
Thread-Topic: [PATCH v5 2/4] hwmon: (pmbus) export pmbus_wait and
 pmbus_update_ts
Thread-Index: AQHcuM0Y1OWAB3qX+UaM5ZpTD4emeg==
Date: Sat, 21 Mar 2026 00:53:13 +0000
Message-ID: <20260321005206.6350-3-sanman.pradhan@hpe.com>
References: <20260321005206.6350-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260321005206.6350-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV8PR84MB3772:EE_
x-ms-office365-filtering-correlation-id: 4892acec-a4f7-46a6-30d7-08de86e43aff
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: M7rnqR1WXnvBTVHbiGOJIyW0mS796yATTM9xixE+Lx+ye4CVXhBjaInDlX1MUpSTSc8P174rgH0ufpdL13HSiMSHUpSH2BdeFHbBUz52DreyM6K8D+VjIrTNegieu9rDwIpChZ9XeyM/hzPul9FIzK6RXoCOcNc2lM4OBi158J5aI3wLsbkKCoafYnWJwtfIt9DXmWRieZ0+KLgSO33ZguAKsT45peMcAEHbVtHv0WZCcPyEPNMGtaIi1+Xb2OgVQ2tYn8bsOpRoqrNi+TlRP3Ml9yOtKiFxfab622tQTIP696UnFDKC5e4G4h9wKh+46EjZeqyioCOzrUCyppOclc+/nio+qaCGQD6b0Uw1Z2xiGglEp8EA6A4o9P9irYguete+mPxBuDHZP/kDKqjUyOxwmPqBIfAXTptmlum7HFjtWG3n2Ldr04gp4jJfPXJXZ1aQzbLJwFWHmJ8SjkiItc8DE6dpd/092+VfZXCk15ygZCkCReYYLfOi535p6t+KS8uNz8Iq9Pkl+GmE43H0EuAjt/BISX+LURlXtt9AkJtVL91V1J1zxiiS+kVzCk2jvxxMEhFkkAtordHTFf/evss501qcILb1vRqvFbFdN8ChNoT94El0+G3HPmInPdLL2+x1ggYSi33VPy7S/dD/UFPgxwtvbZoEQa95Fmef7xfO8J13riR37kHJiN0MHCAE0KNbEP7hjWO39btBbHH3NmsbNYiMqgQhT19FV4Sed9w3es99z5Us3HOG7Dv7XgZlUo8lxjBFxx2barTM6o80jh0fppDJaAEalit8+OXC0q0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?J4/WHm9Zy86WlKoxs7BWo1cNkTOwJpv0wZnhtfUTqDriP1gy2SfeGigO2b?=
 =?iso-8859-1?Q?pTuB0+xVIZ55c52A1Qb7nmvX8s0tkIpMuxuOvjNi8VLJu0PCHB5hdv69lH?=
 =?iso-8859-1?Q?89a2h5k2a+bL+QiLTGWSe8pxY5B6etZw4110RbJ4KsShJFo+4xfiNn8ebh?=
 =?iso-8859-1?Q?gA89XliqNiqo1sDlb0aBVFSIKXAHiCx/pD4Jgwm5QnxNKLg5tVzYH9JCb/?=
 =?iso-8859-1?Q?/PMRTv1+Z9Vl6BL19LOpScWenKquPE1tMZaoYgDzmy22qQ5iFVLZkdIoVs?=
 =?iso-8859-1?Q?xXy+HZnHAp6ix1oXkgRyUHHQsKigzGT2FzjpxlaQJTXeqmlh9feFUJ2NEk?=
 =?iso-8859-1?Q?qVZ/ZFXLqQxIBLnp0yGC0wRBUfDEKUKh51XesSs6aQFfOdO5MiMlDUFX+e?=
 =?iso-8859-1?Q?e2gvtvCeBEV0L33SvCQ8t8whfCbyZPfw1PrpRdQP/QGrK/Gdgvb90gVWkn?=
 =?iso-8859-1?Q?liq7uXGrHEb7WUESaMIjXlGCT+dq3LodB4IJaif6VFnE8Q6lyX2l6joKQl?=
 =?iso-8859-1?Q?XB6upYsU9AU4Qu33s6UutHJ9NRnwGPoc1uWdMhJoNZX3jtAYcmgLK5zrBK?=
 =?iso-8859-1?Q?ntCRgXeLhddKMh8ra9Ku/IFsoRCWN0Yglva8PKwyhiBBXuX1wZmzPdFwR6?=
 =?iso-8859-1?Q?GcPgc4XaDe8RGaZlqN0D6clWTDpj2pWJWZo70QOQasC35a6WH/GmhMuza+?=
 =?iso-8859-1?Q?mP0gD1ypoac2M/Z21RqWlc1YF0rhlZ36bXGCZT4ISs4N11KbnvpN6oSbvC?=
 =?iso-8859-1?Q?e0fSPB19IU9DQIlNMv8JcyCEuXdhRSznOh7IK6l9sg5YBn2Pe8iqx8sDmE?=
 =?iso-8859-1?Q?jF2Ma4+iBFcn79JqG53ankYOAlrvUEIFtS+kVF2Zc4W/qkYUapE93AXjLF?=
 =?iso-8859-1?Q?bGKCHE+TSMhpenwtgZheQdiV5BfNLnvvrkXIPTqOsysFLP1en7K0IV7/+n?=
 =?iso-8859-1?Q?CdPH7+/TIk/vIGeDj2IkzbOalRYSU/wzPCJ8EyVKsixUliIbSo8/PTChKP?=
 =?iso-8859-1?Q?96VjOc64wktES2yoX/zrYPOYyoILfJpIDaexeiuTn/nyUC194OG5MftpWF?=
 =?iso-8859-1?Q?MzML467PxdL5qrjuev1929hKilrK5h9XDalevpzg8PZOFRFP1P80/hiLdL?=
 =?iso-8859-1?Q?T1UWC8yer3AXN0TEiY6DIdn7+FKAPihvPQ8JYVwt2hhof09gz2EGD8IYIP?=
 =?iso-8859-1?Q?kob8nZWYMCFxthqKXU29mmaN1OWhz69gk1CzGQc1XBwV7Ovm22OJEC4OOE?=
 =?iso-8859-1?Q?X9RobQPzIGKkhlmfv4YUHlW70KJPtfFwQlqmkCpQZ4B/3yGOr+Rul88fRS?=
 =?iso-8859-1?Q?ptJGgACsaxA14eMTGJUoUuhWr04/24UhAre/lENZZLuPLru2sDJFFuToG+?=
 =?iso-8859-1?Q?ZLu++EuwoQL/4pVB8kcLQzGXfJnb7pih7tPO/jiMWSRIMh70tmnVm1fpXw?=
 =?iso-8859-1?Q?HtqOFBEoBZvRnRPySJXUH8RMhmIBAyvc37/6KD6rpVtyTeMZ/dvY4jZB+0?=
 =?iso-8859-1?Q?Gq2plrckdONNDuveWZYlIyP+am8AAsHPjV8i84X8Wc+xKi642xgBoEs/BU?=
 =?iso-8859-1?Q?+mp+o8iXyo8Lin6Z+w+TZNiUY3lxlW9kPlJ+qPEUqCaFPJUFeZ5ETXUG8V?=
 =?iso-8859-1?Q?E9jsnydStO2c5aHHbZHyR/dKQsWmDwiHnYlrlwr6+/grZsnOlxqAgmEEZf?=
 =?iso-8859-1?Q?D79ahNRYsOfn+OtryV74q+Qo2atbXL+pKMhXD2DEnRr+hlLXq1WdWHI2Hd?=
 =?iso-8859-1?Q?y7J0lfcbgwv1QeAcSjSx9VmEW8KPndhwTZRuzjjT2z6Ya9hijmbnNpamCB?=
 =?iso-8859-1?Q?EotuxzbwFg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LBvNWaofN5g2NaTRY0mNcS0ACWL3ljBRAa09W457FK6bL0OGmBZ8kMrHRve5R5CnVl8U/5HXcReObuPeRcEVOUHBiWdzMFWu0+GK7a3BIDn4PEp2HBTFy96fB2LgNe51jzxLxGVYzFmJYxUJ9aPVtfqBeP3GjcjJmKXktP2Ktjz+J16TaUGqKyTTKPGCNkf1f5HZVXYsr56jr2vBNMIILlfss+snpMD+kacVBpTw5wdhZHiqamXxgsqlr0lW8tgcoL6+T0bJvUAZMjDHLhP6WLQC1tNdoRple3ybKQ0pLTCE+XwyJFj3fEnkapdz8KPd3WmrP/iGAKZSK9s7k8HTcA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4892acec-a4f7-46a6-30d7-08de86e43aff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 00:53:13.3397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UQ15e0Q3wiI1fkayZJgzkP9C4g4Q7zPD/gi8nkKVTFgKYFagBQX0N7+RNg8AgxvStcOdrWSOYfW+TZTgLlszQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3772
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAwNSBTYWx0ZWRfX0DIFo8TO3txQ
 peHuFGUr7wmoFX4LTuQGRuG6aTffzPZJ86QIzAx4FssnLhKBZkPR6pNKymRdbYPWh6gn0yoCJR3
 E/u2xXNAROH/x4+WGjdPFdurG6fceOzfHSvno/EMZ60tsZ1rrvVQECjmjcclheE+QDrvUvDd1Hb
 hB3owgCAdFMO8sfrTAw2MJ5T7MBrG5UIPuyY8SAHH82zndy/hR5lT2f0Fwm8LdPdsRV5hqDfz9h
 ufK2+SC3HGG//d0lgoze9F3APhAMpzVZlLC1Q/YSAmMiKlatbm6g9pSe93WxYDaRI30b3G9Cmsn
 JtArSoSOxN/q4754HA6zq7oydaxYGIRaTi6jXl2IV+15pcvYgLX1Fc/48Vgus5uBXIGaD6Y2mQw
 m0UIIOKb0UsVc1okJi2sasp1x0QVxeRnIxCPUUQj+l8c5HdThbLZwxHkHKUIX1e6dxCS0rXoPL5
 dSfv+2S1t4voAGE84BA==
X-Authority-Analysis: v=2.4 cv=ZLXaWH7b c=1 sm=1 tr=0 ts=69bdec0b cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=OUXY8nFuAAAA:8 a=nH3FplcY2SvcWnwWU-MA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: 6oLUakQ_X_3cSRXllZTaRN2HAvmCwQOp
X-Proofpoint-GUID: 6oLUakQ_X_3cSRXllZTaRN2HAvmCwQOp
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210005

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Export pmbus_wait() and pmbus_update_ts() so that PMBus device=0A=
drivers which perform raw I2C transfers outside the core helpers=0A=
can keep the PMBus core delay bookkeeping in sync.=0A=
=0A=
Move PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE from pmbus_core.c to=0A=
pmbus.h so device drivers can pass the correct operation type flags=0A=
to pmbus_update_ts().=0A=
=0A=
This is needed by the max31785 driver, which performs raw=0A=
i2c_transfer() calls for its 4-byte extended fan speed reads that=0A=
cannot use the standard PMBus word read path.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v5:=0A=
- Removed spinlock usage; pmbus_wait() and pmbus_update_ts() now rely=0A=
  solely on update_lock serialization.=0A=
=0A=
v4:=0A=
- No changes to logic; standardized on the Juniper email address to=0A=
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
 drivers/hwmon/pmbus/pmbus.h      | 6 ++++++=0A=
 drivers/hwmon/pmbus/pmbus_core.c | 9 +++++----=0A=
 2 files changed, 11 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h=0A=
index 3ddcb742d289e..deb556971a726 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus.h=0A=
+++ b/drivers/hwmon/pmbus/pmbus.h=0A=
@@ -424,6 +424,10 @@ enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd6=
25mv, nvidia195mv };=0A=
 #define PMBUS_REV_12 0x22	/* PMBus revision 1.2 */=0A=
 #define PMBUS_REV_13 0x33	/* PMBus revision 1.3 */=0A=
 =0A=
+/* Operation type flags for pmbus_update_ts */=0A=
+#define PMBUS_OP_WRITE		BIT(0)=0A=
+#define PMBUS_OP_PAGE_CHANGE	BIT(1)=0A=
+=0A=
 struct pmbus_driver_info {=0A=
 	int pages;		/* Total number of pages */=0A=
 	u8 phases[PMBUS_PAGES];	/* Number of phases per page */=0A=
@@ -541,6 +545,8 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,=
=0A=
 =0A=
 void pmbus_clear_cache(struct i2c_client *client);=0A=
 void pmbus_set_update(struct i2c_client *client, u8 reg, bool update);=0A=
+void pmbus_wait(struct i2c_client *client);=0A=
+void pmbus_update_ts(struct i2c_client *client, int op);=0A=
 int pmbus_set_page(struct i2c_client *client, int page, int phase);=0A=
 int pmbus_read_word_data(struct i2c_client *client, int page, int phase,=
=0A=
 			 u8 reg);=0A=
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c=0A=
index 3dad455448d05..9db5a53fd97c8 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus_core.c=0A=
+++ b/drivers/hwmon/pmbus/pmbus_core.c=0A=
@@ -36,8 +36,7 @@=0A=
  * The type of operation used for picking the delay between=0A=
  * successive pmbus operations.=0A=
  */=0A=
-#define PMBUS_OP_WRITE		BIT(0)=0A=
-#define PMBUS_OP_PAGE_CHANGE	BIT(1)=0A=
+/* PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE are defined in pmbus.h */=0A=
 =0A=
 static int wp =3D -1;=0A=
 module_param(wp, int, 0444);=0A=
@@ -173,7 +172,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg=
, bool update)=0A=
 EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");=0A=
 =0A=
 /* Some chips need a delay between accesses. */=0A=
-static void pmbus_wait(struct i2c_client *client)=0A=
+void pmbus_wait(struct i2c_client *client)=0A=
 {=0A=
 	struct pmbus_data *data =3D i2c_get_clientdata(client);=0A=
 	s64 delay =3D ktime_us_delta(data->next_access_backoff, ktime_get());=0A=
@@ -181,9 +180,10 @@ static void pmbus_wait(struct i2c_client *client)=0A=
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
@@ -197,6 +197,7 @@ static void pmbus_update_ts(struct i2c_client *client, =
int op)=0A=
 	if (delay > 0)=0A=
 		data->next_access_backoff =3D ktime_add_us(ktime_get(), delay);=0A=
 }=0A=
+EXPORT_SYMBOL_NS_GPL(pmbus_update_ts, "PMBUS");=0A=
 =0A=
 int pmbus_set_page(struct i2c_client *client, int page, int phase)=0A=
 {=0A=
-- =0A=
2.34.1=0A=
=0A=
