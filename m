Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022134.outbound.protection.outlook.com [52.101.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03325199920;
	Mon,  9 Mar 2026 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773020411; cv=fail; b=uyHTb0fggce5+emDAfqh086pa87WQuGdybCtv/OGvwjUgY8ZLWjnV9AJvMC56HMPovyTgPW7hCZE+sgG+Mz/uoxPYQUKus6moakva7clOgS0hJdMDiVnFpgBpVQuPGOqs5OXRMgy4ssVYFKg93HrwyTPJyXyhLaTHQ9vk3mctZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773020411; c=relaxed/simple;
	bh=fKFdywF4ewDCwdZCTJ3JPol1xo4n+zrOcm0jFh3u26Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lyQUf7IasVN7H7lQL1foeqZXmYudm0Cv3K6iOG1rbCT3y2rNBfJSUPZdSI94zyoovBwro0u5NEADXS19K/GNPvKsj3KWpOxsrsCDpjKrXeorXiDIDNYMvhTG33sf+vNvp7a7F849GwTLas6l9RSSw4A5GHCkV/LxedEDLoc0/GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=gl9qE+4y; arc=fail smtp.client-ip=52.101.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="gl9qE+4y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEfQr5M+flMItmiqbfkHf55e85KKmiiUcr3bw2LvMm7Lew1JpxRAiKvol4aRrp5mim4kTuTRHc/q9J4hBoJYUyIds8z7XTX1MjeJ4q62SsslBK1/XG+S0oOS+pbXEkjKTbv6a1+J2eko38sfalPYyU2uKidG+AVm0dRVfcd+FhfZHADzvT116j+LUH3jPxRs8o3i7HsHchij/QA8FZLk77vsilsBnovgC3IObY6mzEa8Bjk47j5IfyoLzt4PBurkvfxJDN3NLX1f0mgpCRc/8suX3iLqO126PQMTmUIAbpj9TazjkyhXOfuAQuVNnGnNBk0e4O4rRcNtObDVALtbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKFdywF4ewDCwdZCTJ3JPol1xo4n+zrOcm0jFh3u26Y=;
 b=RTgQeByw54ukUqEP2sfpDlC3lbt2n++5fJABfczF8F6YyUq+mFEP1DUJK5FUIbhKhLLuagqGo8/JiUb0dMMnPguixgJFr9XGytUenSVROWWuANPT+GeLDCczjKAGMcU11ffB52Du+B5B0RyVFlD8ScTEQHAjkA/Xz3ktxZnGZozxcDN+cCE5OP4g6m+MkiEWDWEal/lqy8PrsRFHGiJg5LNMMbaHyxesZWZU0pliBttENM0kTzx4sjk+w/5U8a6FFGfz//2oary4N8DjDese9AX+5BHAialtyHaPyOKHEk3nWD0dvCo5Vdo4KG8XUwSPdrkTSz57Ab+FpU/6qEcFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKFdywF4ewDCwdZCTJ3JPol1xo4n+zrOcm0jFh3u26Y=;
 b=gl9qE+4yBgYpZZPxlb2tO3NaE9HPl3w4Jcu7S/IkrAOkFF8XxJErNvpFVBVlvvNFssOt5OCNxElCwr+RCV8W4CPv9zWvI8NO8m1P0GHDffgH8FMVvnYsZcek13CzluQ9agQUpEUELzYhHcGdo2h8CokXDqKiUoOetGmVKRXYII/IdB9nXopk5AHTzPNw4q03YY6eZFLjFawMqDG8Wh+Y/jX2w32tYptVjUrhGlKxshcT5kUyPlUwc9YVnfX08auY//PTq6Xw6e6IJLuUwgqGlVXLtzu7NXCHHEdZn1DRGpe28pFeuot3ooTdxDfFYpvWhuKLDaatcKTx6xGcm/6XSQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by KL1PR0601MB5461.apcprd06.prod.outlook.com (2603:1096:820:c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 01:40:05 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 01:40:04 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
Thread-Topic: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
Thread-Index: AQHcrTS5FY/Kas9MhESiOtz2OxbSkLWhrc0AgAPCAZg=
Date: Mon, 9 Mar 2026 01:40:04 +0000
Message-ID:
 <OSQPR06MB725208C4FA6C90ACC394B3188B79A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
 <e6c06c88-d2cd-4501-8a15-b89ba5a36e5f@roeck-us.net>
In-Reply-To: <e6c06c88-d2cd-4501-8a15-b89ba5a36e5f@roeck-us.net>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|KL1PR0601MB5461:EE_
x-ms-office365-filtering-correlation-id: b3427d82-ff6c-4770-cdf1-08de7d7cc99f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 vYsjFUEvxDYVxF93YfLQVWcZdlAbUnhiH/hMq3BfXMd2vnN5nOggpDwiZ+h127IHUTS2lQ8I/aoHwCuRFuzea1K6v6m/SLNW+X+jB/sWNj1DjLJ6s+h5p9ZQhnyjGay0yKeJxM8zyYFaUkiE+LFx37Hl3Ff87Y8HCBI5n245GkZ0gzI3soHpCZY5iylo/gEHxrE35nYBvE83kvt+Ntguu7N8ovogZiD3jyCQnthqyHhSiytoMQwsVxnEYqtgUQaBsrxEpohssBsFPg8xe86xpJtDg0UDoCNy9tHbU5xURm5qgf2oc0hz+jOmQK9211DMWFsAvi7ggpo6ttw/Du37HgJC/cbLLQ9HpEfnOwl6oHaMb2kAsMC1Ql76dJFuk62fRdV9anMSzMRwkBUP93XUjWEkPN4oWR6cEFZZVy1Q6ZPakEaOQ90an7tiKvZjy+sGt2nRZXGAPtYXKJ2l9HE1pNp86BCdqczP3reDX+h2NjSsfM3wkGFrsIoGu6kLOJB0VPiJFkcyz3shRw2z4rsUV7oWA8m3+RhTuOdGuf7O4hxsMe0e+L6wcGXeqk84V28+0tW5jANkIHnkllN33NryEYYgnJdqsD052zkWsaNZfiKYG5Ok2V+R+9T5M0uEUjowcFqJmvvyFixWPKs2MdIsIuwFEyb8uIfsMV66POFqT2/O6ozyxjAZ6ytpBZ3gM8gw9p48UX5ZW0LXGfY+e0ll1ErLCPd/mO2vD52TJnqYqKsa5dlnNDf1oBLzZZWYHuQRZ81J5K2363BW05YqYZyIo0ouHixkcWRwCCGqAmxwLTg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?2Xywvp7M3h2rxBHZ3vBEwHhRaJsw3qdPyFKZzJ/Lbm1t3Y/V92OzyVfU?=
 =?Windows-1252?Q?5MRFZajt7WxTIcqUqrMaHENvfEc2GbbntDbdX2L73MRAMH1NFSnc7fQC?=
 =?Windows-1252?Q?F7DwgR8eiwI/s11QdvHdl2YnKjAPjYxta1M0j9mIyMx0QutAmuqQ720F?=
 =?Windows-1252?Q?kMsEa/9T7TiNuBXCebT6Hq5Ig66Y1c8+EXtfj5wd7UsWDjngbLS+W1u7?=
 =?Windows-1252?Q?styHYVT6n18Yc7fosR3usEbe8GejUNtZiQdngQ/wLXeW0StEeVHJwXJe?=
 =?Windows-1252?Q?b16/ZtZr4RyZ8pdWytPziZyXlLs15ofQfkk7aOqahBp1LlLBmrlXDgHn?=
 =?Windows-1252?Q?RF6cUkpEckvrr7rSZz5/dA8VdMYUKlWOmSewbtFoe64XJ8R/YiG5pB/g?=
 =?Windows-1252?Q?5qP4Ap/6o8jctoH+AToGNJYxj3O8h04iUPsEmZ9TXnix0O1hVupAV/vL?=
 =?Windows-1252?Q?viohgKnqnGb30vaQvQHin2j4o3zDhuQrRMXlFvAI6FvL9fQfFDrKFqBV?=
 =?Windows-1252?Q?3L0PKeiQIpgBHi+hdJcorFETX/5cM5I8c+ypP9Ni/qJ4zqx58+1INCid?=
 =?Windows-1252?Q?Mh2lWiuxM0+b5IuwnWkSvJgl+aIW28NhjEFIq7mLdQPLMYlfxw8S67rJ?=
 =?Windows-1252?Q?XgD2ECJjqcKzFA5j5NJ1gnXjZ2qwFLwGxWHG59s1WqfUT742bIV+hP9P?=
 =?Windows-1252?Q?iLH3YNa20VvjfhlUIc5bNPrM9JA0aO+CgWfIMj60LcrvDqL16rIo4dA/?=
 =?Windows-1252?Q?eQeZhf+kfn04tPaEaWb05FmZJGpMXkEBX6nAL463/YFRAC4uXMihYu5O?=
 =?Windows-1252?Q?snPTI5gHF6O+9bGmSah1P3IEtKz+A6rk54RGqnebciFNoQjGKIHl6BpA?=
 =?Windows-1252?Q?VHQXSx0dS7IXWBWrFSXq4ceJ+1SscBtvppc6vlcHML0KAlJGqFyWbMdh?=
 =?Windows-1252?Q?rnrqNDvc5wfrYf234Ky5N7plZ0RV9kQJNisCgZYY/cN57BOJLn7yIo/d?=
 =?Windows-1252?Q?sHDwJY2QlODW+GlXlMG/uJbbGe1iLICdmi09gYBsmxCKAJhx1NXOTbDQ?=
 =?Windows-1252?Q?6JS1I1g158sonmqDWAChwFFUGhVspcuEJx/pPnzBRdq1e+tKk/Miprqp?=
 =?Windows-1252?Q?kmXuLCWLKg8H+c9n4xFyajcmVPscebOaIsOUdSFQfgkr2ez708ROj8s0?=
 =?Windows-1252?Q?IOOTskrvRojgm/q0UjFX0iviJCFdgIa/W7LgS5ho/TGSpzc7fGFVoCTz?=
 =?Windows-1252?Q?h3lKlQh4C6WDUXQAC0awzI8RLr1GEN57+surJPsrev98awg3mKw7jagr?=
 =?Windows-1252?Q?dPLBfmvGKXBFLOxYzD1vUNoit1RccCGmgNFQkYZarTvSYkV2df3QNFRQ?=
 =?Windows-1252?Q?KypTju/Y56Z5WzFcAgTfC78HRrBZi9WUIbSTvSV0Xcsl3KZ8DebD5ul0?=
 =?Windows-1252?Q?FgvE4xi8xd0MllXaC4NVakipdlnAhupSRAjW+630sCrQ+PM9h0TIR/IA?=
 =?Windows-1252?Q?biyyGd8jm4KXjnZ/nLESPipx9dBaTOqUHAnwVf/Skx1XbnO4MoE2BAVe?=
 =?Windows-1252?Q?GyLX+LPbOwc7XRcvwQCgehRVAnUF+Q+HH0boau1hpq4+quX03YOjmwxe?=
 =?Windows-1252?Q?NMzIPM1opTbsp4d8PJGWfyRx5mfm0F7v33iqZMFJ4o8yA+koSaiTUQYV?=
 =?Windows-1252?Q?vNok8b7UcO5Vj7zttHMZLoTY6nqjm04XAoeUzIfUPoLwh/1lCFf67Gg4?=
 =?Windows-1252?Q?dnHLSTCA79mo+bWt6kPdnbwC50G4Vpn61jiOjdXL3d2HAQ3E4QQuEQs5?=
 =?Windows-1252?Q?/Ffimowiywo6x6+XcZrIymJeTCDpkVX4mj1JvVUe3eHkXP/mJt1NRWCT?=
 =?Windows-1252?Q?002xUSjMC+0D1w=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b3427d82-ff6c-4770-cdf1-08de7d7cc99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 01:40:04.4710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6rWEK1mgd6BPXmrOSqfsol8Ib9USPH54Aoh24bT5qzTfy+Lto6IR1bqhTeEB7ByO3uUhCXq/gEJaEXoi/eOg3aen38NnkRDw3mpjX8OOKU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5461

Hi Guenter,=0A=
=0A=
You=92re right=97the probe path already registers a devres action (devm_add=
_action_or_reset()) to call aspeed_pwm_tach_reset_assert(). Therefore, ther=
e is no need to perform this again. We can simply remove the remove callbac=
k, since all resources are already managed by the devm_* APIs.=0A=
=0A=
Thanks=
