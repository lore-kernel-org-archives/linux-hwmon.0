Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AFA1A6819;
	Wed, 29 Apr 2026 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445119; cv=fail; b=SWqjwqhReqjr75Scj7gDyWUqrvDXcSvNOZxqZRTpDtlNYGGgh6baj0srRy1x/Ajl8BH3WdIP+fFYF+TO51Q2O8EKJaAVbI0/1Fso8GTXm3aT0eQrRxhS9tIg8jQSXbJN7BfI+hp2EzRKrkHwGbKgvKT3iogy/EKu9tEKlzuP56w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445119; c=relaxed/simple;
	bh=m5DOCKkoY0QRhckK7oOL0OCWJZS5CNNbk2GMQrtre68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OSFnmmMVp9KxxZYtCiz7ISOxu/uwgordeJGSfohkvIdh2PHtC6I8wSWsf0dYqgppi16L77EtjtCG2xAyLAb61M5XGRhBx6Xwgj/5YDS3bjASreWULaCE9OPvlMuHiXknORsMiSJ+DsjIpEaIeLd1cDZbFnAF/s6hSctu7MRy5rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Sop3AMTJ; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Sop3AMTJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcX+Riri0MVxUX4+WFjXQ5nXNevXFDXQ25KsEv5WWiQngBNaRUm+2/l0TTZPziP8JViW/KrPxDF56wXsc+ENxeMtFDXUtzBdtB0R/gbd/BVEshn3RjCf+r4ENr/A3lZ6m0twbdc87g4+q7N6WhoxqGUYHJ+/8b0eKL0fmJbaD7JqHDAk69YP6jR/P/pm2GuXqxkBX3NtTeRq8tJexe4+XlNswPA/xrg+Fv+h83H0jIUe+YvQOHDMXNBx/khogXnypgoqUOjq0sJV7Pg8NjMgMFm8RMGCGMOrlgZcWYUDzLYYIpmvrHshUcA/00b+pXPZSU7Q+YD+N20YZ6aHR7u7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moksl5HSokrDasvRXmnW1+6OkIC7Kvc/eO+1O9TbJJc=;
 b=Lav6lJSf3t9ihVMKnF+7Es7hE6XYMdcvFZwu+EgtK2uQ3rbQCkrrJi8Ar/IJ3NFmoOJnTrHMyjDbUaVO69hP3LiXd4pikrOzn7RVQLXj+HLfTdim+U2NJLJGjQQ+/l+c5AB6kecnCiGAyfftMsnXt43Qa4oSnVxE9v111itGNriwbLlzMnVnEVk04izbpO+dZZqycdC4WZD3fSjX6Zssyf5nhH5Wk3/aA2N0X0J8QmP49tLC+uMGbzOo9sA1JyE/rFUVx2a3uEOoQ2EFdvmYUqH+cPA73vZoL5uy34JX7jpLjjCyw+FrKtF6LrEPJP5FlQVT2OCEfztaXVjkiAmmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moksl5HSokrDasvRXmnW1+6OkIC7Kvc/eO+1O9TbJJc=;
 b=Sop3AMTJx/6savQwEEMcUUtcZlEm3lIhLzva61v7K7TVS0TAIvQ9FNI9Vy6tfc4kfqIHCEBuM9f7i61z/ZGsfQ5xyJPyNc2WxeOtUd4gy/yqF6lOWdK85Uxia8u7bLiLRJS0OW2ykp56S6V275/yPgoC3zHDoKzigxYjOLSmC10sbqf0ydAHpbC/zPEy6JJ3yyZ6nesY5lDPBtmF1EZw7sLm68c7pjincoeFKIzeYlyzLd2CyHA8nBWP1wvPvJxb5dfysPa6H+rQBYzPmWQIgB2cxenDeD/CHsliJYLy7IjhE0C+ZYd9VAKqIJqAhRgpglguG2jI+STFEuSTfM0ynQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 06:45:14 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 06:45:14 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v7 1/3] hwmon: emc2305: Fix fan channel index handling
