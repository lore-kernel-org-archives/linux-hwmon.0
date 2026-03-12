Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59237DEBE;
	Thu, 12 Mar 2026 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317234; cv=fail; b=V0g1I+S6Xq3xTxMoGXQvOFdhOhuT380L8GvYOajDxTMiYBQTPk4JSy4R9jArqWJ/7X07AXpJDrtIXaXIxLJmLTYy3rAf/M0tN9/AkP7Zm7lLXHjtuAHan+ksap0EhY6uHTW1GNR+iD9Bj7Zl5+vkgZy5fiNiRH8jHBGjuCCaHrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317234; c=relaxed/simple;
	bh=fBPIvI9oPt+D9a9lT77G+E3UyzumQ4k2zOQIAPkLRXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dRm76gBCtj8xCMYcj25495IQmfyMPUGJ7/OLHUAwOPoHoR3U0OI1dSZkNupwKoiWJGmkOCKLkPgWrTYu0svbgJj6k3JUC6P4x1KZOEffyVkmgfsa+Sjg4U78vVLCTkqxybnNpc7utycX27NOGRRNPZcu4JN+bj2sh9Ncvuvbtng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fF4JguyX; arc=fail smtp.client-ip=52.101.83.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fF4JguyX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ0j5BVBfWzmch1kvUd/GbHpIBDd9WNwA5/3d8Hq/sgPU2d+dMChVfi/RmYp02P8tg6ifUQ+yhxtFGwIPGbGnZu2tyFn5xVbYkYecRYwgPgBCn1wGKrxOBjd+FaVPg9gT1yszHsIZKyTWfHw5kM52t3IaLPRE2O7ToNU6rZHZkLFLCqTOgzoY2OVEeZvMyC6MAfwR4cU50/5TGrSZ4JCIS07HPA53Uw1W6dN9CAurm44MZk8KXXSGaLcn6t+Elp9mKe0K356C1g4J0jpey1Mh45uIJpEYM+Au0zJcIsGYCgu7pfH2ppjDBeED40eMV/3mElZb6vhe+qqBCwh0K9iQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB6bzZQXq6KDUPPDj7ldbhYP0L+KLoD7eG5b1QQ6lhs=;
 b=RX0bUGGnLKSDBozg5/I1XL8+MIvG8fZWS0q3Q6gRtKp0s9d27DqbBxVN9ancrdcNTajX03pv0vYf+HqJALa9Yynm9XbvaaX6ctcHyKseeTtjrExyWMZ6ftU1yfhz0hyC/boV9zTbp3syXAoK2YqX4K8Av/5sT357yFprIT/p6yvOsOCF/2DlDqvLNrO0DD1yMyNjAtXfe9n6MhV9ZlRkUdS0uF1Rfa435lWs5yvVoltMvY/oYKWN9GRz8LT0dvRYAsDC8DVff4f6A78GdMqZmJXbV0d6pj9yBXEgME7do5fPe7zjEBTOvMnJ/hcH5rOeAhpB8J8r1nC59zVHqeCRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB6bzZQXq6KDUPPDj7ldbhYP0L+KLoD7eG5b1QQ6lhs=;
 b=fF4JguyXb61Gn53xhVBbmO59HERV5fFyXAcdNXgTTpY8WMe5xwLgvoqoV9jp1f1lTDhrUUEjdJVx81KXzNpJeXEowsWZSA3KGwVprkm0eYuuLsdP+h4ZPFWAhGKvZG7SqVLaVXYItn7TZ/K3dB9BqUL6bg3wRbUm2/epGhNFXaZmGquMgvy/GFbMy+0PGE2ottboYjKm00VIYpmb//cRQFgwZ06DLMxqPvHxOAyuU0RSwWlIYyYnzD/MklBsS5bkkeDh5X4Kf2zF5TxP4PIeY8ctTixGk/sKQVLNtnHBzARWVNiw1h6CBwS++s02xwXHkMCgArUPK8RctzjHfhUcQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:07:00 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 12:07:02 +0000
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
Subject: [RFC PATCH v2 2/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Thu, 12 Mar 2026 14:22:48 +0200
Message-Id: <20260312122248.1281572-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0026.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::9) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 4221ad3a-3b99-4619-3032-08de802fde92
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xYo+rL7nNP+zAEqWlMS/+LuetG1GKUY6Wg+803sllBUjaH72XSE/3ZU9PCbfPbDb6HIa5FUVt923g+EgurmtZBWB0B4TaZhv/DgZij8Mp0TUy+OS4uKoMaO0ARsYuqxV0gA8uvJGl1BdUeJw/5ZUP/2eFogKcGL91UFDONo3UQ7zzCYKGgmTZOjWBqGR+PjMCsOerlGaYngBNre8g+QETyUM/6SIsiNmjNyhgLErFSGsrqXzK3AfnA0Zzb4KDhNxej6nnPhvh/3ZB1gWEkmtBjYlDnIBsk7AE6tQyAV32lV9mI1T2ieyEtdm+h5fGnjPOkXz4NCzvYfeZQcjluWziwtDiNN/OyFhDeN+4Rg7k5BC4BGtpTbW4uzrQ5KFA7lxoevMneWfHacWmcoiB335kqBQwp1Mi9A10CbpuOVqM7t3Xz48oYrVtpVwRFbRRQAjC6wOvMIQ0fQuG10wHtUvNeZoJoMQjvZLYDS6jCFVunAuNVkvpWszPnHuWmIR6gtxiyjm/gADYogaXTauYI6piqtMmCUylDGtY1heZDFAawJT6SiWAiDUMmselXblTU8ysbF957acl3pH70O25VnrMyuyhl4LLfP5/NFVg3ivFL1wElZ7PHhrShD332df4Uiam60VyQqQ96kIxAYPwxq+oDiCrOSBgNo1YQMaW2WckjOOO5TJL86HdeLBUsgI2r9AWAcgb7WIml9zlrthgQvCWRRp/6s0xfReZyE1auZvSys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?jw0zoHp1yDUnOUfgLuggabk7HOsYElQLNUJojp8n+zfewF+WMziXJEJA17?=
 =?iso-8859-1?Q?DNgNKovvnSg4mW9paKIJ1HSveiyUAX8Se7UnQNIWFTwhznOpkKP+a/WOaR?=
 =?iso-8859-1?Q?r670RtpR5O6CQBszMVw/jyDgYw4H33VH2nyogFS6XsWXNEMtfo+vlBR4pl?=
 =?iso-8859-1?Q?XoX8lrnp32eQLXej20jNhqJmUhY62z8AMGRglz5jcYAWtOjcJteMd9ifPz?=
 =?iso-8859-1?Q?NPyXSZr63jGQdrQCTZJRRZ+XxFdlvLGO18JAJLDYNGyQLQpxaT5lqqVR28?=
 =?iso-8859-1?Q?rHe3wh2yI1zLxSyQjfKe3wXYZCkETrczKL7YZ974D+f3A2IswG6ac1vIef?=
 =?iso-8859-1?Q?hi3XjNC1dO7SG9DyOmlzxhES6/0Ohij1TbkSLWFjaxt2TYwzcE4wiqX8wF?=
 =?iso-8859-1?Q?4FOjvL20U9UbKY6GaVrsWECou5wFfmfHUNTv1WZB2kuB1VhQUS32sWsnQe?=
 =?iso-8859-1?Q?UgQV+W/1JCMVeK6i/lzuHwkIIHIxFDNcmFBK65nUgZT95jEOCzp3Gpos3l?=
 =?iso-8859-1?Q?XS6xASpvAbFjOJe23zvrB/m4XzdB2bzg2V7zmQxdnTez8tSB8ohuC1TqNC?=
 =?iso-8859-1?Q?vWvqm2xLNZ2lTx7KFv+JJRxyC4H8fse1bZHedb33Th8RniWZv1Vpw1RbCo?=
 =?iso-8859-1?Q?mLzkxoc/thpxG2WlBy+72hjFohPEDTIKBOlimp2w5DbTAvm+d+AtXnaQVY?=
 =?iso-8859-1?Q?WC2HAIP2V/YzyNy/RE2F9egkn2hiqBnqDiQJ1zSKT/6qwrxr1NXQB4ijcg?=
 =?iso-8859-1?Q?as6NmJjmn1LS/VexC5LHSSu9Wufscp8jxzsGHIM4qx2zoCP130xZnDolVP?=
 =?iso-8859-1?Q?z0Pbbwm5CbKXoiywQlMMsPzmogvPXY9eiGq9Kbos4rhLv3+1KU6GvDCMn9?=
 =?iso-8859-1?Q?qxeUmR5CsYPnOv/iH+UGpY/QUrX4TsDVSfgtRUpQGzMa0+U78X+Dww3pj+?=
 =?iso-8859-1?Q?dHtzRL385NA2UST0Rp4i/EuloKFcDzcjb6RCVHz2Qe9YgU+9IOJfjBsgVg?=
 =?iso-8859-1?Q?8PYWV/5KlhTa7RcDbmU6fGm4moZ7YHqQ0rVUfr+LJRP9xtIUwYweQ9fiqG?=
 =?iso-8859-1?Q?xvmm7I6fTg7uY8YN9J4TV27BjbQ0421CRq7aIdiXPWphBpcU6+NgKduWP3?=
 =?iso-8859-1?Q?3+5Y9n46wm9T7ikaVs4oLMes0E/Dj6GWmHpqJfrvJQZvt1/YWcEUXhiAAU?=
 =?iso-8859-1?Q?ij2IoqWSXk7qNXW+Aqfa7b6ML2o5tl3ASvweAYE3CU4KaHqJsy8Vg1LPE+?=
 =?iso-8859-1?Q?f5CYvaNhAlinp1tt+2korKLxxpbZd0nG+cbxt3tsAGcxu3l5rYmbOjaFA2?=
 =?iso-8859-1?Q?bfGJskQVer4s+VXHs/u7uUhxvigfxHAC+rKJ4qF5BLunRr/DzB125p7ol7?=
 =?iso-8859-1?Q?2FAkqNyPChrZ+JY80jFzmq+UaORSZeACWG7akklZ+IGiltNbgT8Hr56NJL?=
 =?iso-8859-1?Q?KtRfxtLrn9ABoX7jMQ3PQ2ytkX2GRNJx8VPJfpbirJvGG3XZGvhvRsTEXb?=
 =?iso-8859-1?Q?3WYEGLiHq+o7BZPXEy6Ny6uMMRxtK97gRi4U/3sdnbMExQdpWNbJh1QOI7?=
 =?iso-8859-1?Q?kxGBu+LeAr/gFF/dpNqC/lZu61p592f+DAab6YoHVmpofd551x1fRbEZ3Y?=
 =?iso-8859-1?Q?F2LYenzZq6C6hSctLKBCCjP/febOhBasQ1CW+/DaJvSxtaf3cFYvJzsPSJ?=
 =?iso-8859-1?Q?uGDXoXCICpKIHdInuC1hLGiYc/X1sGmmC6oYnILguOmL/uwR/gBont5gVm?=
 =?iso-8859-1?Q?wNKmXyQdrae9lR/izWSmNIqus3YLXxSr99xTDAZHBtEf/e5aCulYM2ETIO?=
 =?iso-8859-1?Q?pG03UsuFaQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4221ad3a-3b99-4619-3032-08de802fde92
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:07:02.2740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9lUuQYm+uP+Pi1BvbjuvKNjfIbWv8GYtb+MTvBf9yhTRdoRtEp3ZgDnPO7eQbPLmPIdGiLMDN4mPJ2L12ufRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864

