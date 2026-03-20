Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D31C3A7590;
	Fri, 20 Mar 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019673; cv=fail; b=u7dyaZ7fodG1wlNrFPSFZAonoRLkt5/IPAVGetulnX959cNlQ+vLuth17UoevuN6ZMA66kYbzBLOc1m10Rjn0l6xaqzAKQ+1xssCTCdvFFFSsB7h0ieQsu9KnyQS8NvgBs6/Kfj4Myp4W5fGWlXzqyzZdswOoZGkoj/yaxKnJ1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019673; c=relaxed/simple;
	bh=4AharuZuwJ3KIJFDimS0Fn4Kr+HnUnH6CFBWDsF30+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r1oAsws1HP60lcgi5V+NVDGWRUA3/6q1s3wbTW7YsUNaD/iY2ySCP4u7smQN9fS0p9GNsQK21GsjYsdAZZDX9ZSxibsCbb2JTrkXiX+CwgWQBFQ5kfRy6NK2AbD+P62HMaGZp5DAFfQj/NYykQSoxgA4T7VXg4I+PEMG/bDfsYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qcY+lSeb; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qcY+lSeb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFVheAqDgtk1myv+CIy4/x5X1udfPxnb6PsyvnG6b8kotRz2J+aTEleah07sFfFXTey6AeIT+zCQRGmStRCXX46FqQgGEmcpBcGmkVDwq9AT0bl69nwBJc2q76ChrV99MvslPLYhvyyzM+8YfBFJRJg9pocQk+zQ+84Z/KrmcVqs3qkSK5KCDEqJvFzTZU25RkVp9yQgmorNdnHP8minrpAMYmjLryZMsJ6l72WSmflnmbtoyy2QOFajvRKVERWEUbyHH2NZHUbFSyQ5S4Zm9WWfpeD7oqOaab/j9HEddtYTuO8DqBAwTDgKmTIYBfsv8ip+jvv1yHHMRaraGOmGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbeB6gjUTTi09/FT8jvKb8J4ZHzUMZc8MRjRQE+jUG4=;
 b=nk9GUDozikJlOe7/q7Wv7ZyqguK5eKfDZ8qkl34yMJ254ds2shrGH9b/lAmqUIMaE2OvvmzA6oSY/mTep8sAc57En9LvkVJa0mwIlpyBYNa2F/6DnbgngmrXCNE5JFXIXiKxyGWLHXAc6hcFjID893WUeOl7A/1DbuqgcoWY99QbP4Fnxkf0bz1I14li3nmYcUbkaIdT6N3EnKieLtK6bZAOwYiNx3g3pHYNcd7TyYdFySFQ2LF+3/13KRVvFLoQU0CAgCxYQLYrUOvay5ublhv0hyDOGmevmK41Sax7ISUgIJ9FaZQ/w4Jfq1wf4LmfCI8APmpuWaTD1pYZiFbFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbeB6gjUTTi09/FT8jvKb8J4ZHzUMZc8MRjRQE+jUG4=;
 b=qcY+lSebHfmnlcyke6GObL/SdKeJKpcLPjArWo+ezoEZFFkes5An8XasxsFUldjSYMVNW2eRMoZ5mQEHiQIFGIsRIXsFSD1xERt7zgObSOHLxLG6SAAl9GTJWE5+d6pk8bP2a7PM41PIpRNg44MW4gbFbyoSgpI54cZpuqwF/El1jZd+pu89k0TyFxQKllpJn91gQLWoLAal+sE4SdwniGX3yoImeB73wAVcWAOHcO8dsd7jBfl8bPjR3vSxe4EUuuiw/m2WEus9Ti3BMZvf4D8NLrhRVyQtQb5nB6kbQN7p5rVVNgO3w9QgvkzRCVggRzxNxaLYuOe7Nk0sPOHpkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB10630.eurprd04.prod.outlook.com (2603:10a6:150:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 15:14:19 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 15:14:18 +0000
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
Subject: [PATCH v4 2/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Fri, 20 Mar 2026 17:29:59 +0200
Message-Id: <20260320152959.1575978-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|GV1PR04MB10630:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c6a5be-f024-4d68-52cc-08de86935b00
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hTGWyrzB+cHpm/x7Lt/+J2DUYy9KHy3rVbUWls/fUMybQz306cpm+OLwvjjmf9244D5aRxJuvz6mj9npJ4qpOswcjiOawNA2OyOJvPvvd4a3PV73p/s55b+bc7V7CfcWnfBNP3I1GE5C9D7+dsLm7xHtdM26oVtguBBBSgh3QN/NLt6E64yJHYzrukh3ES1tjs54omEw8RtMaqY87h3/vVkF1FdIL/7IGVytTFcFfw6Fpz2o/ObF/xIxBYFLIsJrKdqGUo+NC9Qqxkq1PitfD5Qfl3iahW7TKCYZJ4hbkS8b2k9wCQypSommeSh+OTZUwKAtvPvbAL1fRU0CseIC/iKDvVFq10ylay4T2u29RcTAmBMwa9IPx74LlWhvuQix+JvscKCwFkb5Gj+KCSrn81x+yIClaLa/x80foZx5jEGXsJppTz0ICQkQ8Y6Q63vjm5hommgbAj4MgDIsC8FtA1ZCZAUxAVI9FSYM0M7H45gUfHm66m98Gu6StOQOPh0t9a8Rf3uNaKe2p8ockS5IcNNlIktSeO9CIKQGZlTUuzSOSnyU/1flW89o47K+t3GOVXZoCINMsW8cnyrhOjCuAPFHo9p06zyNE3EQYRVFW4d38nzutDKbPgyINAdue6ggnqx5/d8Kqf33qOHCnVbVOLZ7/KUSF8jElTaz5N6A4M0wGZi6XNC+HDt2AeF0JBS3K/O6oD7iH7rz2phBU3n13AJbUFd5qsvhaXzYL0SySjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?wYFurlf0M3MC7NE+uflNPRgl4Rs5lOaGf2QnX+49b3N2Wkmo+o8kYohYG4?=
 =?iso-8859-1?Q?Muzlugt/7bXqpKxc2/ifSyLu8wlaS7rNHFDfGTXKKCUVJhflgmRB8qOWus?=
 =?iso-8859-1?Q?U88GIrrjsBdJbC4zbQMe6ko08m7NDP9wf5jfDO2jwM2PVO7zp8Mp3bqnJM?=
 =?iso-8859-1?Q?+rEQIh7iC5EG4cS/Sc11UntuGU3sC3wEQaqCrSLC5K9tP71FOjC9bR4jAZ?=
 =?iso-8859-1?Q?v6EzbRl1uHxKbBd1tCR45GO/mWmlCM5OE/XbCpVmo3kIrCXJcvKMB+I2nc?=
 =?iso-8859-1?Q?LSViuDt9QYyUb27gjyKDxMamW/ScJNVIa+6/GSQHfPQF5OlQDHdN0wbwp1?=
 =?iso-8859-1?Q?H3NvEENsXkrjRRL56M61V9Asll0gpOp8p8U133Z7rC3niGk3RZKinhwWTR?=
 =?iso-8859-1?Q?Li5z27AgSPcMI+jtgilQlfAiHNqwg/FvtFVHgys1IEqXtwrMT+p4NglPU6?=
 =?iso-8859-1?Q?mf9ThLp2Iyi4kpr9PLNf3ruCRhkw427TL6wW6LrnwDc5prTd0Ne979NyE6?=
 =?iso-8859-1?Q?WcGWQi9PBHWO9m976V0D1nA+DRTJYJ7IrBQyluK3IZG4UJS2cR75toshvp?=
 =?iso-8859-1?Q?9rKE9y2zJXcAQg3guxf32F+dLpX2aCE9H6sFnFKONdenjW0JNfzFGBOERB?=
 =?iso-8859-1?Q?5Leow8H02RibNA2vTbskpgxvsNHJScTAL5+/QtMzWCULub1kCcwp+7cj+c?=
 =?iso-8859-1?Q?JSu13qkSNBFfBkXnLBW+Yu3OkkimAkcyon/0izVhSHuOqan8+2P66QHFQh?=
 =?iso-8859-1?Q?9T+MqjQQi5yARswWKkBloY+CSEn4V9wUtDWLp1kFbi47qCeav2Lsvz7Y7I?=
 =?iso-8859-1?Q?2lhgvYSnTFOXf3ZAiI9dynShFyqMjBGT4bBR4bwfOR7RdIL/aWxe0x8bRK?=
 =?iso-8859-1?Q?+1J1vthuwbR1Lc4cakV6HwYrAieUcsrWb+Yj4qswxpAV5i013nqhdIrg22?=
 =?iso-8859-1?Q?WcczT+fHqNdgv82ree1sBY+FFI7fIKtdibzRS0PEgclWWvyPLJCLeNZdCG?=
 =?iso-8859-1?Q?GunD0ogD6tyfubX44qCaMSZZ3gJwXmhPPz0LdIhFlKxQlDtYBCx+JvwDWs?=
 =?iso-8859-1?Q?/HknkUl42koEfjwzK/eszIjsQikrnWb5GGlFkcZ1FUx5tQ3HxgTKEkgu5y?=
 =?iso-8859-1?Q?/8ROvcJt6getItkLTZE5HDBtpnXkPXXUVg02REO/debA4k/1Qob9Byx7j3?=
 =?iso-8859-1?Q?GbFWf4pyOYgxOHp9RkvKaJM9Y697jitRkEBmAWCT99g1Xgx/WdjRRGdYpV?=
 =?iso-8859-1?Q?L1PfhDABCQVwnMvwiZzgsaP49/V+AUcRkosWkAKWIENjm7LsI1ov00jzMR?=
 =?iso-8859-1?Q?U3AQXziWGq7VxhySQ/PnSg0bgm9WE76ctIsUq4fHBfkqpW0+qgEjpg0nUA?=
 =?iso-8859-1?Q?boqK49H5aNcW4iFGc9lpeq0P+1mNpts/OSF/9gSXkVSG35hlssYkJHmzmF?=
 =?iso-8859-1?Q?P01PMJTE0sNmnmtT9+ZwFI38lgTc5j5jBJAHVLTKV9xKEs236+G1M7Tfqe?=
 =?iso-8859-1?Q?hCU0vcUcJZz+Y8ANTOhpmjD4Pf6jItUhBHa38NBjvMdwD17gdGCM18jqZZ?=
 =?iso-8859-1?Q?mES5VFgsZ2KwtKfuoFsYvpzBAhbEACgAqV2JoVM9VVjmTgf+SjgFtaE61B?=
 =?iso-8859-1?Q?r+pIa8DMoZy2Wd2P4P9ZkUhtEs3xbifaKPchOJ0cETs0xGppB14mc3BOgL?=
 =?iso-8859-1?Q?AilUMS0f5yTYyxM+fjsJOFkVfWdMSLhfbn5yc95bp7Plzd4ITStl0Jxmh/?=
 =?iso-8859-1?Q?eP5dKSqy30pVmmukCh91kN7iOgm336CpSP211cXWQguO9J9tD59HXtRal3?=
 =?iso-8859-1?Q?eh2f/85mXw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c6a5be-f024-4d68-52cc-08de86935b00
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 15:14:18.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBEGx9t8RXG1SCUGBGJZAjrzOQ+7xQvR/rI4sxuuvv9HD+yk1jaoEK2B7z3AHIiDExcglRKw5U7jjvH/XDCiIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10630

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
index 64b213e1451e..58249b49e264 100644
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
 
@@ -579,6 +583,16 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
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
 
@@ -631,6 +645,9 @@ static int emc2305_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < EMC2305_PWM_MAX; i++)
+		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
+
 	pwm_childs = emc2305_probe_childs_from_dt(dev);
 
 	pdata = dev_get_platdata(&client->dev);
@@ -714,6 +731,23 @@ static int emc2305_probe(struct i2c_client *client)
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
@@ -726,6 +760,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1

