Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C33BB9FD;
	Mon, 27 Jul 2026 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168891; cv=fail; b=scSl6HztpiNMz4ay35Zh8x7V4mBeHHZz+LdIdIeu6DeLZhJK2taqksqd+Kakp8MN+RhrkoI+XwlMWku/aUqoA8V8iioyjV8pTwgSk6FmPJN9qW05c5S0Rv+wDF4/EW/t2rqxoDCY+GAf5aQ16wupvE5vfizV3FfYcnBbtbvxNSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168891; c=relaxed/simple;
	bh=aq57D1fVXLy9sJbVUA/jkV664Db5nkOhaI6aiAn1Kv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F/mMGESzSaZTj55orh+knzV0XzIi466evyHnSeQbrlUOutl35zCwm+4Uw3T0JlRMj0zO4PqkJWhXHI50qznHUuC+5h7VksdEKZn0gchyH6FyOZXqJZXrEHwPU+IlA+/qydCvSmfjwRVmY69I3hyBajuMvtP68I1KiutJLn87eqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UI0bZlfj; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UI0bZlfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZ/Ce7ukSosnWCjWkaYHz4BHtSVXkwyiQSA4TEBJoX27W9gTwQ4lAaZXQsAcQ266MthqR0HV+gAldbexe8dbmw5KkGePhbqTVJjOCqjPCayRL7b/xXsTaZ1empERpwMP2q3qjJankXdTzLgD+R9Jb/hJw5d5HZI+EZ0RSu3j1w0NMQpOcegRMFzmaZAuhVmPseF0L2Y/hBacNZGRnD3wUalSgbAJtIxHCDcUQ7hduhID6z+zqBgQw/vOfkBRGjAntd91lEwMTkYYVctsBOnfCFpFXsWCtjm6ZfMR7sW82MqxOdygIGUhp6B7ammJSSWtS7iEFi0Tx20MLCGDYiMZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHB44t2EHpB4N00KDP7z9JpWiEunoxGFcneJKCbwCjU=;
 b=nAl9JxIJAjHB/nFZI8CRhen2tFwQFxfu/6pJU5hs+VFCRu72T+BJtLWY9rW5PI0eWYzfrct9FO2GpneG+J1a3SGtV5iY36ZWPOSy6kvAPNyctxU5cvrco+NqzCgxV1oF7JSd8+B3H5N8SXu6UM3d5S8URewLbbMSkjSiFUYxcMT+9XCW2BBzE4xIhSw7KrlkwNEnMAodBWmG+Z26JK1W5zk22YD+BlYRASlgfo9DoCalFYZpfP/r8x2Ru6Bo9TMfcVe0G3AjEcK0Sq9ObzOXD0XF1hxyy+9V2UAmuRzBuFR1a8FM+QOsEjRhferZ2oBO1KWzH/OOgNDs/Oz37cesHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHB44t2EHpB4N00KDP7z9JpWiEunoxGFcneJKCbwCjU=;
 b=UI0bZlfjbowho4mzwdjQgCFOMxOkJq32R/at+cNrewjHjglIf3cmk4sl7cQi4F6RT0wi5RwhhFhM/jArTjm+6UizPQMLbouHP8TsWfFH2f0cLsa7BGipVL5PRn/syVxpEFd8+xNhV9UsSvfv3DGkP0BXZal7ejFQ7hghZVpPqvLIy1Idbp1IRnSM+eMQEe0oeAYCz7fM9kYf+PBT6gFTj/yUkuN2eJ6mdL/cWV6DqzdZPUuSJ1Pu21drhRsQ1ZHRevQn8CYlix0WdqHhXZ40ku1TTwz2U0YT3wkLehahjBrvoy5gfkGP5qQFG34kG1cZqDxkSk14A2Xv9gOvYeRL4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10194.eurprd04.prod.outlook.com (2603:10a6:150:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:14:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:14:37 +0000
Date: Mon, 27 Jul 2026 12:14:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: sashiko-bot@kernel.org, Frank.Li@kernel.org,
	alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v6 05/12] i3c: master: Add support for devices without PID
