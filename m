Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88D3B0AC6;
	Wed, 26 Aug 2026 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787778876; cv=fail; b=fgVnY0aErN5wkEhhVohlZ4Q5dYi3GTmC1CUfd6P27H30iIaVcBjokTL0k0QPjA8l+VIQSMv8ECor93kFOnYBc909KAjFon9ODhtpqw0X3TrmWr3hdpcx9+kbyWx5Az8T8FKPZw5McIv9ShPf/ME2TqqF6wdTBKwsHejI73J7kyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787778876; c=relaxed/simple;
	bh=pfudL1JWE2EThEv588V74xT41wkXqOaybZySAl/QAKo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G1bQ5Srae4j5xornOlv7wG6HXlFtdINrh9/KZgqBP2t9TyJaLJ0O+BAhJUwMYcWlmAKTuoKAvpY0rqgAEcLFoYgzQcJQY7/No/DivvS10a7bN8t7TGPovRkFb6RjUodE7n8tMRoYdbRI/MNFRSXrOZ5ye2B8yG1GIINQU3e0x5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fF1px9r6; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fF1px9r6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj+LL5MeL3r1EtsxiLRZilju/f9knI5Ivnsrw3Et1yKkvfXGpOm29/WisXLoJp+NsqzZPLvdzbKw3YXpERkagCGodZo4ubcDiRFWUOvaUZrBGuNalrfmTXTyAl+F2QUTJ0JSnp221DGgSSJukBdVwssGrJ7ma95ugu+Ep1Ry8t+69wZqMnZOZ1J6zmxxERB/AeHRVe5vjVT1LyXdRjKQ5/fMs4zaZfH8YY/8+SHJmvZ0epOpnD9fmur7E67kFh151HS8ef+F9oAwuyRfsdG86ZfOE0AsuJk6u0eI16C4oohJcebN9bkNfw40mmDyneLbXDrH8KOX/vnIWHFbPQML6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYxkXxEWzy95RL8icTOl/YKNFxm2ttCEukpPG4bvwPU=;
 b=D3YVYB9NAVfYMv06VWAQ4HIKoyJf7vgJqgy1Hahnx1Aj0p64V822PmWhudk4RN8RxBufpbBSdrmbtgw5X/yGAAf7kPoZQqJoXXTNk60bm8mmEDOnhV6di4MlQHTpyDLHfSh6s2HW3xyJUjZ1GtooOINZ2QB1/H0l4SaqIBl9zFA3PIf7s5ljA2tODyMODmmHPTIQIqmKJcQec3rru0aYHd22OritewbnfhgfBfTQt0LlUVl/6erOkvLuPRbR1tRN89EzS30zFBbMNYXoFUMiPdDM+4p1EK8OFKzx99IRcu8PjLWgWsNKzzeK+VHUVEXBo3mBNDktB06Tu9ZTGipFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYxkXxEWzy95RL8icTOl/YKNFxm2ttCEukpPG4bvwPU=;
 b=fF1px9r6AD7y7DW/Kjttn4TmEsFGaLfs4NHBLXocN30VYIdxXqipDYvUCv4bBUhVtmLQM1FATK4bGuS+fbNDDdfYmgHCNk1fcH4lfR8V//+VcHWCoG72eBEqVtyrEsV2gZFbquJOeDRJp/Q3OSs6eILP/MOc15AQScWxn1JFzKJIU9a84kEz6kpSA9vjAHLA1WQ+51tgRX8JHs8hu50syeQbKGk1fbohF9nQwVLGqzdL2EH48ciZNwIRB5HwvIE3JBV1gagZMifUNYdUK70IHfypyX/woEYgNmTH5DQpg6RCJI2zeUV7kQX3QDb6pDbE7q6oXJCK3TUnEu+85mm1Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12188.eurprd04.prod.outlook.com (2603:10a6:800:332::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 21:14:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 21:14:29 +0000
