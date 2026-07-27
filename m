Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CCF42048A;
	Mon, 27 Jul 2026 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169191; cv=fail; b=ti6jioEnZH0MU9hPrlroFVlRemFmgOo95sAIA03td3Bw97EJ2xhe759LQOJCxVCzD9agaMmnKOiEjkLFx4fTk8rpzX+DcO3Me74gDtoAgHdp0MF5MfsaT3F+UxFbn8ffUYo+my6UttSJ0Fj8N0sCOqqgbfYHwh5e2nO+y4Fafwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169191; c=relaxed/simple;
	bh=FoD2CmegNn8NC2ezWESYUIe/OMg3XjOb2hgxGBtpbHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AIw9ekiLuGSwtPuFZBnOnwfavLONVsU8PSq4gccST0GKi7b8LRc+umpFlyRemi5WHzG3kukDYdjZYu5vLHkmdI3/oE6VOAhveNbFwvh3JMF1Y29vA77gZrLpVd29lJW+7MHrttTu325TdbCOLSefzvDY14FIk5dbXS2zaZADFZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gprQ0ez/; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gprQ0ez/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzf5NWpHdAwImebPdbUwb5l2xNG/Ks7YQ/VyVqNvcpt8HUBTXl7Vfa2QZO2FmKAORl3iRIiDiimXPEgXo4WWoQCB/8IHv8hMBIUS9QK5WRlkV2AVn0IWGmGT0S9w6YuZHpn71+dvXRNID1PLxo02Y3UcP5MuCSsjU6yq+SfAM73fJs8KNuJHRURLcfZrHcigKR4U2R69z9tDL0k5IV5QFZX8zM+pcFWiaeZK4mzhtoG13mb3hlNteP3j3J7Gi478UElXYsV/v3vEyn3K6PV8hDkS5LLVo/jk/ZJgBlDXK1MHJWLNxo7i4zvf4HjKvtL0Ef5sWNK9c9YFj1rAeZPl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z8hrKngAAWTivmddQUo14zPhH33D+vYUc0GJxZqsWw=;
 b=nqyascdRkhrSr4cVoUpth0jLBXZWKnjj85SdJGXZf4VBYnNriBvBSZXt0em6dXYPH1iq79S/SOvVkFuAHOQTexGg+BB2ZM6sU4LWij6Yz5Li72rDJTA8IRk2GrDVkTp6ERSGjOp19R/0ZvIjtA3bwOhi4+UKhaHLwtUuFI5WWARd/3bdmWxMC5/toH4GNLCHBjbDShvxQCNG5DMQ32wd9J98fYft0Fee7lkoNfzav4L6YaBB6nMQAXknXYgMil5nv1SStabFRfKZVQ6r4ZbAk8JArSoM4cA+dAVTkLsZhYJ3Rj3N2m8irk4J5EjUdIIVNVYFhPO8O5g4Cr0nm0tAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Z8hrKngAAWTivmddQUo14zPhH33D+vYUc0GJxZqsWw=;
 b=gprQ0ez/4OSZyukXplhIO+fhwHzNobMG+B082sNrQMMQP7/tegQ1plu6RBw9Ed9GHybeI4/7F8av75m7L+0n85hKPCO//RnAo6Vtg8DF1z+symI0UOXO3nOOrWEFr0Cdv7o4nciFpjbpi8qD4uGyINu6LT+jhxq+nP1wfCVkdurBlakgiaekHC4h+kVvioTRta1NFR+8+ig1tT2Q00dSZNkeuceprES5UT7/qQjuBr5xJ2Xux33hkrpRNfm2ZILW+22EmhYyta3VHpfRhe2B/mc+J2sEUjuFLv4Wz+2yYL1j6m8kg4RwzL74UTByYfshsIGvG4+BTf6zu/zTzXzcmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10194.eurprd04.prod.outlook.com (2603:10a6:150:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:19:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:19:44 +0000
Date: Mon, 27 Jul 2026 12:19:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: sashiko-bot@kernel.org, Frank.Li@kernel.org,
	alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v6 08/12] i3c: dw-i3c-master: Add ACPI core clock
 frequency quirk