Message-ID: <ameD5ouU8411EhHd@lizhi-Precision-Tower-5810>
References: <20260721042604.87E791F00A3A@smtp.kernel.org>
 <20260727141200.171715-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727141200.171715-1-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SN7PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:806:122::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10194:EE_
X-MS-Office365-Filtering-Correlation-Id: 3789aa1f-e7d6-4f3f-4a87-08deebfa27df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2aR5L/WTjiPyEQDwyjbg8V8Wad/0/Gzan3WcsKv2V9y4t/YU+HZgTaumsdXEpb/oi9HmKUuME/s6/qAICzXdkILE0UI9JVPEPcFNSiDUrrTYt9XTTP8MBminKHL14aI442KcqZaTs8aJ293Kne8aOnGjSkoQC7bvet9CCVATubWHVsS/TUW5nU2s7TqfbQw0ecA/F8LhS5i0IVADgBKGAsMw617ooL7InuOviki52WksbmFxfse0Dp5sK4AQzuqfHo+KQtVJ3pfpa6bA/IRpSBPYxaWbn4hnsNTo+f2RVndg/IuiuoBU/vEwyvGyPNPXRI12SRfTGfFPZtfI0X4DqFkAFViPsO4xT7sENBJMJy3e5kPZwsdEVpGxSclncCwUgP4Rrv+qoECHKwekkUjKh6GkqI2yVBLF1ukSx7dL2nF50WWa0FYkngbB027X3tIqkeAQzZgoJInaQrBjxmTFwdTHZ4/r4xFhove3giHndu/jhZRPKgoMdF5TmtDRi0oPhif0ZuqBY2pBNH+sTuZYjbZxylUqOBPHhbEOEYgaXX1prBIlDJXthKb+kFlkhNPr39+SQgHWv1uqkOQwXMzoblQHxF5OzDaSfIA0H1Kfen/j/mbI3qONfPJVfMRrK8hVblaymzRvIb2WRh/V2Fnzd1WoR7mPAGh+4214ggYVK4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aQtoWN5XPVeGWZ+jO1MVVR4MtmXkrcAfmycRb8bsvBndCUzoaU/xvaF6RY7S?=
 =?us-ascii?Q?8BCnNZ00mArbg5R+TuSRbhSyFq2LhAJqYCmnlJMmr4pD9cLmCq7fi+un4UEv?=
 =?us-ascii?Q?1BEp/eebChmA4B9MSyNQ9Z2ZFDakNw62ZCo/rLdmJJbqI/B31DMxs3oongBu?=
 =?us-ascii?Q?1EPkyJK2LB6ucC63AwLqNlRyILC8ZkVbbgZpEce90iIBojYiJ0fDSRLlKzhE?=
 =?us-ascii?Q?Uk5xoBWAvjVzgO+2cWGb0//BrMpi5dcRINx+4aiAESdmuysVBXzwnYGFQacF?=
 =?us-ascii?Q?4SYKIVO6aQ7JrXzfXr5tquxMfnDjlFUQdYKKtQcoYLbwCXhMBEvmwsZGtzHH?=
 =?us-ascii?Q?FsZeAiJ4LKR+XgYFFwPQN1ntoUpDFnGD6tcX9+xKbwhCMGlln6+HXhmffT4u?=
 =?us-ascii?Q?w8SMsUmLZ9j+XDfkKtkp1iLrCiCmN1U85Yq7JOvbyL6MYbbFizcTSDIW+ztx?=
 =?us-ascii?Q?QADwfx0LylwdgQZMdGTJuLcpaywffe6odZbBxiCw/QZvU+aeExyRPZZwBcoZ?=
 =?us-ascii?Q?hF9L5reVcrzhw8zCDvAnX+K+fH1CWyynJ/Z6pL39ueBmp1pXYUNBX8aYPiYc?=
 =?us-ascii?Q?MV330pNuv7rTuCCmVxlVOmUP1qJF+hLj1DgHhIQg7j/3cYnJ5afGlKzMzhY2?=
 =?us-ascii?Q?8eJNUDucRbdT4tWtFmqR2QJU0yCmk1PyN+Podhu5sqULXRsvoQf+WGvf3HGl?=
 =?us-ascii?Q?FuOF+gOmRtisrki/D2Yvw0eXbZeuRF2q0HGsf83GnmQKjs+osCRczOzpksl2?=
 =?us-ascii?Q?SHUO3PKYNZVHgz3B8jsK6vmY31bRswybMaDqExZeFzIXTfpz8GLCz1bcgpBD?=
 =?us-ascii?Q?MyotajmOL+Y34HMD6eoh/pJ+NbjhhMcSf+6nqp1bFk3PG+w4x0Z2fW+VESb6?=
 =?us-ascii?Q?U1to61rBrkhX7dYdIKEPApM96BbG1zfe59qBnhpLXbUQnfSI1qyLs8vJJoQA?=
 =?us-ascii?Q?s/XGpPDB3ZtNqgNMS8oqJW+djfx/sB0tslZGUOg5cJJVtgNvBaKpnSCECsw5?=
 =?us-ascii?Q?yEjXgqM6WUrKoegjlPm64Y8Ye+esYXu0cjIUVZZMi3WjQU3rlfeeAraNN74g?=
 =?us-ascii?Q?L4D6XG7wBYEkUK1WxhJdIYwGJJ7n/dswqpoa2bvcYSY/IkEWKQKm2AkV3dYU?=
 =?us-ascii?Q?FY/dNWmKPvK3OWMvvSgENSQXuOILLb9OIUmKupZaGJbesqbF3slYKfkaCrtP?=
 =?us-ascii?Q?wubdbPYSz6rA/YJGJktCebpwtUcK0p/AiTYiMqH4yQ5lYTMd3OBXohtIOxt3?=
 =?us-ascii?Q?ertQRsWEuvmMbr0vRB75gAW3lP2TL/2XodMGQDyE+BGC3xM8G6N1jQaVy9oe?=
 =?us-ascii?Q?iUxEH+uojCSA+ZsW44nAcNIMtBnaAdwaTTPUIExT/ybaNp2s2HfZJciyLhu7?=
 =?us-ascii?Q?jDgt5pSnmZGCikCoCRtZn5JN3LEfQTFcT0Qk/U1AWtSbbWF8POfKY4mRYatc?=
 =?us-ascii?Q?90zkCUUFqY0YXyT9oJYe0MMqZFP4w+a8VnoBp58xZ4zqbYIwYLUxIIPqgCQW?=
 =?us-ascii?Q?J6VIXmsTMrnIIWLJSAvq3Gja7juh5E8Vnsk+f0hcwoIQO/uH1g1qYnBixX09?=
 =?us-ascii?Q?PXTNLW6+GtZ5BLNFEPeM7PJ9R95X3oZKepyYPQsScE7EW7f/yvO5GOwHhhUf?=
 =?us-ascii?Q?sRk3/mGYGrH1o80BEz/s3Sh9CheYM6It4/L907lyN6Lq0CGOemqxh5LVzfRm?=
 =?us-ascii?Q?FUPoc3+DZB3l0v377Tp5BtEzV7s6J9XzePY/OF/Kl3e+ux6A4eghYpa8lzaA?=
 =?us-ascii?Q?d8DAV1ndIo6lHoc6SpPkRd6X2mE4W8n6EONlW6j5iu119rXQGlVk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3789aa1f-e7d6-4f3f-4a87-08deebfa27df
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:14:37.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMEHvYhQ1rNH4tKgX933nzuV0zKE7swlfvD8hbmNrNjsEmk33ZyYlEDm9UX9DVx/6qVgaTtQ5ccz+5G4G8C1glcHxGguHRo6ts+7ck5xGAjk9ml86/fuCxVWRMCWIR1n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10194

