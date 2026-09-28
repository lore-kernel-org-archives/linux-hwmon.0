Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2095.outbound.protection.partner.outlook.cn [139.219.146.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827346D569;
	Mon, 28 Sep 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583353; cv=fail; b=sL5XvfYQE3pO1J1b29qfh44cPzwmuMuluEHo2LjhL56g8p+kMuIY0neqEO78mqMpag8ysum8Z7aRRKnMdBKZYxfBINvVHgLX9DIVq1HpmmhcWET+S8aDl5ChCJrBbroe1lSRX+fbrfFsGGE/knhYDprbPvwwaZXn/r4CYr3qQfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583353; c=relaxed/simple;
	bh=gMjlZH0baGPivSQopPQ//MBd0rvQFusMCNAHHxaa1s4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CfFOegL25zf5LroCp5fJOoVxUAou4nLc3pCCSv4F2hNR6kAU1JTNAquUXnsjEY/+J+6y+o+RRKHzg2Cs8zy4Dgj2TXtdw/TTSiqhK5VuCKVXdKyET5t7t/3MkHD2xTdAQ1kRp+kX7Ksq6MFpSiJcLQ2/XGv6k0TvKCL2G4/eOaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duwowatJI1dDaJ6S8YsORX1JF+/oJy0IbdvTnmVEgb0Pc9BC6+YxnxwSz65xd6L6AgQw8SYnX5kJ+aFt1MKb4Abck93A5Nzv2wGSNc8u2H5azYUc557Mp1UdaBPpwmc0oBmayamZF4t2wkVDpaCgQOxLaUdzm9WylWL2GtiiCV0EZgr8XKrM7JXxMRepzoPGhUQXJdjFrrV9V5cCB+2cek384polA3Ad/EGphz5B5cdBUx9/07aUhMLaX9/NFyqkqsP7U55+9/XxbOs7vDE222Z2IBdvsNZtgCxWXLzfozKULgRVVwt+JPiaoSilhaF5Z5IH80axIbwX5Pr1/IYcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nm1Dd+iLNw+x9wcIq5ed/24+x7KeFwFy7Eu14gINSg=;
 b=Dc85Xe1mJkQySXxRQVXyTWZwWjGfcFdECVDHcVddJnTe1P6KY1gheSzVhT+p1jR8ftBiWlo+dpA53fEcfGBTF4+IEp6QgfytP2vivy/JJsuOFIXVlWj5UHK50F81EV7S4ooY0B59pui2kryMdcZ9v7LbIZq8RcAiqIalTxicEU+bumY2NWPjuUcRlytjO23TVfmsW873d8WGgtkT2oXwa9Bzo/QeiNx5iFmGJEUNnOrsnW54xMkSBf6OPQYPqGrwJQspIGdBWDUijCCpHdiijr55KVxtuD6eVKQTpGI8iTxeP5mMRYW7LLyRx1z32uyM4F8K/5cw3842rNaC15RfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1236.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:00:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:00:35 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 0/6] Add StarFive JHB100 PECI support
