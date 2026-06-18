Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A85258EF9;
	Thu, 18 Jun 2026 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812844; cv=fail; b=J4AJJ53pZUB72mV1N8FeuRLMZQfPL+u2Hgty9bpUjUHi+S6d4KYP0UgX6++83YFoZOiGT0ucOPsYhX8n86rIeO06kiONBPhe759cMsTiCLfqlUzGbVDrmsSi+stL43eCp/Ay4ZpwuqE/YwOXQimsry5NthDfG7iDjHO5eCudDBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812844; c=relaxed/simple;
	bh=28aV7So9QEqHNjiNHDIA7RWjOduJzB7+3KCB0Pkiq7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZEWnz9dVsm9uyzaObSatZ7pM9kYSf4+10wJ9ppATidvfHrXZvDI5XHUVbkkPjfVF4dTJzD7vasYkcPwOt77XUjmoMdBKXFnkMu+U6G8SZ4ZEAcunxX5paFscFfK3hu9p3dOHKkPo/UtxVPNTVIy3dn/46WNKgAsvl7pjNy5eII4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X3FWW2Au reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X3FWW2Au"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0Frh0afU8lNgoXkKTcaOIimDyfNGwOJEDx0EBWmcdTI0n1vFQJ/arHCSd1h91HofA3YnzYPtMAZOx7xnXbsRTbF0Oqvf70aZPdjSRTtNJ6A7azGo5Zt6p5V2e8P7oW0f7T00qTh4NNuHYgH83b8RDUAhHOChOlg3btleTojvU7ZJ9za5AUI+NSlqmmPhE7JZmoUi5msgX7q9kpicTVUQeW5DbX4kj7bjQcLTeZpTtYdBiq6PdXlvMAmOT6aOkPSIRhbiZN/8xT3RBCXOR7RBMrzsKIzlyideDt1D57VaqFgjCwyepsasvO8TkLhOwHkyOs7FoHrzW4S8BwVlJJihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4Wnw6E7k/bjxFRXmGaJKHqixrzeffOCaTmKPJpDg3A=;
 b=RT4LwvQ6xeN1aw6dYLwSlWMlG8IjJKHY36YH5qVjFv5rxO2Ry6lj9+KSCUpQSulAX1V0PSQN9R38LZ20lLd8x2fgYNyl7yINDjm607OPRpTDiRbbrNkVFbhNdZMiETHnTo7slb7HDMpw4duTQB7EO5K059jW+gx4m0wFbRVKup2wDzEbACUNB0v6r8fzndhVQEhX5NCs6De5HT5r32xPfqCsW0SnI+SM1Z950iT6u15wEZV95wQVFuVnLWpv+3ixwd48U/N+67qebHWOnhsLPAwXr9W0zYt3G4YKk1WYnhPczEv2OjzRVFSqHZONPRSjLlORd0geVz1SRe9W9SUSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4Wnw6E7k/bjxFRXmGaJKHqixrzeffOCaTmKPJpDg3A=;
 b=X3FWW2AuKXByRDMQJIS3cVSs5tJLAPYkYiqQyy+TbKPT5M1QrW840/MyMq63vDOS6HfksRZd9eZUlxHGDX1PEQ0hfLxnO8FTEi5a2nUX0znhds7qQWAY1kusZ/EEMvZ48xD/qmvqBaRvl48hJDLNNzt11ZkxZ5/4Gzl4d1WBwdbUZpUQJT9duXXv5qNhW/81Coir9RaUeX2Xzat1FBXXt1WWhWxgCZJ37/PavQONX/JzVM3BGonDgiV2dnklCS73YHsnCnIaIj0KCRyRKTC9x6WDrSbou/VVQ8HxvgvdCipHWsAjX5ZROL+5pob5NY1mlcTU8FmwWtbTPPoFM65jUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 20:00:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 20:00:38 +0000
Date: Thu, 18 Jun 2026 16:00:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Akhil R <akhilrajeev@nvidia.com>, robh@kernel.org, Frank.Li@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 04/12] i3c: master: Add support for devices using
 SETAASA
Message-ID: <ajROXuN4PWfSuuvr@lizhi-Precision-Tower-5810>
References: <20260616095429.3947205-5-akhilrajeev@nvidia.com>
 <20260616101919.299491F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616101919.299491F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: db495027-8196-4829-f7b3-08decd7444c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003|4143699003|11062099010|3023799007|7136999003;
