Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11022088.outbound.protection.outlook.com [40.107.149.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907AC393DE0;
	Thu, 10 Sep 2026 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016714; cv=fail; b=MM9KJ4HmVcooJOnXH/htB1j/Sr9KE9ldMI3f/PZqQMfBwHzF4dQ/21KCMew2Gm1nO0pCzYuHd6ef1CtCcb6g/03K4JJ7P3QpB00ZFq6i9nbj56wWZtEFYlKvu/wvuwrDS4xAASOSdWmqAW9vy0fcxinbJoGmKeReQTv7Z/qpBHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016714; c=relaxed/simple;
	bh=EvRK9gLX4vEn+m/U9KecWCCS7WRFnhbhIQLSal2W17k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rbix89nQtB+vc+BtUxz9t4o3EH9ng35a42397xhYcwo8YDgMO8bCnzngKBlgkpgOymMgnJskqvlO4t/2uPFaDyNdSVanHpHDsCKcPdwfqBVbFi/BAZa4XrcmSbDr04Qcer85gJVYIVfKZV9r+Hv+N9TeGiTGOXv8Pcf14eqj8C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=VEebGKMH; arc=fail smtp.client-ip=40.107.149.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="VEebGKMH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMHIOPSdDrf2jGJCHvUoEyfI5unBBs+MU9Is2fPmq6vPb+vEm2BmFbeuvPfUf6vn9x6OTvqdwqtZ1ek7ZN/qmw0rWEwc2aahyaiv7gFDp3sv6oCMcjx9IF932hUDX5vNchRxqHqjPpSziJLRPQAEMJ89XFS4IXSQmiuFo3SihIXfHP7YNjrTfIVJXt4Qx4tAXQSjDMsQFtPm50uNFp0Ihe7SAkewFxtXFp0vBCfdIPiIIJ5OehhJWQaDyvCXz6mwNXz+AMvECSZccDQN/B7pSo7y943i837HuMSMCdh/AlszYod6/DpY0fMwRqv1ioc/3i9kaVsVMd3InQZlLmx7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mfg0vsRfDhFDSrNEpnMTx4M/wI06fCPCtSJogUH9X0=;
 b=waPkJ3zvuyrbtEkGryOks94UZclpgk7SNLmQuhD6CA3lBgRX9Q7TZyy8/UW+S1L6B3ffKexj9RDF1xqpTiHAnvLtymWKBpI1/aqFqHB2yey8nG3xzsjFo1x1B5/U8Gt5UfRuKrZbmEDunvW6zR0uatsV9FUSiUSs9wAX7kEcegpk4DFptxZMu906mYLNYwu0nU+hirTwdYF0fzLfnboNAt4kdD3TaAWSEZlwXB03y9BdED8joQsL1qTg5FB3IBQhD3vDa+ssa9pJhky1rwOb+e3y7K2AHTDmK4GMdtfL6ZCo4pYLxmU9fmfavF8TEGWZtT73mPfmUzxwwuYlNKDG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mfg0vsRfDhFDSrNEpnMTx4M/wI06fCPCtSJogUH9X0=;
 b=VEebGKMH7QllUyb18u9JFQM+rqy4nq+PXZzUClLA5iIzmOsoXN/Ih5GdIN6R5QFOeTAqJTRHoe+cJPKSWmYYCClfmZo8HNrQ45toaUOf7Gu6zeg1udKe4X0SDcQIYGvXOvOHJu/DQzNzX2/MKfZajMDR0Hj4xKCeYsYJE0eWLySJWyoSUm16qqn2mqV5Kw8wKFM2D/FW7toDoYF5VVinTiO6p5JV0IJCyZgd5hFsI1RD6jtQAXUPmq2o1w+u0RA/3jq95H2dxi1NMDYFlaoqM/kqPa4o3Onxxw0gX4qcFMdQfT1euXPFSWDZ8uuY+yt0mLz3PIpOC/NUFzEgSgpIyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8) by
 FR2PPF80BEA9E4C.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 05:05:08 +0000
Received: from FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c]) by FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bbc8:b2df:8c7f:739c%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 05:05:07 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux@weissschuh.net,
	arctic.it.hk@arctic.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH 2/3] hwmon: arctic_fan_controller: dual-license GPL-2.0-or-later OR BSD-2-Clause