From: Florin Leotescu <florin.leotescu@nxp.com>

Some systems require fans to enter in a defined safe state during system
shutdown or reboot handoff.

Add support for the optional Device Tree property "fan-shutdown-percent"
to configure the shutdown PWM duty cycle per fan output.

If the property is present for a fan channel, the driver converts the
configured percentage value to the corresponding PWM duty cycle and
applies it during driver shutdown.

If the property is not present, the fan state remains unchanged.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 60809289f816..1fb5eac75f4a 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -32,6 +32,7 @@
 #define EMC2305_REG_DRIVE_PWM_OUT	0x2b
 #define EMC2305_OPEN_DRAIN		0x0
 #define EMC2305_PUSH_PULL		0x1
+#define EMC2305_PWM_SHUTDOWN_UNSET      -1
 
 #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
 	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
@@ -104,6 +105,7 @@ struct emc2305_cdev_data {
  * @pwm_output_mask: PWM output mask
  * @pwm_polarity_mask: PWM polarity mask
  * @pwm_separate: separate PWM settings for every channel
+ * @pwm_shutdown: Set shutdown PWM.
  * @pwm_min: array of minimum PWM per channel
  * @pwm_freq: array of PWM frequency per channel
  * @cdev_data: array of cooling devices data
@@ -116,6 +118,7 @@ struct emc2305_data {
 	u8 pwm_output_mask;
 	u8 pwm_polarity_mask;
 	bool pwm_separate;
+	s16 pwm_shutdown[EMC2305_PWM_MAX];
 	u8 pwm_min[EMC2305_PWM_MAX];
 	u16 pwm_freq[EMC2305_PWM_MAX];
 	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
@@ -539,6 +542,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 				      struct device_node *child,
 				      struct emc2305_data *data)
 {	u32 ch;
+	u32 pwm_shutdown_percent;
 	int ret;
 	struct of_phandle_args args;
 
@@ -578,6 +582,19 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 		data->pwm_output_mask |= EMC2305_OPEN_DRAIN << ch;
 	}
 
+	of_node_put(args.np);
+
+	ret = of_property_read_u32(child, "fan-shutdown-percent",
+				   &pwm_shutdown_percent);
+
+	data->pwm_shutdown[ch] = EMC2305_PWM_SHUTDOWN_UNSET;
+
+	if (!ret) {
+		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
+		data->pwm_shutdown[ch] =
+			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
+	}
+
 	return 0;
 }
 
@@ -716,6 +733,23 @@ static int emc2305_probe(struct i2c_client *client)
 	return 0;
 }
 
+static void emc2305_shutdown(struct i2c_client *client)
+{
+	int i;
+	int ret;
+	struct emc2305_data *data = i2c_get_clientdata(client);
+
+	for (i = 0; i < data->pwm_num; i++) {
+		if (data->pwm_shutdown[i] != EMC2305_PWM_SHUTDOWN_UNSET) {
+			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
+							data->pwm_shutdown[i]);
+			if (ret < 0)
+				dev_warn(&client->dev,
+					 "Failed to set shutdown PWM for ch %d\n", i);
+		}
+	}
+}
+
 static const struct of_device_id of_emc2305_match_table[] = {
 	{ .compatible = "microchip,emc2305", },
 	{},
@@ -728,6 +762,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1