Date: Mon, 28 Sep 2026 00:59:50 -0700
Message-Id: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1236:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ae4ed3-523c-458e-e458-08df1d369398
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|366016|376014|38350700014|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	khhK+YxAHz0WjtM7yzMufKDKWKLYnnRC5sXRjdV2GEfkAE98CPvQT1TDFRvtYg1XHf8FyCdYRteO95toSsh4f/zTag3+NMu9QUAnKmrdKonXcoT5Bi7qJp91Y9bkhK6TE0+nu4RM8DB+nRyKz1MwnhzTV0tUM7nX/6gkH6p6Xs4yUDWXYdg2v921TQia0byuSClwHQRkn+jbitWVJKhthtlbFydmhs/9rymllykcpiC+XBDD3A/WGukBWEb1kjvQEeSAo5W7lcQ7eL4CkT7WNYTgVg9JJ2miwke8FQkBB8nQqPzj4EAHx8fNZ79NM8Qrl7IkUJIEkwJkrwNkR94fX7ZgterftSJCcmNGD/EHlrA4eMNefXNJbYTgiyvTADdCzUTaVO7MbNRA8EJ/Ea1gdhVsXmGxcI1hWpr1zmVh1pzSPlDJfP89oNmHpsAekPqmOaThxdWMA2mBOoyUAcd4ZMEd3QmDzWcIDoel55Lx8G9jhGXKUFpZdLOhzVIqVd7Icgunq1JEvAlLlLY1kLKZJFpsKBjb6aTa9ZcKTDbkpyoLludNEepFEli2KH7KTPP9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(366016)(376014)(38350700014)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IS4YJfQ0YlEyWVlwTmPz4PnrjDvzuzn1yggMItmhq5zIEEwtsq0FWFzbZ7Eo?=
 =?us-ascii?Q?90qMcBfQDGN5nvCQ+P4cBjMfvt3f97bzbWPxpcQxcBhBbweIfttOJFHSZbVA?=
 =?us-ascii?Q?Cz4+U7ZGf7mlon/AzGIs73gxO2Z6QzRx5RuWZRn7GSHyi4jNDosrO0PexIGi?=
 =?us-ascii?Q?8Cp0N4STTYrK2orxyy7eJ2u+5FrKvH0/fzrtfZtmXt4zstfciNYH2n7AWHbV?=
 =?us-ascii?Q?KmbDqQo+NH7GPP9ndjml8GN1fUpv8E4zf0ywD7fjwl+uV2qUjDuwu8S/er2I?=
 =?us-ascii?Q?iZ1oE58qEnM+fADZnbONRntfgKnURqajNV8EAJIqtMp+Bb/QSY395iEnHrLz?=
 =?us-ascii?Q?BxMpfWe4152fURPQgp+cA4fK702eLmGA7VHACYM2WHoVLgBqetVbgf+l01l5?=
 =?us-ascii?Q?iNqvNxlzmCHDHccDqI9uZOBv+HhLcUwAP4jlP8QBvVQU69yK+1puFxV2rNJx?=
 =?us-ascii?Q?QM52wEmbDDkdFneU/gdsqmaJLez77g2wNXAo2FMyj1b9DI/8Ksa/x/UlnNTU?=
 =?us-ascii?Q?8Zvlu2XZWffYs2Vm1212fxEEzqGr39oH0YyjBC8Gl1Yu2p6cO35GSowSsnG9?=
 =?us-ascii?Q?5KkBMewSLnXF2zIgfBOlpBwIdHiGEvpjuaHmy3pNApJu6CZgHe1N8vP2Ugfr?=
 =?us-ascii?Q?Qz2io9Ii0TR9wXsD3ptqmj8+SKNQumdu60F5YkOyngMPXllJ/azJP/4E2IPc?=
 =?us-ascii?Q?1EVDbJ3cqSPHaqOcvBaIwQXaFMiLdh0bxTRp9ndGzLc1E1kglr+nnOF/akuJ?=
 =?us-ascii?Q?dt3A6GTCL8xWYYjniEyBZtp/2WwhOqLPbebHeAutjbn4K6/5/UuVZX8stfVK?=
 =?us-ascii?Q?q3trpaj8ebJljgJ3e4zIA3t+WmtBsM4aDfxFocxeXEp7gcQLNlJEQhEO++oo?=
 =?us-ascii?Q?zq1J2MKks8r9gwzneBj7xU+U6j6wV6SBrnRMgIq4b9N6z8mncIr6/NJ/S1Zl?=
 =?us-ascii?Q?uysaZIcQfCQ6DwYfZBgTZFt1/MhiujG8fcSq1e4AFEybJ9aZ3RKfFn02ryVP?=
 =?us-ascii?Q?zv+fR+iICr+mmZiqHIvCYk/aMiVhUH4FJ0ZozeyK1wGAq1v71Fwui+7neQmd?=
 =?us-ascii?Q?H9uJfSbXrU2NLjcIHsvfyWgbN/p0ZBV/4cb1paIcRTaMpA7VKxbdG37Q1Mgk?=
 =?us-ascii?Q?oZDajLVJrlAnI7LQN9Vtp7x2TCNM3ZRsr/TSwLaaUMBQv9Ecn1AHdmpdQxTK?=
 =?us-ascii?Q?bp7jwRAqfFHOJ2n4gYqLDcvjyC3AgHsW2biS5myTOSXZxE7NaFWEjo13GpOJ?=
 =?us-ascii?Q?nObevZzC9OxrkmNgDgyC6uik0PWZOIlwg9WFeasSAAu4rP5xgft3iDKOnOQp?=
 =?us-ascii?Q?49Hn7I5xI8HQyGi+Bm0l+J9dmUsNUmu/9WkGWiHGbqV9OdzTk5WwbbXzH18n?=
 =?us-ascii?Q?mtn23hCcgtSFMw92OzEBQCf/+8252gQu8znYZWo9MQXSl7nXQMMdL3PqmCvn?=
 =?us-ascii?Q?10r7fFfiyAQeIRXCcpvvhpPdZ4bJFYsZmyw/HeWnj1j2/BHFR9N6HajmMJTi?=
 =?us-ascii?Q?u5Ll0TP+/AtcMW9MUKLjB2aOI8lZ4xWLrzuNzEM0HJmjb85F3vlN4a0AthBz?=
 =?us-ascii?Q?WuQq25UEyNoCo6Xnhb6DN+t76TJRiBYKaIVfW96qz7EcwltMlBvNYHfvcELt?=
 =?us-ascii?Q?5lyU/C5Yetkqz2hkFlW9gIsLwlp3XTu7xYSqG2oXmLmVXnyiLmbUZ4w5C7y1?=
 =?us-ascii?Q?TWLq3aB3gMGB5FUgr1935e4CCNYbHPA3ylG7Fgzcg3Hri33pe4T9Fs93sm7v?=
 =?us-ascii?Q?sVuQf8UpbfFZ9ocXeAigWEPFsfSdBuuwIoih/TO5BSZYjrBJ3Rq+?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ae4ed3-523c-458e-e458-08df1d369398
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:00:35.3336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oixBflx0RSU1QMu/Dq5BrLo9R+ogEWwEHSUboMyi9+p6Q7y/5IF3rC+rJ5uhJmZ4j18iQVYRG5oc7Y8TI9VLyLFgdcWOhrQ/6u7WKFbVJDf+se3cwWQrMH5ejhTP6vyb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1236

