Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EE441F356;
	Mon, 27 Jul 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168788; cv=fail; b=tanlO1lNOTbXUp7LrYc/LQWCX0xaX1tew2pwtEXpaqZqkqDe8AMIYDOwPvPtwZQ57Zl1Sbhk8XFidco5hLknnUDKijIn+kC4f2gnL6mIDwNEmwv/wKZ9vTExEzrlgtMML3Y/oGoO1jT2GA7zDyTKDW6esBDTpQ88suVLfxIyv+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168788; c=relaxed/simple;
	bh=nS5HKpb/M0b7pcZJjTH097Yk4CAjpG+ht50wVvvZ0GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KCfyLnq5/RnOVoiEyaxpltfQ2k9RDAI/EBS15q01dctY9wmXAdEvPYYokhUYbZvY1PDWtiPaVqWPXZa78wRyxUSwTtHvWKjMLMSEwDocOkAjjuFc4ZX4fF517Z/YKtaXReqZUL1OU5+mRLZ+2mch+MLFujcTbpv/mTByITvnMYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oXbBgHN0; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oXbBgHN0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdaTtQ+CCbUWR1946wZTJnmLGjf1zv9GtL4euVurW+0hLToj8BqD9MXyukp4nG9SQnkezQDrR0ALSxJTg2PQoRzMjNblEfIBug8612CEoHBShDrEgAUZeS/wOOPOfC/jsBSCLp8YUJCswa1nsBCGZgkv2v7wk4R62IJ0VrbD/w0+edayM+V2DLQTuG0L73QUoELz6J9hH4Jmi8QmZJSdIh6HYEaSsypnm7pNaFavG6+Pt6/Xq5my8aoCvMwgK+LPH3iggbendnsribDFsyLPW0F0TkOspkeBPzY+5tBaQzwBgxd7U6diK9soAVx4NkPjDqMNAFCE3JdPLJkyrOrCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C01HlJ31ej6g7wOqEHvqgwL6P32EG8YXzEs9QTwqsbU=;
 b=smMCDXg0o6M63im0OXWHhdPqh2GqrZhAJ35NpQOvzduOneotQ3VnIdzLjWof8uiFM+bcjFDbqmzc/y1mDyfxdySgb8TPXyie5WDWoc2zPePZADgK223wSfbxKxmPewyv5Us542KqdAS23BALkHZKyN4GF4rqDpxcE9QKFk4xK7DuvpZxbzz6oEIvBZR1Su6jkEeYlU5znaFtgaCr6je9BXfJZtja5d39E2IHoulABqWZRkCSvmR0K5GRYfH5fAUEY6fe7yald2+o5iBoggwUgcCS8eX0upbNASsdlPEfTSbYaisCX2dKT1AahbcR6DltWsDj082xtDRSywFo4gqFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C01HlJ31ej6g7wOqEHvqgwL6P32EG8YXzEs9QTwqsbU=;
 b=oXbBgHN0A7LWHXhKenPAklRkH0TPfk4F91xa/vewaE9E0Dk8qz9s5Tb257u7lPoMaBUw9hMdyYOxslqIRiE6iKJS2bpaC+eAb8AjNafLfA50uGhYph2IH9Z2H7DvfnG/xOVTZNiXtEkSeCQkE+0kntZUSFHRLr0mOhVE2lDW5lQ435+GMaY+Ay0D5wmwioNbDWisTMl+Q11w7rwd1H6OWKCQn7SSp9/bsy3RYUea3HKkllzyivPtJL++pyKkAiOBgsEkYKg61GiFFXavQzILUdGX6qwbKDG2NuX3o3pAc8arifoHRpMWjwJ1SKANc7gAx7YAgLeTaR9zt05JfUyW3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7311.eurprd04.prod.outlook.com (2603:10a6:800:1ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:12:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:12:58 +0000
Date: Mon, 27 Jul 2026 12:12:50 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: sashiko-bot@kernel.org, Frank.Li@kernel.org,
	alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v6 04/12] i3c: master: Add support for devices using
 SETAASA