Date: Wed, 29 Apr 2026 09:59:53 +0300
Message-Id: <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM9PR04MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b4f639-b62c-4145-8570-08dea5baddc5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mZJLTjK6nyUounyK2RkTgd3fFzkWn/V1HyahzIQjl5XgnwunThtP42wdSxfy6u2aXNH34d4uIBJlMrcr9Qp6tFNeNtcH/0gKjv8z3cIzcssU5tDqtEFmDzlUDXiARPwi7nblUSQx7wNH0WDmoqqK+mheQ4BQygij2R2jrM/tr0XdxzM1qJ5UbSZS6wPX5N8v5+BHDIx1TPQEh2vwUBOCMl0NmbWSht2SSGGC7/WumYMG1G0AB0GClxF7JdRdvxCBxWwArLMQfRQHNJRaUhTC6FQRQ6siXSSX9UdTMOxQv2/pGEzFcZjE+ckhH8+pKAT0hHHdTiTxRAcwHfSKLzniGEaB7QJtulCwlO1Cyum4Jsqv2hYyU1pXTTOFpTCWpt5EhHdE+ZdIfRSNPeGc4N1bzWBUeYfw4IkRtnE66K+YwX9FLtndRm/I5AMhBQh1O++6ghv2Syo/h2uyP3ZmOAUWMyv/guLsuYWq0ctVwvbVHpTaGok3SOPIq6wrFUYTpxz52OxzuWpDQVF7bdahH9If1Nf0y7AViDMxd4LIe2THAaOqcxOyx3euiakvIUKRkczFh0se6rAiZ2tyYe/7VeA/kO/SZ5h2fa9p6qWbfvD9uv4VFM4Ey+u2D9dJxL9WNaoPSFDJqhHIe0/7U6x5/ACHbJHIypKkmk7AhfI9mgA+RdX9A2fLpxCorBS55oiHedex/czguK5s1uEp7vtUaQKTdgqByqJ+6H7p6knpw5uW5x0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0WEX7oKgZL8Ia5uPhT65UKE5CMJblKZDTUKHXjp3R1QYxfIcSHo1pO54b6?=
 =?iso-8859-1?Q?e0LswdeQvKskMarn/JqudJCaaTReAbzX2J+wVGE1UJ4zX8bmmEbx59yFQ0?=
 =?iso-8859-1?Q?QbyM3I8/mIlZ9Y+EpdZHBS4tSUmAjAVKfWpHWugHR6vBLsDWSHjloWdMVZ?=
 =?iso-8859-1?Q?NSEBpqSMLQe98/xaPSublq0xyAGlMGLorLy/ZBbkt6ND7qa3VSUr+PCVth?=
 =?iso-8859-1?Q?D/+fO4hXTTLOnbqbPfvAQLtqOSG1t9MM3F7sQh641Tp8Cnwi+WYNc6VX+2?=
 =?iso-8859-1?Q?4Ucwv4xnLsVQrO0gr2TsSLG0bh3d99kCfBMquyw7IkHhOummvmAI/IRcPW?=
 =?iso-8859-1?Q?V2HvMNcr4bF61+t6aYYHxTq6Uo/0HDnG1j5eOYQ5ViuEHUG3RdteftDkEm?=
 =?iso-8859-1?Q?cFDbQHt1qRzUm+JzV1iJ3EFwFOTwvz5vo0D/CrJfefOP9gcALUhSEUSUn8?=
 =?iso-8859-1?Q?r48RPfpmXL87wV0Fw97D6NF3sESf+RvvE1mFViAilamgpNYynMpJnZL67X?=
 =?iso-8859-1?Q?d1xsG4g7SG6f4cRXHY5w00l5HiERRsScGQ9YgpQ+wblc0c3agjjUKwvj9f?=
 =?iso-8859-1?Q?LnpWy/46j+RdPYyhNv8ab3EYM8caUVX13NkAijapH2DlAcenuOpDroQyQ0?=
 =?iso-8859-1?Q?ZPFlmsWwxNzksWVSPti07cG/PNd5sELDYweWaVx/e50N7A0nejgEiKuH3J?=
 =?iso-8859-1?Q?Noz7OF6lwJ8odSMAlYUo7Im3ELgjfEAMc+4Fqb+gFXD9LeRM8En8urFz20?=
 =?iso-8859-1?Q?FMHLrkhVCvdORX8NI/ktbkvN+BWzG2E5kLAa3/QaUpQf8CB97chvn2iasT?=
 =?iso-8859-1?Q?mm8tUm2rCqO153Qp6AGcRqO5bqqSLHHI793skqcINYUE5op2sPRjYZGtbK?=
 =?iso-8859-1?Q?scK58BKc6x+rERnGzuEquSt3jXvrlHBxCIQ4xjov/bgEai2HL9rVdH+kby?=
 =?iso-8859-1?Q?V8mipcqJP3cNbMzqJKYHJJwBf60usZ6im38rZe+3T3aYocGMZ7jiUSRriI?=
 =?iso-8859-1?Q?E4eB6qvENbssuf+1GQVyhUM58TKIZr7LqZwhDdbYCpAxl6ML4LEspuAzSX?=
 =?iso-8859-1?Q?moYqfXVeIiDrfUdPYcNSS7evNxG6dew97uC2lLmQj9ZFPIuaY8SBbCo/kz?=
 =?iso-8859-1?Q?H955uHic3EConJDKo9fPyzw6z9sIKvcmb/dHhg9KVEPz5hBCrG70j78NNF?=
 =?iso-8859-1?Q?2lhIOL3lloI/7SZb7mzeyMckcoqFi9WOH8xXNOjtXrZcopixTQTO4ORibD?=
 =?iso-8859-1?Q?K+428faLfVc/kBQm/R7+ud8wj5Sy88tgseJKv0LnkkgmFhW9fa8N3USnxW?=
 =?iso-8859-1?Q?ePaZnmWQ1mvA16K/1oMBba3sTCXnuhAqWqmjDUTxmt0g1+JCz3g0xKBIj4?=
 =?iso-8859-1?Q?rIlJ5T080rQTbbAlmiMwKC3HnCEolBJ6GvL8tEgYlvYOkkRZGkSUyHolLk?=
 =?iso-8859-1?Q?NRGaRcL7BX/cJcOuyBTp5+ma2KpvlG8JdIUamjokIQiwkp5J70lIBsr1RB?=
 =?iso-8859-1?Q?5d0LFJeb8k6o+9ow8MuRz7x6wPqmawcyfb8rprgpp5EpscfrbMMzUz6Jd1?=
 =?iso-8859-1?Q?UfP5XMY7UxmzoxD7dIr6Ptp5Gy9y7qIB4OLa0x4OJbBuIaBYsu20m7BB7g?=
 =?iso-8859-1?Q?h3JzTbdMuiJOLWw/N352gW2VklUXTKa4LLH07wb0uufFwe7RCwq/4O7JTD?=
 =?iso-8859-1?Q?UH1HF2xArdEa+QB0sF6ylYE6Bk30w2xSAVNOiBjHXPkuwh+p4QBcTs9T4u?=
 =?iso-8859-1?Q?7l4PDQoUsCyDTxqooXzd8ko1k37nwXSn8cYEwJPEUufW8NkDLT7OHAQI2p?=
 =?iso-8859-1?Q?t+U038h9fA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b4f639-b62c-4145-8570-08dea5baddc5
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:45:13.8974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbilCl/FoN+wnwFCE3twrtOWjzU5jHZEWlRqQwpclLusE4xCApbr73e3/EV+ZLc3dh4/y5igvcgo9qG97YIcww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8652