Message-ID: <ameFGMYt7oEWbVIV@lizhi-Precision-Tower-5810>
References: <20260721042615.E38721F000E9@smtp.kernel.org>
 <20260727144112.177391-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727144112.177391-1-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH7PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:510:174::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10194:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6df572-8d9c-4b67-b5f0-08deebfade8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	wui95OKALIl4PiQVl0EKXzfgV0X+j13b2t1mGH0gNOPF8UY1j/9LDVadfqqAb8hQewYbc1lqQQChK41vgAT6nxPJryHUUMSviVIZYpK+PVLEsgXyWggsxxxgxk3iqO+5QanpT+enycGZbwNd+j3fZZp4AATGnQ3P8hHjUGYcF8IRHWQ7arw3eB/96HH0qZmRB3jbt04iA9dGIchTR3yEIxq3BYVGyWfCer6iEZ4IISlSG9jhIPFbYnqDyM14KNHwacjvqzn36d5AxbMN8/jbFMcHFYbp02gAvCZtheZWdbRqkPBLbmMOZfQj/P4PxvC10n6y3AZSen9+ffpxL5uTcr/qJSFbN7PbBa4ysdCmDA8VwPwoBadYZAWKV3eEC1sJBD1g9Jv2w8ExOW4jEoTDNY2qc1YrUUrxRpexS85nAVg49RrABMw6xr3/AE/TuQ6ltSj6sTqMyK0vIPg1OpQrfi1tDhtHN2iM8uyXH0IbKXrNKNEfm5Yi+n7Zt2prYYs/QlYeCz5FtwS5OFOcsJzlRYsTW683UZn/rpZvOFjWBHOc8BM5x7wFDusWRAXJ5i/osNMbw3Drs41eO4cSjtUCDbppTFL0zdnZRqnU06tafXKs050/A9ujxat+E/IcCDdkFWHFL5slw4JH6U9X/suGumIpzw2TOu/79Fzn2RM00ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6KvsrNxv7B9bcVrRm2hZ0GWgwbAT47hq5u2HM7lczqFjbDmy0Q6M7Gq6oj2s?=
 =?us-ascii?Q?dMkt6X435DjW/Ybh9caRG9p+5MAPxMfFC59ZzpUppAe9xcqVpll7g3JSdo+y?=
 =?us-ascii?Q?HlSE07HXScjLl6Q35ff1jF5Bg0HV1OYyaZgxmDZJkARrdVyTzI0DWIzkH5A7?=
 =?us-ascii?Q?VGPhKJNo7KhafFA5sDrNY3UrVp337qQa7AwvfC4DxQ5tHSHMdbq++M2q2835?=
 =?us-ascii?Q?6p8jIlapoknsAB9o1iIqLRWsz7IvRAZkTj2kI61JbzAtO3aFPURV3rsIkpkA?=
 =?us-ascii?Q?Up1wVOqJoVeSDVs4OCt/rKyjqjMJMUAnmEsykgU72ZRXS1ovh+yEOLM3VoNH?=
 =?us-ascii?Q?/tkYHw1YUCn/ktqdYg7DtrUX36z/ibscyWp3g9+AtcazEke3spDzIFeX4uu+?=
 =?us-ascii?Q?+W/OVh0vhwVwr+CXYHqgGfBa6+eGvmOhI9WqRslwtZZVY+MSWBqMoqc44B+7?=
 =?us-ascii?Q?sRP4DucIzy5Z3ESKLe8Qc1C+XDf5KmAKqpL4DvJKz6nw+a9auFowjXt20GsJ?=
 =?us-ascii?Q?c03FJJS18e9PY5TybYUCCNw9m7bPT7pOPmXPHMeEvIegWUAIh0uqGspG+/Wo?=
 =?us-ascii?Q?5F2SmhmTOno/drnvjYam3CC7MpSH32ev+XUnTW40p5A7NiigoyDaBDvd58mm?=
 =?us-ascii?Q?mIl/XFsTxIH1H9D95k2HagsqkFw4+GCj4c6H0A5mm1CIgT0FZqiUH5tzzPSR?=
 =?us-ascii?Q?Lw1MPuag/LrJW+namd27zrUJrmcoJPxXlE2ptKJThXBOZbWBWRi2pdr1Ymy8?=
 =?us-ascii?Q?Z9m6Yow7yFzQFmb+aIwNcC7oXYhJpKxT4Bc0CS83oAXdA/+M/eLprfieZSmU?=
 =?us-ascii?Q?7DG06u4rkWTElRSomMeMABtf9aDY7oD36QbTQmDTMv7CgmmiQsWqXlpwOQKg?=
 =?us-ascii?Q?eIW8tHuA74GQrfY+A7iF8jzIzxW8tHpyY524LAQ75LlD9HFjD+TXz50+FUyn?=
 =?us-ascii?Q?thco5OlynpRBH+WAuusq6JPI/ROaRzuXRrvBAFi8cY0vG+lGScKk+xRrawPR?=
 =?us-ascii?Q?i5gJw047uLI6Ha/dX1xCIjyXXaFEAz3Ky3hKmk39/sAjecu17tjEWbFpvQgc?=
 =?us-ascii?Q?82S7/8QvI7X3wFM6vymXFb0xXm5aph2dGRpCKKPEkZOXt5YTj+i/r5dbyCm1?=
 =?us-ascii?Q?grPXalfTqEnLwCewrgDiQL1lu9090UEBvHZxcgakFJLBUt9RswZQStPKu/X5?=
 =?us-ascii?Q?qKUdr785ob/eq2S0IagJq4beIfc1GeC80poy/D+gEKhyD8pZ8ADfxjdnkCaH?=
 =?us-ascii?Q?dWzB/mKXXhO0b4BFp4Ji5krqTbDRXQjpobeer1MxWjAksAVjjt4VFtyAh3kC?=
 =?us-ascii?Q?SoC2QzjloBRbBJ0XGCuArIysSNzZ+l35mJnQo18D/lMimQnDd4MZnFndaCz3?=
 =?us-ascii?Q?rrT/MNLvRfSKOzFsbISnc/81BVwBkobSdV6Xxuf2MFkNOJ3CeVI47mZcDKjA?=
 =?us-ascii?Q?aIzcq6DxKpGYcUY8duBu9EU5C5KFXauhrwS0EIHqihq9JI8Duyd4liB2UGgS?=
 =?us-ascii?Q?YHzUe+AFJwDI2QqWJiDK74yslZ7mHDoROg6zWxARxNwIfjYiBj6OgDSky8BG?=
 =?us-ascii?Q?mtqBvZP5cwy+Jc9ZsXCO1mbou6dOn2jSSegrzk9QU9e/DgvKdl5HdH/t+xk7?=
 =?us-ascii?Q?HkZFVxmDx9PwYliemZM2a+DEuAIifdyaOYrVfwm2+RAgXlbpI8nLJNOpDhqp?=
 =?us-ascii?Q?VBDyqkiGqCiuqK3TpS9cJgOEnlPqi1H0jyXRtr8c8Xc7EqmBkl5qPy0tyTXW?=
 =?us-ascii?Q?CO0TO0RFYLAGxsIn/SX1j+tjvvXMNC+iORvCcIn1SKISg1y3gDn5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6df572-8d9c-4b67-b5f0-08deebfade8a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:19:44.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wY3yFe/vTbp7xtu9wzKHbGOBABjhuQZ4diOV5TPDOOiFQU6TrluU0XE4OQFZYb38TNZceSQeo9NbLukkoy26YNSD5zYNm8ZtzW5z/8M8+kiEaMJ8NpBSuqv6I2DoUUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10194