Date: Thu, 10 Sep 2026 13:04:00 +0800
Message-ID: <20260910050401.279868-3-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910050401.279868-1-aureo.serrano@arctic.de>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:51::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR0P281MB3401:EE_|FR2PPF80BEA9E4C:EE_
X-MS-Office365-Filtering-Correlation-Id: f21fe0a1-33df-48eb-db5a-08df0ef91520
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|56012099006|55112099003|18002099003|22082099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	QJ8nmAzfpi+RzjgwZZcuwNQXIv/M5+VDXyoQTAL1E9QKS7c+8Pi7fPCwZ//+mcr8ikiLZo1iEicO64ArbVLjYjTnRY9W4qLX3LHtA9fK92h+qEltu1eBuAjYF1sJRM6ywgoXWEfHH25DuylFwWpsDw1JkxTdu61xF5G0W4n77oH3qUS0g+EkZ0rs+wQHKId6NlRYnfQ+3MaGCwbGGpRUHvPWbka5zkT04zy+PuHhz5x43szJDX3pK8OSw8MIDcmyyx5tSdfG3HhqmIisuP43CBoa6UkxGA31u0QMC7h4V/zUsLva33a9TauwkQT3VDvGSvsx5kI4gVwqFJfsYzqPExwOinM07+h25qcdsbCnR8h0ZSGBzCDt7no+8U/15nR6s4FnoIcWC24RA91OsT5Mj4bxkEMPThuhgJaLm4yXxW1wtW9YclIjuXJf2lLT5yVHG5a934joETmXIAO1U5lf2UBOhktNTkC5IXYaHUvqzgfxtGdW1avgz4UK0qE2D5QyIh43ON8IQ48iPbYmQq/bn6Nrcr6nYFDNIGKP/FSfULSng9ViFb7n2g41GvLxuR/s6NRVwwp1BnWewOUJVmuLg1HqKqjuAnLhnXNe2c8eu4BqMBuLlz06lAyCuS2BNrxyLEdL1S96a0aAzTHwBzf08JS5ro6AfLX7uBaGDbmWfVCkTfJFCCMXS35AGpBSZ8gIHNBCTx+PiMZcxNA7EfSJ1iNekYJBuvRKouUhJD7erwk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(56012099006)(55112099003)(18002099003)(22082099003)(10067099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NiU9+ktbXukbDRfduk8EwREVa5oXHv60vJ7jJaswQ9zJC387g+oUX1wou9ee?=
 =?us-ascii?Q?FfvDwdO50rHlhUyjrsEOtHO+O1tovJEwRaSHkL6/cmiH91+aBAZknY4YhbOE?=
 =?us-ascii?Q?4wHTGoWtdnjGnUYgvioqs8lz50AtnwZ0Kkrdb0KZ75BVbi8JYxX5iIvWfizR?=
 =?us-ascii?Q?emY97aqG9HbCzN7IUY9nZjudliSLXSkxarrPyMEzozHmg+lXD6XMuK1jLV5R?=
 =?us-ascii?Q?oPydsSs7X27i7tcMUjFUSrW+PR/RVpExqDeQuHC+IMkBZsrscIPhcDA7J2b8?=
 =?us-ascii?Q?6jVDdtP484c547NJRFv2sGVHHwvfOPcB4zQfOZv1czWEwrSxvq9Mrj/Amzxj?=
 =?us-ascii?Q?5A5I+7Fwbs4qrunNBLJ0ebhr7ZvMP+n/xybsNXTiHEARYIXUCHVHvvaFH75V?=
 =?us-ascii?Q?fhOMsBmO1zvp+4v44NCKSEkCmGSAicv9XELcHMoZZofBH76R+CGkQk7mEra7?=
 =?us-ascii?Q?hYDRjv7oBNIfP0rYaG8SR3i8k3fa6qyeQQP52RFvc16NQeV1yU8DgVaS4G6L?=
 =?us-ascii?Q?KzhZxl8Cne9pBL2JAa3qK2bSeFeN+Wy5hkOkrkFu9Ji2oBDRoSlJYRiaXIKK?=
 =?us-ascii?Q?ZpHkQ2CQPczr1Iihtq7gga7dc9w/5VK6eTGgULTTJAMrLCNKzFaL5Q0uicFH?=
 =?us-ascii?Q?xGUOIhf65MOB5cOvO7/ohEarW/SBmdeOd1U3nKwu4MBRWiBWWQXW2pNIAqGI?=
 =?us-ascii?Q?UbK1XZVzVJZGBIJD1gBKiStw5FEdlhqTXLEPlNMfgjq30NSJ5ZfcU4kdUmxn?=
 =?us-ascii?Q?j8KGXMDqPERFeHljnk+9J3nF+cZzh1TkyPj6aEWs/t9lxCw90KNGI0qrTQP5?=
 =?us-ascii?Q?eQl7/TUYHNj8RNXjcTour/QjMPxRpOylC3FnPhcbgzmBbZDzi6CifuBWmDxc?=
 =?us-ascii?Q?k1ihZJ5nW36gDiWR8or8MfxEYcha6lJjTy8SyY++O7AtbRuWxABaQhq+Ohvf?=
 =?us-ascii?Q?82eu6p/mjt1c4U8zWVMTWbUoB4RMhPXW45/kMRqpzHiKBJIDlsr9ycsmC/Vx?=
 =?us-ascii?Q?206K3zqcHJkhnTlA1ItcUD74nRPD/X48dkaj4xkYbCA76ATMMGVkrdpXzIA3?=
 =?us-ascii?Q?hQUuuLQJiifWJJ2rSZbTxYTfThASZZP7QUzDgCjcOylkEYfSibbZW2jlQZAa?=
 =?us-ascii?Q?QpdQSP5gQo3wCg8pxTDcQpgmM2qkV7l3js0XGYhr5BPV3ShYPOKXOHAOA82x?=
 =?us-ascii?Q?aTVSzP+UUgg5cHccAnCUn4DjVT8dKHOukWOto2JQNDdp7eFC+vTXxSViMR60?=
 =?us-ascii?Q?+Cz2ztQInoy+2YGukM/Bijr8X0HxQJ+laT0R75poQ3cNa7efsiTdLNbs0dVe?=
 =?us-ascii?Q?c+ccirBZoYeVPErBa1/IS7sNUJizEPssHkQC8wejRiV6ZoKB1M+r9X0vWqjO?=
 =?us-ascii?Q?6/jZYmLMWF+H6ki8tElpPvrBI03oEHVrQN7anvrSuTGrxheF72CdS6fQH4Fz?=
 =?us-ascii?Q?Eclt74bkhVr/T3nJtfSMerYkZ68Gzdp6izAIygBm9VU4cPgKzqO6CkeWGrQ+?=
 =?us-ascii?Q?+9BIMDk6UDqpnUZSvmo54uWyel15MRbXDwYxow2HtIBGhHg8KWYHth766jDW?=
 =?us-ascii?Q?fmCZZGdTOSCPg62jY1G1YzHGxTejW/O8+n8Kw2GdMWJ3PI4fR6pS6L/tqmRq?=
 =?us-ascii?Q?GzC9bgsrCgBOHiPReeS+pBnX7mOiXCkLxOTYh05lDID7RHvvPInrCXbijMYz?=
 =?us-ascii?Q?q5u6OQlyr92fZ5PR2QD/KxCMsJEhUrzb9c2wgGY54XZkzLR16tl4K1VrUdjp?=
 =?us-ascii?Q?EKsfQvvpVA=3D=3D?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f21fe0a1-33df-48eb-db5a-08df0ef91520
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB3401.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:05:07.7414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1diEZgsF0x6sBQfapyE4om5YpBSz9JIpHy8DpyOdEU9kYcrNE1agPI2C5dJJKAhb4BUd1eq3Ro+7u8Msh5Ea5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2PPF80BEA9E4C

The in-tree driver is solely authored by ARCTIC. Keep the existing
GPL-2.0-or-later grant and add BSD-2-Clause so the files may be used
under either license.

Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
---
 Documentation/hwmon/arctic_fan_controller.rst | 2 +-
 drivers/hwmon/arctic_fan_controller.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/arctic_fan_controller.rst b/Documentation/hwmon/arctic_fan_controller.rst
index 200e51932a1..60ac09a9cea 100644
--- a/Documentation/hwmon/arctic_fan_controller.rst
+++ b/Documentation/hwmon/arctic_fan_controller.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GPL-2.0-or-later
+.. SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 
 Kernel driver arctic_fan_controller
 =====================================
diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
index 9a609257273..9eb83a149cd 100644
--- a/drivers/hwmon/arctic_fan_controller.c
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * Linux hwmon driver for ARCTIC Fan Controller
  *
@@ -375,4 +375,4 @@ module_hid_driver(arctic_fan_driver);
 
 MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
 MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.43.0