From: Frank.Li@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Colin Huang <u8813345@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of trivial-devices.yaml
Date: Wed, 26 Aug 2026 17:14:19 -0400
Message-ID: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:806:a7::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12188:EE_
X-MS-Office365-Filtering-Correlation-Id: 497dab8a-54f4-4329-f667-08df03b7042e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|19092799006|921020|10067099003|3023799007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7tkGchPxFgDvJnnXkLT0sDIJyTEe6V5w0px7MzUrryD16NWy53nGbZWBv60Reh2EYHvOdcdptQfWPB2JJMUo1oqEWED6pax9H7aSY7qYwPM4PvxHfPp6pWTAsLpt+FX6RbLv6XPkwklDK0K2DMNeeKLgqMgXToKxa7/a8/dB5cS45meCscuPJS0hXAyyB0ku9GHUpE33WpvnbDa4+HJrYUxC8OvbMwnPqDtIs86ABGfXrTUUQa6PP/554OVhYqkDCunSmgbMMWN+KTnMT2AOJCqcD1lRWa40DVYLw5uD51OoOVbsv+A5nsqJslSkiT5dHGwdmWvhWIEtjhovCfJuE1qdDY3opsztCD2h+FWbvnc80qBGq9gCNR0rrvrJZJtUt3wFR49sV9CJ9D8EkGPUqiyn1MJiEXL2Oe2nfCcO6RCmQE14gxHdr38L7JK9WsjEJ1Gh9pV2/qGNU6yfwuBlZtpk5LOs5d3jUzK5YSrvoS5Sj9x4KTr4w54+UED+V6tO+zkf/09Gxgt0PDfspUBfa/gvdroHEM54HyAfl+0ufUhooyCpY/RLQ8x4yivSOXr4D7CLtDYus55nITkVNrFbsrVvLgcQMmz3WUZPBuBD/4taRbMcso3D6n8G73HbBhQhHNLgeWp38lVOvDKd7z6JAoVIBGsVIPDHc91OVIkFIz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(3023799007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p5qd1bCGbWmDfMP5XbRd5HnEXeX2ZuwkefxOgBJlSmzR2hF89dQQIjRnMWsx?=
 =?us-ascii?Q?1U6jw/gj45dIdYJ7868N9VLKi4Te81gjY1TkKMJEBt+BNm2K3bH07nnWlV7V?=
 =?us-ascii?Q?6BKnXcIJd+g6nh59MENfcbz7eHDq/Kh3diX59nFptq2KyKKjJm1Imex9G7Xl?=
 =?us-ascii?Q?GymYwyXSW1PaUF/astgfpQwAQOA7+kIhcfzbpGUAXxYFMOS+P0D9e33bBEDw?=
 =?us-ascii?Q?QHrGj8BGBXw6zrkld2S43x3YR46MeoCpNF6Wimce/bB7Pjv+0FZbm5FD+M0N?=
 =?us-ascii?Q?4PCyFBOqHNPshOaJ0ODMJSCEZ/8aSf8ctz0s79foa7Qs8BX/7KAyJLFvqPCU?=
 =?us-ascii?Q?yEATfXi5hyiMrabzjUueGIc5Vf9rM1ElSeazopsLKdoRAEcWwdvPeP/xIuVp?=
 =?us-ascii?Q?jBytamdz2ZXPR9/UPgUcxKvUMZe5NXK4zHyl1eQuTuMo+RgRKsiTsLwFwDSD?=
 =?us-ascii?Q?jQQ5ICCZUb9YdXkPdcrfIcnXoCobEoep0r6Axl8F693YdcMez1kVEKrx5EDl?=
 =?us-ascii?Q?qx8chjS/QDhZZ26TF7kvu5O1TA/1zOpKN4ym33zBP0yNPm6Gzg8wxHtLNPX1?=
 =?us-ascii?Q?k96GNuG4ijOwVx8A9AnDaPbkYntRf0C3qwW4eSwYE90qROeUizxbHLfHHQbM?=
 =?us-ascii?Q?pYuGQ8UTzcAtD74te84Snd/gcqZ6kjNUbUGVz+EsTcORxQi7XlXBDZgC4y2a?=
 =?us-ascii?Q?KtXish1x5U+/tT0ZQjs603In06IwQWuxOrOnCmXNDQoXWDTO/RonyutJXAW7?=
 =?us-ascii?Q?kn36m7b0t4USDMyTyfjfTWGT/FqCnzZztlPd/+XZ2cvBuMEYjiKq+j3h5m42?=
 =?us-ascii?Q?tjBlcVLN/E6L3ki6IUclavmr7ajzUgQ6AJc7q5olNCD6yjs/BxDcJI0CAqoZ?=
 =?us-ascii?Q?TbDuB2ypv+XG8I8Vy7uSINZ6eLprIdEM56V4N8LYWByiTJX1uEXU8cjj8z2o?=
 =?us-ascii?Q?dgL0UwpiTDIQee+sdvbXFIseIg4JoSgOgT6K7qVYwfjpagRV5z6B+0wF+yMP?=
 =?us-ascii?Q?t44L1O30Xngeo+SK4zdd0lauH0rPCrsq7s1L4FlsXL59nDI7yjUh1d/V5zz/?=
 =?us-ascii?Q?lW5YGKRG6XrtqYTlJdLrd+XBj4TbdAECL9WRjvgxKjmQcTMwrEwX12VRVBVk?=
 =?us-ascii?Q?jMJsMcA9vRV7UK3wfr75G+ib8KP4EzO3RvE+YXyfED/YR3NEHcrUSJHhpNI9?=
 =?us-ascii?Q?fIUs2S3N6bKmcrtke7UiwEYVBSz7CTDQBgZNZxw9gKwkKtRUkn8RW6cwMeWU?=
 =?us-ascii?Q?Cmy5iWlsMFX59sRV3Oawd6ZbFBocqqsknd7lmzhaHXQECmwEQt9PSEwu+yxb?=
 =?us-ascii?Q?0YVxHWO8r8pGWlvWeSaYhC+9zoc3VwU83BqrpTq/91xI2cKW1tyklWz89XS+?=
 =?us-ascii?Q?ABimG5uNismLiQqoeheTDUyc4/1mKZeGxDHnVhFuXGuwRkCZvJ2vlU3eeR4/?=
 =?us-ascii?Q?gOscdqZgqHJbRNdkFCInf7K/bpo4OIjmQjdfYge794pHogP8EX5IAowUAH0f?=
 =?us-ascii?Q?H0F0fmFLiN05PhxBko8aqmbO8CDfOkFrgqMZ/nao7/qktG8HaizIFtKx2MzD?=
 =?us-ascii?Q?GYMXneSGq4NKyXJ3RAhIs1Gwuk2NoYU2SgpeyoYU03u9SGbSsDkjdUjX8ykH?=
 =?us-ascii?Q?Ac9Vuh0KQiccmleQX3VkDb6DL/9/noVq4K7b20h+oTfu5gpJVjtRsYQx6R28?=
 =?us-ascii?Q?Upa0Sl3kMlDr3JZWEoJmboX3GHin9SvckGq4FTo0B9GoY5dvcHG27N4kGe+/?=
 =?us-ascii?Q?cfaFT+3sPxNY1RgYcrRiEo6A192WJOIK6ausypUNt9E6uaP0pXbA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497dab8a-54f4-4329-f667-08df03b7042e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:14:29.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUZ7jfQZ2V7RnLk5cUFZsoi45b/GumQzu9WnQiHahuPgN8GF+KwB3szbC+hdNnzodZSCCwIJqgLtH22yQYae+h4SFyTipOoUlJpOAHKWGg44U5gZ4+8l0z1vHWTcfaQq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12188

From: Frank Li <Frank.Li@nxp.com>

Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
devices are single temperature sensors and update "#thermal-sensor-cells"
property to accept values 0 and 1 (passing no argument is equivalent to
passing 0 as the first argument)

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 5 +++--
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
index 96b2e4969f78a..cd96b1d8a2d5e 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/hwmon/ti,tmp102.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TMP102 temperature sensor
+title: TMP102/TMP103 temperature sensor
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - ti,tmp102
+      - ti,tmp103
 
   interrupts:
     maxItems: 1
@@ -25,7 +26,7 @@ properties:
       A descriptive name for this channel, like "ambient" or "psu".
 
   "#thermal-sensor-cells":
-    const: 1
+    enum: [0, 1]
 
   vcc-supply:
     description: Power supply for tmp102
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 05f88cf81d6c6..3cdf9e0d8322d 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -506,8 +506,6 @@ properties:
           - ti,lm74
             # Temperature sensor with integrated fan control
           - ti,lm96000
-            # Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
-          - ti,tmp103
             # Thermometer with SPI interface
           - ti,tmp121
           - ti,tmp122
-- 
2.43.0

