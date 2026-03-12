Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C83364EBF;
	Thu, 12 Mar 2026 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325147; cv=fail; b=k7u5GGRZfrjJAdxV772s5z77CkNytjWAtsGuVnmJ96PUsGgzXOY1FacpxfcmAr+JmvlMUDCSMyYHuaGNj1MZCMo9bMfE6rQF7pqB1b9bUjdCmt7nlkGOZDFKE9GTQ2UC7p5JkbEfqagDPrj16HkfUtTOCr2RB0d7aUE48bTiS2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325147; c=relaxed/simple;
	bh=uQNeaL0MdNr34I/hGXzvlEAcL5I13cWGMXH47AdxcwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tCoUvlhgq1LzGhb1mYLwumE0rSbGVKK9K8TD770GXqjvuJHJZspRigIW2K+wcwoUvjAX49QTHb+FROZ2xtMKGM+V4sGobXvj4QZhlyQzSXt5zGjNX6xj3mz10AFJ3LdPcpxjKuhUE+PFxLg+xEC1Qb1Lt4IvtsbPkERGkzsTTeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GbXArEtW; arc=fail smtp.client-ip=52.101.83.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GbXArEtW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnwNxs0oAFlgLxAi5taEUEA4v3w53x+lOhFj0uOKIs/gU5tc63WTyPu5zRdz90WCgxf2cKHp/N3dd2Y9KlMbEEuSRun2cT8N2AhFrfwjJIyghKVSajOcD65VyXhnVyQXJt2rpPWZMVrDP6eNVr8gJeJZielcwqmsIvQzoBjhBRoJPtYTAvDDXFsSF519/5iBYJOiSiHfrlLdmN2X2l6tWpb/n6hqoc/GLJAjqhWnJ6EWPbBp/LJRFwdfJ2xLM5J6b7dnFt13y6qI9fD77QDO9WzND2oDAx24zwpoKcHFbROZ1iuiXFOBBOquCugS/EnllVV7GztPVIAaJoYSq8U/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2taWn4h1H94XQey1x+fBgj7u5bHIstlp5Ab8vzpk+kg=;
 b=K00dDA+zQywhBgv3e6CD1ztteoTK4WXf5pi6RzGAvjNTTVb5R3p9zaTr6xZF+Rd4D7Xr5Ghzjn5Z1LDxLvJVaq16/uIHNl7Lq9IihtPOsbW7Wo3wFfQGY8+7BRuz09wGSYjBOWwKkIfnzwobEwHQNk4S2iZDS5cp2sI1ae1ASYM1mcPUEXI1Six0KKdkFsHlOSqE9nkoh1gybzCDuN4cZkGk2cqMFpFkBLaofXNN7lP60ZEN1ZcGO04mREoQLO1ubk4nqZ1npfjgC3NlWKe0kNGMBIq8cRyLx9YNp/QfeKAmPF13BrBTKcxp8E3WZAXPGC9BfL6Z60PjTE3tz6G2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2taWn4h1H94XQey1x+fBgj7u5bHIstlp5Ab8vzpk+kg=;
 b=GbXArEtWAzm6/xDJtv95w6kD/J5Xs0Lz5d8Ww8qDoDPPw8PT79ACh6vCLTaUS14j1oWtcGvsOKYG+OpQwhjCuvnHcLf1c3rR+ybQLmWNiGkLFUnKIH1PtH4R4UR0OAtfPkDN1Z5VEyzDk/NNIVbuQ1HsUrgj3ROYWstEpac5QidLh8RFLw/QMXC2tNeHufcTWNokaRGDPEZxwH+7Xz59nLfa1ldZRJbVzch1zuewXnbUYzpmJU8fhNR+w73S8qBBqYwet+26WZ3B9S6fDpyXwvx/rHA0/GPG8o9GJRvACaH25XWXRFT0UtGeXjR1/PD6jhvDSjyHx4WPzV6FXzkb5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by VE1PR04MB7453.eurprd04.prod.outlook.com (2603:10a6:800:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 14:18:56 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 14:18:55 +0000
Date: Thu, 12 Mar 2026 16:34:56 +0200
From: Florin Leotescu <florin.leotescu@oss.nxp.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [RFC PATCH v2 2/2] hwmon: emc2305: Support configurable fan PWM
 at shutdown
Message-ID: <abLPEDnqoSWZwFcX@ro-kernel-workstation>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-3-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312122248.1281572-3-florin.leotescu@oss.nxp.com>
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|VE1PR04MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 5063f77f-2bb8-415f-5a29-08de80424aef
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PNRJFwRV92zgenHz635ZSXMj/ZbltmJihC9hvTRphdQpp9310e66wp7PCtZ30RPvm0JTQB1Ba76B91OcxiPx07z/62V6NwFJNVT5jd5m/d5Nd17gbCG2GDyAb3jVrM+8KRsYaByugl2DpchU7ggqvy/6qFvFM3Cf10MXyrFVod4KOQxzNZ611nCaORd5+YnPbgJRNLuYgFgaWrDis/C8z8poBBDk5PNc400OhNe7C7Q1fZJiDlIm3IBDqHBI3lgXaROfylKFMKaXvmGrOzSDC7VkgJSH+92C+b6CvfXL3xMNA0+rRXD+l1wyrvmJjYYk5hqc9C0WpMvVFEgrYPbgDCstLbA6quD7deYOZJIGtVYS4t7/os80pQhrh4OXWMmVd8cxyubGGeylb9RI6shr4oUoXCSs3Wng5sDZI5KBLAuJd7ccLPm63E7yZ0OKgl4Pt9b+Ec0CHrJW9wBxR/RnkTOmqGD5648Kbpt1/aE74emJ54i4TOyhyOxyzeDSdA2PpgO9oQELAcO8qEQNhthUmbyGNLjodSbN+RPWaYoYs7N+u6SE9qPR5dWq9jXbB+ZLmF0uVxeWtprkGJbzm1ISvLWoPr4KWuAUeLWPw3AJjfnzwrgPt0IQVJeEqdBcs9meZkkVnMA/yJOvwOyJRap/rqBzj0vdb9hxI5g4WVH7JpKECw+0SEPV5/1Ls7z8GB5t8JkOjU+mz+YPVCa67bSvxj7Tja4esXZKLm21r+uRGp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1XJAUgpu63CfO+BgxBVDk5JYwVmfWvXtO+zsm+qQwE1WPeDcgw+ptoZ6LeCF?=
 =?us-ascii?Q?9NgUGqNv7d5yk/8pX6k1JpDlxltGkar6SGRpdf/UTBL7Vl/oChqsX3l+wYpv?=
 =?us-ascii?Q?uX7hASjRN6isRPOw5EWQNB97IXw3ZObeOjLm2JMFuuHNj6WxfMxYyATg4um1?=
 =?us-ascii?Q?bZ/rubV2s2SLUeZtPPYMppkPZmoLY3GuuIWCdnLv2eTtTouFbLcrkX7uHkqS?=
 =?us-ascii?Q?/Pl8tgUYS96EJ3Ti93sub3hkDRCqxZ4DxtNG+1VGTgXrG4niHLMLp2WWRpWK?=
 =?us-ascii?Q?S2DMBz57FLoPRS/H6nymv5ot26xKjDW6YLTpP8TuEeHO5trEfvsR/CoqNDXk?=
 =?us-ascii?Q?us2fI3GSgNr5pLT8fQV9EO6hdFaRsVzJ6PYVTsOPPrjCAjDYHxFsVw1nYays?=
 =?us-ascii?Q?RDi8fmTyUuEcwQZ5VKjnmj8rPM05QcKZs8BDYlH2sG9hm9hDstQfLcQT/RKR?=
 =?us-ascii?Q?9KAcPUWPlU/YkMRHEJIE+HXfUGZRdY2IBwwUSMvQIImBye1dPL9reLNoiAFp?=
 =?us-ascii?Q?vKdvqkSCYMGyJq507dWwmUR5dQTRaMjJzTDK3uI2DqYAv9GvSnDogob91Brt?=
 =?us-ascii?Q?rfsU4FOJxSg4/RfPY6VAksNYXGKz9fCB+wLvLnJIDxNBSeI+ucyMM0Q5KQVO?=
 =?us-ascii?Q?85MdgHOP3I6zCQvSD1zVFJhp7JTZ8tHv1r8nBfWwy9rYM4eRnIlGR1aD5hk/?=
 =?us-ascii?Q?Vl/2sIAbrhTbZdb/0l3wbgUgY6J+MTTjIvpO6palOp1XDz8qJkQ3McbnY73r?=
 =?us-ascii?Q?CrrEnWYeughSfPngBXn/u9890wlrX9l7KEeSEZeetXqwHUqEEAYtbG+VQXZp?=
 =?us-ascii?Q?c2Uf+qDXcpvaw/+sMTzhgNY6XdkKtFgPgI2ZiP9CYqUBz2sdY2r5h3lX8LwL?=
 =?us-ascii?Q?vX7sZPWWn917cipXnSC1FSoVgVKIFnZQl163e7LGrI1Xbg+xnBSwEpYzwz1Y?=
 =?us-ascii?Q?F5u9cTi/VbG4rDKYX2rgQTyf7PGXKOHPWY/8vO8P2p15PZwCttdRJ+Y0O8qe?=
 =?us-ascii?Q?vwHjFrpS2drt34St748TUSj21d+ssX0QnUjeIXyCRBmMpguLhwpu3OTbAoIt?=
 =?us-ascii?Q?S5vKub5pzijohUHHWkhCCCMwlKHLCc3S3yh7e33U3TpLZcVI8PtIdB/njeWG?=
 =?us-ascii?Q?L4km3NeqBDcZkYTX7Py1jgLHeKGKuL8W+OfVXoqsBNZVOjMVV4UbC6OonOAG?=
 =?us-ascii?Q?MYYHXiAN98FmuNKQTPxX1Sn/EE57r0ZxAFqFeQ4NlNdh24UZkVnC9YnpeCcl?=
 =?us-ascii?Q?63HUqXXP6z82urtMNwMPOLoa/+APcjHlmF0UoNL97JJpjBofFftle0uZ1TNM?=
 =?us-ascii?Q?KFpEi4kvhZAv7zpN7PxT5NhX6BCd+YxWJX8DqCcvj772e5GmdV2F2xrgMHE8?=
 =?us-ascii?Q?Er1+ac6xalnXDdJVsezM3u0j2UH/sq4ZPPx8puVDpkPLkmJJOclrxjKAV+T1?=
 =?us-ascii?Q?1I31OyaakIxelFwbeXj+gbliBh87nl58md0TxFEnfQ9D0xvdmK5/P0joGXPQ?=
 =?us-ascii?Q?Kj8Oyg7v8dxkxzhsIJ2EsDjJSrOjHN5tEAofgAKhT03EUH1wNsw9M3itA9S6?=
 =?us-ascii?Q?j/DWKf1TQCyyM6r2kngYXY3TqxUMy2xyegNMg6lG/rOtI2DaBnDGcZIAOoRV?=
 =?us-ascii?Q?hR7yapwBFi20novAf2D0hMKPwD5ycd7RH3eVosUWnG0shjJ86z91TBSoT3HC?=
 =?us-ascii?Q?DcUIEuJd6dn9GbpDH0UMp/3n1RrZ24TQcVbAE5chfG9V0oBIBdUAindz6cBp?=
 =?us-ascii?Q?wzg1g0DvWw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5063f77f-2bb8-415f-5a29-08de80424aef
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:18:55.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPIpB4dkhO7eNNsp/e7pIAf/f9eAzHrnm0oRrFV5Gf+2BKLETXGs3/wQ2anobbJF14owp5WMpM5vOkrnwLiAtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7453

Hi, 

The previous version was based on an outdated local branch and
included the of_node_put(child) fix, which is already upstream.
I'll resend a cleaned-up v3 rebased on current upstream.

On Thu, Mar 12, 2026 at 02:22:48PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  drivers/hwmon/emc2305.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 60809289f816..1fb5eac75f4a 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -32,6 +32,7 @@
>  #define EMC2305_REG_DRIVE_PWM_OUT	0x2b
>  #define EMC2305_OPEN_DRAIN		0x0
>  #define EMC2305_PUSH_PULL		0x1
> +#define EMC2305_PWM_SHUTDOWN_UNSET      -1
>  
>  #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
>  	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
> @@ -104,6 +105,7 @@ struct emc2305_cdev_data {
>   * @pwm_output_mask: PWM output mask
>   * @pwm_polarity_mask: PWM polarity mask
>   * @pwm_separate: separate PWM settings for every channel
> + * @pwm_shutdown: Set shutdown PWM.
>   * @pwm_min: array of minimum PWM per channel
>   * @pwm_freq: array of PWM frequency per channel
>   * @cdev_data: array of cooling devices data
> @@ -116,6 +118,7 @@ struct emc2305_data {
>  	u8 pwm_output_mask;
>  	u8 pwm_polarity_mask;
>  	bool pwm_separate;
> +	s16 pwm_shutdown[EMC2305_PWM_MAX];
>  	u8 pwm_min[EMC2305_PWM_MAX];
>  	u16 pwm_freq[EMC2305_PWM_MAX];
>  	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
> @@ -539,6 +542,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>  				      struct device_node *child,
>  				      struct emc2305_data *data)
>  {	u32 ch;
> +	u32 pwm_shutdown_percent;
>  	int ret;
>  	struct of_phandle_args args;
>  
> @@ -578,6 +582,19 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>  		data->pwm_output_mask |= EMC2305_OPEN_DRAIN << ch;
>  	}
>  
> +	of_node_put(args.np);
> +
> +	ret = of_property_read_u32(child, "fan-shutdown-percent",
> +				   &pwm_shutdown_percent);
> +
> +	data->pwm_shutdown[ch] = EMC2305_PWM_SHUTDOWN_UNSET;
> +
> +	if (!ret) {
> +		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
> +		data->pwm_shutdown[ch] =
> +			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -716,6 +733,23 @@ static int emc2305_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> +static void emc2305_shutdown(struct i2c_client *client)
> +{
> +	int i;
> +	int ret;
> +	struct emc2305_data *data = i2c_get_clientdata(client);
> +
> +	for (i = 0; i < data->pwm_num; i++) {
> +		if (data->pwm_shutdown[i] != EMC2305_PWM_SHUTDOWN_UNSET) {
> +			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
> +							data->pwm_shutdown[i]);
> +			if (ret < 0)
> +				dev_warn(&client->dev,
> +					 "Failed to set shutdown PWM for ch %d\n", i);
> +		}
> +	}
> +}
> +
>  static const struct of_device_id of_emc2305_match_table[] = {
>  	{ .compatible = "microchip,emc2305", },
>  	{},
> @@ -728,6 +762,7 @@ static struct i2c_driver emc2305_driver = {
>  		.of_match_table = of_emc2305_match_table,
>  	},
>  	.probe = emc2305_probe,
> +	.shutdown = emc2305_shutdown,
>  	.id_table = emc2305_ids,
>  };
>  
> -- 
> 2.34.1
> 
