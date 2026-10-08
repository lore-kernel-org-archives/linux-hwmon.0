Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070A1C3F0C;
	Thu,  8 Oct 2026 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454013; cv=fail; b=cPT+etZwKHCAKvPE1hLft9ZeCDBjolcPvvZuyagWkdkd6Z2SsC/SLRSf5NQREJntrwurLO/qW/hNXUxkiPKUA1tgK2Ua8XQnBMiWtazxNygPit3e8HHah3JDEa375vtNCncdKU3AdwSdVSB/8uqT6IwcQEULA114J7IVLXR1+e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454013; c=relaxed/simple;
	bh=M+VwyKIwjr9MhDKvxFH5Lhz7/pTDw14MjLbnU9qsnAw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SrP2o+XMu2dUoxZA7rENYayerkkX6e8tdx4lzdq/TaGPW1Gy5AWroltELpe+F5QCOdgJPKXQmz4U5RbJP7uGyFGZzSHTmUpQNZbG4CZFUBXiVEjkyc5ztvbDsnvqr+p33NX7kHsLrOPmuiqYl0UuVXGn8AiDy5hfDcno+mZ1pgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q40EQ501iV9moVQyVOO8zYqGXmS8GUFcZr3ysPZ/qXZPlXLZV6POkN6uwb9z9/hB8uIViflfhxvF3gwNILiFzJLfeWTM2dBFnYPxsSxAK+zTQCzrIv1DRmnIPXtW6bl5llgPjscoAoE6+FoZFwpojnFNuh1/hGtMasxCfax4zVxqFjfHtOHnmz2860g+VJexbMZcgisx9gHBht5xnC0gdbkVpk+Yq5hGJXRJNQ+Lh4LAepoJCGRLt2xUI9yHI2nfz4wsOregOQerpVgyXyD2DRJvfR9FH9w9UD5EkLpuuH+h7XL6EBQ6fM4dePlhwGZclTj/ENYJernZegOXnkksMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOOiEbCSBC3s2DsYr7dknPwW2a6tg6hHhhLOB+ZMp4M=;
 b=QykNrXjqTbfM+8GLmWJpmvB4iKTmsL79ibXSWrG5CRs3RA2Vd2IboZEOv+fecByJ+XzJ9QGW1zEbpyHgJeXy5bFHjW/5v4w9HsCD1mwOrXLrdpzB6R0Rnt1lQWXj4rC517wdmHIWEENE+PbchkKyG4CtVkB+mduRjBopX9RuF976jG5K3gCd8/4HamYkQ+njI7/xJPXnghYmAuANDrTv88E8eJyd2NlrrnHiOwFWG3zlfwwRk2Y8lP6UmT8H1v8t+ChPigKYZtXAXi/vb/RSOJh2mvcRecRnLxjBPDCAz6z3rJv6k03zkwLYRpnQkqBsZ0JYSqd6g/ObOZvqw0ttPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 10:06:33 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 0/6] Add StarFive JHB100 PECI support