From: Florin Leotescu <florin.leotescu@nxp.com>

The fan channel index is used to access per-channel data structures.
Validate the index against the number of available channels
before use to prevent out-of-bounds access if an invalid
value is provided.

The thermal registration path currently uses a sequential child index,
which may not match the validated channel from DT. Use the DT "reg"
property when registering cooling devices to ensure consistent
channel handling

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..f71a0e265924 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -548,6 +548,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 		return ret;
 	}
 
+	if (ch >= data->pwm_num) {
+		dev_err(dev, "invalid reg %u for node %pOF (valid range 0-%u)\n", ch, child,
+			data->pwm_num - 1);
+		return -EINVAL;
+	}
+
 	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
 
 	if (ret)
@@ -612,6 +618,7 @@ static int emc2305_probe(struct i2c_client *client)
 	int ret;
 	int i;
 	int pwm_childs;
+	u32 ch;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
@@ -680,12 +687,18 @@ static int emc2305_probe(struct i2c_client *client)
 	if (IS_REACHABLE(CONFIG_THERMAL)) {
 		/* Parse and check for the available PWM child nodes */
 		if (pwm_childs > 0) {
-			i = 0;
 			for_each_child_of_node_scoped(dev->of_node, child) {
-				ret = emc2305_set_single_tz(dev, child, i);
+				ret = of_property_read_u32(child, "reg", &ch);
+				if (ret || ch >= data->pwm_num)
+					continue;
+
+				/*
+				 * emc2305_set_single_tz() uses 0 for the common cooling
+				 * device and 1..pwm_num for individual fan channels.
+				 */
+				ret = emc2305_set_single_tz(dev, child, ch + 1);
 				if (ret != 0)
 					return ret;
-				i++;
 			}
 		} else {
 			ret = emc2305_set_tz(dev);
-- 
2.34.1

