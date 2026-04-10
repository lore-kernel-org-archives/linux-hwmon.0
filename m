Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BF2580F2;
	Fri, 10 Apr 2026 02:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775788638; cv=fail; b=uVz9ilw9BsIIICQu64S8+S2VeNVxb2EtWLfR8D373m6zOdKmO7A992jsAjMRW5jzMeDW013rEiaWCciqUy91fb1hbO9lGlczi+rxDheA+FEM984Er7Rsma8EGNucBczu2stFqt85G/75zChlRxn92yWr1qODYuxIL3w+ITWQWRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775788638; c=relaxed/simple;
	bh=MeusO8eLaloATu9K6l+4NxSu/A8RktFGoP+LGNsBAHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Srin7fwQr6goqTNZxG63+yaVjpTEsQzcniarbSlmOAJ/YBuuxb3guF4n7+d462qMtc0ALcQYjbfB/SLigZ4X73bvgVKA63lllyhNVKBPIkXEvVSjv0wPgV5yReswytVaM4I891lNP9FhsyjX5VX+bEdxb00HcYCWYhEJf+xzeHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RpAPKgPT; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RpAPKgPT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzDXwiloR5FAELDSUTBr63fQTwBT+cfaihsYH7mrweSYCSobNwL4S5WVk/61ewiYuypm9y8VeUX2knNcvk7vq4vMoMSSE4NiM+Gym8FObJ2wIEz0UGRX7Bpt/LMP7Zu1u/QypiwqKu1TIn6nmOPAjbWEq6wHXyKzYQnqx+X9l1+hrh4IEtKxDShkal4Segirkvi9v1M7As5yXwvg8ibscmfd5Pqn38h0jhghd6W+dZjEqTaL8uCX/LlUjH6Oqhx8cjX3caCY6mSvx5jbeS5S3vp3OaPl9fmpdh6sjbek59XSNveZert5MRVfiPgfpwdapn07TqVfdKO9q5KQSWJcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPqxvcTvnBjsOQgHHIYPaFo0RKYsH400oYj0w4gFiNs=;
 b=tW7F176SN4ICVLEIO19qLM5ykxtrIWGJxoLac7qP3regndeNuahlAcXcV78gYBUIFCFKU4wnaH3wmFJf6qFIqHEo5jRyB2aFWgSk2X7X3zoMdnqi1li8HRlAQBJzSuu1vtPgRc+zhte5Ouzfe1ZZx8ceWdRJ4Qb4TxauvGqxCE3a+leX2BvXX/zJE7N6g4UgsJFzt4eV7jHj1bC3EBqoXLAZty2g1w0ioJs6CGcyPcOfJ/etut8xFKib7eLAZrent9s8opfaV2DC7Ca0g4xpr/rYN5L17U/e2WLU5DgOkAK7/qYmlwfBEA7LODdJ1Klbi1GSOMyr7eMomQjrNHzhQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPqxvcTvnBjsOQgHHIYPaFo0RKYsH400oYj0w4gFiNs=;
 b=RpAPKgPTuVvTxpg2mMbnzidAKo/TRDWcoKi6bjGqnoIUh65kkwZ7+lxj2JxnvxI8MAeOeyp6xzHEG9AgM3/Z9Cwvysj/Zte9U64XWjUbMhyidbtYJL1hvt+7g2KERJwV95z0gXGQBuZ5KQMFJ8RNTvYig8hChfYa0m8cBix8uYFLEjuJrzw9G5LzwOe8OT2iRn3R/GmPr48qQSaeXWJyL6fD0u4uWlF9jYkvQJJgV9VVA6Avufq2qnnNQsSIK3neurQf+5mWvO95sYiJTEtHFBuEaNsibng/7gy3wMK7tFqLyNeQFi/tT6DOoR5eyUx+4e65FBxT7t8zPZVMVeQpDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 02:37:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:37:12 +0000