X-Microsoft-Antispam-Message-Info:
	Whip8vcVDrxH2KspGhRWKnKO1Jcg8jEJEzwp4czDqwBLRiA/BZnskSsf3SPMdcgzSCgT5LfA4m+OciTiMzhT4I+8RmRMc9BkvzSx97+sk13DK1jF+VeymHVh4YjxvZGrMWL9e9jfFr3ZHNf12Ds/LYutLErfyvLeIOqZGcIX8Hey/9J7hx0yR4zaIdeUHUEZ/23zKLktoTnJNlgpWX0q66bnT47XS+80vLN8eeESziDQuwhfXSUjuMTKqLsKFi9lKz+m+WV+3p7VOZQl+d1ZmLEgjN/Tq8m6zubMKzlgDDHA7h/S1pUKapcb3wa/3BmphO92o/AGlrmd43ZZvD861P8wllzhQC46pQsDxl6UH60xWr8/7sGzur08iRNdTeQknsa9936TNe5hiajJNKYdmBJFWY1ffpgvrK0HlBGxsSkCCkgtY+RlH4CTfM+ewySsPxK60s7xNKnhBb2/qQjev2Nh3J+F2w9pUZoK+c8SgKUmiqZVPA64F6UdUyLwUFKf/DrIhaUDIotsE+ubkRy0wr5oRgkdl2bVU2uMq3obEr3Ws71WPxZuhn5nTtJiUqU18bb21fxEaUJ95iPXcM48SLuiqvpKuwKfkbJZSlumzKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003)(11062099010)(3023799007)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Z/1AcxbqsQGZGAE6+s8vQf93HPbPszm/nO5seAt+vxaPs96QdZBRK+hz5d?=
 =?iso-8859-1?Q?jtXBUeJIKVZ7xoYBayH/IExX0ReRQgol9ZiUK1k0yzMJyK32OCSD5PGJbK?=
 =?iso-8859-1?Q?+c6/ZF7FzC8cWQSEf5b7IEalBl+a0caLQGWQzX5e8Ylf2HkinagYPXsENN?=
 =?iso-8859-1?Q?8Z/n3+qAy1hMXoQ1Tt/cvBNo221PYkJZK7T0lzShzyiVh1d08CpdYRD3Fp?=
 =?iso-8859-1?Q?57P0qfPX5GPmlmcco+Vj8tIJIQa8zUXE0zsSM9TO4dt+nfb8YJN3FYRJvF?=
 =?iso-8859-1?Q?pOPoLlZ9p34fK5UenS9KrFp6javtmZpqbJQfPqjaA5hEurMa1yJnpSO4b5?=
 =?iso-8859-1?Q?F6R6X+9NURPOOo9ICLSLtJvYT1si7atBvZVT5723GKFhzSETMOtKBZMX3Q?=
 =?iso-8859-1?Q?32eYZeD1/lvuZOAWyv/7ZWBLX4JLtAJ3wRaYqTW1LGufxBAnmiQBhCV4HX?=
 =?iso-8859-1?Q?ouH3qlYyrAhW6TZ2qqiBwzwj24WVM0dNKkp1DYTPC5nQvtHFP+4ZQwug7i?=
 =?iso-8859-1?Q?r8rBLJTpofWbHLHCog9ym392Fz1QM7+tStkyK7T6QMZcrWzACcG4AdvEmG?=
 =?iso-8859-1?Q?6X5GcPTHoEQvp0lEzb5MqZG8O3VGWFDwL+pzMQ/9nyCRMQIcC8HcUZShHb?=
 =?iso-8859-1?Q?zhVCXmT0SDGMhsAtcYmmRbc26jxSM7IoI1szlq3+Zs3+1DTgEvilhI0+ow?=
 =?iso-8859-1?Q?Oc9JGUImBFA86x0HpFKXuvAQ1WvLN8LvIsqDaK80e1SgdakIx4ZjI1RPNG?=
 =?iso-8859-1?Q?tazDClStsPMPQzly3BNtOHhgqlBYrrBp01Nxsey2iMRQvtbuMUHdNSiuY+?=
 =?iso-8859-1?Q?kAOHcaxNkRFQ3Z6NISBIB/c56TGPQqc3gDcmzJ30v4cKHIU5MVTKOpKASv?=
 =?iso-8859-1?Q?OWijWk06PwsSP9nPX5rS99rz1GtGuWZJTJj/x2dSvvJDRZBreNRv4vSVof?=
 =?iso-8859-1?Q?60N08U6uwXU/7MRp3SqmiS0LoLSO/hj7c5SHyFAH6J0sesgxzaaiCZgcOA?=
 =?iso-8859-1?Q?25b/leG8t+3oXm23hF/lik/PCMf2H3TXgeBjt3LEsQlOTaWDfvwHCTX4+X?=
 =?iso-8859-1?Q?Z1Q5eo0SOu3IOATnNzhiR8sf9AQOKIslPt1KN4WeS2eqVZqk8IM7tXNhQG?=
 =?iso-8859-1?Q?HX+26jWsNUSt5+p//A+Iq2fVxI+rdV9tABuCFjDH7lWQljFHSCBiFocmwP?=
 =?iso-8859-1?Q?kG+mAs56S4k4/RQqVxVdND7kO80r7rHF7liBtsSqHmjBQeVAb4prqooh8b?=
 =?iso-8859-1?Q?yFEZDHUbh8E2EZNy1S4s+9jvlwGZLuGQ1S1lKgbpP66Sk4WvTt8gg3NNio?=
 =?iso-8859-1?Q?uN5C0WzxyfHMaMpo4A7P19JkNL4N/9Oolrc3R4e70iXm0w5NoMkhbyAkuT?=
 =?iso-8859-1?Q?6kYEKCaxbD52v2BU/ETY2ZO7dPsQjEp3BH8QbRdoMZW+TcTPXOzFi/DJik?=
 =?iso-8859-1?Q?0r8zJ2vSWv5zszHSU2EPRmaZqKF/OnNHz11T5fdB4oPL45kAiewsnYqCcH?=
 =?iso-8859-1?Q?lbDVxv3NTha9Ooxb/NSjBUO02HBYCNz0E4IXrWrLU/83CXJaLnNSlA+0z/?=
 =?iso-8859-1?Q?oSmhhyvUB5SsMOxMrasB3pYJpciZJYy4OT8sAm3xmmrH91KJQmfbxRShh7?=
 =?iso-8859-1?Q?ASbpF2e0HEynILp1D0wZCteWoPfYck6CmVcLGnQotrptCTCfH22gS1HIFI?=
 =?iso-8859-1?Q?y34sXsLf7LiHHBA28pbfJxgqYqrCs2vwtN+OAiSwJxENinasHjlDjs7QPv?=
 =?iso-8859-1?Q?TfmfMByUQLh9iOzaqg+yoB3A8X0oCcuAuKBUdmJkZ8hw+K+lhVIjdATN/A?=
 =?iso-8859-1?Q?YXIYAhaSMml3MpRKViXqj5bbBgHH8NsaxJjnyLKJ9+RuCp36Hrdm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db495027-8196-4829-f7b3-08decd7444c1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:00:38.8284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phHG2J6+kZm3qANcge80UtIK2VZMjkhZEe14PM01i8c6oL4vKwvO9vyQeQWc87qNpOfGm5nFseW4c1mOPEdSSag7kbr76kGd0rgdsUFHhxUs1uuwANpKvsDd71G91pCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313