On Mon, Jul 27, 2026 at 02:41:12PM +0000, Akhil R wrote:
> On Tue, 21 Jul 2026 04:26:15 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> > commit f3333de342eb1c266eb94909516ea27afe8378d5
> > Author: Akhil R <akhilrajeev@nvidia.com>
> >
> > i3c: dw-i3c-master: Add ACPI core clock frequency quirk
> >
> > Some ACPI-enumerated devices like Tegra410 do not expose the controller
> > core clock through the clk framework. Unlike device tree, ACPI on Arm does
> > not model clock providers. The hardware is expected to have its clocks
> > enabled by firmware before the OS takes over.
> >
> > > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > > index 29030fd9594aa..3ec3ab1c13b4c 100644
> > > --- a/drivers/i3c/master/dw-i3c-master.c
> > > +++ b/drivers/i3c/master/dw-i3c-master.c
> >
> > [ ... ]
> >
> > > @@ -556,13 +557,33 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
> > > +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
> > > +{
> > > +	unsigned int core_rate_prop;
> > > +
> > > +	if (master->core_clk)
> > > +		return clk_get_rate(master->core_clk);
> > > +
> > > +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
> > > +		dev_err(master->dev, "missing core clock\n");
> > > +		return 0;
> > > +	}
> >
> > [Severity: Low]
> > Is this check reachable?
> >
> > During initialization in dw_i3c_common_probe(), if the core clock is missing
> > and DW_I3C_ACPI_SKIP_CLK_RST is not set, probe immediately aborts with -EINVAL.
> >
> > By the time dw_i3c_master_get_core_rate() is executed, it seems guaranteed
> > that if core_clk is missing, the DW_I3C_ACPI_SKIP_CLK_RST quirk is already
> > set, making this fallback check dead code.
>
> The check is defensive and is harmless. I believe it adds to readability,
> but can be cleaned up if preferred.

