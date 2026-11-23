Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466862;
	b=Er8ERC4CMWjpYGqLXrLr3DPU900EzhSwhAGTYn9nbDSoJnOecOwDrC+6jau3+F7dxo/B
	 wRXNV4DrF/o1gY/nyaGgaMR3YKYm3dxJPJHP5gnMQryHHwccA0zISV9QTaUnw4Tlad6JI
	 LGNjOLyNlPvtzcRlANidEv7WBkVZ443uTGqdMEMnrLBbwnKcj5XdZ19AsJnmIBMdJKcS8
	 smqPChWe16k5Qgo+M7QhQQDmdXqSfn638pOlrihoUAD8L0amOr5vEmMffsHfuxKAmcj0G
	 jyd7mxOyP+VmTh24NR21I5i0zzz/aEZt9ovek4W4e6RWIJzISgDKH5S7kabVX5WFdaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466862;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mKe5EPpkFKLpaxvUPL5XMVwvpGQOxWZpQ5Tw8qp8gWU=;
	b=QTY/bCx/KtBCUlOqvqjHuC4BEwJF+WEE/OAWSUh6Y9VDndfBw1knEdeB95k1ofJyw9mO
	 FuTMuLY/B8DGiEKQjgvt/Q4pKmgmmrfZi+JRPcgmSaEJ8LUbcDGri/qIzQ3nLSx6+M5sI
	 LHw3u0/gvjOsgYMpVe8zUh5dCdFtJCeO/duVe1TQlho9MGl/U5yIbUFscwcyIySAMnD4w
	 QuCIUKSuKD/rAT1ucy5qBGoJEi/ZSZUHuxxCjGnB3oyYWghaLCY/04qigsoMh/q4Ktv/4
	 42zRO+4DON2vIalYFWWNAWN1spRk5O0YrzjZe27bzVrPS2Lwj8HVY4E6/yZWhUGjp3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mb7jxT5n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.11
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C610606A31E;
	Mon, 23 Nov 2026 20:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C610606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mb7jxT5n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yubvkUUW0nkmy5gBOxkhKQEJoyQYj8l8JCQjY4ntsoXe+x5g2VejcXTOCo0ikrYiCL8iPoOlq8bs6MyIyhA/A5kEaG+fSVukQSEZdKiSRDWpUGrX2fySs6afN5SXN5swy6n4x0DzQ/RAk6DIEBPNKWHz5GqCRsFoVf2NOCPOqtJsCeBSn8nuQQtnHwj/yWIADexGC9Y2xTU0wbbw2QA/DLt83CK/ZIXw14Iom8OSxXsIPfzHjyYjEcu7AN2+GGwmWI/aClWIHQj4S79NyDsglTngDv7hnqACDdkYZNoBmp35LwoZw2Du0WD2YN2VU5/RZEAGUizAJ8d5Fmm4aqDt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKe5EPpkFKLpaxvUPL5XMVwvpGQOxWZpQ5Tw8qp8gWU=;
 b=Oc2PHfONkjRtmxgCOcgKmNOULTK9zNxg0vS5JYrz2AoDMX5uAzupMMhwnch+z8xDFwz5FdFCTwga27uzZDo87MwfZw4ak8ej1QQ6XqRr+NWyLgU+fdkvVn2U54ZLTCjoHyslSFFuPgdev7EHBTEbOdibK/FrkDdXS4Jcidia5ISL3UwDz0TnwnllFmrqSHAcMgovWCDDAEVet5sUuzoCvfUJWddVWR++7Vi7DD05Ti+VhKZfcqtkWYB/oUaZB2ReMdXU0FDN7M5PGPezDw24Lf09+m204lGLY1D7aHqq1N9p9wSVd/9bHNM/U9NUuEEDhBT8swsz8+S1hACEAYKcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKe5EPpkFKLpaxvUPL5XMVwvpGQOxWZpQ5Tw8qp8gWU=;
 b=mb7jxT5n70+/A8ybf8HUPnQR7JOBDcvoXsjnUzp2LsaieM6uADR1P2ceuVFMWLuHZKAewF/PKFKWbsRxThSHOw/vX7HrcWq+BIRT51XK4BLHfMpO6VfZOznMx+iVoygkWXhm6MGvw2yTU3hEQ9PQ+G6nJhKbFKMp8fVSSWK9vImf37o+Tc1B35nUCQNJL1qbudsOKKAsnLgYX+xqFV0WgG93ThcWSt5y14LpwcOdb1XFO16ADqO6xxnjXChktUIuz8+d+UI0O7Zw2FSzge1+cbTQQN++qHlrmA++WbfA6etLQCr0VOLA6AXAvwXt4PixLfK15LV1CbXWnmM0WJ6Bqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB5PR04MB11255.eurprd04.prod.outlook.com (2603:10a6:10:5e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:47:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:47:38 +0000
Date: Mon, 23 Nov 2026 15:47:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: sy7636a: read the temperature only while
 the rails are on
Message-ID: <awSmYnfbVnjnSwNB@lizhi-Precision-Tower-5810>
References: <20261112205228.42630-1-pmazzini@gmail.com>
 <20261112205228.42630-2-pmazzini@gmail.com>
 <9bd10826-7684-462a-808b-91b72c9d5689@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bd10826-7684-462a-808b-91b72c9d5689@roeck-us.net>
X-ClientProxiedBy: PH7PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:510:174::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB5PR04MB11255:EE_
X-MS-Office365-Filtering-Correlation-Id: 715b7de2-3f61-466c-6c28-08df49a30289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|261026140227099003|4143699003|10067099003|56012099006|11063799006|261028144727099003|261026121527099003|261021123027099003|261102123227099003|261022075727099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	NaDr+Rm9upYN1z9NDLR7OfVlNtow5eC8FfmjnK904WVc3zruYH6jfk5ul11HIKKTeI5bSvC1IxXZ3h+jOHn27FvvtT2ZrVFIYQ4uDKU6BLmIfbFj4yJrd0DXSHmr9hqsN2NGN0myw6qZ5dMyvBbkqMVBRbssfu7G8W42oi095H3UdnFtQnTyYB+5U5hl/gHTeIyNdf/sIYBQzuNtGDKqHprnG5KRbHEVU317SfNB+zgnpvPClU+HcMjykxNkXdNXW1LtCbW/qChOnLBOvJv8Si1qtKXB/5QMaFb4cF7FH2XOguJ8yYlz/KUUhqbHGgNa+behevDCvlh8Df45Honw15rDOF61dsKolhuLgwCd/XttBt1w+QStASpMq27U0cMclb6Q9nfJHUtkU7hGrocdH4eVQ+AiRGiXbs9xPV0d+7HoLIvJS7T+k8ndW4wjdmTeqnYADba6wTXLHrY2+MY7wjFPybFXgLp6ybK141T4XId7gpv7qpf5Qr6uAusBV3qoS0Xah+RmygNkLv/kAqnkYqmkJCvY+jdsAEk+I5eO5OHa0VoSWJlU2Ohr3vZ5oYEcrWTHe7RGL+TZ0hIc7lmWxfJUuPzMdCI4Bn5iZv95AmHQWaZPf3dNCLkJ+vdHO0p0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(261026140227099003)(4143699003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261021123027099003)(261102123227099003)(261022075727099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGLVGuVKIV5nj5J2agXGSDrEyqMpOIjk6UW8yytDpibfeavujWA0wCumr/oB?=
 =?us-ascii?Q?6dch5rIZE2492B6Rcbq//X5bL8SOaQpVaNceuf4+ouYBU1EQwFupyaZGgusW?=
 =?us-ascii?Q?fPqDL5UdLpK8LXuMpQASd3038seQBKzCJX3c/QQxMo2UPNvsebZCOn36MfwV?=
 =?us-ascii?Q?lMhPsFRDGrnDdFvBgU/s9MazfnpswJFHQQfD9TQGVd4Nv4fd3V/t26Vno02k?=
 =?us-ascii?Q?YoqLgL0IfYhJD9mR/3mq3sFmY8M/KXmD/BkP0Nzy+C4Jp3JQwCDidFjV3XbX?=
 =?us-ascii?Q?4ygE7ZJaocvND4rr3CLFmiKepjQRcSo1JFZg0LS9Yc5L+17LUS7NQfBjb1Jj?=
 =?us-ascii?Q?Tb68yfcYWNy+arNJyQsWeWJpsOOTzOxC2v8WQIQ33o4GWASrZrYtBylPhBs0?=
 =?us-ascii?Q?ki2CfF8aMfnGxcb1uI4Pku+HTzUtChJx8fooJ/EV5GJgqiEsTtd+xblxym//?=
 =?us-ascii?Q?7+yYIoyqio+NPwYD5fbgKs16cJzNyvrBpXzrVw8NmZy8EGwfY7xXWDQkJk8Z?=
 =?us-ascii?Q?1+VasLfOZx/WXllNCXLQfTUMGBpB5lc3gRInFKb0UMzOHRlw4MW03OBySlOx?=
 =?us-ascii?Q?knvZPZn21YiWd809BfAl2Oi4H3dAae8CVQO7bpA3xjFux0oY75AUbeos/K0D?=
 =?us-ascii?Q?gSGNQySOYuSwZqN0Z8+4M3a1SsaCKFuZyhaXReb7rXqOy4OJSHOYAh+zcWyd?=
 =?us-ascii?Q?Zt3FkbjrgF4afFw5/ISjY4StWul9NRHxblK7Kqd6BuhLOPlczS6dJlt1Wtie?=
 =?us-ascii?Q?FkB/Gp63JI2p2McQB/hIJpnqOvCqZoZ3AFIcB0zx4DqR0e9tOdUyHois4wA1?=
 =?us-ascii?Q?m1PhL9OcdeAQ58Isawon+50wzc5g5L8y+q7ytoKMYFLyscBeXIks7I4pDl8u?=
 =?us-ascii?Q?16G0JU3IheUjNf1qDG57sDfCv4XcXUeTKeb9zweOKYdSjVt7XWubhltG8rBV?=
 =?us-ascii?Q?wwNqfPtcwSPWJM7I7TZvyDlyEl7lNwH3Wz9WiHCwMgiaFU1xwKi0yPx8QY9D?=
 =?us-ascii?Q?JlaTTE3LvAY2UzMZNd62m4plkYEet51Qtcg6IuEgVq42GYUJwjRHVmc5FS5p?=
 =?us-ascii?Q?Q7iiaMg27e4T8ZoS7dZFEryEWIOr37O60ra/pIspKsZWSziTIhf9Q3DLjujZ?=
 =?us-ascii?Q?fdx+IBnuGXHmsYGCu73YAs9Tup6kut1vXw41q/qnp9e54/8U/+7Az3Y81bd7?=
 =?us-ascii?Q?KKn8ZCgYd2/44hlO7IEwtE0OEll26LYksrvokmsukNg4Rl/y71aB7XUdL/Qp?=
 =?us-ascii?Q?hY9oQ56ZIyOA2qw7hqmD8TZXRHLLgTUcHEzoCXkMNyO/+7VvPOeyDWtSuHto?=
 =?us-ascii?Q?qTKTVRA/obxLTpJXlIvl6pcGrjplifHqrvcgv4bTODLj7MkhBwBjD2EcFa1H?=
 =?us-ascii?Q?Og4Sw+9eGw2HM58BtMw+H/0NKzk546rNU4gL4BuIsP1sFbhsDkK2K7E/qZXX?=
 =?us-ascii?Q?0ZHU8qn87+GL1En+xdf3XtoxKxdAgdaHd10AfMserFBFQPh+3+H8vMpKett1?=
 =?us-ascii?Q?v/mzBV6ccsiNYGX+/0Wf5Rzg+UyDjRKA70s31d3UsPmYWOreDd7WB9UGfBpb?=
 =?us-ascii?Q?9jetzOin5mBENE9iOTKT1jwYVhAy5ehMu0xqxqVPhzwukdOhzeqWdVmzTYN9?=
 =?us-ascii?Q?6dWReIKZf2xjVwmDcELPtFqvKchI/8rVdeHmhvZjq2FZnj8kEmkl6iMCW4Eo?=
 =?us-ascii?Q?N+FuJAA7D1Yn800tfo7hn7Vth/r3x6IBQgWP1d0z5mAq9ST0iZVHajug4t7b?=
 =?us-ascii?Q?7pZ/xUbnrUh6C62IEFgh4UZYxtI5rIDmqXG1jd9o9OQ/uS07DiMT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715b7de2-3f61-466c-6c28-08df49a30289
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:47:38.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo8iAJaVvP941clQmNZIJnT846x7rikSuPOGRot3qSa/eN2yz174KxIJ2czX8Ks2I+zVTazQEi/9byZ2/rtz3lg6y4gPjdZCFN+NtF8iy4uYz2oGCWaDR6HAV40lGHas
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB11255

On Sat, Nov 14, 2026 at 08:33:47AM -0800, Guenter Roeck wrote:
> On Thu, Nov 12, 2026 at 08:52:27PM +0000, Pablo Mazzini wrote:
> > The driver enables VCOM at probe, which keeps the panel's high voltage
> > rails on for good. Read the temperature only while the rails are on, when
> > the chip samples it, and return -ENODATA otherwise. Read power good with
> > it in one transfer, so the value can not be from before the first sample
> > or after the rails went off.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
>
> This patch depends on the rest of the patch series, so I can not apply it
> to a hwmon branch. Assuming it will be applied to some other branch,

Guenter:

Do you meand depend on CONFIG_MFD_SY7636A=y
https://lore.kernel.org/all/20261112205228.42630-3-pmazzini@gmail.com/

Frank

>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++-----------
> >  1 file changed, 24 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> > index a0d0b4119bb3..a8bfbf1716a1 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -9,26 +9,43 @@
> >   */
> >
> >  #include <linux/auxiliary_bus.h>
> > +#include <linux/bits.h>
> >  #include <linux/err.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/module.h>
> >  #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h>
> >
> > -#define SY7636A_REG_TERMISTOR_READOUT	0x08
> > +#define SY7636A_REG_FAULT_FLAG		0x07
> > +#define SY7636A_FAULT_FLAG_PG		BIT(0)
> >
> >  static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
> >  			u32 attr, int channel, long *temp)
> >  {
> >  	struct regmap *regmap = dev_get_drvdata(dev);
> > -	int ret, reg_val;
> > -
> > -	ret = regmap_read(regmap,
> > -			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > +	u8 buf[2];
> > +	int ret;
> > +
> > +	/*
> > +	 * The thermistor is sampled while ON_OFF is set, but the first sample
> > +	 * is only ready after the ADC sampling and conversion time (ADC_SPL +
> > +	 * ADC_DEL in the datasheet); until then it holds its reset value, 0.
> > +	 * PG is only set once all rails are up, after the first sample, so
> > +	 * read it in the same transfer and report the temperature only while
> > +	 * it is set.
> > +	 *
> > +	 * With ON_OFF set but PG low (rails still ramping up, or a fault), no
> > +	 * temperature is reported even if one may be available. That is
> > +	 * accepted: the display driver reads the temperature only while it
> > +	 * holds the rails on, after power good.
> > +	 */
> > +	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
> >  	if (ret)
> >  		return ret;
> >
> > -	*temp = reg_val * 1000;
> > +	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> > +		return -ENODATA;
> > +
> > +	*temp = (s8)buf[1] * 1000;
> >
> >  	return 0;
> >  }
> > @@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
> >  	if (!regmap)
> >  		return -ENODEV;
> >
> > -	err = devm_regulator_get_enable(&adev->dev, "vcom");
> > -	if (err)
> > -		return err;
> > -
> >  	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
> >  							 "sy7636a_temperature", regmap,
> >  							 &sy7636a_chip_info, NULL);
