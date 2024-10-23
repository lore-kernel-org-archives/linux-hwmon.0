Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2095.outbound.protection.outlook.com [40.107.117.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AE913775E
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729663721; cv=fail; b=owI+W1qnCqTLHEg0xlD1rsN1T9PS1Mfnt2swbtYTKXU/ZdtH90NIcJiJxBcFif3ZbpZL77NXx3n4LLzqgQkiNYlxqcidJ628uzzgVCf8zihJKRgGQV0fMGRoftMmncQ7fyC5KwD7+kdj/q+u1WpTQ5u4jhrql6gL3i/lGvha774=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729663721; c=relaxed/simple;
	bh=o8408Y+tpQw21/xggVULYYtdZkZG8kzphfUDChYD3Ok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MaRqFP3Le93M/P55sU/kiC7BF2H+Tb/X/RZhXVCbLE/Eh65zBpcugLy4HJ3lgZvmDO8/Zjz0P925sfBuF3YvLWTb3XKn0ntERkb1flMg7d47EdNcG7d7xuWkJzQP4/mQtsVV/N8wIyQFxkaeFtQ3zpkzs1IrjryLsqJRu3u1i90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=FsLtx22W; arc=fail smtp.client-ip=40.107.117.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="FsLtx22W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtQgBW586ge2gojJWkWEEqY5aoYadO1lWGMKH3DgA5p6MFqR4ulOq6+VQDB7bgRBQ3B/rXverlCakq4v9Cp3vtF2dbnNpGRpOy4agA5C9gmaLIy7Z7VSDcsJzub5yWaObDlBii4AFtv4ZTGQzaw2QrqmRKJpLj2IlGAzxnsoxEm8vGR0GJGW/uZPNV58af0MHhZiZDq7DFtIuwzm/Jll3m788SJK+P8uC2gcT6qdH/PLR0mSUAvta83MUvy9OB4dSXiYYnjL1I8uJHnG+qpvsqJ86Q9Ss9HDg1djsN/gnWMdlPIKsHxL/WfvqIzFYLjrte1CRR0j7GP4pFwbNl3SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8408Y+tpQw21/xggVULYYtdZkZG8kzphfUDChYD3Ok=;
 b=xiwUoLrIdWVi43JfhLHYnzZde0DKWFkRBEcwB3vSocqHGbY68PCRs27fuYBN7NGEPKX3kKZWBvmNStkxaz4jqnrhBPI3wNShk7PF3wpBz0gmqZWMnYJfsX4oJ2vCDByvc091Ak4WMo9Aep+Sw65HAY7U6rULar9kMexdfSPR7koI6HwTEdzxdmvJ7cHAerM56GkLDhcF/56+X626aeSu/EugxC9zh0DF4OqYNNZLrUEqp4cEOPz6uLb5C9JEBIm0c35EMwzvxdUM7ssduo4tzFm2ibxzgb2KS6TCUDTzRrKYvAGj2GDULfMseoLAGm+SlrpTIfWn/SSSAc1TWpor7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8408Y+tpQw21/xggVULYYtdZkZG8kzphfUDChYD3Ok=;
 b=FsLtx22W5kTYrLxI0K+yyz0huryuFDhyQLVndfGrpOp085bpJw2/cNlu6/AxEmvgtIciXBfohihhFdUDlRzLL+p6G4zSbs9DVbsPA9uanrmcarBLHQe+bzDzoIbj46M32fK/tQYrxJjsMR3nSKY9rY3C2x+s8pY4ZlNcbmj4xfDDlfuS2p7KzS1hqinvDc5YrC1RpUSHUrnfr1HCl3cNUejjjY1fQ9E8rGV5KlID8xTOIBk9tX5pi37c0p5YTf0i+pNOli2o5cmb0qVS7MaI6ZHbH62reAyq7OkeewTIUvBm4bXYHH2/v628DtAAunn+UG8bAuHZh7zjyScKs6WI5A==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB4992.apcprd06.prod.outlook.com (2603:1096:101:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 06:08:33 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 06:08:33 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, Akinobu Mita <akinobu.mita@gmail.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Thread-Topic: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Thread-Index: AQHXsCOe2FNL8sJbDk+9evk0Fc7dCqvN+eGAgeQSdQCE6LbGbQ==
Date: Wed, 23 Oct 2024 06:08:33 +0000
Message-ID:
 <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20210923023448.4190-1-akinobu.mita@gmail.com>
 <20211011143421.GA2374570@roeck-us.net>
 <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com>
In-Reply-To: <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB4992:EE_
x-ms-office365-filtering-correlation-id: 39dd9863-7906-4a91-d780-08dcf3291fbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QQATYej2tUD40M2gNAUnGDT0CAWs8dmt21wXXyVW7Y6d+QRTvXm47AGfjv?=
 =?iso-8859-1?Q?LKRjjxX7bZw1L9Zmz1rEvpXV8WeactTyB/KUZ67pl4Vx7g592XmtkYGrOl?=
 =?iso-8859-1?Q?gBmS1mFF0D9SDV9G0lO7oeNvTs2GJa5AyG/kcoIPwNa3QPaOF3uwwzGsBC?=
 =?iso-8859-1?Q?91ZTvvHkrzqPZMpemm7/MGjrTb0lotjm7CiLInNaZDmV8E5w92cRosEj/F?=
 =?iso-8859-1?Q?PlYRwthZjqraYfcg3EQHWA8089IP6i7Oqp3EAOXlYXdRP9N7ZWkeHdPz0x?=
 =?iso-8859-1?Q?6sDnFaVg7Z46zr0cNYeaasLJPenpj4ZElozDOYA6jMm7YaJJf0iKLlTzao?=
 =?iso-8859-1?Q?hwrSDxw2/xNDkE4hQ3yljIBFhyBRfW/AbVobYAO78labZDWDjPyIo8Y+OL?=
 =?iso-8859-1?Q?Sgq4bHISyi6x0ej4XC/HrvtCdXmC4PbYBCfCYh8rqSMGO3TiJtFYuo5MCs?=
 =?iso-8859-1?Q?giJyqD1Ey8l2zPZyeGB6JwuI8Bd048Sg46TItCQefXT66Ld+cGmbMs2WFu?=
 =?iso-8859-1?Q?gqc5BmXMbQaE7TCVC08KQdQagktaM4sp3In3BO3sVNnndPaexHmwjXdisx?=
 =?iso-8859-1?Q?YplkTgXHdj4UgYxvz0I7Zdbfl59mh2aMmJ48TaENyzC3/CuiladsdP2ftr?=
 =?iso-8859-1?Q?l8yDt+CEJq8P1E/w1FyBY6RbZfS4vlYPgnGp/leRiM46XmRFqb9X+piGO0?=
 =?iso-8859-1?Q?fF2Q1T9/Oj4odxlg/3u8sH/4X+/ORcInyMDLbD9dLxa2d+jP22cGX9B+pa?=
 =?iso-8859-1?Q?5y7C2ENl99zHvENadCgVd6HHC5XZz+Udu6BU7Ss22SGnk2xx6HJj+VMigJ?=
 =?iso-8859-1?Q?x/KCVHr/4mN38jXY4+QzMh/Qk0JVNLAVB+sjL4LLRO0pCVaGltANB9Lv3c?=
 =?iso-8859-1?Q?viBnw7Gu8UFr+J2Vpc15B49zeuOBGTUHc1XhDHGaKU0U6aZ1TwjwZYaPx8?=
 =?iso-8859-1?Q?9vm7A+p6cVLFO2Dg4t0H/62psJxObDl6Z9tkLNlpA966Raxi4K/ldT+8Bi?=
 =?iso-8859-1?Q?5h9eKlZfbnrw+C0i/Ap8b33UE9ZNOa3E9Ar80h7Lf9K3HI0FV9ziK3XUds?=
 =?iso-8859-1?Q?3F6zq7t6yoHQ4LfD8wl+FcbdnvxV+5gHirnNbw3Zqm1X4pGC3BqEYJTcSD?=
 =?iso-8859-1?Q?GD7IO8Sxg7+zkVD8RYoQStSSiORd0Vrsz4uNwtr+vIrt6qDht3K4W5XNEy?=
 =?iso-8859-1?Q?vYGLSP0jwoJdwtHGF1OlPdLuAPLGOhkCVjdD4Jou1axbD9xMaiqEtBJpDD?=
 =?iso-8859-1?Q?brAPUvoq8QVH46Ngulk8NX3uP7tj+7DYFXJv4qXJZN16qKLtocWrkp3dck?=
 =?iso-8859-1?Q?OR4PUqZK+3KbH0PEXHarUZlGyEjz7xNfZJn94VylpwocLV+LZ3m5qgkGXO?=
 =?iso-8859-1?Q?GtyAYzPyJva4eeq8RyiYEwW8gmzvQzEX2HGN6VeWA1PyFXaEQTyi4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JsxEJGso3S8QpNqbhUPnSgxUMJa2FLNF9LhixDCoJjj+bhMbaHoRNpYzHr?=
 =?iso-8859-1?Q?CmZomWVQaBt3OOQyfxqGXuAC7O/yX4kd4EQ+umVOcWjn6dw+0XqWq+RcQs?=
 =?iso-8859-1?Q?kIWT2rnvHa6hWftjcaqlb33qyBzrP0f3tmhTJNLjfcOqDElrgRgQwJlTTt?=
 =?iso-8859-1?Q?rCdt7lrbViQ7ucikDLlsDmos6HYi5B+olUc7/AWuceqw2fftt4MkJyzWpd?=
 =?iso-8859-1?Q?D5oa2X41mCCiAjBzE1q/p2hTfcuyw/q/5s7r2f495ZjpcYgeFzT/FkhhrW?=
 =?iso-8859-1?Q?7WdabrZP0rcZHM6/GlOCQMjJr/T7mxTt9xbJwOlhotryuLj0E2HOchX6aC?=
 =?iso-8859-1?Q?lrpLnssOmj19RvbiAD9n/zCn60nj1dbatZ+7+eIDT49PYVCdudKGv0n+KF?=
 =?iso-8859-1?Q?fUULERn0EPyFvtkU/Y2CMVqBvQZCdkqCIhgUY79RJJPtF2ILPmeVh9IlzJ?=
 =?iso-8859-1?Q?qK3kg7Wx5zXS+jXobHpDBB+LDPlgoWlAiugL2IZzKgdJH52QEZl+FL198I?=
 =?iso-8859-1?Q?iXK6Iiw9iHgEEgsxo3BgbUvOqzegzPc5D5Dx5lUPGWIhtjIIuNxJXJr569?=
 =?iso-8859-1?Q?MCbEzvMzbx95sOx+oLCuHw5viIHBivGj7BR4ZbTq7ANrnawU3Zhqn+9hR5?=
 =?iso-8859-1?Q?9/d5nZ+yWy74/ezz/jqCe5rv6dFWa1V7/mcEQgD6Dput9ooxr3oTtOlq7V?=
 =?iso-8859-1?Q?vgXRKmtvnwua5iXvFfVsDo+5g7dUMuez22TSDPtRht+nVApOlzgfZ9eMLv?=
 =?iso-8859-1?Q?+pQJNgVDwRmjVVl5kI2ctMT59nVLhZsunSiWUnJpV4I8oryVmllNBS17nt?=
 =?iso-8859-1?Q?Xd39hUbLYnSbWdi4Xtyuq9Tl7FdtfVtpVlE3Pjvd2o+iad+vaKrIigOhUN?=
 =?iso-8859-1?Q?ujbhIkTSFAjLt9NSPnsAPdctiJ/ZWvUjXP4BFpjeSPZ4dSISVi2ws4lqTo?=
 =?iso-8859-1?Q?buddIFG2mooBhe9jCrI8NpX3p+LhblvkOJ71bqrrajv076oXVIh1dOTK0U?=
 =?iso-8859-1?Q?Gx3VNDwGWq6bC5e8ojT6MXCLOR1eEu9OGKvOBtznGzrfUAvMzpUV6Tg/Eo?=
 =?iso-8859-1?Q?JYmtSuZ/OtpG4+PScfNJr0Vtxn2xli497PIltWtciZrg61T3Aqkc1SzH85?=
 =?iso-8859-1?Q?PMG63bLA35U5cnw66h9zvz9YkqBgwJN8B+DcRurpRK81VQvyw1EtzQqvBy?=
 =?iso-8859-1?Q?shzHTM9l6HUYSsrKcOlGim4esPoCaXONm0H7pZa2yVV9mziMqF2Ns0Mez5?=
 =?iso-8859-1?Q?TSXLKsJe9mvnyRdphLNv/xsLEkn4q/T8lovM4oEKuUTqqnbfjyOqclaZ7r?=
 =?iso-8859-1?Q?BClTkd7blj4i1qFUU2WIaX5ulYjuJraRJREX6m6qFlys9t6funUV7O3JVn?=
 =?iso-8859-1?Q?HdkjyRys7FxHFqqxlcaq9J3ridtQ4ENHOZwO0Pgq3W+966Wdc0fD/hTZz6?=
 =?iso-8859-1?Q?LQ5RWh3im1sVfGW7afqF25XI+JPuks+PnRle1suUB01upXx4sTfmuOj4ca?=
 =?iso-8859-1?Q?xBnP+YEMx4bvEvjaawkSxBMXyp8UkELXwbLZ+wuABbuZS+4eSGK0xknudA?=
 =?iso-8859-1?Q?Hl4I71BtRa6pbPBTSdvD7spG2G52hwvURC2ngKBlA5bCFMClZi9Rf5LkS8?=
 =?iso-8859-1?Q?JeP0Gb7KmLM8+cmUj8rKkSpvZ84AUZFMrn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dd9863-7906-4a91-d780-08dcf3291fbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 06:08:33.0972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFZ6KfH6/j5zG1nfgbClohd2XxbZKEiMDBAxAkZ8T8VyGhuykOV/ihnnqHZ5NrPUt0TbQ6578CgGlUs+ASWV4gX+uDYlClyYHXytdl+hhLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB4992

Hi All,=0A=
=0A=
I found that these patches have been rejected. =0A=
Is there any other reason why it can't be merged into the mainline?=0A=
=0A=
Thanks=0A=
