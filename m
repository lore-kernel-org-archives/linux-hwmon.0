Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCBF3DCDA6;
	Thu,  2 Apr 2026 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131804; cv=fail; b=TaynwGi3PlK+gbD03HzMerOaJRC4nYDxYLQJ8xd62wwUZSljo+eoHeeeAi5WRP/oWz+PbJtsqee2ePo/6+2UzUgx+SNbZRGhNJQriVJuJwUDnY8UvRbINIo9yNEWaOcTwTSF5gZvMqFogekLgEHXz3PV1TrRF9HUx/oVrbKT6Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131804; c=relaxed/simple;
	bh=+PU7VnGBnhrgJMpbey/JpN4Qz9XIWKcE6T19pgYXGb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S5+ytWdiHu8IuxCQgpTJsjvRNeGlpsoYa5agD/TAaLW+10D7isVPjGv6iyjkswg5cdUU2hEwvdngO2zGDzwPsqCyZr14+MvPHVwB3ImiXGTx/JdW8T28tzQRmL561netRHQm7B0s4h3GiMUl1ewLzkSlURObKUuNtAPnI5MX9Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ASJl2gkl; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ASJl2gkl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZAPfUU9NCR1ms3/RY+k6vGJV9RNHdYkCxi/stIswZ+e2Yi+j3GjcfOp7zDXlj5BIv18pjzVmTFESNALz0IZ/ClpYXHT54PmoNghlwDr4SsV9bCQg2eZJuoDPVNJwntzhOnqdvlitWXuamYMpMqle/Xdt7TOz32dSqBH3Z/Pg4aCEan9KZbOdwogM16PN+dbauleJyY/BG7SdvvZmGVx2sm3HmrV3LDUd/m+32G8IyWA/7inGKt3AHdKladSt2MG9kU7uJF1yl69XJPjhHUVbadMN084JpPMXJKvZJwHYsUqfwILj8xpRkjvRpG5DCCyE5skXZZhR1/mMQL0hpGM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xie2KyAwJ0U4IgVD+zf7OHMnpQ6RnxyPLRDcOMmZ05U=;
 b=rMieMWb47kRo82RQfmaojXyeDjWtXSkcIf9ziPyKvubP4VEZAhUEgxaidH7WGxGnQE7JKegIVFMdbg+REcFKQD2M0ZKTdNR6V+p9hR05awhVD3nyKcqAF4wY532OiXwxS7jXBbuamjXO/z2yU9Z6GzoCA6xjnrc06kWcLRcfPjV78fhWhz17vzZF/ISuY2vLJEhJfZAksIKOvt++xWGqdxz7NPaBTqgmp/JrjttCvnSYJe/QalQf+zgYqN6YinrVgiRcRtvKN9Bau84SiTvYs0cxCVCaDL79jXZ2X4ntgj+/dNbbeFaDMH/bW7Zb5vEH5jyR94VKYEvTaMHoy1WniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xie2KyAwJ0U4IgVD+zf7OHMnpQ6RnxyPLRDcOMmZ05U=;
 b=ASJl2gklOYaJPdCQvwuxP+6qkkqHTlXYUkh6Y5MnNSgPBB3NY2PNvCr63KCAP/+5KvsxH3OL1LSV/JZnjvDEkYPNrCYxNKcfeM0JW9L9WHa7VRhKWa53ZrGhWEeCDTZBiddmOvYlyDcTNBin36Mgh8x6zHzgJx7KGXVkrSXwuEHDo6c7uhKoQstE+i4tKenclINGOBFyW6DsvEeaW5rZaNKuZNtsn2LEstV2vlcZU5KrepNL+3m1vA+Ww7ouKEvB5aNT5cYWWbvcG8YSHBet+kyxeSWfhe4SvauKIWArq83+N4GZJEvEcqaqf0qp3FbTGJkmJ7w8GjRKs1cfUXbm4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 12:09:57 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 12:09:57 +0000
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
Subject: [PATCH v6 3/3] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Thu,  2 Apr 2026 15:25:14 +0300
Message-Id: <20260402122514.1811737-4-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: ca38969a-09d4-479d-f319-08de90b0c140
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tECoUPbti3C/CXMlmJJRwGbud5UOGVTPhkhzeRlZaaMg2xeBM8aCrGYr/WD5ds6iUBhm6HENVc2djWoYk45zWYlzKTmBoReeEj/Qvi1rJP9z8JvFm4R1zG9WTiCgpWFRnnNpz/xtPtftnX15PbuEQxykY3ulTPSvVGrCdQYu0PjadlfdX5NmYcw934JU0lOfiIvX6vgh7kWJ5ceTttJoYc7C9sbSQwfOuSOKIHzQrKMTKrJaN8YleSahG5V5BPcmBlVkrb6i+QztxZFhlZw0RijeInKqNTSS1VUthxmxJNt710nI6LM6KAqTX05r11vd5JuvlGjbb1gA7iJAcS1DtVYT0qawRU4c0J0PB87fs2M1kYemAuwBaMlLQp4EzxUmI9jLIbupT6BvXY8sQ3AXt7dBrsisQVe020VwDvngA6Oul8Zz0inLmnuEab/hdT9XqOrJBYpu03NMYt+aZbUEf/PejMj6RPJEoXnjl7dhDaWozDSI3r9XvPUt1j564Ka2B55o/E8SPqu9FoLcOfP5TQ5v7xQbLlRlCHBscKohhSrF90sXb+F1SsbG73kCwgAMUMkQdlrriJ1jbVrkWh8aDZ13bgdkLw76sI8bhC/0DmvvpAg1ZBwKMielNSyp/XVU+opLiGDbJdd26wyBwiWaRn5GTN539j7a+tTg+WMUsCG5T5ndUWrfn+NKMzW41yvwlJTevHt3GPGN35GGfKqU24f1weZWK7l3qX/83OfPFeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?plpbRoIPtv6qUmj96otR+Y0AaduChBzVXGZeq4MpacsyqcNn5VW/EZCGlq?=
 =?iso-8859-1?Q?gDdOYglS45Urh6zQuKxo1Lf5x0O7XJOllIlL/8xpl5H444zKobIGjTKYc/?=
 =?iso-8859-1?Q?7yAJN4jS4a4i62qGO/2mR7ueEqbFLfvY6n1kAe+w5RbqPwSYxdACdCw9zS?=
 =?iso-8859-1?Q?e2/Ol9ePi3sNmdtmXm7Vlj9OEK/O17/gi1OB73uL4RqGqR9Fj+HB4DoizE?=
 =?iso-8859-1?Q?Noaf2HxuVkQBp19IqfOE/odxD/Ul7jE2VCCCiVvlhaG9GcunxsOkOqupJH?=
 =?iso-8859-1?Q?q6x5ivShY8uCmRqBXyWYzsr08UmzBB8Sdk7WsCk5+BTI4rgSITZ/Lex8hh?=
 =?iso-8859-1?Q?KS+oWDgKf9KjDLUhfUw55cV3Rsl3+X1iBbgk7C1fpT/6berh/8MP2LHGPp?=
 =?iso-8859-1?Q?0yDKehoyi/+lPGBMh1xXM5A0CzmQ9hwXTwX3FqqRv518aCP4PKoPZg8ao7?=
 =?iso-8859-1?Q?BcJ8r5fSUJI3EgUH38+yjuSm+0aTffOcu2PZJG/P/0/JDjmiTHQ4mKIg/F?=
 =?iso-8859-1?Q?n9rdnGIS60vyFlQl23Xf+250gDh03D3fUe2VsL4T0S6wPIK8H03bw4XgnU?=
 =?iso-8859-1?Q?AVX6k0j6/7gPVJYZHHxPIXjP2pgpl3BCC/YAavWT/npTbwshoovQcLiIc4?=
 =?iso-8859-1?Q?Hu0dmpaEjB15foFDv9iigDW0PN7L+i46uLcLaH6f1C63OtIsvi19/0HNdx?=
 =?iso-8859-1?Q?bpSrgY6Gc5iZOGP+psrPpWzlqh2IdvEOd9lsY1Gs/GWx6Hh2BmodkHqM9X?=
 =?iso-8859-1?Q?vmGdY+7ECRJorVnmLUWNVD07xeA506gPlrzpWGaxbASTP8zj9SXA5iKtZz?=
 =?iso-8859-1?Q?Tg93IuPyKbE5Uhl3QHlzYybZtwtfc/AhnQYIm+MgyR3NM2PCES+e58ZhMg?=
 =?iso-8859-1?Q?mUdT9qf5ntYGV5102CLsFXyAERqhSnRv4qGxaaKDjOBIUCfh6kdD6fbHr5?=
 =?iso-8859-1?Q?xHmkgNijub5I9pzSPaVsG+CuUjCl4tiTLQEseyBEN2grJSP55LOAKfZ2uM?=
 =?iso-8859-1?Q?97nT7rLUXDHyZ3U0W05SYNKlYz5Q1j/W9pI1ta55ipDZ5TUbFBWcJUAf/q?=
 =?iso-8859-1?Q?KJvZRvjtW6v5nACUMlSwHFDiDvzAyq/or+V8XM8tr6gn9iBNjAzFFFyjj3?=
 =?iso-8859-1?Q?on34Fx8Rj6XB6pCAYuh9HlLs1K+Zuk67Y9tLkdBMMVHK0Gal6k4cTwxUB5?=
 =?iso-8859-1?Q?IW3wiXMSiBAxOXKGkczSgAt1RJ6IkwWP0PgO2VIBeoyb09nmZTuVfQhhHV?=
 =?iso-8859-1?Q?42Qg3RZFAfADwikohdv+UJmT+2/mAKrtiT+t8v+4KeEJ1bdpXhaV+c+jQ7?=
 =?iso-8859-1?Q?1iD/dTqSYxYZ8EE3/WIaoK+5sevco8CJXbgZWTIDHJ03WhrLuAjYEY50kq?=
 =?iso-8859-1?Q?8nlr9YMihqljhLeHl0YqXvNoPr+0tYGidDkuWqLMD8nHdVK40lcJVexI+M?=
 =?iso-8859-1?Q?jFxjoBqqLD6YbIp0xLUnNBWthanW5E2b7DgKCSTtS80g4AT505nyvouPcv?=
 =?iso-8859-1?Q?qG/MplSnK9Ztdu7/S54KMp+SZj/ApTWT6ADa+PcK92dGgoKrhygY+PP1WS?=
 =?iso-8859-1?Q?wLoL/kanaUcPPJq9UQkfyMJJFKNqzIYlLogCS/RzmU5vEE/KhxnhmhMXAu?=
 =?iso-8859-1?Q?tP3UCYNcuWFYdr914UvE/jf9PwTTDmqUBNSuRhOpt7dg/da2de4UtB2vPG?=
 =?iso-8859-1?Q?o8oSR/7PWGEDokh+D9MZhiNsuTuweG/ii1EQDxoi9ulFLYt0SCMeU/2oOC?=
 =?iso-8859-1?Q?/Xj5XNsidUhOW+n4igdJhBEuZFCTift5mHEvHgz7+BmEOkb2r+U8kZTmEu?=
 =?iso-8859-1?Q?qz3aJOYLlg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca38969a-09d4-479d-f319-08de90b0c140
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:09:57.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8klfTJzF4NLJsfaaEvZtYYn/vsanh+H/GVJBppp4M+lOhJSd949wCwgTtSsUpIvdriYP88YbJ+R5ZD9Oeb3Ihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976

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
index 0b42b82c8e22..dec3a79933c1 100644
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
 
@@ -585,6 +589,16 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 	}
 
 	of_node_put(args.np);
+
+	ret = of_property_read_u32(child, "fan-shutdown-percent",
+				   &pwm_shutdown_percent);
+
+	if (!ret) {
+		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
+		data->pwm_shutdown[ch] =
+			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
+	}
+
 	return 0;
 }
 
@@ -637,6 +651,9 @@ static int emc2305_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < EMC2305_PWM_MAX; i++)
+		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
+
 	pwm_childs = emc2305_probe_childs_from_dt(dev);
 
 	pdata = dev_get_platdata(&client->dev);
@@ -720,6 +737,23 @@ static int emc2305_probe(struct i2c_client *client)
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
@@ -732,6 +766,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1