Message-ID: <ameDgqvp2pAKDEsE@lizhi-Precision-Tower-5810>
References: <20260721043058.C02B31F000E9@smtp.kernel.org>
 <20260727125745.157384-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727125745.157384-1-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH0PR07CA0113.namprd07.prod.outlook.com
 (2603:10b6:510:4::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eab62d2-7f53-4910-82f5-08deebf9ecb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|3023799007|11063799006|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vRdE5CHhbcbWSDPj9uvPQtJwnMgbPr3CMCnH0qNRxZYPa5MfJF/TLtOmKiQWMAB2a/vNmdpH4PNs/rMMAaVwE52h43x/ZX2sgp8nvNcXYxHHkGJy3fG5rmOZJfDTTtLZS0PEArcm2xlYk429xZ2gZY5gfdlxVpKtu5grhgwXWPkz9+33eFQwikAyFDD799KytXIG4/2LzL8WWoD4LIwsvwFEKIYM6ROwm4Ztn4muyWswg+sJKAxEw5rEnIazu94P5SaIqktoAGtCiBnttw6CYNwGMZROhwGHiwS2eAFUnX+xvGKtnLzMqp4ghE8T/aTdXyqxYLDiDat4WVQc8yI7QfANkcXeXt5UbDaGoNJVv2wN+M1wa8Wj9AeA8mCyBn3bS+/3HmnL1uYHLb/kDsZPcyoUsyZ290pUwvoLpYeXQY+Tzy+o5shajh+BwdivWD8OtlDQN57uPQNqhOsjXArj7xXG7kXb+wsWO3ejWpRQCvy8XJfl7CLpdzdnT77iHPoSObNXTw/2Bfv1cItqXNcy2BOa2plDy/iEf9fH84+tai7chqS+CC2tSTwFd5ptauz3E2B+ZuhqG9n6WAJ6hpPrDRpIpbcDXJfcPOiE2M5RbaIuy28Z+ncM9BCcl9ijR97o5BvbWvyAPYmN+5G0MRaxBv7hQSjcuggPKTH5fgXIsZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(3023799007)(11063799006)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A6OUuVa1JiqyQuk1TELxYcVeCZBNhrFHSN5820g0vXVOfC5I51CmCR7Y8d3C?=
 =?us-ascii?Q?2wGHNnl7YYaR1WpTs35hWKFAffsbjLnWZrNJWBxSzbmI0kk9y/xuaZF7wW1q?=
 =?us-ascii?Q?QisVYAPRGzGHow+Dla2APPlzkHnEekVbhtNo1guQMs+Ey3gwqQSZOv7GIrwp?=
 =?us-ascii?Q?EoNSCFnMLf74mJnrYLse+Ou5PSqlkpB/OBoyroGUHFnQWYlLo5pkE11Zbt0e?=
 =?us-ascii?Q?poOU+zvcjCsmchXKhNHGtdBL3l7EjvVlvgeo0c1QTYq61jUkdIdfYbtmMUUr?=
 =?us-ascii?Q?awv1SwXI2UBnxqAoWaxoD8AZSHW9q3666zSpslVnN6lGRuBawAVFSpi1E/cv?=
 =?us-ascii?Q?8Hy7+6mnp/jd4ui3PbsgOp4STqmf6SuSVasUJA0HfMRefOSa2rB+VYNmyxcL?=
 =?us-ascii?Q?vlxQx+CN1KoAPa0E8lwqqKb60WPxaIhhMC9gTPaVkMJHPycQCkXtkI5g5YoZ?=
 =?us-ascii?Q?cI4ukTCkv1ZF+Tx9USWq6V/i71TlNniiLomy98VmlvgTX94/XSRw+ltSM9KK?=
 =?us-ascii?Q?WsIDXQcvMk15LnDEdPevK16JpcSef31WxJZa9y2GkCAlGk026/Am7Fxo7+6X?=
 =?us-ascii?Q?LmjMlkA69T9yHdbGMMhciGCUL6jlUUAm5ztcghKJb/6qMZhqNzb2KZ7hSeJz?=
 =?us-ascii?Q?9RfHPhiDk4ZwFq5qMYLwr/aYBu1KqGn3Y0ckUiZHavU2mUXvlkWGbdFLS5Q4?=
 =?us-ascii?Q?jznIRetou8fKgm9ZSfPvv6Nw+lagmtWY2VElMNPDKRP5u5gh/7I9jA4BujU5?=
 =?us-ascii?Q?hOqBxHPNFoRQzNi833z6zHHwGZWLGjwMI3BYv83ZgRST/rh69RTm9Jbrh04v?=
 =?us-ascii?Q?cnmnGprP951Kvdh6i9uYEc8uxr+E2GLMM8yIjCab/QswfUnqL9XbjF8+kKAp?=
 =?us-ascii?Q?fppglJPCjrfkaDmRZarUqLbpI1qGTUPmrA4J6JYOiPH3YsXzjhDmqPojXBOu?=
 =?us-ascii?Q?y++WBI12fnz9QJnBYOqYryIFcYSzX07RevnmDVJVnhJ01DOMyVpOdNR/Pc8V?=
 =?us-ascii?Q?7HK32LQFSS17xyhpPcxcGpTgWaqDKL0sqF1iAL8qUtDx7qeO5ErgT0OLGXXU?=
 =?us-ascii?Q?62SzRW6ql8hudCR4oLgRn5SZQ0NaZQE1TEd8Sjilkm53HhhI3D1Ta73Nd5DH?=
 =?us-ascii?Q?2aRanWj08foOd43203dQgNbE+bAqJ6vSStBAmzqGFFU0BZ3fjFbjcDhsLVP1?=
 =?us-ascii?Q?ysFyAS5OFGr7782kuAGmiFtGTcW1NG8wNudtbLPr6mKbiHB4eyrKmFL4Elnh?=
 =?us-ascii?Q?m7OiDXv+8L0auX6qnf8uuIB+y2IdYIT8CE25EoAhFrlcEmK0trTWwSFrprSA?=
 =?us-ascii?Q?Yegb3n0+kGGo5FyJp98dMTNjkD6lwe3PleEpqApa5fYNFtJLBAr4PxhOyVPT?=
 =?us-ascii?Q?AHUdEgPfPrx12neKqv4H7fgqrOql1xMlSZ+J2KhwkWTiNh2pE4GA4NxqNPwD?=
 =?us-ascii?Q?CRWi0vUVUGx/soWJdwGqXWKRaGh9fnlBxCjKsuFjJo2dht+yJi+t3GqG2ItB?=
 =?us-ascii?Q?5Z/nGCC4ojzHSfhyStRPFDoP/0LppgRl7ehRUEFjX8Mby5/4YSlnafbr5lTH?=
 =?us-ascii?Q?Q6hJrBX8cwCEqLHUJFEQhFBrDuIDwcWVt3xX5lf5+SoinnEeyzuucj1g04dq?=
 =?us-ascii?Q?Oq1C37tt6oKt/SCcm0qPojDtYle9gUoIT8GbyzoU/R3vL6kl/f/S0jBvVKy8?=
 =?us-ascii?Q?Y96A53+yleEvD2zDr4jon9qD/lzOQIpeHVuIvmx85Fi0I/PCVcgGRVgxtP7M?=
 =?us-ascii?Q?Wtz4YcW6HjtZiPZgYzmA2noV9WeS8RwIakVu8zJKZ53S5YQCt+Eg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eab62d2-7f53-4910-82f5-08deebf9ecb8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:12:58.5830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkUlCUGpF5kkFItTXjkL1fcWupAmX/gk0ldubhQdX9JfgGC13MQx/5wddoDjbfiWPaixQNKX3C4+RBGumpD5PY/UoaNhOkptBQP+1605aDjrykXybhys8asHx4Z9EZJL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7311

On Mon, Jul 27, 2026 at 12:57:45PM +0000, Akhil R wrote:
> On Tue, 21 Jul 2026 04:30:58 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> > commit e158b576a9f733695d868ee16f34bacdb43285b3
> > Author: Akhil R <akhilrajeev@nvidia.com>
> >
> > i3c: master: Add support for devices using SETAASA
> >
> > This commit adds support for discovering I3C devices using the SETAASA
> > procedure, such as SPD5118 and SPD5108 attached to DDR5 memory modules. It
> > adds the SETAASA and SETHID CCC commands and updates the discovery logic.
> >
> > Link: https://www.mipi.org/mipi-disco-for-i3c-download
> >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 623c6b2247d9f..b18dda89c4737 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> >
> > [ ... ]
> >
> > > @@ -1102,6 +1103,51 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
> > >  	return ret;
> > >  }
> > >
> > > +static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
> > > +{
> > > +	struct i3c_ccc_cmd_dest dest;
> > > +	struct i3c_ccc_cmd cmd;
> > > +	int ret;
> > > +
> > > +	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
> > > +	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_VENDOR(0, true), &dest, 1);
> > > +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> >
> > [Severity: High]
> > Will this fail on most existing I3C master controllers?
> >
> > Looking at i3c_master_send_ccc_cmd_locked(), it calls
> > master->ops->supports_ccc_cmd() before sending. Many core controller drivers
> > (like dw-i3c-master.c) have strict switch-statement whitelists for supported
> > CCC IDs that do not include these new SETAASA (0x29) and SETHID (0x61)
> > commands.
> >
> > Would this result in returning -EOPNOTSUPP and aborting the entire bus
> > initialization on systems with these controllers?
>
> SETAASA/SETHID are only issued when a device opts in to the SETAASA method
> (i3c_master_setaasa_locked() is called solely when addr_method has
> I3C_ADDR_METHOD_SETAASA, and SETHID is sent from within it). Existing
> drivers are unaffected because SETAASA is a new capability they do not yet
> advertise; they can whitelist these CCCs when they add SETAASA support,
> which will have to be updated in the individual drivers. This patchset
> does that for the DesignWare contoller driver.
>
> > [ ... ]
> >
> > > @@ -1878,6 +1924,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
> > >  	if (ret)
> > >  		goto err_free_dev;
> > >
> > > +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > > +		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
> > > +		ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
> > > +		if (ret)
> > > +			goto err_rstdaa;
> >
> > [Severity: High]
> > If i3c_master_reattach_i3c_dev_locked() fails here, we jump to err_rstdaa
> > and eventually free the device structure. However, i3c_master_bus_init()
> > later unconditionally broadcasts SETAASA to the bus.
> >
> > Won't the physical device claim this static address during the broadcast,
> > even though the controller software no longer tracks it? This could lead to
> > a bus collision when the software later tries to dynamically assign this
> > "free" address slot to a different device.
>
> Address conflicts between statically-addressed devices are rejected up
> front in i3c_master_get_i3c_addrs(), so it should not cause any address
> collision with other devices on the bus unless the same address is being
> assigned through ENTDAA. If this is a concern, we can avoid freeing the
> static address for SETAASA devices even if software attachment fails.
>
> Let me know if this needs to be done.