Add PECI controller driver for StarFive JHB100 SoC. The driver
supports PECI protocol communication for CPU thermal management.

This series has been tested on the JHB100 EVB1 board.

Changes since v1:

PATCH 1:
- Add Conor's "Reviewed-by" tag.

PATCH 2:
- Remove PECI write command support.

PATCH 3:
- Update the 0x83 completion code definition to PECI_CC_RESP_IN_PROGRESS

PATCH 5:
- Update commit message
- Set GNR's minimum PECI revision to 0x42

PATCH6:
- Update commit message
- Set GNR's minimum PECI revision to 0x42
- Remove the redundant !priv->gen_info->read_thresholds check in update_thresholds()

v1: https://lore.kernel.org/all/20260903133408.110847-1-changhuang.liang@starfivetech.com/

Changhuang Liang (6):
  dt-bindings: peci: Add StarFive JHB100 PECI controller
  peci: controller: Add StarFive JHB100 PECI driver
  peci: Add support for PECI CC 0x83 retry condition
  peci: cpu: Add Intel Granite Rapids support
  hwmon: (peci/cputemp) Add support for Granite Rapids (GNR)
  hwmon: (peci/dimmtemp) Add support for Granite Rapids (GNR)

 .../bindings/peci/starfive,jhb100-peci.yaml   |  57 +++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/peci/cputemp.c                  |  21 +
 drivers/hwmon/peci/dimmtemp.c                 |  33 +-
 drivers/peci/controller/Kconfig               |  17 +
 drivers/peci/controller/Makefile              |   1 +
 drivers/peci/controller/peci-starfive.c       | 376 ++++++++++++++++++
 drivers/peci/cpu.c                            |   4 +
 drivers/peci/request.c                        |   2 +
 9 files changed, 515 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml
 create mode 100644 drivers/peci/controller/peci-starfive.c

--
2.25.1
