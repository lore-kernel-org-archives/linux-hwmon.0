Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E9825B0B9;
	Sun, 30 Aug 2026 01:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788054780; cv=fail; b=TyhgTr+qSsAYMoCQBcekBHy/MOoZft82i7TVQZKsVgQBAWBym062QvZNFcWcac1n0ItFugBFtuEubT4UlnKrY+xk3C6nmmbJOvwTpVFYHEIn0z43F0V9IzZewH4eHpuxdZMAj7Zh27hSA89Ca1UqCfDhZL/KeTpqZS6Vyg9lS04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788054780; c=relaxed/simple;
	bh=131sSPZRlIOTs3dyEPr+ot8WWDSORx62nM/RQI5Q2us=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DnLlnRjlVaB8Af6fQshHgULJ9ucLO2VSQ3wfKkTRH5/K4yx9RFd/XFv6RWCtO2XlDZprtvlSDaIuSXHYLIWSWmoAOEb5IU/WagPCJeQ/Vn8kxrw/TfBb/HPlLnW30tx3Q/FhYBO13AITAFrRx4cipJSCisBMOi0OE6r3QfyFB94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtEDQqlghEPwhoEhXqQdbxjA3Ozr2ngmjDecUAlh3DUQxsfB+/eK73NzQ73uIz1m/+92TGJutlqDxe9zaRwn5l3Pj705M8c0GVANrFC4tYbu07chPI1FNeYC4ZsLB+I9RuDf5y8TqM/Z6GuUaZaZD0pSJXFcii+mCg0zCqi+M1OKnJvNZLIzJWncUoeIHoBb5KnQDzab+KdPr214NfxkvNN1GOKUrN6li6Ionvk5phnbsDUcZug+2WDIHYA/kxTdoJ2ps2tTdh0N0AYEfk3/r6TkQQmWK876z08Z7RcVgR/q6ZYsXRvN14uHIIjYzcNBBxZ2LZ6wPi6wfwNZ+ZuWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgpYPQKDYraFNmXDODyLnvAnpbPhWqjf3YKS8/Ytki4=;
 b=B6Xl39YRGUMJMQcyzp3K+CiPOL9sIrVSfN7IAgqGW7/JzOR7MPgO7rDCJE3XsU4AqLimyXxyw5otFY4qvQx8vr3WNhARJaLBwfyQ1te/mWeYI1HwreHZqbdtFoh+oHEQFslW6umF75foG+zPg/AQwR60DvAQoqm4kQHj2TxlqHycLuNunNBJYDsazqHWB3/xYgUo8/a48hqGtX2GQqLwf45LHUTjmAActqGqBi/Y060PMVs9hP5zew5ROXtF9HZ86wzasI63vhOAyvq/de1NQMmniCFfe4Wm4Z1ybtKaTqUZiW2qbQWDb98gViBbwd79OdKN6WDGRe8sHp8yz2NeAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Sun, 30 Aug
 2026 01:19:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 01:19:53 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 0/2] Add JHB100 Fan-Tach support