Try it.

>
> > [Severity: High]
> > This is a pre-existing issue, but does jumping to err_rstdaa correctly reset
> > the hardware if reattachment fails during SETDASA or SETAASA?
> >
> > If i3c_master_reattach_i3c_dev_locked() fails, its internal error path calls
> > i3c_master_put_i3c_addrs(), which marks the slot as I3C_ADDR_SLOT_FREE.
> >
> > When we reach the err_rstdaa path:
> >
> > err_rstdaa:
> >     i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
> >
> > i3c_master_rstdaa_locked() checks i3c_bus_get_addr_slot_status(). Because the
> > slot is already marked FREE, it returns -EINVAL and silently aborts without
> > sending the RSTDAA command to the hardware.
> >
> > Does this leave the physical device holding the address while the software
> > considers it free?
>
> Pre-existing; not introduced by this patch. Better addressed separately.
>
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > >  	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> > >  					i3cdev->boardinfo->init_dyn_addr);
> >
> > [ ... ]
> >
> > > @@ -2741,7 +2816,19 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
> > > +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > > +		/* For SETAASA, static address is taken as the dynamic address. */
> > > +		init_dyn_addr = boardinfo->static_addr;
> > > +	}
> > > +
> > > +	/* Update the address methods required for device discovery */
> > > +	master->addr_method |= boardinfo->static_addr_method;
> > > +
> > >  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
> > >
> > >  	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> >
> > [Severity: High]
> > By relaxing the PID validation for SETAASA devices in this function, pid can
> > default to 0. If a system configures multiple SETAASA devices (like DDR5
> > SPDs) without PIDs, will this cause a kobject name collision?
> >
> > During registration, i3c_master_register_new_i3c_devs() names the device
> > using its bus ID and PID:
> >
> > dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id, desc->info.pid);
> >
> > If multiple devices have pid=0, they would all be named "0-0", causing
> > device_register() to fail with -EEXIST for subsequent devices and preventing
> > them from functioning.
>
> Static addressing requires each device to have a distinct static address on
> the bus,

Any check and report error if two devices have the same address?

Frank

> and PID-less devices are named from that unique static address
> ("%d-%02x"). The bus address-slot management also prevents two live devices
> from occupying the same address. So a collision would require a malformed
> description with duplicate static addresses, which is not a valid bus.
>
> Best Regards,
> Akhil
