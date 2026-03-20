Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02F6275B03;
	Fri, 20 Mar 2026 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013784; cv=fail; b=LYiFn0cpugEQq4KOAbC8Ktmom2LdCnv0zkbNqRn/oi2eZOaZ+YLDf8tNnlVQFq/Fv5ZvXJYSDC7kBtYQprozVW+xBzfGFQ1414Q6rBW8BD8WXa0tz3uxTeK+vwEZ3WMSGfGp0ktt6l5WowMzV/lKt/BYeFROsgUeF9jNrEsK0l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013784; c=relaxed/simple;
	bh=+vTGVRmGKdPpcebyjw8aQZWJ9ik+3lN6ASN04TqR5WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ugsWDPYgEPy4FETtP26AjDRamw8CGr0xeIov3YTuHFVz16kKtHCwJfI6ttWpobFoaIKcUmWlgCQnjZkTU4olZBhIam5GKnx1zeRcaV2kom6QxIn62WVHjUSntCc0WPX7cMZ5RC5vqbleDdYb+HM0tY00om3WwbhPCUnbi3CIIps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F+ehEIYU; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F+ehEIYU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9CxcHjVxW6BIICyL0XvAC+1MF0yf8foJmOj4k2sorHOYkEIUOwxiE+iL+/ydJMY3psJ0CA7makCbHSopxqOX/vqN7oBle8qiMFPGsfALUAJOhcmdEhyuCMxAc5M149wIsOOEbz1yDddEGcYRq5Ay3yoyGtYfetcWtuJqytqdIjMwI/yCaOqJzMKob+DUmuTgkyIY52BW8YlqezUMZwaAO6CTHZMclPq3Xr5eJYrYSR1vXozi0ZLUbZKSkQqNrKBhdI6F482JPZ02jz2Nexx9E0o9mJ26R0mj951+iijhNdvx27AhDDLQ09l1sAxMeW+uc+S9LCl3R4Zns5EO4t+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feDe8HW1W8DysZTnYHAgiAddexYRgDVJYHAg/cE6S/c=;
 b=FoU03FU575lqK+p54praafG4BLLvtgRKPy5Mv0I+0eTdFki15W920vM0yTrLELK7tzGLUGCIU9o/ivuiy+yc/QlkQlIrOzULEO+eBw1b3AxZdgoSJytAZhL4gZMZ4qBcl+okCnHERobW/+rtCQmQ25NnO7rW+YyRNh4HORmIb9eV23cAbdHetnTcRFKemdxCPPQdCzEHGKb/XmhvvVZ8K7OyvaEADlX/UOBnGMyTge5qpK8gI74Pw24ruEu83ccOOCzkrGfR3qR0xYEaakbynxX3ZuNEwpeC3xnAaxSAl1Ci4GBaq9zUcUv8RjOtWumPJr4LHuKZjanVkGr7SZG22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feDe8HW1W8DysZTnYHAgiAddexYRgDVJYHAg/cE6S/c=;
 b=F+ehEIYUKcPO3pax01ZBb3afftB5uNBkZOjSbh8v6lOpJSZZUrJJ3ZahfrvqBCawZF4apjj8Q/cSzkvGN4+rTVGgJlRVaWF1JH8YtB2CwX71ZzadzTn5eM86G+ku7QikCjiWgCxM6/2Y5KAXqzQQzC+884linRGl5J6PgVn4kdG2ta7L5bBndgDAuxZ/ybmnUqV3LgEINwj+gBDUHNr9shChtjlL+NW2K/p8uM2R2kDPW+AIE8RtirKivENFBy7Wn9Cc3D06+dGN4nMQB8BK4tQn5VaRq5O2RAKbyfKvA9LiYR9ano3Vz8EB68I/OYsmnXyBt8APdLMTlzZja7GxTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by VI1PR04MB6781.eurprd04.prod.outlook.com (2603:10a6:803:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 13:36:16 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 13:36:06 +0000
Date: Fri, 20 Mar 2026 15:52:01 +0200
From: Florin Leotescu <florin.leotescu@oss.nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [RFC PATCH v3 0/2] hwmon: emc2305: Support configurable fan PWM
 at shutdown
Message-ID: <ab1RAT6cEYqeHrgD@ro-kernel-workstation>
References: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
 <a3ec42e5-d151-4d54-9625-fffeb0399431@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3ec42e5-d151-4d54-9625-fffeb0399431@roeck-us.net>
X-ClientProxiedBy: AM0P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::23) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|VI1PR04MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ec8aa5-fffc-46cd-88a0-08de8685a349
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|83080400003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bQ21bjYKHY3XCZebpk1T4/Xse0RB2u51KKlBjgfJ4Otc0Oe6GkrJdGP73MWxgidyNNg8UuB2OLXq6i9BfLgMZWtLhpKmyBtnx/39kyhassIqGe7MyDE6AB3RU4VlQU/0vXRNRpMGvurXy44juXDlZO9omCWbnZlhDD0DE2jUYLd2t3lzjvQx79p0RYPr9Iv+7WPlds1ebLwQQd2MM1eBxFqqxE5k9tHe8pKtJjTa9sS+hxCRBOsaoybp794h1mJ8BwBiWH2UQFYYarPr8ae8c6+CMvWp12Yn9AW/g6iTYu6GL9O7OEPkWZ9QBP4/RTTW90i5EGNdyIm47LXhHOff+iZxOJWOw67JrnrUFv5XlLuTPsvZCKmCuqweS13aNqAC/Q4XYAwoStdeCHmpa/WE/iWyUvR+EXFiuVS6+SdbI8ADaLW2lNjJ45RocQn5DmG5vcyJHf2f+tL4/UTmQeheD/wQtpKYZ4NkBRqkddPgddXywRM+SB9mw/eq5/9uwZcXNYwEq9jl/NHJf4/U2LWGCpjhYAEyRcdIN2ej4eaIx7dNIJmxhC5k7qPMy0fnt8+f5xl6VHOSR5tLcDvdwok+Kfz1K6PHMq5ge5XuhH/mpLyWsOSGZk2kNVmsYIBrS06E1KMj5bJwK8jPKROAgxGirxwJrWmS9R0uRyTGnTjaKdCAGUQBaFFVA+R+c69UPKBlkNvFFnelqN+jRRnQBedlsY6CdQ/LJZEztMKfYZSab6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(83080400003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9xNi33y+1QDYL+aRboGPvW8LJUcOwCTlDmtKJycQzkfQWAejmQVp9Bd/2LVM?=
 =?us-ascii?Q?ZewB1C1uikg2QZmB+02FUNGtxm0dV/U3zWB7tcPNCRBQgoRHxoKv8SWKSNQF?=
 =?us-ascii?Q?qhQHXubVYYThFfUd87TuvtSKnVr0PJIrwt7R+MEJHhDqTOkz3wovlcB2WJ1Q?=
 =?us-ascii?Q?EXMukvq29H/N0zVhut0IwICCFMqQV5BWJN3h/+J7Euh90oYWfY+vs+CHjabf?=
 =?us-ascii?Q?IogTxw0JfK2HmvAZ1S3CyyVTfUPjl2kO2BjKujx1CjLaK21aDFZQoX7d9aP+?=
 =?us-ascii?Q?NA2Y5Vcr5Pef9mfb5WTqp9XhdAP4d3xrO2w/WRfRSOx1FfbK5PjWx1pdlxQ2?=
 =?us-ascii?Q?SPpY1voG6mYCckqt/C66MJi72/NuwLB3+IDhpsY3/e4g9qTlMdINqcj8GzrO?=
 =?us-ascii?Q?cdcQF5zarfw4v/Wf7SohjZwQZGRSAcFqpV9agioaY9tIdasvl0Jv73Yy1E89?=
 =?us-ascii?Q?NHWingz1CjOzFL+eEYWc6D3Xo7EPLRF9sWSzZPnAAQvi3SwXtxPmPi58YIos?=
 =?us-ascii?Q?bFwvoZnr6FRyRHekMQwjrYu2XwumtasKs8mBA9IAFp5MIc9JybNO/Zet04wB?=
 =?us-ascii?Q?3c/p6LNFjcZOWw6NSWdr2z5zd5D+OS+L87GAAPVkoBEZokbT71gilMP6bpXp?=
 =?us-ascii?Q?2FB8ekpICnLYUXFusz3e+8Rtnxs0ysLk6ETMxA/Ui6uaSjfpu5JQlo/TackM?=
 =?us-ascii?Q?nDqV4lXlEvrjLHyf93o6rhZCcSlYwb7dM/8s3Xw7KWo/isYS1v5Ks8wMcIAp?=
 =?us-ascii?Q?Fv6dZPKcE+ZTpAwXayBLpnaRo541216WyrSJnEazuqqSl3RmlkD+AthDeKEH?=
 =?us-ascii?Q?eyylp/NyVOByAuRHixfLuQRai0ibcINAfGMgO4WlZRb6PaKGcgmCfkm61Wiu?=
 =?us-ascii?Q?yZrVDksV4+0fQDXjN3Z2xLC7BTXuG+l5ODF9qaDlsuYfTjbtXsuaYceqdpJl?=
 =?us-ascii?Q?Frh1mRzcCSVA+5Q1la6J59aK/ooRkV0V/AzHRHQyfl0KqIltmHOORaDwUbqn?=
 =?us-ascii?Q?8kQHyiZRKpUNlUdbYSsX/o97dJOsF2luz0C4nHxFy85RIRLHB3KFnq4lcGLL?=
 =?us-ascii?Q?YtMaeZr3yPhNMgtAkSyo1ddg9mtTbFQ9cBJ4oDwu+0/X5eulrIGCYBfI1Y63?=
 =?us-ascii?Q?gpke3yaJGhPxrJPaDJbfBIvOIM1GESN+x+y7Z3E4QWUKMnkNkTsfhwCUqx7Q?=
 =?us-ascii?Q?qtILxTGK+j8CW2aPJDVmssVQxcGHJBsqbvV5/RnI9tUqNC4TUtvI0wZ55Xox?=
 =?us-ascii?Q?e2OJjX0EXXD2CPbIUSRh6kEiYtEXSqNLv6qFdGEwshuG2ZHj5FRbMBiJZR3N?=
 =?us-ascii?Q?Sxp6xOcmrzNSKiMnymRxe43juO6/VnCsta+vE5N2w3zt4JcKVOrWSVCm0l49?=
 =?us-ascii?Q?UEhf8eFgpO9ID5CSja2iRhCpcw0AjLHF8Dn/fNlfAtrdHguEmNMTJx5MPS2G?=
 =?us-ascii?Q?PWs/A13SuLqvQrC7jy1h1wgH2NzT1W+oeGYL+Uh696HzQnVdsggmN8Vawut2?=
 =?us-ascii?Q?zrDAbUganiKiz4A/jcgavSiCTgvmeXih/sUkVR3PGjqst0ykwcr5naJ9w1LG?=
 =?us-ascii?Q?FXhnZ8SFZVkAgNMIsz+9h7a24zkQQYb4/X3FB9CvNiXPpkN+NscV64pRcgK6?=
 =?us-ascii?Q?ybi1FjrmnMfMXT6+gRD/0F5XwfAaFWzZjQUHFYO68X7AGUnjidzMVZrd7YCv?=
 =?us-ascii?Q?veUvT19ekR6mW9crvbeeKOgY/o1IjDYetVLcXJqtt7tme/6jQsX/FAFb/EjH?=
 =?us-ascii?Q?x8amfM0T1A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ec8aa5-fffc-46cd-88a0-08de8685a349
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:36:06.3857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6htDhDGkGFQ6+IS1tsP9t4W0W6/4dMmK74U1LakPY+rTetoeI0JBtpd6DSXbp+UyHSwRxaCym38JdQRYX/H9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6781

On Tue, Mar 17, 2026 at 09:17:21AM -0700, Guenter Roeck wrote:
> On 3/12/26 07:43, florin.leotescu@oss.nxp.com wrote:
> > From: Florin Leotescu <florin.leotescu@nxp.com>
> > 
> > This series adds support for configuring the fan PWM duty cycle applied
> > during system shutdown for the EMC2305 fan controller.
> > 
> > Some platforms require fans to transition to a predefined safe state
> > during shutdown or reboot handoff until firmware or the next boot stage
> > reconfigures the controller.
> > 
> > The new optional Device Tree property "fan-shutdown-percent" allows the
> > shutdown PWM duty cycle to be configured per fan output.
> > 
> > Changes in v3:
> > - Rebased on current upstream
> > - Dropped already upstreamed of_node_put(child) fix
> > Changes in v2:
> > - Address feedback from Guenter Roeck
> > - Make shutdown behavior configurable via Device Tree
> > - Add optional fan-shutdown-percent property
> > - Apply shutdown PWM only for channels defining the property
> > 
> > Florin Leotescu (2):
> >    dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
> >    hwmon: emc2305: Support configurable fan PWM at shutdown
> > 
> >   .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
> >   drivers/hwmon/emc2305.c                       | 34 +++++++++++++++++++
> >   2 files changed, 42 insertions(+)
> > 
> AI review of series is here:
> 
> https://sashiko.dev/#/patchset/20260312144325.1311314-1-florin.leotescu%40oss.nxp.com
> 
> Please take a look.
>
Hi Guenter,

Thanks for pointing this out.
You're right, since the pwm_shutdown array is zero-initialized by devm_kzalloc,
the channels that are not explicitly configured, will be treated as valid
and written as 0 during shutdown. I'll fix it in next revision.

> Thanks,
> Guenter
> 