On Mon, Jul 27, 2026 at 02:12:00PM +0000, Akhil R wrote:
> On Tue, 21 Jul 2026 04:26:04 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> > commit 671c3fae66002e874a13051a9c956e9987d76674
> > Author: Akhil R <akhilrajeev@nvidia.com>
> >
> > i3c: master: Add support for devices without PID
> >
> > Devices using SETAASA for address assignment are not required to have
> > a 48-bit PID according to the I3C specification. Allow such devices to
> > register and use the static address where PID was required.
> >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index b18dda89c4737..7b2f819bf4437 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> >
> > [ ... ]
> >
> > > @@ -2389,8 +2398,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
> > >  	struct i3c_dev_boardinfo *i3cboardinfo;
> > >
> > >  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > > -		if (i3cdev->info.pid != i3cboardinfo->pid)
> > > -			continue;
> > > +		if (i3cboardinfo->pid) {
> > > +			if (i3cdev->info.pid != i3cboardinfo->pid)
> > > +				continue;
> > > +		} else {
> > > +			if (!i3cboardinfo->static_addr ||
> > > +			    i3cdev->info.static_addr != i3cboardinfo->static_addr)
> > > +				continue;
> > > +		}
> >
> > [Severity: Medium]
> > Will this static address matching logic ever evaluate to false?
> >
> > Since i3c_master_attach_boardinfo() is only called during the dynamic
> > address assignment (ENTDAA) phase, i3cdev->info.static_addr is inherently 0
> > in this context.
> >
> > Because i3cboardinfo->static_addr is validated to be non-zero at creation,
> > the condition i3cdev->info.static_addr != i3cboardinfo->static_addr will
> > evaluate to 0 != non-zero, which is always true.
> >
> > This means the loop will always continue, making this branch effectively
> > dead code that fails to perform the intended matching.
>
> This branch is harmless and does not affect functionality. It is kept for
> symmetry/clarity and can be cleaned up if preferred.
>
> > >
> > >  		i3cdev->boardinfo = i3cboardinfo;
> > >  		i3cdev->info.static_addr = i3cboardinfo->static_addr;
> >
> > [ ... ]
> >
> > > @@ -2848,9 +2871,16 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
> > >
> > >  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
> > >
> > > -	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> > > -	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> > > -		return -EINVAL;
> > > +	/* For SETAASA devices, validate the static address instead of PID */
> > > +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > > +		if (!boardinfo->static_addr)
> > > +			return -EINVAL;
> > > +	} else {
> > > +		if (!boardinfo->pid ||
> > > +		    (boardinfo->pid & GENMASK_ULL(63, 48)) ||
> > > +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> > > +			return -EINVAL;
> > > +	}
> >
> > [ ... ]
> >
> > > @@ -2873,10 +2903,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
> > > -	if (!reg[1])
> > > +	if (!reg[1] && !fwnode_property_present(fwnode, "mipi-i3c-static-method"))
> > >  		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
> > >  	else
> > >  		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
> >
> > [Severity: Medium]
> > Could this change allow devices requiring a PID to be registered with an
> > invalid Manufacturer ID of 0?
> >
> > By permitting reg[1] == 0 when mipi-i3c-static-method is present in
> > i3c_master_add_of_dev(), it appears we can bypass the strict Manufacturer ID
> > validation in i3c_master_add_i3c_boardinfo().
> >
> > If the method is SETDASA, which still requires a PID, boardinfo->pid is set
> > to ((u64)0 << 32) | reg[2].  If reg[2] is non-zero, !boardinfo->pid is false.
> >
> > Would this result in successfully registering the device despite the zero
> > Manufacturer ID, violating the MIPI I3C specification?
>
> This is only if the reg property is intentionally malformed. If needed,
> '!boardinfo->pid' can be replaced with !I3C_PID_MANUF_ID(pid) to fix this.

Yes, try it

Frank

>
> Best Regards,
> Akhil