Yes, needn't double check if probe already checked.


Frank

>
> > > +
> > > +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop)) {
> > > +		dev_err(master->dev, "missing clock-frequency property\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	return core_rate_prop;
> > > +}
> >
> > [ ... ]
> >
> > > @@ -1573,14 +1594,28 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> > > +	if (has_acpi_companion(&pdev->dev)) {
> > > +		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> > > +	} else if (pdev->dev.of_node) {
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but since this block was
> > relocated, I noticed a potential issue for devices using ACPI PRP0001.
> >
> > If the device is instantiated via ACPI using the PRP0001 HID,
> > device_get_match_data() correctly falls back to the OF match table and
> > returns a pointer to struct dw_i3c_drvdata.
> >
> > Does casting this pointer to an unsigned long and assigning it to
> > master->quirks cause random kernel pointers to be used as a quirk bitmask?
> > Depending on the kernel layout, this might cause erratic driver behavior such
> > as missing PM operations.
>
> > > +		drvdata = device_get_match_data(&pdev->dev);
> > > +		if (drvdata)
> > > +			quirks = drvdata->flags;
> > > +	}
> > > +	master->quirks = quirks;
> >
> > [ ... ]
> >
> > > @@ -1636,15 +1671,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> > > -	if (has_acpi_companion(&pdev->dev)) {
> > > -		quirks = (unsigned long)device_get_match_data(&pdev->dev);
> > > -	} else if (pdev->dev.of_node) {
> > > -		drvdata = device_get_match_data(&pdev->dev);
> > > -		if (drvdata)
> > > -			quirks = drvdata->flags;
> > > -	}
> > > -	master->quirks = quirks;
> > > -
> >
> > [Severity: High]
> > This is a pre-existing issue, but I noticed a potential problem in the device
> > removal path regarding runtime PM state.
> >
> > When the driver is unbound, dw_i3c_common_remove() calls
> > i3c_master_unregister(), which internally calls dw_i3c_master_bus_cleanup().
> > The dw_i3c_master_bus_cleanup() function accesses the DEVICE_CTRL MMIO
> > register. Because the driver does not wake the device via
> > pm_runtime_get_sync() before unregistration, the device may be in a
> > runtime-suspended state with its core clocks disabled.
> >
> > Could this cause a fatal bus fault on platforms like ARM due to unclocked MMIO
> > accesses? Additionally, if the device remains suspended, will the subsequent
> > devres cleanup attempt to disable the already-disabled clocks, causing a clock
> > enable counter underflow warning?
>
> These are existing issues in the driver. It would be better to address them
> separately.
>
> Best Regards,
> Akhil
