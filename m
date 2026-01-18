Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAF2296BC1;
	Sun, 18 Jan 2026 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757455; cv=fail; b=bTn4bEZ2vIGLwWzyb1wZML2oR37KixxD7ZJUrlw4PLKOuYlT/0zDLQ4vwvi4upJF1+8nJcaQOXG4sfeUjErnQ4/uURaz8zswVJEign1zBgnhb6wBSaU7DbVNp+8UNM2PZ0X479468FaYpAv4b5VuXKC8114PijwRIedhH0sD3eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757455; c=relaxed/simple;
	bh=0taY6AADZ/Pcju3VPegGMGJ9VlgqPUxhOdGzEuGWcFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zos8F71G7tHFrKpl+Nz5WUu7N8O85cfYE4yZguDgpzbEDYraek0EY+cXnEVVHyrv2eoWyuBbEB3s7HVjQgRW1moVtJ9T1/u2R3Y7uMBzQdqngbXDcq/Wsw8M1moQXl0vYqX9krVQzrM3ivz6Z9+xja4C7E6kvJYg1YMivlU9K0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BWk6DFwH; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BWk6DFwH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9TU/eJGWaH1EyFTI0CbaYWXo0a2JU7JcFswEtdUPbKTrmTQuwlzLU2e+NHmA15lnhPb8okqRM/O44LWVVNA6NDC1L8CrF9XpI6D3nfMju/eVP4nxXT4qVFc261FZrYZpqndRVk4HYKq/DZWl1sWohNgwkQf72kjYR803A1aeCOUFNreCSZWSXd1KcjIsdAaJCNz42rOkk6H4DKVYIQnobXd7PpELOr9pNRfjXMqa6J3pB/598dUnwA6t+NimXvMIb2YVDhE2kIC5oeqG3iv/zL+ogFIvqivUIIX34TWutPw0c3ArAsaBf/PTE7jg1EtyMUbA6Xpa0phDYbo7rkZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43tkz+ZXEAd8f3dfOu0DVpOKrZ2+HmqTvpQLa1mYZ6M=;
 b=QlzR8Uoyi5Y5MnsDllsnyRglQNFYIrEEWx49+UtDl9JJfwidWB3OQ1atRhqeusc2OvWTrFLxroRJZm8Ra5rFnZ1hynI8hf0Tsxcd6aDbrAHsAlDHqumvuSmtc5L1bZhOwJrPc8QlmImsz9SENFReigi254MEpAnk7C8+zAJ5TEM0ltn8kWh1wcDpLukWXD+EK+KrtuUhmZHH01r9hoLBwuLDDxdXMhrZgGVfmCVsG1NycJ2jkKtRmeL9XKBtm9U/hozAO5BTAWPlclBdOYXigrtFKeAgWzxYsf1q3d35xXGP/lw8/GVYTNFSR59XjYW1Jgw3kkZAnU+On/UC6YbbsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43tkz+ZXEAd8f3dfOu0DVpOKrZ2+HmqTvpQLa1mYZ6M=;
 b=BWk6DFwHnj/7qc+ezytLl25gBgbpK5u5lan/HxOy73iGTuQcR3A7BMdffg1dmWrM+0d2YxNZ/SsTeZrkql8bPfBOd6rMBQNa6lguXyz1oBUaDzbBA+o1XHGh4kQOVRnU9pHQD1e8BHq/xyOGjLEJ2pAZwkiO1BlvUYi1FeaEJwwg52BYFWQb91AOEktL404XWVCq1HqB7MD6msEYfcYVb822a5twl2S64r/5McKZcSaeHV4WgCUHNi3Zw64X+H7qjPaYrnXZOIgWU33Xp/BtVwgCdpVoFyDEqBLKrCkaev+3YFz3cdJ1EJSBAVCIMj1BGzyeglA7QintXl/Iqms3eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB11686.eurprd04.prod.outlook.com (2603:10a6:150:2c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sun, 18 Jan
 2026 17:30:49 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 17:30:49 +0000
Date: Sun, 18 Jan 2026 12:30:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mayank Mahajan <mayankmahajan.x@nxp.com>, corbet@lwn.net,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	priyanka.jain@nxp.com, vikash.bansal@nxp.com
Subject: Re: [PATCH v4 2/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
Message-ID: <aW0Ywij9SDXPDMIj@lizhi-Precision-Tower-5810>
References: <20260116113554.986-1-mayankmahajan.x@nxp.com>
 <20260116113554.986-2-mayankmahajan.x@nxp.com>
 <aWq7d5XOpeUYdlzg@lizhi-Precision-Tower-5810>
 <5e4c5665-9094-4ed0-9b7e-0d7c565ad33c@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e4c5665-9094-4ed0-9b7e-0d7c565ad33c@roeck-us.net>
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB11686:EE_
X-MS-Office365-Filtering-Correlation-Id: c83fc22a-bc91-4a95-eef3-08de56b7526e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JJ/59je43zGaX7tdUaisiGMXlSr80oquj4/JxsGGGCjiEgDOeMgKXIgTnNJu?=
 =?us-ascii?Q?4WuV8wLMRKCN7uPE8iInUdBsK9qu8S6KJtp8x+kmOzsLlFc0J1EPWeFf9wsV?=
 =?us-ascii?Q?tUNPQFVPIotmDGYaJfbpZ2pJvywu/U4thDr3JHQiS0LLSOX40KfjQ36ejVnP?=
 =?us-ascii?Q?hU6hN2xypfO7Fs9K002Cz7SzMKF3RWbvpsOfB+Pt2YI6uIL/wqMTCI2wAwr5?=
 =?us-ascii?Q?9DQ9YaN2OsNKBU+3pU4Gr0Fj2tTJeyFwitFEXcyQW1taVsicE95Um9mbbUQz?=
 =?us-ascii?Q?Y7oAF5KA4dviaThMvaM/xu0g9KsRK4zazWk5yDmGmmKVVr0fgwYnW3QvJsPC?=
 =?us-ascii?Q?AHU//n81mIwP1TMmuJ9SL2Mp8pUMQzLr9dYcHkuAxp+44Na759mvcpA41geA?=
 =?us-ascii?Q?W3q0ZZ02kpj7vZV+gthIeajMPFzMaKQWoRQc7qRl8XbbZe+UecZAU/BlfmNV?=
 =?us-ascii?Q?uujzQYYIlPYURZWw6YNeAyX63GIrzw0WcONgBMKtzhOiK+XhQ4iwub0xb/q3?=
 =?us-ascii?Q?vafFpOloSNY6c9ldMsaJQl2U7J1l29aMMmE1S5+E8R/3hBNPHtQbIv0EXgnC?=
 =?us-ascii?Q?yGEzCfj77p3VPIIQT+zM632xXYc7+hl+UDnCgO+PscntrVKSmYMNSGgTelLl?=
 =?us-ascii?Q?aSl30T+Na+Gyx5yYDRBArx5CvEST6AiVCsX+YFqda4tH8vxGWCQAc6PnahVP?=
 =?us-ascii?Q?cvwB4MkOMyYLDbExBoJ87mjvlJxrWscIL2gLbZdaaARN0fvyEh4313+18ctv?=
 =?us-ascii?Q?G/VEpthgnlhsDx9YpJfrHTEEGxbve96Hs0CQ5PakouIQ9hv4ifD4cZZIaC7R?=
 =?us-ascii?Q?+FXtuAbNI0GA474rF62pyXN992D4yOoZA+mbEt+HvGeVtJWAWtNm5/SRw5ut?=
 =?us-ascii?Q?qLf1Nf19CbWeXciJ5cjSTIJw5C9X+/S/uLu0MfP0iezMGu6UkFNx8hg7ii6Z?=
 =?us-ascii?Q?ce2PMym/DVl0vPQlD7k/Dy5Eiln2OZZc9inUx5V9NDoiUOdizFMqHg+MceiS?=
 =?us-ascii?Q?z5kYTty0ktpdG56/c4c4s9oiaVvVZWuTMFWYcGSi+Mf40rDQ1gPNt8sj4V30?=
 =?us-ascii?Q?EhgxBNyRysbTr9IPFeASbDEr0PooWvVgtJCN248AqICwxoOKTVN9xSvWcvMB?=
 =?us-ascii?Q?WZJQ7HgMSkBcsP5so+8QLj7zcig2iQOh08rdIIxCRWc+CQvX5RGsVkM/brPN?=
 =?us-ascii?Q?eK1ffVn96NCMfrdjXoLPDtGKxkdJWaYJBFhEKjoI1LoTQD+svIwV5PQTSkOU?=
 =?us-ascii?Q?LA+oBfy0buvoJl3/CW8VyZA6H0b1HMknfrl9JDlKONTFXw/fT4B3sOU5HKlZ?=
 =?us-ascii?Q?zIDzN5zf2PpsnxnCIWYBCqqsBTtnVSUN1CtXL1kKR3StHtwLP28205EXGiAW?=
 =?us-ascii?Q?iigJZj3mdOpWMfjfnwEye592B9sywz7aq3/1D5CiHrJIhD3aVQfpAZw6q1nB?=
 =?us-ascii?Q?LBHNxDLccHlkonH598sw8+L9FDHSlvVF3AnTGBFh86MM/ZG0BonbC2NsLOA5?=
 =?us-ascii?Q?SPmBEM2/wwdapdBucfkiSZjyCMj2NvXR4b8SzuA8vRoF9Pcc2MCiYvO1UEZ1?=
 =?us-ascii?Q?K1M818LdFb4QfTTluegkRf3qEDjxyA0QikpBv4vOmcTKz+4CdwovRU5ep3Rj?=
 =?us-ascii?Q?I9aTdkyxYyPIrMy8L2124wk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Buj+cdEZWi+5CoCd9WOOoEedGejPzIgbY5ZuYOhO6f+MNzXTxtIqW1HzIUj/?=
 =?us-ascii?Q?UvHpgWPefnek+VmMOn769GZLy8m2xdDqqpJ3yWB06u7R9cWT+TSjVrAa7WQ5?=
 =?us-ascii?Q?wZ8rU/XVafWfVAUJyCyJbakMO0jslCpiNLFj8TvpP5zLGIP1JyYUqL8J6/L6?=
 =?us-ascii?Q?q/Zqu3PU2LYnRlnK3rdg+v7b7WgOaFuLsJy2dpVZhloFue219hcFLrRnXrxT?=
 =?us-ascii?Q?gDtWxWpCS+9pxHuXwHWaEjSi0H1B/xFZBBE1WDOd1N1IK9QLInIat4e2Gvea?=
 =?us-ascii?Q?hZpgRt4k5H2Wk9WYNbV9uVJBPv3b3qR97WUkaYA0cyhtM1q7oAnnFbEAz4qj?=
 =?us-ascii?Q?qFLQ/Qo/CXxe8FzfFWhOFAMpE/gXe42qQ867MeOnyJ0g9aRSrLzgxqIj32BU?=
 =?us-ascii?Q?DYSyE/2kRpkm4eROtCaKu4MmScquCn5rZcxLFMT+K4GcSej72CAVLQq0VKgG?=
 =?us-ascii?Q?a2Q7Ii1kKjrPKTcApMp7KiB0zTawXlWlkZx3oozGmbq+yLZG/hxj4ym9i8Gn?=
 =?us-ascii?Q?u1C4X//w3dnJSZGRYZ5QvFwQ8Wo+JH+GnvU44+n49Zk4gDXyGbyVhVKcxPF/?=
 =?us-ascii?Q?JPZ/dyhwKkxxWZUxBYVFCo3OrMIBc4uWIQd3HCwyk7P9CCb7Q2YvBldpgWsv?=
 =?us-ascii?Q?qm8k/xAreErIxotDWjJp69V0NMbIIUf56f2UPidhN/UKO9fEIeiWah/4KkjK?=
 =?us-ascii?Q?RXGQIVo/+/hiIJp9qTUrCAqstrj7BkTyRp7I+Gd/Tl1FP74lrakJe5hYtV48?=
 =?us-ascii?Q?fIRtld73tVo0A1+7UU/eHUlWWuiezuqLMpn+nuXwAQWaGNsJAHMO7BtfX/2x?=
 =?us-ascii?Q?bXoySLrriuD3SBGkxuuSRUqlefayQNjNHKxXBdoSrCDEt/bO/4hCjU6iC2Nv?=
 =?us-ascii?Q?za0b0bNjC48RKVg7i1Y23iR4tHTCXDLY4Ay/i1LxqsYEnJEDLND9EDM2cZqC?=
 =?us-ascii?Q?ZdL5QArBlL/7JqKwMPneqUbJaxrutl2rjR34UCnIOMNeAsBE2u1iFrh1BAe/?=
 =?us-ascii?Q?oomd5rouejO6Aa9zQhed4TDo7AWwWzUWm6Uj8PK5IgJgf2N8JMAFDCQKf4me?=
 =?us-ascii?Q?H0hjJTmQ+jZvICHyPHhnAyaqV1CW0Y94uPJ1rH/S9ouF6Q4HLCvcYtOu4Q8f?=
 =?us-ascii?Q?n7wCq9Iwj4awLjrg0ace8vgLyu3KEP4EFeV+6hzHpsmxol4Mx7Xl4Ud1AdwK?=
 =?us-ascii?Q?a/fiZevXMTA/TZZVtpn680lJTv3iETuIl5ByqON2ceB1Rn1QahClwCjnk88q?=
 =?us-ascii?Q?83uDMuziVZMThjPwFimjDugXB319pPN4z1WIkZr+UqC8Sdzfa4/vIH0QKuTu?=
 =?us-ascii?Q?vJSLmEinKHyM48lgjA4VR30TTGW1FX2duv5rrMnL1qYR872JdWxDrTza6WB3?=
 =?us-ascii?Q?ARX9SyIt4kSvgmNa8Mu7bE++5ewlGznR+neUccKbyUVgte/mtO4mzCmImxx3?=
 =?us-ascii?Q?tEanVZ7c9GBS+X5ywGsm4iAhagQDmLz73JDZ96aFd6Y16xKbe29vohDe3Hmv?=
 =?us-ascii?Q?E5udQqSjB+gGoB9eh/mT5eWpjmcWQ8EdeA/BHmnGIUgNIgk5HGgaMbg9z4tE?=
 =?us-ascii?Q?rS6RIdEHtz76MlSwdzl10ZvqbL3+gErYwkXR9gaAWz5wTFFoCSy5PZ4RRdrY?=
 =?us-ascii?Q?fjJIv4Gxly63sdVjGyRPxWBxaIaHGgB45J7CriKsOc/6vJJpV7OHXTzwTZhx?=
 =?us-ascii?Q?ympI598oGK/pout5M3wPvQbpNhj44L50HBRD3zCIqmW2UdLiuuitDFq8CjcQ?=
 =?us-ascii?Q?HSBBk8SsNw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83fc22a-bc91-4a95-eef3-08de56b7526e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 17:30:49.7024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rRKONDv61q6A7uwQYLQRcuvDBXo4oGkkQCFHk210QquPlaVbz+uRqpkMakJ932Gda+qO2u7WL422PXArv+2yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11686

On Fri, Jan 16, 2026 at 04:36:59PM -0800, Guenter Roeck wrote:
> On 1/16/26 14:28, Frank Li wrote:
> > On Fri, Jan 16, 2026 at 05:05:53PM +0530, Mayank Mahajan wrote:
> > > Add support for the P3T1035 & P3T2030 temperature sensor. While mostly
> > > compatible with the TMP108, P3T1035 uses an 8-bit configuration register
> > > instead of the 16-bit layout used by TMP108. Updated driver to handle
> > > this difference during configuration read/write.
> > >
> > > Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
> > > ---
> > > V1 -> V2:
> > > - Disabled hysteresis in is_visible function for P3T1035.
> > > - Added tables for conversion rate similar to the LM75 driver.
> > > - Implemented different bus access depending on the chip being used.
> > >     - Removed regmap for 8 bits; now we are using one regmap as before.
> > >     - Added read and write functions for i2c and i3c for use with regmap.
> > >     - Mapped the 8-bit configuration register to a 16 bit value for P3T1035.
> > > V2 -> V3:
> > > - Remove changes not relevant to adding a new device in the driver.
> > > - Address warnings due to incorrect usage of casting operations.
> > > - Remove the usage of P3T2030 as it's functionally identical to P3T1035.
> > > V3 -> V4:
> > > - Add GENMASK for getting mask for conversion rates.
> > > - Add static arrays for containing sample times for different sensors.
> > > - Remove redundant code such as checking for NULL pointer in probe.
> > > - Improve readability by removing double negation.
> > > - Remove type cast where not required; make reg_buf & val_buf local.
> > >
> > >   drivers/hwmon/Kconfig  |   2 +-
> > >   drivers/hwmon/tmp108.c | 203 +++++++++++++++++++++++++++++++++--------
> > >   2 files changed, 164 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > index 157678b821fc..31969bddc812 100644
> > > --- a/drivers/hwmon/Kconfig
> > > +++ b/drivers/hwmon/Kconfig
> > > @@ -2398,7 +2398,7 @@ config SENSORS_TMP108
> > >   	select REGMAP_I3C if I3C
> > >   	help
> > >   	  If you say yes here you get support for Texas Instruments TMP108
> > > -	  sensor chips and NXP P3T1085.
> > > +	  sensor chips, NXP temperature sensors P3T1035, P3T1085 and P3T2030.
> > >
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called tmp108.
> > > diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> > > index 60a237cbedbc..d308e2aed18a 100644
> > > --- a/drivers/hwmon/tmp108.c
> > > +++ b/drivers/hwmon/tmp108.c
> > > @@ -17,9 +17,16 @@
> > >   #include <linux/regmap.h>
> > >   #include <linux/regulator/consumer.h>
> > >   #include <linux/slab.h>
> > > +#include <linux/util_macros.h>
> > >
> > >   #define	DRIVER_NAME "tmp108"
> > >
> > > +enum tmp108_hw_id {
> > > +	P3T1035_ID,		/* For sensors p3t1035 and p3t2030 */
> > > +	P3T1085_ID,
> > > +	TMP108_ID,
> > > +};
> > > +
> > >   #define	TMP108_REG_TEMP		0x00
> > >   #define	TMP108_REG_CONF		0x01
> > >   #define	TMP108_REG_TLOW		0x02
> > > @@ -61,6 +68,7 @@
> > >   #define TMP108_CONVRATE_1HZ		TMP108_CONF_CR0		/* Default */
> > >   #define TMP108_CONVRATE_4HZ		TMP108_CONF_CR1
> > >   #define TMP108_CONVRATE_16HZ		(TMP108_CONF_CR0|TMP108_CONF_CR1)
> > > +#define TMP108_CONVRATE_SHIFT		13
> > >
> > >   #define TMP108_CONF_HYSTERESIS_MASK	(TMP108_CONF_HYS0|TMP108_CONF_HYS1)
> > >   #define TMP108_HYSTERESIS_0C		0x0000
> > > @@ -70,12 +78,23 @@
> > >
> > >   #define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */
> > >
> > > +#define TMP108_CONF_CR0_POS		13
> > > +#define TMP108_CONF_CR1_POS		14
> > > +#define TMP108_CONF_CONVRATE_FLD	GENMASK(TMP108_CONF_CR1_POS, TMP108_CONF_CR0_POS)
> > > +
> > >   struct tmp108 {
> > > -	struct regmap *regmap;
> > > -	u16 orig_config;
> > > -	unsigned long ready_time;
> > > +	struct regmap		*regmap;
> > > +	u16			orig_config;
> > > +	unsigned long		ready_time;
> >
> > don't mix format change in this patch.
> > Now prefer orignial format, just one space between type and field.
> >
> > > +	enum tmp108_hw_id	hw_id;
> > > +	bool			config_reg_16bits;
> > > +	ushort			*sample_times;
> > > +	size_t			n_sample_times;
> > >   };
> > >
> > > +ushort p3t1035_sample_times[] = {4000, 1000, 250, 125};
> > > +ushort tmp108_sample_times[] = {4000, 1000, 250, 63};
> > > +
> > >   /* convert 12-bit TMP108 register value to milliCelsius */
> > >   static inline int tmp108_temp_reg_to_mC(s16 val)
> > >   {
> > > @@ -101,21 +120,7 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
> > >   					  &regval);
> > >   			if (err < 0)
> > >   				return err;
> > > -			switch (regval & TMP108_CONF_CONVRATE_MASK) {
> > > -			case TMP108_CONVRATE_0P25HZ:
> > > -			default:
> > > -				*temp = 4000;
> > > -				break;
> > > -			case TMP108_CONVRATE_1HZ:
> > > -				*temp = 1000;
> > > -				break;
> > > -			case TMP108_CONVRATE_4HZ:
> > > -				*temp = 250;
> > > -				break;
> > > -			case TMP108_CONVRATE_16HZ:
> > > -				*temp = 63;
> > > -				break;
> > > -			}
> > > +			*temp = tmp108->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD, regval)];
> >
> > This code optimation need seperate patch.
> >
> No, There are now two ranges, not just one.