Date: Thu, 9 Apr 2026 22:37:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 06/13] i3c: master: Add support for devices without PID
Message-ID: <adhiUHTjItkNU0NA@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-7-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-7-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SN7PR04CA0157.namprd04.prod.outlook.com
 (2603:10b6:806:125::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 604a17e0-867e-4efc-c623-08de96aa11e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c3H2SEBKWJMZa8uo8aikhjclBVQ2IAIO0Uy8iaxRRSVQBcxdPRuxUamAhfruJQSvoIn5Cmx3LriYFQ7+Rmf/Eyan1jFTX6lwJthLAJkI/dPJYURPAN7kDiFSrym54w7TMXvInnsYYJ/K2mz/oQQKpk8mBOfQwOpUxNkUniuaFW5jcuenB3mHxi2EpmNEs6ABKFxLpO/gJBqC55D1eSTvC9WKP4Ogh2fKsPT/Z2Uf5ALelPANpNXCdi12zY/8jGWgz8hhbcLa2UKY2WR9G0kExYH5RYczcYjJBIuQ/8BJcjBOzu8Sal8qGBFdOajxWu5e2lWaDQUhvWTSmgzJrooQRE2wi955BgQs9nkZecYiFSJvni+Z8BzVYJUNKnPeWZ9Gg08oyoTFfqWpTVs8DsH47FP7VsLHhrJHW8rhGcUkjweQS95kz8eG4lLg4ShHq062q3YM/lDoI8540gdXc3nDU8VsiBionlakYuSFLOxZd6BypG6bk3i0SpTf1KpFDKgE+TVrabJJjfKZSm3t6P4kpDL16BqvfdlrE+INcRXnDiPGX2iKBSenvQVNp2R2vFD4X0rquXgCSf8xYGIupcti6pgwT3tjGax0NgE/sN+CzdK3G2BX3XHFgqwyxtkQoZCWD0pl6Pmgh/+N8RQDydwAwfoHvDjdgTPndsK0XskLKm8AFPIV0lojIZz+7BH0jYo7IwdTIK0Th4kbtPqGLqWQuqLiORpyLgJvMxoO/4GTgwSeGB6FvLfXAmbHIT55J5c4a/qUP8l9WemsU67Wa+Oc97t9X4+AEn0xpQNqTHpMTKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5mjxhxwgj9VRh3pgz9QoCRVNnWOXbkGUkt6oofIuSH9iqkCkx8OH74v4jMo?=
 =?us-ascii?Q?wz0YBPwJtn4/bVTdWfGljPxddtbM9X5jUC2ItV0mTVm5f3nN31Qh3ZR7QB8r?=
 =?us-ascii?Q?k4NRI3JCuSt5vBN0D9S3Jp78LJ0+2cMvXADEcT+SDZEgzuViXteO2gMWlV+f?=
 =?us-ascii?Q?m7aEV8t230MxlVkCOblE9DKVoA2ute/S/UMwwN1z8hoKljhAiWIvD1mgDgGJ?=
 =?us-ascii?Q?3Yg0HrE6LQiUvct5w+MQXSNUV8K11tU382K8KvQX6sxOzlhS8IZUCdLvRYRr?=
 =?us-ascii?Q?kaQdyZQCRGPWrldtIc01d6nCgAFPKyruzl1Fc2IsA1kUT6MzPLpsoR1nEsAG?=
 =?us-ascii?Q?y9SUOGGap0mEpMrlSHhg6g6DuRe9Djp546b3/ep0Ryvu8FB6QGfDix4a3z4y?=
 =?us-ascii?Q?g+2TZ+I3xJNXjSSDV8WHOdoALDcM8Q9IjYzbIzaUmcJSt/UZOFCJPyrd7ekC?=
 =?us-ascii?Q?bGlVQHiongVqDUXUMhKfZr5YJY2qGNFke8IEMQe/J3Nl1be/ieDSfAqEB3vd?=
 =?us-ascii?Q?tVrQKQtVjhveZLU0rrkjPa+mPzTHjFQBGJdPKXpfROegW+WH9f6W5+xJDbin?=
 =?us-ascii?Q?XjO4yUday6It+UM9lXDA5cVQZJRyxrq9O2bO4i1MlM2HOg+t7ul60CCt3rWk?=
 =?us-ascii?Q?2HGK8QjEdb2WeFMNWTHxsWG6RqowNBdoimfWYeZluwoLIgMWkKjFPcgrBCVQ?=
 =?us-ascii?Q?Ne5P+vNQ7ZwqCfBELsaelOU4Rd0WSNh8dhxT6CqnlrxaeaHWvWQUtSTCleZl?=
 =?us-ascii?Q?ze09PwGVGqhGxHJEL9bq7UmzE51HTLGUgb+YB8hVv0wXrWWls8ie3XpmZY3P?=
 =?us-ascii?Q?22jgHlEjAH+kVFjVZIryS2piRqJiW1YBHwpONUMmrJryRkF5yp1qcEvCPtXG?=
 =?us-ascii?Q?yaOF00WU8EskSQ08qeNPH7pDfVG4OlbYWviZ/p5cpGeSx12bgIA3wEGFbL+P?=
 =?us-ascii?Q?MZCofMs1NyfwGOj3zXX5BL/3kIXsF/WBbYQC1s5KnHSr75NIxNGZ0czYDQMh?=
 =?us-ascii?Q?2UMNMaPaH4j3XKRw7ljWYcwE7icykFWPt1sw5miQUMfl0PRW8/oRXY1PfCc7?=
 =?us-ascii?Q?Cr0+1Ji3NtzDGzH/c73oNtl7hdhhlScfTsVDzeUPm24sBBip4gRt/drBCueg?=
 =?us-ascii?Q?mel+7pKP+ybSfXvXb++O7kPxXWwAC4o/PxSUPsjydUP2kiUT/mrbSxy0UdgA?=
 =?us-ascii?Q?RBANBsKTsUAjtJVz3g/RUdHkmvdn/u7zm4fWryL+6chrsiZXayqPl1YbWCQb?=
 =?us-ascii?Q?U2pmtB5sutRWy1p1gu1+dvOVoLc7iyPcEUErMMcVAzS3oh2QFWRuF75Ox8Gr?=
 =?us-ascii?Q?BgpBaftKK7Za+StruN0fCkWmzBZUhSjymuiBMqkBaO+rTe7OLjBchPhOtVeo?=
 =?us-ascii?Q?45I3aLWPM/Ft6r8y0L+2fJ2oZLA8gwkSFkxydUZKegsLJhOrQ0LVc0GJx3Ey?=
 =?us-ascii?Q?N/ywXC32K9b7Z4Pwfs5hNOIjbqUKeAD86N45soFHX+rhzJcf2K+DBgASOQgI?=
 =?us-ascii?Q?qmz7C6TBWkLeLR47g6dXU8/rQPh2vg31KgDnm1KX38okn1HwrgQR1Ci69R5u?=
 =?us-ascii?Q?fNmtze/Vyc75R8sXu9+sM6VTCFdECHyQbeMA2qfwcfKcnPEGavkdzkrd2+AZ?=
 =?us-ascii?Q?P+VAtyt5mP7p6gEjE0qs2XqP0hjeIXOYJob2p5W9VKbgNCAsXCmIaoqCx6bm?=
 =?us-ascii?Q?MuklIdjeVQHkEQ+dHecfh+av6flld2JVFK8BMXxKyCE/Lgnori0gY+XI/r22?=
 =?us-ascii?Q?FnutZ2M28A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604a17e0-867e-4efc-c623-08de96aa11e7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:37:12.4390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTzGl2ABT/4ZQW5EiWiADo0VIAt6xcax9DXGTKeKHL/yBVcltae6WCvBa0vwiOcqu6hFiunRiLZg5sC2Vz29WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952

On Thu, Apr 09, 2026 at 04:27:36PM +0530, Akhil R wrote:
> Devices using SETAASA for address assignment are not required to have
> a 48-bit PID according to the I3C specification. Allow such devices to
> register and use the static address where PID was required.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master.c | 51 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index a0f7a0d35f3f..324a0440724e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1835,8 +1835,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  		desc->dev->dev.type = &i3c_device_type;
>  		desc->dev->dev.bus = &i3c_bus_type;
>  		desc->dev->dev.release = i3c_device_release;
> -		dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
> -			     desc->info.pid);
> +
> +		/*
> +		 * For devices without PID (e.g., SETAASA devices), use
> +		 * static address for naming instead.
> +		 */
> +		if (desc->info.pid)
> +			dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
> +				     desc->info.pid);
> +		else
> +			dev_set_name(&desc->dev->dev, "%d-%02x", master->bus.id,
> +				     desc->info.static_addr);
>
>  		if (desc->boardinfo)
>  			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
> @@ -2285,8 +2294,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
>  	struct i3c_dev_boardinfo *i3cboardinfo;
>
>  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> -		if (i3cdev->info.pid != i3cboardinfo->pid)
> -			continue;
> +		/*
> +		 * For devices without PID (e.g., SETAASA devices), match by
> +		 * static address. For devices with PID, match by PID.
> +		 */
> +		if (i3cboardinfo->pid) {
> +			if (i3cdev->info.pid != i3cboardinfo->pid)
> +				continue;
> +		} else {
> +			if (!i3cboardinfo->static_addr ||
> +			    i3cdev->info.static_addr != i3cboardinfo->static_addr)
> +				continue;
> +		}
>
>  		i3cdev->boardinfo = i3cboardinfo;
>  		i3cdev->info.static_addr = i3cboardinfo->static_addr;
> @@ -2300,8 +2319,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  	struct i3c_master_controller *master = i3c_dev_get_master(refdev);
>  	struct i3c_dev_desc *i3cdev;
>
> +	if (!refdev->info.pid)
> +		return NULL;
> +
>  	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
> -		if (i3cdev != refdev && i3cdev->info.pid == refdev->info.pid)
> +		if (i3cdev != refdev && i3cdev->info.pid &&
> +		    i3cdev->info.pid == refdev->info.pid)
>  			return i3cdev;
>  	}
>
> @@ -2601,9 +2624,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>
>  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
>
> -	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> -	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> -		return -EINVAL;
> +	/* For SETAASA devices, validate the static address instead of PID */
> +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (!boardinfo->static_addr)
> +			return -EINVAL;
> +	} else {
> +		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> +			return -EINVAL;
> +	}
>
>  	boardinfo->init_dyn_addr = init_dyn_addr;
>  	boardinfo->fwnode = fwnode_handle_get(fwnode);
> @@ -2626,10 +2655,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
>  		return ret;
>
>  	/*
> -	 * The manufacturer ID can't be 0. If reg[1] == 0 that means we're
> -	 * dealing with an I2C device.
> +	 * I3C device should have either the manufacturer ID specified or the
> +	 * address discovery method specified. Else treat it as an I2C device.
>  	 */
> -	if (!reg[1])
> +	if (!reg[1] && !fwnode_property_present(fwnode, "mipi-i3c-static-method"))
>  		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
>  	else
>  		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
> --
> 2.50.1
>