Date: Thu,  8 Oct 2026 03:06:17 -0700
Message-Id: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0026.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::35) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebd864b-21ab-4d3f-79f4-08df2523d4fd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|52116014|1800799024|376014|366016|38350700014|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iCBS1cSSZ8TseJ5YtVEJe++iOMAHSQgukcl8FpIqT0oEfYL9p2lyTr7TjW3VcSbhUCxZ+ib4x2hvcky/4IHuYN81839OiXD+6qunpf7XZfznAO0XB6imaoy1dYnk9GGN+SXcgOzs+cX4JBlSm/K2JwxH0qQ3IZuMSX8/OzuGdoH5lMjT/UVY7OoIDOXJ2hjWP2DOjAF1v7KGjth8roDtqDCQ1aq2YWXkLeCS2cF2fyoYYqIDOdGX0wv/Nr6s2M2ITtGTp6e5RoQbCpjcvh6oLduKhzG2SWWwrujwSOV6bnP0OOPIj26cAkhEaq00EZ4GWq5Mt4OSNcP2OxktK3Q0CBVyabl2VGCtITOSsr0UBCQK1VtwB5n7qbO9nKdugkfrQAolmWuJbd1cr53f1YK/vmEB4Iu1oqZc/XVYow7fQ2Zsf/Eq5E96LiIoJMCyLRDLp0AKEulzgKcdmpoG7teSegJvNACsmA6wAq4ZnHByCFexEtuJRsWaUQTdDDgiZ1Znvwg7+iwPxN7qUyH43v60xaEXel8fCBvdzYaXin6o5FL/pzhYuiPJRL0Z52wJKQJl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(52116014)(1800799024)(376014)(366016)(38350700014)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cr/tLNvsUAFWHsMfPXFyW7q/dWElFMbFtzE+rTT1VgWF8CHuwvnQ5EnFULK/?=
 =?us-ascii?Q?0d+MUt7eQhyshQ3cKCwaQuK2vBpkr5jIvg/kdsuH7UDEVyDRWv1WtLRXID6e?=
 =?us-ascii?Q?d4Mmd5gzbAd9tIQJyeW4iDTploxc0izASNCuWSwWBBKpZV4xhO9BDVgsuxuH?=
 =?us-ascii?Q?Wenme6WA1XUK/aLUVZY1yyZMfJCiyEE0pHH2c42lgA2mohTD5dDFZOuQOIaL?=
 =?us-ascii?Q?WvbRhvTC/l0vRPENJNvfqtZttJ6Mxu1kgcdjq5IJ2Lc/RkVuUZH2Xu+OYz6s?=
 =?us-ascii?Q?Rd3BpiH9XVntpIHk2sHUnemDlawd+3dw7g4FQBfKopMMELBnmbj4t6vqcShM?=
 =?us-ascii?Q?HmAfk8RSMWX98yo+H0pgaucuBLSrrKbIyvi/7XesGwFyFFP8wPPc/EDAaNpr?=
 =?us-ascii?Q?3WbVDTKRfbhrgfMJnlNBcm3wPmvdQzSlc1H43/l3RYl4QB5SMIlgj0Pk/Ees?=
 =?us-ascii?Q?Rd48x7dZOwW/gqAcFvrO/11qCe+a2Cp85XC1o2vVz7+XQ1Lh+Unsadw5irqE?=
 =?us-ascii?Q?Ry/jultZOs7lMEr1qAoRSGV03BSxOkfAIAC7qoqYVhv35tweg60yF3CPVRW0?=
 =?us-ascii?Q?CajRUg+tMJaWBbd8Pp5aGezXOSd8e8xiZVJLwobuP6qmserMc7HTWs+IBejK?=
 =?us-ascii?Q?zm4oTgpcS+meqnOLmLh1SahbeVQbc/cnNfxeROkxeKaaCbgsIEHRoof2wIr/?=
 =?us-ascii?Q?/eM8NVABMl7YL9mMFwIcZhHQToLFl6jAVEeRDh/Zb0dy8y841JInUxS+8fW8?=
 =?us-ascii?Q?rufQiu964rwWXyfWfLr65NMF3qtCVTzotPHc/DI/0hXVLIvK8pCnMwnZkI4v?=
 =?us-ascii?Q?PImZf2Vh1fXyXQCtptHhLGMKMxwg/kTwRHpxUoXcw4DkUecD+ZdNSvDqOR89?=
 =?us-ascii?Q?70xFKP4xUbGer2MgWw0yyFRhYHi1zfKUC6hXK4xpw5kjIVyljjzfnmg14gTx?=
 =?us-ascii?Q?hCbuk2Qoa+hzAvso1jr3M9zLUvx+zMmxbSADk3tRC5SyFe2+wbO05Hu1/ZW1?=
 =?us-ascii?Q?qKJ2HMDEwhiJnZ7BYA4/R5IXEysFi1dyAM3Me5CCVGrsBRvqzYKksSkgN6MS?=
 =?us-ascii?Q?WppJv2MYj6nBqh8qPMsQyBf1YthSfORZLJ6lS2TuDY8tTFEQ1yyct6SvficV?=
 =?us-ascii?Q?wLOCfvevLaB200Kx2hjBZMPwWYZzG0tmRYv8OZF2phbrbWalikGe5jIMDF4P?=
 =?us-ascii?Q?Le51Znn8tRSsx6hTswpyR4999zZbY5Ty1b315pfnIbgjJe5ZLBPHSVGRQ47q?=
 =?us-ascii?Q?WZB3Ecz7XlRr4T2psnt2D8EgNUqHKMtSkhBiamm7i+GsR8SbiT7sGK/dp4bg?=
 =?us-ascii?Q?9Scc/noX3Lf8AAx8npxYFiP7fmq/6uhwLTod4H8/QLVfWRK/w+H1Sd8nMzRm?=
 =?us-ascii?Q?nVxLzlnv2Rb836zQRSxd+NSjq9PjarxkQjHmQn6XlgzrHF2pU5lkvsaNjrk+?=
 =?us-ascii?Q?JP7YLVL5eagmVpsvAB9q4ueHwGEfnraTZ9+fdzy60W+OrDJDrE1sUigSzQHa?=
 =?us-ascii?Q?eGHQp6oAf9SMJSza42AXAyMdkOhsmc733nPeJ3m/hp+o7K8dLHrdVfHuXVDC?=
 =?us-ascii?Q?stlWXQ+y+EGrjO1Cuilm54zfwnxKDI12pKSbhz6DV9HeuMhR4mVseX/TA3Jh?=
 =?us-ascii?Q?LT67fWT+yT4ZbdmEvn0UekmKeDuwOVZ5+D0QejZIbxUJ6Dj69QO5dVKJn7GN?=
 =?us-ascii?Q?b7lvFQdbXaZGJRrIYX9qxiX7FKW5R79dfVz8yB3i/xTIVk6OHMjqOIZ/yatx?=
 =?us-ascii?Q?W1+UK39Z18I0Mh6hWn5iqrnzlRAtXVit7NmHgZn1eYWLKX9HNB8h?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebd864b-21ab-4d3f-79f4-08df2523d4fd
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:33.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU/4cgSHYD7nPAbhngYI+z+0d4ZXLWBbwoDUxVx5QXIWaLuMK8/OuzUcNhSRDInDU0QoeJVHJpKktM5M4FVcUOnMrI1Y0jadvEbGtjaFsssiYym2h+jNA1PZ3K7wHayt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add PECI controller driver for StarFive JHB100 SoC. The driver
supports PECI protocol communication for CPU thermal management.

This series has been tested on the JHB100 EVB1 board.

Changes since v2:

PATCH 2:
- Replace devm_reset_control_get() with devm_reset_control_get_exclusive()

v2: https://lore.kernel.org/all/20260928075956.62298-1-changhuang.liang@starfivetech.com/
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