Previous code use swtich case to handle sample. now convert to use a map
array tmp108_sample_times[].

My means use a small patch convert existed switch case to map array firstly
, then add second range, which make code easy to review.

>
> > >   			return 0;
> > >   		}
> > >   		return -EOPNOTSUPP;
> > > @@ -192,22 +197,17 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
> > >   {
> > >   	struct tmp108 *tmp108 = dev_get_drvdata(dev);
> > >   	u32 regval, mask;
> > > +	u8 index;
> > >   	int err;
> > >
> > >   	if (type == hwmon_chip) {
> > >   		if (attr == hwmon_chip_update_interval) {
> > > -			if (temp < 156)
> > > -				mask = TMP108_CONVRATE_16HZ;
> > > -			else if (temp < 625)
> > > -				mask = TMP108_CONVRATE_4HZ;
> > > -			else if (temp < 2500)
> > > -				mask = TMP108_CONVRATE_1HZ;
> > > -			else
> > > -				mask = TMP108_CONVRATE_0P25HZ;
> > > +			index = find_closest_descending(temp, tmp108->sample_times,
> > > +							tmp108->n_sample_times);
> >
> > Need seperate patch for the code cleanup.
> >
>
> No. There are now two ranges, not just one. That is not a code cleanup,
> it is a change necessary to support multiple sets of ranges.


The smae here, this code just convert if else to helper function
find_closest_descending(), which is not related work, which add new
part support.

Frank
>
> Guenter
>
> > >   			return regmap_update_bits(tmp108->regmap,
> > >   						  TMP108_REG_CONF,
> > >   						  TMP108_CONF_CONVRATE_MASK,
> > > -						  mask);
> > > +						  FIELD_PREP(TMP108_CONF_CONVRATE_FLD, index));
> > >   		}
> > >   		return -EOPNOTSUPP;
> > >   	}
> > > @@ -251,6 +251,8 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
> > >   static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
> > >   				 u32 attr, int channel)
> > >   {
> > > +	const struct tmp108 *tmp108 = data;
> > > +
> > >   	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
> > >   		return 0644;
> > >
> > > @@ -264,8 +266,11 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
> > >   		return 0444;
> > >   	case hwmon_temp_min:
> > >   	case hwmon_temp_max:
> > > +		return 0644;
> > >   	case hwmon_temp_min_hyst:
> > >   	case hwmon_temp_max_hyst:
> > > +		if (tmp108->hw_id == P3T1035_ID)
> > > +			return 0;
> > >   		return 0644;
> > >   	default:
> > >   		return 0;
> > > @@ -311,6 +316,106 @@ static bool tmp108_is_volatile_reg(struct device *dev, unsigned int reg)
> > >   	return reg == TMP108_REG_TEMP || reg == TMP108_REG_CONF;
> > >   }
> > >
> > > +static int tmp108_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
> > > +{
> > > +	struct i2c_client *client = context;
> > > +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> > > +	int ret;
> > > +
> > > +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits) {
> > > +		ret = i2c_smbus_read_byte_data(client, TMP108_REG_CONF);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +		*val = ret << 8;
> > > +		return 0;
> > > +	}
> > > +
> > > +	ret = i2c_smbus_read_word_swapped(client, reg);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +	*val = ret;
> > > +	return 0;
> > > +}
> > > +
> > > +static int tmp108_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
> > > +{
> > > +	struct i2c_client *client = context;
> > > +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> > > +
> > > +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> > > +		return i2c_smbus_write_byte_data(client, reg, val >> 8);
> > > +	return i2c_smbus_write_word_swapped(client, reg, val);
> > > +}
> > > +
> > > +static const struct regmap_bus tmp108_i2c_regmap_bus = {
> > > +	.reg_read = tmp108_i2c_reg_read,
> > > +	.reg_write = tmp108_i2c_reg_write,
> > > +};
> > > +
> > > +static int tmp108_i3c_reg_read(void *context, unsigned int reg, unsigned int *val)
> > > +{
> > > +	struct i3c_device *i3cdev = context;
> > > +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> > > +	u8 reg_buf[1], val_buf[2];
> > > +	struct i3c_xfer xfers[] = {
> > > +		{
> > > +			.rnw = false,
> > > +			.len = 1,
> > > +			.data.out = reg_buf,
> > > +		},
> > > +		{
> > > +			.rnw = true,
> > > +			.len = 2,
> > > +			.data.in = val_buf,
> > > +		},
> > > +	};
> > > +	int ret;
> > > +
> > > +	reg_buf[0] = reg;
> > > +
> > > +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> > > +		xfers[1].len--;
> > > +
> > > +	ret = i3c_device_do_xfers(i3cdev, xfers, 2, I3C_SDR);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	*val = val_buf[0] << 8;
> > > +	if (reg != TMP108_REG_CONF || tmp108->config_reg_16bits)
> > > +		*val |= val_buf[1];
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int tmp108_i3c_reg_write(void *context, unsigned int reg, unsigned int val)
> > > +{
> > > +	struct i3c_device *i3cdev = context;
> > > +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> > > +	u8 val_buf[3];
> > > +	struct i3c_xfer xfers[] = {
> > > +		{
> > > +			.rnw = false,
> > > +			.len = 3,
> > > +			.data.out = val_buf,
> > > +		},
> > > +	};
> > > +
> > > +	val_buf[0] = reg;
> > > +	val_buf[1] = (val >> 8) & 0xff;
> > > +
> > > +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> > > +		xfers[0].len--;
> > > +	else
> > > +		val_buf[2] = val & 0xff;
> > > +
> > > +	return i3c_device_do_xfers(i3cdev, xfers, 1, I3C_SDR);
> > > +}
> > > +
> > > +static const struct regmap_bus tmp108_i3c_regmap_bus = {
> > > +	.reg_read = tmp108_i3c_reg_read,
> > > +	.reg_write = tmp108_i3c_reg_write,
> > > +};
> > > +
> > >   static const struct regmap_config tmp108_regmap_config = {
> > >   	.reg_bits = 8,
> > >   	.val_bits = 16,
> > > @@ -323,7 +428,8 @@ static const struct regmap_config tmp108_regmap_config = {
> > >   	.use_single_write = true,
> > >   };
> > >
> > > -static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
> > > +static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
> > > +			       enum tmp108_hw_id hw_id)
> > >   {
> > >   	struct device *hwmon_dev;
> > >   	struct tmp108 *tmp108;
> > > @@ -340,6 +446,15 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
> > >
> > >   	dev_set_drvdata(dev, tmp108);
> > >   	tmp108->regmap = regmap;
> > > +	tmp108->hw_id = hw_id;
> > > +	tmp108->config_reg_16bits = (hw_id == P3T1035_ID) ? false : true;
> > > +	if (hw_id == P3T1035_ID) {
> > > +		tmp108->sample_times = p3t1035_sample_times;
> > > +		tmp108->n_sample_times = ARRAY_SIZE(p3t1035_sample_times);
> > > +	} else {
> > > +		tmp108->sample_times = tmp108_sample_times;
> > > +		tmp108->n_sample_times = ARRAY_SIZE(tmp108_sample_times);
> > > +	}
> > >
> > >   	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
> > >   	if (err < 0) {
> > > @@ -351,7 +466,6 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
> > >   	/* Only continuous mode is supported. */
> > >   	config &= ~TMP108_CONF_MODE_MASK;
> > >   	config |= TMP108_MODE_CONTINUOUS;
> > > -
> > >   	/* Only comparator mode is supported. */
> > >   	config &= ~TMP108_CONF_TM;
> > >
> > > @@ -384,17 +498,20 @@ static int tmp108_probe(struct i2c_client *client)
> > >   {
> > >   	struct device *dev = &client->dev;
> > >   	struct regmap *regmap;
> > > +	enum tmp108_hw_id hw_id;
> > >
> > >   	if (!i2c_check_functionality(client->adapter,
> > > -				     I2C_FUNC_SMBUS_WORD_DATA))
> > > +				     I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> > >   		return dev_err_probe(dev, -ENODEV,
> > >   				     "adapter doesn't support SMBus word transactions\n");
> > >
> > > -	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> > > +	regmap = devm_regmap_init(dev, &tmp108_i2c_regmap_bus, client, &tmp108_regmap_config);
> > >   	if (IS_ERR(regmap))
> > >   		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
> > >
> > > -	return tmp108_common_probe(dev, regmap, client->name);
> > > +	hw_id = (unsigned long)i2c_get_match_data(client);
> > > +
> > > +	return tmp108_common_probe(dev, regmap, client->name, hw_id);
> > >   }
> > >
> > >   static int tmp108_suspend(struct device *dev)
> > > @@ -420,15 +537,17 @@ static int tmp108_resume(struct device *dev)
> > >   static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
> > >
> > >   static const struct i2c_device_id tmp108_i2c_ids[] = {
> > > -	{ "p3t1085" },
> > > -	{ "tmp108" },
> > > -	{ }
> > > +	{ "p3t1035", P3T1035_ID },
> > > +	{ "p3t1085", P3T1085_ID },
> > > +	{ "tmp108", TMP108_ID },
> > > +	{}
> > >   };
> > >   MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
> > >
> > >   static const struct of_device_id tmp108_of_ids[] = {
> > > -	{ .compatible = "nxp,p3t1085", },
> > > -	{ .compatible = "ti,tmp108", },
> > > +	{ .compatible = "nxp,p3t1035", .data = (void *)(uintptr_t)P3T1035_ID },
> > > +	{ .compatible = "nxp,p3t1085", .data = (void *)(uintptr_t)P3T1085_ID },
> > > +	{ .compatible = "ti,tmp108", .data = (void *)(uintptr_t)TMP108_ID },
> >
> > Do not use device ID, define struct drvdata
> >
> > 	struct tmp108_drvdata
> > 	{
> > 		.samples = p3t1035_sample_times;
> > 		.reg_width = 16,
> > 		...
> > 	}
> >
> > Frank
> > >   	{}
> > >   };
> > >   MODULE_DEVICE_TABLE(of, tmp108_of_ids);
> > > @@ -444,7 +563,8 @@ static struct i2c_driver tmp108_driver = {
> > >   };
> > >
> > >   static const struct i3c_device_id p3t1085_i3c_ids[] = {
> > > -	I3C_DEVICE(0x011b, 0x1529, NULL),
> > > +	I3C_DEVICE(0x011B, 0x1529, (void *)P3T1085_ID),
> > > +	I3C_DEVICE(0x011B, 0x152B, (void *)P3T1035_ID),
> > >   	{}
> > >   };
> > >   MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> > > @@ -453,13 +573,16 @@ static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
> > >   {
> > >   	struct device *dev = i3cdev_to_dev(i3cdev);
> > >   	struct regmap *regmap;
> > > +	const struct i3c_device_id *id;
> > >
> > > -	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
> > > +	regmap = devm_regmap_init(dev, &tmp108_i3c_regmap_bus, i3cdev, &tmp108_regmap_config);
> > >   	if (IS_ERR(regmap))
> > >   		return dev_err_probe(dev, PTR_ERR(regmap),
> > >   				     "Failed to register i3c regmap\n");
> > >
> > > -	return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
> > > +	id = i3c_device_match_id(i3cdev, p3t1085_i3c_ids);
> > > +
> > > +	return tmp108_common_probe(dev, regmap, "p3t1085_i3c", (unsigned long)id->data);
> > >   }
> > >
> > >   static struct i3c_driver p3t1085_driver = {
> > > --
> > > 2.34.1
>