Date: Sat, 29 Aug 2026 18:19:39 -0700
Message-Id: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: e182a1d1-4d25-46b3-6e5b-08df0634cb7b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|56012099006|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	SxeMsTnR7w91Rue/U3kiKJbn0vB7qiHVMyeiErNCj2o6aNErGObdyIr8/QNFTwWgNQxNuSkwdp2WNTF55XaEdloX76uWyU9m6xclp2VUFLu/LbDRbGzr6lYz7WfPKx9sDBvNgSel1WBEZbyrPcJuaJnQK/wWqThonk0gkdOVdvpEnSrs5QljnyJ/nG5rp4OdexLs3o+ODziCKEUojCjwsWNSrGBZSwToje8jU8F2LUpIaDPBtIqWyR36jqgzb27WNLNU+eMrG7azvtrW36bPw//9MAlb9DbL6gJSAA2y+p794VitCTBR7dl0RBDEWWndR13Af4aH8LQ+PhOqruRmOra0P3WVvt3nZmZanH7Zw4Ni/MPje2oStrkj2mdmRS6m/KhSsVA8sgd3uFjwbBdrEMknpbotAzWrM0f3vIBFl/KutkJdfXE0ko4cyt1SZxbJix0WYKS/TjSwabYuQm5yo42ambdm4yIc5KKfYAtdGDJw39SUI1V7NG1pXsN5SwgA63rVv3wC/czQm3Ml4z1sfJ9R6dYyjvlmxIlRzluwE5epcwf3gcJ5lUgzMTlhY4+7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JiPblDvTbSIguTxIhWA21YXCvc5pxNnSyAp5TxELg6HfkxNuwPc3WcLOIzkW?=
 =?us-ascii?Q?OBMpTzJW6z/rKlfTacb3O9g+8TndCOh07ALPbKzfdTTvDnbQEep1p4QGbX8y?=
 =?us-ascii?Q?+wNRSAu1WQzQ3mcq0GxKOmRgP2LwqTqVm4/XujbjGOSmX6nUWIRJr0ZZfaDZ?=
 =?us-ascii?Q?vhKf5yhd9PwTKOg8oderC3NGJmlcJ+RwsgHUmgRWhxjf2t4JgTfHQjYVDEGH?=
 =?us-ascii?Q?lIGw/c4Kd2mFzqATbQHiMTEalTUhfA1OaPrmonPzUjH3o8AFBzfG0IrIkZBJ?=
 =?us-ascii?Q?gyZ49dvYwmLfAohvt3j7dh2iiwAy3q0pOfqLHTJmJzdU0qrbVB+RYnMqMTHz?=
 =?us-ascii?Q?oW4VSv7vsLpqQlD8wjNzk0YeecpRaParOStqwbplUfAinDQM2GhE4CMGd641?=
 =?us-ascii?Q?Ze8CgvwG2xK6fRHW9ScnX1BkcUvpEEUcd+Okb0fOfng8poL8MhOaECEOqTSj?=
 =?us-ascii?Q?2AnRr2B1cueHyHCEfQozgFTAJcrE65iEcu9jeUd+JWwyc6kscD6Ny1zrYITc?=
 =?us-ascii?Q?wjcwn3UrMGf+/mxj+jMRd+e2CJzZzubrHxUhXaieemzKA2uOjPnox7ca9tBH?=
 =?us-ascii?Q?x24kDn9JfOOGN/P6Y9uDDor5rFllOPLXdJ7gR7FPuojNsG6ZpaibbiM7Mh7/?=
 =?us-ascii?Q?IRECg0Gl1a9foYn3cPuzEWh6TSrR356YZ2yU2SHMmHp4hqPCmKz6+2ZIZsKx?=
 =?us-ascii?Q?1iQc14LaiWuE0X9dz+gvBVMGBhIsGpK3YhRKvST05WYNTg/GIrX4VkkCFJe/?=
 =?us-ascii?Q?jogKncqz1mkEoekoVcigI6PsAwmX8SK3iAI2d17e/FfRyIuJ48iT+Zn+ly/m?=
 =?us-ascii?Q?HH30nTMX86ZqpFSlKYFSS7veYav8N6d9mOpHS73mWcn2WYZG6AivaJNG5uyY?=
 =?us-ascii?Q?2mEAfXhwj5Sr8ocF4KpYUtbDp3jOJco+cZyA8skjDmSRNkz3JgBwgNixTGTD?=
 =?us-ascii?Q?YvkaKgdam9+SbZKC+T47iVPAhh7k+Ua5ZrEmFm1SYe0t36TwDt901BRwzrg7?=
 =?us-ascii?Q?c3dhh4nFT/Mbiiq493AkSAUuqruAaXxjrka0WUGiV0afw8NxwqKxcDyvEfsH?=
 =?us-ascii?Q?3y5j8peuOWEhSpmC5H2flF5qvzCTV5vFREYJqZXxqNDH7sPS/+HgjC8xkBE0?=
 =?us-ascii?Q?TiIw95SZyhDIwA+EVWcDni/WYdZqenSnSaeEdazzi7rfOlmkw7E10c6dHUDP?=
 =?us-ascii?Q?aFcH/ZhDN0xnpsdmV1xaPlLb8Jtr0Z0TupiDhQuB5S358w6GnNyt3Rip8NUF?=
 =?us-ascii?Q?+/p0VFah69zyzDAzRZzR0wp5sP1k8cKvAlYrhxvGZ384eCTAYXrprCZPOVUY?=
 =?us-ascii?Q?gEY2AtGLcgR0gUuke7a5AOdJrLrxgZXSB7f/206gEcmHMG9psVmVbMrmX8A8?=
 =?us-ascii?Q?Va4HRqRETWMwkPrzfRsnZQ/Tqg1giiU83tMAsA1C656HuPdBKjpto/biC4hu?=
 =?us-ascii?Q?lYXD2NzBKEPzhMpJCYJ9e1s4yPdCq3e+oWRnXQthp7fLhzuYMdX6uAA+Uw3u?=
 =?us-ascii?Q?q4YnQP7YRy9DxJccpju8XzbnuYPkmHfJfMuKuRlDFOA5mUEUGQ14RtLcwS0H?=
 =?us-ascii?Q?2/qIHlCOpcv5PvR0+C7S0sSJKzUZmwgbP5bD1M9+r7nZA2TEO4TlCkFnihFX?=
 =?us-ascii?Q?Xsw6TT3Gny6mSdkfqIX8sWjoOEK40VNvZkVcJEVJn2ddE2CQMarUyTwf/nZW?=
 =?us-ascii?Q?aorKhtg28IvQqKPnWmgsuy4bIRiYbNtOUnFYPsGag513e85uxMiZHE98fEkd?=
 =?us-ascii?Q?gCZ1+muSVTTcnljYNUvTvunfo21FVht/AJomfIux32TUF1k2gXFZ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e182a1d1-4d25-46b3-6e5b-08df0634cb7b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 01:19:53.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYQcS3m4V5aKrOgEBhYnmvO3IHTvOT7S50+56+lBvXJ0ziR1dc2PFYVE44em+BEFEpMF01PH6AxmKLWTAkiGZrA7X9e0I9PAbOEec5HmefifAmAmEdVAh4EORR7p95bg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

StarFive Fan-Tach controller can support up to 16 fan tach input.
The series has been tested on the EVB1 board.

Change since v3:

PATCH 2:
- writing 0 to INT_EN before touching the STATUS and requesting the IRQ.

v3: https://lore.kernel.org/all/20260824030234.9321-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260819091601.41077-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260428082337.743546-1-changhuang.liang@starfivetech.com/

Changhuang Liang (2):
  dt-bindings: hwmon: Add starfive,jhb100-fan-tach
  hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100

 .../hwmon/starfive,jhb100-fan-tach.yaml       |  93 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/starfive-fan-tach.rst     |  38 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  14 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/starfive-fan-tach.c             | 542 ++++++++++++++++++
 7 files changed, 697 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
 create mode 100644 Documentation/hwmon/starfive-fan-tach.rst
 create mode 100644 drivers/hwmon/starfive-fan-tach.c

--
2.25.1