On Tue, Jun 16, 2026 at 10:19:18AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [High] Missing CCC command whitelisting in I3C master drivers causes entire bus initialization to fail.
> - [High] Premature SETAASA broadcast preempts and breaks SETDASA initialization.
> - [High] Missing physical device address reset (RSTDAA) on SETAASA attach failure allows address collisions.
>
> Pre-existing issues:
> - [High] Bypassing PID validation allows duplicate PIDs, triggering a pre-existing Use-After-Free during teardown.
> --
>
> commit ef82dd52670ca8654bff7067823722f8e77933d1
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Add support for devices using SETAASA
>
> Add support for devices using SETAASA, such as SPD5118 and SPD5108
> attached to DDR5 memory modules that do not support ENTDAA. Follow the
> guidelines proposed by the MIPI Discovery and Configuration
> Specification [1] for discovering such devices.
>
> SETAASA (Set All Addresses to Static Address) differs from standard I3C
> address assignment that uses ENTDAA or SETDASA to assign dynamic
> addresses. Devices using SETAASA assign their pre-defined static addresses
> as their dynamic addresses during DAA, and it is not mandatory for these
> devices to implement standard CCC commands like GETPID, GETDCR, or GETBCR.
> For such devices, it is generally recommended to issue SETHID (specified
> by JEDEC JESD300) as a prerequisite for SETAASA to stop HID bit flipping.
>
> Link: https://www.mipi.org/mipi-disco-for-i3c-download
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index f0e05bcac26da..557332d932576 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -1852,6 +1898,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
> >  	if (ret)
> >  		goto err_free_dev;
> >
> > +	/*
> > +	 * For devices using SETAASA instead of ENTDAA, the address is statically
> > +	 * assigned. Update the dynamic address to the provided static address.
> > +	 * Reattach the I3C device after updating the dynamic address with the same
> > +	 * static address. It is not mandatory for such devices to implement CCC
> > +	 * commands like GETPID, GETDCR etc. Hence, we can return after reattaching.
> > +	 */
> > +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
> > +		ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
> > +		if (ret)
> > +			goto err_detach_dev;
>                ^^^^^^^^
>
> [Severity: High]
> Does skipping the physical device address reset (RSTDAA) here allow address
> collisions?
>
> If i3c_master_reattach_i3c_dev() fails for a SETAASA device, the code jumps to
> err_detach_dev. Unlike the SETDASA error path which jumps to err_rstdaa to
> issue a directed RSTDAA command and clear the dynamic address, this path
> leaves the physical device active at that address.
>
> Meanwhile, i3c_master_detach_i3c_dev() frees the address slot in the master's
> software state. During subsequent Dynamic Address Assignment (DAA), the master
> may assign this supposedly "free" address to another device, resulting in two
> physical devices responding to the same dynamic address.

