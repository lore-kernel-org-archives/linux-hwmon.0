Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2099.outbound.protection.partner.outlook.cn [139.219.146.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0D2DF134;
	Thu,  3 Sep 2026 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442512; cv=fail; b=ODlmlhsuaUFAhZDzGH7rVxxlVDxMcXfNh7HXl3IbRMRgTJnYjjRDTNjwgKpHDuxJ0ziSdeTSF4zdWI+vT7GM92kHntrbvwgH6KXRDFNNlbPLqmBEy3dVeTtJqUKSdKFNrDoHFcr1GZZ2XS5DLLV4ZNhJxyF3Y7mPuQbi2ksEEi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442512; c=relaxed/simple;
	bh=6UDbEY5ZpR1tFm1Dw5X+4PTmmXbgJ+aEiWcmlPw5qtw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pQlLNjwdL9Os0k9WuCWYJKWlFId29WmCdACb62g3BT8CS7HJ4fXqFZjHgMvID1t2VRBvClRktnw0II67UbRhkdKhJL96ngQJAX23IbmF7wuQFKiAV49sDoG1/5ueJARjyu839BdEDC87nGmES0/VyuUduATW2urXejbF5ecwaFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzLPhp4Zek9e7umsGlwwKLzbOIwJ99SILvC6MfHr+DNwroR1+a7cVwp3AkelKZXvHJcQ6JvquzQTMwXO8TE5ynzCxorD853MXp3NHwW+EtwRQrvEY1b5ZiTnexVUoRTWl9J/k44MITAoxpzu93ZUSpX41TBkc1DvEgrunlFWVmUF3T6xjGPLL4aLuu8euuokporxcfzZrvuFlUV4UG/j+IPAFoZaarZMyD3HLK2YUPgvbtIUs1om5AKa/PFyil376Pv3UzIaQmv/LV2l3IhROu6EwZD96nz8wJ+H3qzA5W8OgehH4aP1GcJVcZTbt04slbcAeWrOfDng5KBJYBPz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE/iKDqI9xAc1x1iLJqf6JKPA1INENgsca9bvo7ZUj4=;
 b=BWvO8RU9PnhxyPpYFErZWsaqre1ZpiZ7uo8GaewvZGBWAQsq/GcYfW2eFP++EYIpFQmAxRnjM9yEWsP5rStXDzlCvIA6uOEI1CdhhKOWevt92S4WkQvRxMx7UykH0e6iSmKqXwclFvvB4GwVF+/N4m7A59A7Ub2mQBM6OavxLzxkkmn3ajygsOotwFUz6YqY3L7BmGYVm5WG8PWLwDsUZ2rGo+WLvG830YzzepXV8NpITCQmAf5+y591yYUU+HTqPXfx9lEGvZW5p1Q5uGRHmG4wwkvMG9upJ9Zeo2ULrZILb26xG4rrSsT0FwiBDgs47DPPiyADt98Jr91AxU0XXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn (10.2.1.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 3 Sep 2026 13:34:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 13:34:37 +0000
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
Subject: [PATCH v1 0/6] Add StarFive JHB100 PECI support
Date: Thu,  3 Sep 2026 06:34:02 -0700
Message-Id: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f3f6ef-df47-4712-a0a5-08df09c00e7a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|52116014|376014|38350700014|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7za9zS08HS3oLt8dItPpXQHWdsemhdlIn1T1ch2jQFauo/ZbWhlp83Yap614Q/BRBV3wWY3Kg9L8IHcy3i3hiCuxjNbs2gzpULXf/4dzFuA6OHg5GIh/O5AmdFklaXB37v7IidX78ZmpLaUPNQpn3h4cAnu6gXpD4ptNSQ9kEIAwi4gAGCkqBKudw4lZ4WdklYGxyCPkHcJ4LPfiuZl4biScxEvNA3cpR5pr+O86yc/m8tBgYGQ/YO196DcMmxygUsU8fyHzS0xUoHAtPiC6o7jbcXTcwwHmR4jI3rKoqy53m5SlhlgjCl2nUoAWZeOYalqqEcs6q3dEPfxZb9WdGldjx57YRw2qfSC3d+YGrv6/upf1HCTbMMUMIkOqSse+gtdPLvjZEZ7MQ8WN//yxTCaYFvNlwrq5NmF01d6/eVR2lpV3nHUCinTFklXv6ar9q2WHw6PyXATsPpt09SUVFvRF9N7iNBldaAUATl8wItJPkf1SSJGmhGZqFvOvLdNAs09fQtH4XFJYDPjc1oeBEaKbDwB+oh9gGUAdSZkKfVkd68/Zpg0X1+a+72eYEN8n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(52116014)(376014)(38350700014)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GRv17sFvXe/inAxKIa6Wa1v9RTI5vMbLQA2IuZK47fSFcEuxeYhFYCsXpXpw?=
 =?us-ascii?Q?hKpM2t2KwYb2Kd9r/RN0KYrIRQbD3eYX34af1CMigVWaMpQ+Vd3lJIdyNunN?=
 =?us-ascii?Q?Qe9zLwHpg8rCiiAN6+rmsj1g8WXWOeOUeVR+TpVMPjZ6AC9tQbWxxJnvsl9h?=
 =?us-ascii?Q?rSQllAfcvfUJ9VB3csGgp0za5ag7frR6JPIUZ1KHBgRcSuwBX2HCZm7HMWAf?=
 =?us-ascii?Q?JEDWdt86EjNNTtHuHRtBW5I1xgobyERX/ESlVnFIA2OvnjJwpK4wejAuLgIi?=
 =?us-ascii?Q?JVkCWiQqYmUsTq/h2fTi5ilVY8usx51OW+JiEODiroHELxFoYAMT82FSHA7v?=
 =?us-ascii?Q?s9ea2k/htPh4EPtgjwrWt7ZZ9pfMzbh5mqgXuZtr+OE+ZbhTB83ptjKVuIds?=
 =?us-ascii?Q?KXalgldYyGfiazIbNpv6HQSSMA9CJTpHgcLFXiWk8AZ4ZhmhNQoJDQtPKYL3?=
 =?us-ascii?Q?oeyN8GKtb4mdQHhp2KCd2QyUhnWkc/PvvmMFG/NW/wWVMRvBb+dQjmiE1jN7?=
 =?us-ascii?Q?HMouKvjUvknhAYfZPW5wBrFJX9t6UvXNi8PTMdCmJnONmFztEG6z/yc3zsSm?=
 =?us-ascii?Q?gH3R6U3v1Z3q9S0t88FMyjb6rcFrwFv1sQ1haCtoDdCd91nRiIleTkRiChLL?=
 =?us-ascii?Q?+q3k3NZVJNrGvs4ZIzlHZeJzrTbdZKJldNoXksTq133CplI7bPkYPg+zb0Ff?=
 =?us-ascii?Q?2Wee6tGEGauAPWO5Ovj75NJsoldrLluIgKiOXz55RzbwQCrvvQiH5dgAAhYA?=
 =?us-ascii?Q?4KcvSmV/LpwwdSR3dMbsa4J1PdlQiDgSEzc+TOiwaXggJIK/99PSEsJs1oZ7?=
 =?us-ascii?Q?E8hwgWGPR94FB93JgvdvzQfSMXz0FQicQOCcOB0wDXdxnnlRI5FTI+2Dg4d7?=
 =?us-ascii?Q?ajJPHwLIrszE5rf8oMP5h5GwuaKoeOs5TrOEGI6auK9QdV2UY9aKNZGS/m63?=
 =?us-ascii?Q?NXkrXDjG6NIBpwuVCyIALp5pzW/mASweviEEsdHqkvGbAxENPgixnwLt/qS5?=
 =?us-ascii?Q?AMTKDefXJitBUsmihamC4p1oDZAGHIurH2qscfixpcuIqjQseRNsZjWSiHC7?=
 =?us-ascii?Q?0QmcUumYAiltawO9DG2KEaryORjYFTgH+MI9+YCLnk9eeFzB5T1dyOGMuPZi?=
 =?us-ascii?Q?NIZXNH2QayXycHVi9b6OpePx6YB5FmOEVz6wlvUc5Vd8Avmqv96UiWPPWmoF?=
 =?us-ascii?Q?r/YjfmBeHU9mueL0hGrzVY2GmCpHoduz2GYPa5Sg+nnxKJ/yYlbHERq66SLq?=
 =?us-ascii?Q?NG1b3pMiELuIX0BkRxzpCycDa7686izsqL4sN+8YG7FCkGVvapvH3YMbE+kx?=
 =?us-ascii?Q?mtEBq4k8Kfs25Zmz/ELjKb31aJ6Cbm+1YmSOX09oxMvLOdPrbbAFJLHkIQyV?=
 =?us-ascii?Q?5YsWhfL/PoBpjtwoJmj8etkM1fHxurd6KoH4x7LIP8BzL1tuRE6WXlJYepK7?=
 =?us-ascii?Q?VvX1rJidfGT1heSbWvAavEKwmU3fMHPzat1mJzpJjTHqfKml38LWNpv22CCp?=
 =?us-ascii?Q?SP2BtGKXB7MYe4zWA2nIpOD3wVxlRd3eYDRAncGTGpcIHdhVJ52c2ayYXDoh?=
 =?us-ascii?Q?shY3/m5ygcPA4quBSW1SDtGE2rwdteaWoN1hZhAJxh/tYHlJiS0ED0r11+6i?=
 =?us-ascii?Q?zhvMkVmTpxrPuok+kydQKoDlIVOL60QtNeKU0T3R62jfuhR476NZHw5XvIWw?=
 =?us-ascii?Q?TPk+GIcdm/HV0VwKuEb3NWbym418VKYuK2JO2qj3DkzAyhCAvUYACslL0ULJ?=
 =?us-ascii?Q?hh4/CPfoDYfyqayIO3LWE5woB91PA7IltDMVYuPAs6e5WjULRF/6?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f3f6ef-df47-4712-a0a5-08df09c00e7a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:34:37.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7Zy2Mfc9VJ26IO7OrYH7ugHLhHEvcphMmtLQpgTxWq4Roqfc7RtGRfXwJ/HWcwIZVbhZWKzYuD7NOYHBfwoTAvD/k/an3+oT8Q2FxLmdfbIfAdAEkvEXGxfkhth4PKe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

Add PECI controller driver for StarFive JHB100 SoC. The driver
supports PECI protocol communication for CPU thermal management.

This series has been tested on the JHB100 EVB1 board.

Changhuang Liang (6):
  dt-bindings: peci: Add StarFive JHB100 PECI controller
  peci: controller: Add StarFive JHB100 PECI driver
  peci: Add support for PECI CC 0x83 retry condition
  peci: cpu: Add Intel Granite Rapids support
  hwmon: (peci/cputemp) Add support for Granite Rapids (GNR)
  hwmon: (peci/dimmtemp) Add support for Granite Rapids (GNR)

 .../bindings/peci/starfive,jhb100-peci.yaml   |  57 +++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/peci/cputemp.c                  |  20 +
 drivers/hwmon/peci/dimmtemp.c                 |  36 +-
 drivers/peci/controller/Kconfig               |  17 +
 drivers/peci/controller/Makefile              |   1 +
 drivers/peci/controller/peci-starfive.c       | 405 ++++++++++++++++++
 drivers/peci/cpu.c                            |   4 +
 drivers/peci/request.c                        |   2 +
 9 files changed, 546 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml
 create mode 100644 drivers/peci/controller/peci-starfive.c

--
2.25.1
