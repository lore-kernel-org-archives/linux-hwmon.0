Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D84E5358;
	Mon, 19 Oct 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410331; cv=fail; b=RHam+Z9L4vQal9A5+ler4vVsoo7RXsU0Equ1+ECzwvy2xLIyG/ug5pPYdqaizgitUuODurCx312raWoKE2stEtnAl6S6kQUS4HdvZ+p3KcRggUCskOhivY/HzGAOsZoMbZjRgB4IwTAB0MZZANvEuA3oX82ebLS622jhv3/7Ks0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410331; c=relaxed/simple;
	bh=0VH5QVhM6B0esc+dZOK3bmvlKl3+wv00AOTr9ssAmK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L2y11K2hxEoP1uUFpjMJj7J77C0PwzjewaL/4WowvrPO2W2Y/D40JV73hK1iTdsKkTdgib9B3JhlWmePz/Xh/jRkpgxSGAC7aj8AXXJYgenrgaFqPEgndurkB4xOixqKz07x2ekZISkKYJLdPsjLN78LzRPAHXfy/0e7NQy5ze0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTK7em3mfRd9aVZ7W/47HC2/HyO8HPjMAbjVWecgWw2slyi9Lu0decZ7OoWVwiFhM49kxFuqX4YYuOS2S4ZCurWrmO82Oi8uWPNXTaFplKXxvjLndkOyUzxpL/O/1zKIiCvkK6Repkdc/5mPyU48EVPzjS8ytyM4UP+BJqOfBOSmsP2f6iGHTFIWL5e2Nt79xuHh22tTe8E0bkCihjFFP89L3VLo1raminrjEhfvbfEb2AOGFilwuqZQb+pqVP7D4jms8J38DH3Jx2vPn4hn06lVLi4Bs8W4W5Du2410UxGLdHOdWVmmEAYm9PYGeGwHDyMQx0HkYHXatutWvhqrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnRvw/81uYNwgGx29qz3KtPQaaYh+nm6nlrax5/eBdU=;
 b=CqnqLcUdZGIOkQvHLNf1JRUtebbuqHGobLz4HNmJzuSbNfZDb0VGeTuULQxS4cQPKx93jthZ+u2hfrnEZBxOeeR9x/K9Eh6M03K80PKV3R82ShEdKK0fHJINiKeRrIr8b2k5oYoqg7/CjkQqX5cMk9jrBhn1NN6EtYzkyKAy2cHGqHV2LwpWAAjcr+eIBqGSf07PGVMgHSSphbiKtYcMLwJnGHHuyrHE2taZaPfeNmw2kgmARqfRFM8wdi1AV+XA96bp7a/B/bCKhXZeNJzEJGKNIBVoj2hjNqMPAd7vp4ncMrFIrSerkHBH2UAAeFLixF4SH/WKDIZUEh4n57iOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1298.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:45:17 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.017; Mon, 19 Oct 2026 11:45:17 +0000
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
Subject: [PATCH v4 5/6] hwmon: (peci/cputemp) Add support for Granite Rapids (GNR)
Date: Mon, 19 Oct 2026 04:45:01 -0700
Message-Id: <20261019114502.55307-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::17) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1298:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c7846a-9d66-483d-c33b-08df2dd67224
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|7416014|38350700014|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BTMXmxqommVt6TkgWzz/XDNr+gYA7O8CwweJOHV1Q5uTUnKKHo+irO8riWJk5hkCWtyPjv1UE8eRcm25IsGncYCKo+W8J33EoD1t3N8c+ktJ16GFXUjZt8Ayj2dipG0vcA8mWR4m+axzLVOASNn+PRLw7785RznVLg0xVxnkEZvanTZsWfU6s12FtUngIebSKx7q1Rv2TtdO5NdothDZ9GJzG2nstPEp++IS+585Amoaa0mm/zBctowlba4/Qmq4ZP212abB9o2sb0btWwuhJwFC9dGZf7wzc07IKKENG7YiV/cZZT4InTK3a9i33/bKP/w70b1RHxF1RaGIpglT7MYflpaBDdv4vAee1WAQdZEO97O2TD+UyCW+G5OD5QxitTOXUIOaRTpzM3pMBdps9EF1gO/LODL0lIXzjT60R+GOHrCe2XDy36k5ddxhaudE4bJXj4fO44bHAcS50dA0+wxkuYuX3EJ/R1Flx9suzj6HytSgE6iFhqlAEAEK/V85o5IkSe6o3N7bgIG1ZXhXoNU9uVzLKJjfVnXuR8SZygUNeA8RFljCiID6K5eD2GDk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S7+Gx4WVYntN4NiQhfmZZXl9Fre7E5dH4Y04ak3RboGwMOHH1HMRwQzZspF+?=
 =?us-ascii?Q?s2mxVF8eVc4hIqSTu/Aow9fno4ogXnRoxsD7ZLjnxYAkj+nP5/z0efA0aHla?=
 =?us-ascii?Q?CEbMaDJTW6+2JBABfRuNK04giaBpGQp1ns3LPItRtLdZyaTJQNw5ma/VYBvF?=
 =?us-ascii?Q?Pug76xECORoDQLN5XMsZddEUKGzY67jC4WrHNenrHuaTK8QS/nVLqd2F2EZi?=
 =?us-ascii?Q?N158Q+pI44oUirvVhMbMhKWkdt/DAb3Ab/Hkn/J4v4La9LQ80Q7ki0Kb7p6Q?=
 =?us-ascii?Q?rqPBWBv09aJcBFKwc7eWXoGmROnOpHwcEMeKUujyLaKjvqoqTrU9X4jaZxu0?=
 =?us-ascii?Q?7Poub9KVrnUCIIXVNIlqzAWs04+kKtn2hmTe249QpntwSDgrC622uPlsNNql?=
 =?us-ascii?Q?KiMxTxxX/3y6UpApPd8IDXMHhscwiBm9R+URzlKIFSZByH4oUYJYURrC46uC?=
 =?us-ascii?Q?6ry/zD4fczkyFZ7x3tHrgGoswoPeuKKJLgAKZgshkMO7JVEGv2ngld/qxAuw?=
 =?us-ascii?Q?ApEPwRaBJCwglYPoqRu3d2UpX1S5jFO0iT4iKTIXTvPa2/HXksq3WwrHvREn?=
 =?us-ascii?Q?a1ArkZig9qWwpiEtQ5lVUsJBRaMPa1tdg5pr+AKxb/yYPMJXtYSfDqLCER0m?=
 =?us-ascii?Q?wgmpXsGjUx8VyHcrmAKDtN6CrCyeA2ojYk+Nqzc52LR2G+5G5u9ZslxOb6j4?=
 =?us-ascii?Q?g7MGf2E+88wrw4OjwBgEJR5VSXmkzMVcVLOlk78NtE5LvPWz9QBeLVeLX01V?=
 =?us-ascii?Q?oN8algWFZqa1Ob0w5XvhvLM0GAecRYLYOA9FLeVa0Egu+23fUjUqFxJIflik?=
 =?us-ascii?Q?mVQlA6kpKEc86t2oVaOvwCu1atP9JBHX0nblAkTtZhZfdxuDX97T8vev1YCQ?=
 =?us-ascii?Q?qGdJnuF6UIqwPR79XC5FtdfB5mR0KLf2VPIo+gp9RkYOyi1UchLBVX61Kl0q?=
 =?us-ascii?Q?bAfpQ8Hlsk8kZWB+3vq+bm0V9FkD7E2QOkIgkXEwbQNxCrQ5elpZI55Df49q?=
 =?us-ascii?Q?5lZh30/mTNPKWYTU98ZjeK3M9d1Q0BbSQ7c/WeT/oin9KJVElLfdHhR3dooz?=
 =?us-ascii?Q?OY+gHJPeCFRkHzVkpzY2th8Kf2QcAqC2bkYgtxh20v9sRqPO/EWgwFAdRuCZ?=
 =?us-ascii?Q?5HmpzYA8HjtjLC0RDz2jkXgyG/N1VBcX6RSXCMmXIQmv2mfg5KLetz5zIIef?=
 =?us-ascii?Q?k+CcJwB+1MCDAlLHcr34lUpnT0joVGac4zSCEhDt6aMhSF1dFT2qYvpzF1LE?=
 =?us-ascii?Q?XzehXJxYixj0Qq1thdNzS11isGgju002GtWmskuqWCdnFBwUgj+QeybPd+aC?=
 =?us-ascii?Q?UOWFupQYnz9dBOKOgs6N77ypdWcAwZqCEKqUXDrwITWHQoi8e5c5hwNKTEm/?=
 =?us-ascii?Q?KOilFkK4F8Ln4SudSniTnBWOjhhzmvttI5BtSzvQW38IzcSdwF9y4c0ieMhE?=
 =?us-ascii?Q?23ktUqnc2heDPsz/F7y/ET9rhvTZGZGGvl31WxrJLLJaSQfFXXDLLsytD23h?=
 =?us-ascii?Q?0LwqI2Kvninsgr3Hb0Mq9YUoGOfdvyx+IM8HzB4c47K5T1YJp1012BILsRbf?=
 =?us-ascii?Q?NC5ZWd3nHfldtJnZ22vG26svOvLTMJl1FhYOmROCMZfzsCpti+Ym3oAj32XG?=
 =?us-ascii?Q?ePaAJeDn5wEFZYlGg3NIDUF1mzsOX6vwQYK//0rf14Gnktp6pai6Hd+ZISEB?=
 =?us-ascii?Q?T55FfuFksvdZYkJwKbzfMKv+3i5E36092oK8eEN57Oib1R7f3LgvC9NWQKAp?=
 =?us-ascii?Q?ZvAhLIUicKsxX82vq3JXobIXVClNpLb6yJsybTvv+mJUlABJ817/?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c7846a-9d66-483d-c33b-08df2dd67224
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:45:17.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmbO5Cvwlv+peP31fytDwJnrQ/rG8MHgAlD4/7gCl5++5aMQFsIslM6KvyBA1TRIAQgUy4B88Zd+X4TsCpDZlthnfKBFW6H8GtCOZkZ6LVLbd1DIvb2OlUHhA5m2jltT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1298

Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.