Look AI correct, please check it.

Frank
>
> [ ... ]
>
> > @@ -2206,6 +2268,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	if (ret)
> >  		goto err_bus_cleanup;
> >
> > +	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		ret = i3c_master_setaasa_locked(master);
> > +		if (ret)
> > +			goto err_bus_cleanup;
> > +	}
> > +
>
> [Severity: High]
> Will this unconditional broadcast of SETAASA cause the entire bus initialization
> to fail on certain controllers?
>
> Several I3C master drivers (e.g., Cadence, SVC, Renesas) implement a strict
> whitelist via the supports_ccc_cmd callback. Because these whitelists were
> not updated to allow I3C_CCC_SETAASA (0x29) and I3C_CCC_VENDOR(0, true)
> (SETHID), the master driver returns -EOPNOTSUPP. This error propagates up
> through i3c_master_setaasa_locked(), causing i3c_master_bus_init() to
> immediately abort.
>
> [Severity: High]
> Does this premature SETAASA broadcast break SETDASA initialization?
>
> By broadcasting SETAASA before processing devices that require SETDASA:
>
>     list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
>         ...
>         if (i3cboardinfo->static_addr)
>             i3c_master_early_i3c_dev_add(master, i3cboardinfo);
>     }
>
> any device with a static address will accept the broadcast and adopt its
> static address as its dynamic address. If a device was configured to use
> SETDASA, it will erroneously accept the SETAASA broadcast.
>
> When i3c_master_early_i3c_dev_add() subsequently attempts to issue the
> directed SETDASA command, the device already has an assigned dynamic address
> and will ignore the command. This causes the software state to desynchronize
> from the physical device state. The MIPI I3C spec explicitly mandates that
> SETDASA commands must be sent prior to the SETAASA command.
>
> >  	/*
> >  	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
>
> [ ... ]
>
> > @@ -2724,6 +2799,9 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
> >  			return -EINVAL;
> >  	}
> >
> > +	/* Update the address methods required for device discovery */
> > +	master->addr_method |= boardinfo->static_addr_method;
> > +
> >  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
> >
> >  	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
>         ^^^^^^^^
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does allowing duplicate PIDs
> (such as PID=0 for SETAASA devices) trigger a pre-existing Use-After-Free during
> teardown?
>
> Since SETAASA devices don't require standard CCC commands like GETPID,
> configuring multiple SETAASA devices with an identical dummy PID (like PID=0)
> passes the validation here.
>
> When i3c_master_register_new_i3c_devs() is called, dev_set_name() assigns
> identical sysfs names to these duplicate devices. device_register() then fails
> with -EEXIST. In the error path, put_device() is called, freeing desc->dev,
> but desc->dev is not set to NULL.
>
> During bus teardown in i3c_master_unregister_i3c_devs(), the core iterates
> over all devices, sees the non-NULL dangling pointer, and calls
> device_is_registered(&desc->dev->dev), leading to a Use-After-Free.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260616095429.3947205-1-akhilrajeev@nvidia.com?part=4
