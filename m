Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233CB3E716C;
	Wed, 25 Mar 2026 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453759; cv=fail; b=JWvCLbnXS9MTrH5/g9hZ0cAyNMh2w8vQgaNDPRbt3mV68tq1NV+i6pxHvLhx8A6rsAm/ly+moaQ8nUoXvDDfgXvsRJj2V6RSgt6/ylZ0PkRc6sty+mdjy3hyDtAPlWA8F3EKyA6mhRETMLSC6NyIctseFzc9rYnwSNMOHFagW0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453759; c=relaxed/simple;
	bh=PsXb5LTxiXIM/n465Bwl0H71ceyoet7tZ4aNAJc2OM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MRu53WJoPGlaCbJX9ef+sy78cujiKtjSSL16t/e805knzjuCTLbf53dfhL4adgq0twjDgmpROF7bMBQVC4t/Av/gqc3p4j0Z5W/Jw14v+EjVEf6DUr9abpT8atzlpvahoJND3uRSgMt3deJROOMK/kpY95/HLaewSA4SFrnxTK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JC7EeVYO; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JC7EeVYO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FymrUU9EYmHhtgghRV9+DYVOFe54NuuIgQqp5qdsLo2xgHolRSJISNQoJh1N8jJGtc8zse8QXYSkMQnHIVsj4SHTgeiXkZJ/XRSKkcH3g81ZmWeFXMEpsShvTfqWpaca2VJzB2OHPZnN3T7o2NTdeFRR2i4e5rf9TV8OE5/B5JZHjhvQq7FWtCMi2Xpb2pVG+c3p111hrU9NUWzWr/3Wbv2aTXlFCMgBQ51ze/kJB6sbHGDtO4IJA5nQaMGCw+rfAh41r/vQRrCVPAWh+zMKbSpL8facmci2o9xOlkawGXUgDIgQqt/1WvamwK+5YJjG1qhIFxddtlyqSzeJbkPqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn/+XpM9DpsfS2JCYqazxQNsa1DHBEAp8rl2fLnI/+c=;
 b=M09rzp6LlIys6dU/EhSHyZhghspoYS00A+RRxDusaoJSYDXf1VA9gZYbjUZkDQPSlZMRsMrij+UGpP0jpoaxEnLi9YGUtfwCNZK7hPci7198mMalfXGLPCb7oFFP6eehLy2cDV/uQVlWb28iHpoxaN+z8nU5ZiXZagHET6ssRe8g3Ocg5+DzgDHbXK4YdRCQJce3zKHT72WfowYL/JKt9swxNEVpPXP0smXLAuTqHRtmS3KOEBixM6u0TtACOJvcmexGRqzJoq3dx64jyesdQzYlePYvoxGNQm0sqIntTtrDB4sFfeHCxVsetL8wTkhtJcDRnx0FI7kjTqS9dSmxKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn/+XpM9DpsfS2JCYqazxQNsa1DHBEAp8rl2fLnI/+c=;
 b=JC7EeVYONU+rSFXqQE4r1QfUFO3i3NKEvaLdyGABgYIILivgZkhMSNDFoqpvJID7ObKa9lfdCHZBTUtz3NcIaZNa/j407/pZfAAlWldXlh+7d7XsaKYJNNO86PP7oHn3+8fxlD+rgi5VJWunWcQRVOu35tU3c9zd+VfKpBCb2VqmLszC9gKO/im5KnqU3uf5J60Gjk40gUYNCf1KUIoTycA9wlW9hqZ9RDsuuI2lGl1DJxIHREnS+4yEiUC4fR8k7m3r+5oe2y0PnMKslxS4nTyQnlLsl9K4RVwsY+d4JYKG4PsZvgizDvSRgNbMyqyYTqBXOU4CQwd3bmVUtZnZGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:49:13 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:49:13 +0000
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
Subject: [PATCH v5 2/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Wed, 25 Mar 2026 18:04:44 +0200
Message-Id: <20260325160444.1736866-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
References: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::11) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|DBBPR04MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 773eaa12-3119-4b12-76a2-08de8a860fe1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|19092799006|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Km6kpq+aLgcvsldZs5UWzFz3Yjd/Y/ZC8CYjXvF2SJWyfEssOQB5U3cNWrK5vheViVGQPiHS5Y+kuYjqaeFMvHhzwgE+wDi51BJK3noioZBvTnEthG71SDBAWHK++HI6EUykmLitQ6X4qIC78SaxjbaB4sYCCc1Kk4a812PmaS0XzLaG0i/dn/5vJCYX4Vy1UPm2OEgtpA4miXgC4hPPHC4fS7rz7oaa7JS/oXjtJMVmwz0pNACLfFx2L/f/TD6i9c5RQrbZ4NO8uZeQkpxpqouutOIK1g4tDXUj6LOLln9CUja4diLcCfuz/A+ahYFJA7VPLQhg3gxXJGyKXpgNhkx/m2/kNN++PXFm2v84gHHMlhC375Dyc9GVJqb952QUxi7S7Wk5mJ/9lNpKvqiI1lH7UC2KKsNI+rMW6bFuk7WpFiq6fbWdcModn1kUwRtG+FP4c34uvjxBr/v4SH7EA3dQYocw/O2fPKDEmPtpez2udiRNZY5tSGhcn7I20RAxVFIYNA4DbDfuENrWAn4RKv2dOmr6p/4cXUtw2q8gND+SMxIB9gl0yZ/sIB7zB6I6iD7qY1VXfmtfVHgQh7m9Naf+QggKV4POttPZTieJC1hRxXgD8IgI28vVOWOgx57wvox8aYFvfUhaLFsiNvbSC4qzH1k04tbTDw0uEXunSYptuRI+cNI1FxxHa34nV5rdPPotADzQVr/9iA3s5Pu6WmXYyuzXhQjHGtW6kOtaUb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JXYkU8GzFPh9J6PeynCdj8Hg3zKHCwj7VEzXxg9GAGlWa/8qpjp9cxvHfF?=
 =?iso-8859-1?Q?IjoKP54CghfTPREGuNojRQBJ3yprMokpwh/Kio05viXENXLZEb507DYp7h?=
 =?iso-8859-1?Q?Dy/Uwbt3KFFPccFcEUaXXA1jO1YL7VbpxBuC6fjOmEK6afT5BNXRPvNTNK?=
 =?iso-8859-1?Q?ev7DTy/QsP5Ca9TL2dSc5UOaftdd2yGT+J7Cu8duNeGAs4uCKYgf1HuQFz?=
 =?iso-8859-1?Q?EDzIGVqkI7h5jBImPhZH2xvxG9Dxjl2KPpdcNbmgfm6WpXX6Uu9IEtZFPy?=
 =?iso-8859-1?Q?Kw1mpg7sEbi++NC9ZrAcwH/6OYSjLSec6C4rMkWHbyggpffr01Quu5UWKY?=
 =?iso-8859-1?Q?bPDubCwtbHqzGyy06lNmhCrgJPmQjfAt/OAOgLUJviyxnXc+5EQ4H3babk?=
 =?iso-8859-1?Q?ONWTo8i/DmPaY/QwDzjcxlXHkK7DkIU+4U5nAWMcCCbpKVyqXEFNHcsWZj?=
 =?iso-8859-1?Q?iyQkiv1gSxVKyf19pkJUnrST5WABJqD4biI5GCsT4I90z6ft8rNPUuXQk1?=
 =?iso-8859-1?Q?enMKUFvQxcbe9Q24R81FoOnP8Qwd4YziPXMdCcY4Zum42aPggiLXfVG1Mo?=
 =?iso-8859-1?Q?s8pWRZfznVFzse0JZoGaePx8Yxc7GC9UPfxrFZ4HfmJJZ/ImGuP4SCQVs6?=
 =?iso-8859-1?Q?wQM8VznnrpKjBkpQvokIpevgMT2GTT8XO6BTyuguOWEu98SNG7uv13+412?=
 =?iso-8859-1?Q?HAkXLi/HRXuho6kWGtRq4dOUOKdV3W1LIqJ2tSD6yfUHj9BMO1dRbI7JkE?=
 =?iso-8859-1?Q?O5a+KQdApZ1qrQsJwSYpjFVlKcR9MJ7v70XrIsDKeUzIqj1YPauD10b02x?=
 =?iso-8859-1?Q?ccpHoN6FGIZDjYhXWGCufOf6elb2zh5x+jV383/wxjP+LoIgST34/9KFyh?=
 =?iso-8859-1?Q?trD7c74xFhhgNPzVdtd3rttNgEIeNTK65qmnz2RVUpev3/FSg8VWGkiJ1B?=
 =?iso-8859-1?Q?MeCl2uwfvUZMPZlutvLJjHhWdUU2ECggdCB7z2iYHNcsnRGVobFBlTd5td?=
 =?iso-8859-1?Q?xUsYYM5MlTwKxUrroWCJy3pTn48K0Wo8hsQHyKF1JessEznyD+bFDlZvvF?=
 =?iso-8859-1?Q?CQVM1wZeYny+YMt1WlyRpTTfLQYPCIhf11KqfGv9LinIbCuvJO+oeqZnom?=
 =?iso-8859-1?Q?NH9dv+/ULTt4RnyM+VSzEzVwaSqM1OTUBqwSTVcOVKPlWa9vlR9uFrDfoE?=
 =?iso-8859-1?Q?LY4FrAZeZK4EiPwaS9+bbb4GX90Mxnq9uy5/mK+f4gaLRWfryj06aPprJf?=
 =?iso-8859-1?Q?Gyxxfyw6aTfPPyKJDWSJXtgFtJfC+eqCLnmsHCRoJ1BCAf+QuzsDpnYPwR?=
 =?iso-8859-1?Q?+9P8Thb+2PnvtA1Cx4CM1BdLlwHsuDcjyT0GMyJNlRwxRn2qYdYCJnP6N8?=
 =?iso-8859-1?Q?LY0R02zWXVAquAq3htyo04w05uQYQBzWplDc4BLMwKAcNGz/jCeo8+TvDe?=
 =?iso-8859-1?Q?curbqTSrL3/4mjWXgTL+7HMuFxseIRyp9PBCERJSekzPJQzqga05aK6vf8?=
 =?iso-8859-1?Q?WgFLA1YQFXbOpwticiUfSsSfVq7lggJ9QxMZqxN1k0FMOKBQs9w1Gkj34F?=
 =?iso-8859-1?Q?qPmKYoA40E0ReQWQWVj2Vdazaz3I8YTEyBnTSWW7TbXJTe9dcOTVan+SkW?=
 =?iso-8859-1?Q?QSDVWXxNcSNWmpA9Fh7IFuYz8vUBUd2AIZRsfUzRsFpn7e7yt/6Tx06GtW?=
 =?iso-8859-1?Q?4xZtNPjAOMCxOuW++xOjlTIDBr3tYKq9WVMbORmsEp2rpDE/Qm0seahBDV?=
 =?iso-8859-1?Q?ERXdB3x5jmNMYYIYhJOfXfUi05i/qDjmc6lws4rFnnB1ZECRjHjkn9VgYv?=
 =?iso-8859-1?Q?QuZnGAO4qw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773eaa12-3119-4b12-76a2-08de8a860fe1
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:49:13.2887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gr7B00jevAFudQM7gIlM1fBXxImkC6sYnTmKa5MED17yqF5uNjM5pOy1lN42lt+I/An84EVt+4Pgzn4RZLMusQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

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
 drivers/hwmon/emc2305.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..722ec1d054f8 100644
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
 
@@ -548,6 +552,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 		return ret;
 	}
 
+	if (ch >= EMC2305_PWM_MAX) {
+		dev_err(dev, "invalid reg %u of node %pOF (valid range 0-%u)\n", ch, child,
+			EMC2305_PWM_MAX - 1);
+		return -EINVAL;
+	}
+
 	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
 
 	if (ret)
@@ -579,6 +589,16 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
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
 
@@ -631,6 +651,9 @@ static int emc2305_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < EMC2305_PWM_MAX; i++)
+		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
+
 	pwm_childs = emc2305_probe_childs_from_dt(dev);
 
 	pdata = dev_get_platdata(&client->dev);
@@ -714,6 +737,23 @@ static int emc2305_probe(struct i2c_client *client)
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
@@ -726,6 +766,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1