For Granite Rapids, the resolved cores mask must be collected from each
compute core. This implementation is relatively complex. Since we do not
use the resolved cores information for these CPUs, we can explicitly
state in the driver that the core mask is not supported for this model.

Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
the thermal margin conversion function dts_ten_dot_six_to_millidegree().

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/hwmon/peci/cputemp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 457089c561b4..69c4a07b99f7 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -339,6 +339,18 @@ static int init_core_mask(struct peci_cputemp *priv)
 	u32 data;
 	int ret;
 
+	/*
+	 * For Granite Rapids, the resolved cores mask is relatively complex to implement.
+	 * Since we do not use the resolved cores information for this CPU, the driver
+	 * explicitly does not support the core mask for this model.
+	 */
+	if (!reg) {
+		dev_dbg(priv->dev,
+			"resolved cores scan is not supported on vendor-family-model 0x%x\n",
+			peci_dev->info.x86_vfm);
+		return -EOPNOTSUPP;
+	}
+
 	/* Get the RESOLVED_CORES register value */
 	switch (peci_dev->info.x86_vfm) {
 	case INTEL_ICELAKE_X:
@@ -543,6 +555,11 @@ static const struct cpu_info cpu_emr = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_gnr = {
+	.min_peci_revision = 0x42,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -576,6 +593,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.emr",
 		.driver_data = (kernel_ulong_t)&cpu_emr,
 	},
+	{
+		.name = "peci_cpu.cputemp.gnr",
+		.driver_data = (kernel_ulong_t)&cpu_gnr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
-- 
2.25.1

