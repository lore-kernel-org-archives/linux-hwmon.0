Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE773921E3;
	Wed, 29 Apr 2026 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445124; cv=fail; b=PKyZ3r2c8O5NCJYl+xJKXu4/jhDLiulHKBlMV4dr9N8rD9H1hIwfjk3X+5+skEGmgk/BJZGAar80DAhYZULncLuAXVOodVTTrNntNkN6ij61rjitJAVCtjHz4P9CCFxaxoTYU1kXqzfHTBhDqSi5PUVce+fxCDTnvBMb+ozc3T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445124; c=relaxed/simple;
	bh=TgXDH2O5sRpHnEO22nWxwD4eT0/clAcootr4caIabNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oUNQlCMXFgkwE4MJUksYzrxRLpfniTujin67ZYYF+m1pZP1nvrhhToL1WA9B2nzAv+cpG3FJ+ofF8gkZ1B3mRh+w5YZ4KtNcSseSkuT0P+lt1PEAEIEdX2LaMY1ejIh5gQSo32O75shrrqJPhvK2aEdrvUY8VBz/G4/m9ZligEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ricYTNhF; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ricYTNhF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guTjuYvNnIO4iGq+B7yOU58x05X+LJxbOcDK4yrN1o/MCh885nd2PVLSeqCAilqXelTWVOCdzqKVBy2UGRtCEvS+fU7nXYM0rTWo023wgigvFzhOTQMXT1RwqcUEOg0MTpnddfV7BNBiN4mLI0erAtFT6juuQXGACyL6n+nPOXb9zeEsKXN1+WaGG1SU41EPjy166GRjMZxJKAwFGuvR0Kb78+YHk9huAtLYM5UuFxdz5YH3BlrFEOA545p5RljrV2Pf2HgGLcLvUir5jCWPeA7B9RPHg7nlWxPPxMAgNpq3PB5akigLShkBlBPOs0Izl080pn8QFjmIn4pRPFgAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXfN6Ld3/BqKDYQJPrG014ts+/SrA4APKLDba95wrvc=;
 b=oe5FyTZ5nCve8k4Q+fYgey+3Ii9y1cNBkUU2xqoPGniu4YmyR8ZDKX9+W10ycwOWp8v4noEaPKASc+14rtkoKLYFlZzfXei0ssw1VK1hcFBcSDGt6u3e9WwoQabBqS0iPsQlff6GJ2YcqfUogeNOaKhnlxnqqSpNF3xtgGza243AWHL0SmhHNxfKjtv/a9U3r0BafyQUe4ouzKkSctgbuyK2DE+VndbMHciwnDGhyxq2T4rk+uN0Fqro71ren1IX5vDSnAJ0EEml3HtT5kdDj/7maCrvXgPdtuLvJIQ77+Sx6WkDADPzqqx3ZY930WVIqqVZe/GQlDB1rQeoGM50+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXfN6Ld3/BqKDYQJPrG014ts+/SrA4APKLDba95wrvc=;
 b=ricYTNhFaOvK4xYCwt4XvTA5UJ/9u4qzGhR6o8mFpfO2frENAZpxr11tKBtN9d+QTYwihjQY+9WfZzeylXuZ7SL0tlZpbWqzfRVRF4LLuNzBVIYueKj4RAbzMmcdrDVYH1EsnNTLrSHLRZuTjUEJPN29ijoUDiWFAQoawo6+/k3LzYl6G0VnMc20P/Uc52DeBS6aFvmNqMec7MvxAmDhtZqsaIfrAdsBTqSo/9jTGRAkQ70q+FPmiTKWMq5/TY7lnQFQeqKDSPcu6GqjG7O+BkxF0d8Z2AHVbva5wGEI3zzeq1y9nhFhCJRkKc9ZJ6lPzyNgBWnDVDSYCaNtdAPKxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 06:45:18 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 06:45:18 +0000
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
Subject: [PATCH v7 3/3] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Wed, 29 Apr 2026 09:59:55 +0300
Message-Id: <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To DU7PR04MB11163.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1dc34a27-974c-442a-a4f8-08dea5bae089
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FC7oxNKbc0mryErbB9cTDrGx2qq7VlsWpDRdTZX5s4p85PVBe3YmlSSw4LHM209U55ksecVi+VNIqjcBiP6isV3U2pASLKT5IrR1k4roKvXZHR5JAJezd9RAjJhwKHDc31Wngr9uO9tosvpMo78APh5BDmSOmFHi4PLmxgNwLcFvYrHdbt9uvP6y5R5vjoHSR4DBufC8711LNi1OhCfeY73zJSCJJx+gbipGToq9kbXjWWGsEt77S/L852EZadj5kOQnl7/v7YmHzf53+NxtvQeFa72gHtxvtLLkwiEfISH3vnS7bBEB7QAGx6x/bybE4NZE3Q0gP/tl0ZgjDI/5DHUmU8eFoe/dxQKNdIUOIdhEIww2N9r5YVq/VHnJKb1XPQ5UT1Smn78I+5bHTZkuD6difqP3HwDO61731PoOqZ+vLel6W+FCFw3uEyZHPH+NbfJHlnEGUZ1sFoaq7OfdzDSYsU1DC5oIitg/pnyHFgn/eIL7hXEf+vPS74mj5okKzNPCjaTUhdnTw2fQgDCuGTfekaqbYePVQ55JYKWDPe+LKZnHtAlhnZSHY6cN/2WVeGT96uPOFOEZz3JNrH6g747Kj/EsKr5A74yde28hRBjRHEQVVeRbfrbHrbgUaUEXKLluks/fuFQdMFQqglQdrOhoVwiNS2uwZJlWjLD3At9GnEWaHhhQpmZ/KJLf0uzXsS8RdujljK3aWz46guO6aIbvBb4h7ow5dVDejNIdcv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zFn6hrQ1HBT10A3mX1IaGLpg6pM408uDd9d6fJy2b6dG41hJecbXRbTZ5O?=
 =?iso-8859-1?Q?3wiy8ptzDNKDhwS3RkFxvSyXInqRLCot0wbnC1KoJF/aYv1OgPN9ilYUsR?=
 =?iso-8859-1?Q?OBlL+nhNFp7z3Kgj98+oR3Ac0jrZgi926QvzgzDUkrAk4jyhH4gXdeUNjC?=
 =?iso-8859-1?Q?wA3vRAu0LdT1kTE2XOH8gISQTOIRB4VF3NjXZ4RONSJHKcChkL/fvSjhTh?=
 =?iso-8859-1?Q?oLoZK30uO2ququPjgVsBlQfpFds7sPjBLgagUbja7mCOb1LjwsMxX5l1U5?=
 =?iso-8859-1?Q?QKk+oHnB9CKF5rAt+SxW/+KA+FzodUK0Qsbj/stKUfxbBmrvLCi+bfulg8?=
 =?iso-8859-1?Q?HtE3PcxidF/poTsZ5gEr5sQBGL1iTZWuS5MKpFprE9yUKOpqW23DJR/7f0?=
 =?iso-8859-1?Q?8tq+0yP6iNbVi+peVUzyLkZyDNpasQ250yQVHtCUHJU10GtsiCwL7lZf8u?=
 =?iso-8859-1?Q?tVeVdyVg0lXoLMsl2NgN0gd0AG4B4zQ9gfNxra0X91afEhp0LL9N6WG8O2?=
 =?iso-8859-1?Q?wxQW9FK9ehAdrQunhUpicikvCRHx5GKFSUOtGeJlL9WjIKEc7UH3cTcmVj?=
 =?iso-8859-1?Q?zshFY7t8fiRGoyu/jLfHINNjn5Nnpv8RJVc+A0ljabxg9r+BmLXVtT57GK?=
 =?iso-8859-1?Q?lwY+tlFMSm/y8DR604PlFFPxaomIF8KigPBIUlFDy50Y5fiLjLmljHjru5?=
 =?iso-8859-1?Q?22jl0gCjawpBFMIyPCyGAtuSntBgP/h9ZB9Qh8XbODc/1rEsaZPhtYugwy?=
 =?iso-8859-1?Q?MBp9H6JdvjNEKg96DJE60SELsfFL+cxGAnyF4Nccnrp3qgjkLjIIFh9WeT?=
 =?iso-8859-1?Q?pgJlrPvQPOqtV7aJuA7H1fOY/XGnSghJvcsnc4DlrFfT4XH1XeUrqtlfoW?=
 =?iso-8859-1?Q?9jT6LKLTv8eE2+eBAQBozf3ZMsCxfdwUgVBDs2C3MaIGYNlL81+6dJ3mDe?=
 =?iso-8859-1?Q?TXAfPSe6jmeFiQYQA27P+9rClzIwfbfG2qw3JuGC05HCQAI6rHnVAEX/gh?=
 =?iso-8859-1?Q?5ud0P7dOQmPo6Myb6xmBaHZVtsn/pl6pcXp+ttGDfTGLCeUsSo8WL+5Ua3?=
 =?iso-8859-1?Q?goSg5VgXVlwS41sPuxQ+xE0O7q9VzvC712il7rCLSjo4l5Ja+0lKeLpnnI?=
 =?iso-8859-1?Q?o0T3u1f7m4k2WyPeNDVcQve51sRha0iPWAnolu3VJ1yKEnYr2YNLaTd9zP?=
 =?iso-8859-1?Q?3dWcRgzTTZ6sUsHHb1t8QF+pZbn+78c1rFhAt2UvwA50TguiSOmkPESaMz?=
 =?iso-8859-1?Q?/fmv+aNfHslZNUk0ku9T+uYTt/m8gxlJ8lDXSl9NT8mmeq5G4RpQtA2Mzt?=
 =?iso-8859-1?Q?Xvb8WIQoq8GFHoCG3sETx4raB5HmNiqs7zfZprUFoX1Wp1QtRWPPUtOasz?=
 =?iso-8859-1?Q?ywEk95+DCWPJ4D7RvhZXoAbvy45GHwCmHfbTNQkVgs8WIVj7TPkwwrQlWE?=
 =?iso-8859-1?Q?6QOuARdC0uMRe/x7MXq2II0xPyKY4+bdXwwEov/EPNdP6xag9Pin/aDJLQ?=
 =?iso-8859-1?Q?e4OvQiWAmPNy7uwSEMAlFhZuKCm3Ar+wx7/GmvEQRpNqWLzDGhMKPqgDMz?=
 =?iso-8859-1?Q?JEmCVeGMmbFTzrdWs8e8cn3zYlo+diiTiyMreqGXhMqqSs3xTsPrCnh1Wc?=
 =?iso-8859-1?Q?ySntRhYnViyFL8S9b4li/i3eJPa5sHpj2VJlLWLVHKpJR9BMK+zKuEqtO/?=
 =?iso-8859-1?Q?I0spFRIKFh094vEr1q38f2H1Orqj5kfJeQpSn8ZHShR/0/v/K3sj6yRof/?=
 =?iso-8859-1?Q?CfrZCC4U1M04wP/MsDKCeBkZ/OL2wPgg/3osVE72H196zmQ+6d1kvbhrbn?=
 =?iso-8859-1?Q?1bclTxAvnA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc34a27-974c-442a-a4f8-08dea5bae089
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:45:18.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oa1EsPjE7GI+g06w+9zWF1QPaeh0YYzMUuyAKV0uDPoXF0PkMvk36vyq9tT/wWatftSR4NPhmNH284z9sglFKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8652

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
index f71a0e265924..c5a0b2146478 100644
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
 
@@ -638,6 +652,9 @@ static int emc2305_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < EMC2305_PWM_MAX; i++)
+		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
+
 	pwm_childs = emc2305_probe_childs_from_dt(dev);
 
 	pdata = dev_get_platdata(&client->dev);
@@ -727,6 +744,23 @@ static int emc2305_probe(struct i2c_client *client)
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
@@ -739,6 +773,7 @@ static struct i2c_driver emc2305_driver = {
 		.of_match_table = of_emc2305_match_table,
 	},
 	.probe = emc2305_probe,
+	.shutdown = emc2305_shutdown,
 	.id_table = emc2305_ids,
 };
 
-- 
2.34.1

