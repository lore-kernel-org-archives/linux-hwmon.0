Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503574071D2;
	Mon, 27 Jul 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157095; cv=fail; b=bFYj6xa5lYUd7YljcelpNvKx4mZzhcIA617xTDhhcBXMf3VGnXEXFord0vmZZPtteXPWY63onk0t3jj8UXo9ahRQVIUtxKSMreJZ+Yqbb2hmsXXUC/9JjQqryGrAYOUExvxvloQo4k6MeJTQZnvUvNfSFmCfA2c/0s/C4rI6uag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157095; c=relaxed/simple;
	bh=uwR8Fp2hJJ9K+JUfMkXcqaYiH/N4tfB5+JrewH/RbXs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZCTWg4CmW2ixN+Vf1oJgVHdp0jyaOHu5BB6fk+fPiXLcMpuXp0f211osPQubj5io17w59F9MpMBCFb7mCXGQVv1AIdO+y0+0Ovx8RLpUH1xmJQRe5kyta+UQolEEbRrbGLyrWVdztIQy2ILTHsKEyHu4UVy3Y7mkovj3QxMTow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t3NshYeB; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t3NshYeB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQ0Ov5pf4GXdLnsidLehB/XdSNpFicDd5mBWnZQ7Rc3w77YiPuXYzvWpRaordO/FWt8fJkqX2DpPh6GyeQEUNL8ILPuXw717ON97BctakZtUz+1H6r+0ojrGBcv40/Zzt0iBqpWAxjO6ZQVF00ErkvXAOerOlf8JOyg2ri165j9NfuKadcmmun+u8FBegbXqtpGvHapdNvvT04FLMsLeISeNFtbnrn+6z8z+FJgsIlsvJuq4tNV4GcHsG02vID6m4cLEMwK+17hwNHSNYNRWfHX6Zqzn3nGkMeAQZRcLAuTnabKLGjxvouvZTQ/AaMm17ADD+G2p1987YfODph/EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQZsNf4vjH5iRhNXNLTzscm99kO+vCHowsz6zaEU+Ws=;
 b=OYen7MpFowuznpcd62QYqV/Hzc+oAB+BUN7AJuBW2G9Sy/buSPT7ulj4oMbTYfhVhTp22bVj+QeRVjZWj7V1c6ALkF8KRHN9YuR7uQCCDLtmZzcFz8AdyIwcum3H2PA19EF4vB/SdoWmvziGwL9gg/NfBuOGGzwIWGjlleXDxuouPb3IS4C51RfK5q5hdWXIKHYJJowTgFyKWzdaL2kVsCIEoLzKIs/RjP/FMA0qu21xsEBxjltz3H/DRw4RfDXTdXRLTX1q27kY4zHuMyaOGie49CdhnuSVhCk+7FbVNxAR2J5jDo+q4N3Hu1r/i13Ih+/RPDGyF/KSox+ifvOptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQZsNf4vjH5iRhNXNLTzscm99kO+vCHowsz6zaEU+Ws=;
 b=t3NshYeBRvmsYDEZV7jcwWbDMRotOQTA69iVXl1khTCCFmC3U3G/45bFw72g16nfEW/TgFaHrGryS6+GiKcHKUQOeH7W75pApCpBWJEPtK/Gm8LyU8O4coJKug4EN02sDtYYmQC088Mjr10fAkgUsAZgpP8htjXLomEOFjaxAZ20kfiKI1l4ItJRDTkT7e0BdY75qmna+TuE2XtzaGHHpK/CtdhRa0lrSrBHF5BhqMiKgQfiK+AChrS1vm4qL1ZsUY/xv8v7R8gKgb+PJzVMCx4NvzEstT9jA9KORdG+fBn/hsqBpuptFiZFinI86hfHYzCt9uwi4NZMGCU0kcAOgg==
Received: from SJ0PR05CA0206.namprd05.prod.outlook.com (2603:10b6:a03:330::31)
 by CHAPR12MB999226.namprd12.prod.outlook.com (2603:10b6:610:2ff::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 12:58:08 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::ae) by SJ0PR05CA0206.outlook.office365.com
 (2603:10b6:a03:330::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Mon, 27
 Jul 2026 12:58:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 12:58:06 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 05:57:50 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Jul 2026 05:57:49 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 27 Jul 2026 05:57:46 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v6 04/12] i3c: master: Add support for devices using SETAASA
Date: Mon, 27 Jul 2026 12:57:45 +0000
Message-ID: <20260727125745.157384-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721043058.C02B31F000E9@smtp.kernel.org>
References: <20260721043058.C02B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|CHAPR12MB999226:EE_
X-MS-Office365-Filtering-Correlation-Id: 701796a9-27b3-4660-16cc-08deebdeb426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|11063799006|10067099003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yTclvJMT6J97wREsJ2ks9v+nswucd1zVxLIwlOeEfgI7rIFf/yMUbu+OaIUo8nMrAqScvQKG5pD0FNv4HLwihqQAmcn7Biw2gmF05XCumrjr/zlF16qCT/Y9KZuxCZzBk57t8Fyoq+NFOTvK39QCNDM7/GXRO+PXPHW5uk8Oujy3cZ5F8XC5UPBI7YXjLz9T8hsYu5lIThG3PARPrOoU6mWVDcXjU9C7FQOkJsQNfr9sTUs3eRcKhyMmleR9wIW9ghkLPPg9IGJs7imeXmvEj/2J+QLpCQvmxsOMBPIftVBrJDY0nTyd139wGEU52nCAGJAlxEozWbFKSzKH674cHPaAaA6lLEg/Yup/wBZvPzfnCegAc+zG3aLpfqkQ3Cb+E82JXZHFpWcjjC3w7cVhXMDZPceiMdx9W15QgXnqB5LLHpI3ng/cC2st5cDzAt4KYG2BrhYA83ixt139bxVr7Y8STERx9mmZGx7LXbTKzrWlQjUXhnVQZZbCEUdqWleU+eluoPw/Q/vhnRLU/fGlZK1SxX1PD8T7LtdXeciWlzdDng19PY+k5jK62ZDK+Xpd9R9WDcAm3ngxzfjtJE/oD1xzCi9Otyk9MWLri/yS2jrOS4+4VeCtAX1iF2IA3+oelOqIe/4SLU8YIhZwmhK9qEoq4uK0f8qyKoSRHIA+RODasj5zTTT+0MxRNtmDoxczK+Sjp352MfEGZWR12Cq2hQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	As48zMBl3xWSfvy1bqc7C2v2Iy8Wng+rLqe4+weyPkRk5CBpPJLIMf1yNfRc0zmpjVOyWGENQTWmJTOBc+3IYw6wpoH6AV3NNKTHOMoWqyNjHP7RiDDkD0ng52CbRcVPJpHNQJl7B1lW0ZPkZZXKwrZkHnLOi2yFDrUVgj7HTVB8OidsdphBSPNtjdXd/1rBZRCyngVbS00mzynn0XUxMP+CnABMTBeIwNL9/9oggDymXxkv6reOg4Hq1LQtbiZVuaBHmLKoppODmryt++0ex6liytJQK1TRnAnD2GbhfJ8zcCkBIvdxTwKsKK61xtpAWsan94sBVDntasgqiy74bMoRLtjGqRzH5FVntJBpzixrpO1mmUG/HAjj0wMecVNhE7PkzgTkcSTGNILYZrLvJNETCMPi9n6BY9VmrXnFLG4XXrvbPkDtpuqrEyCMgCyB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 12:58:06.9869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 701796a9-27b3-4660-16cc-08deebdeb426
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR12MB999226

On Tue, 21 Jul 2026 04:30:58 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit e158b576a9f733695d868ee16f34bacdb43285b3
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Add support for devices using SETAASA
>
> This commit adds support for discovering I3C devices using the SETAASA
> procedure, such as SPD5118 and SPD5108 attached to DDR5 memory modules. It
> adds the SETAASA and SETHID CCC commands and updates the discovery logic.
>
> Link: https://www.mipi.org/mipi-disco-for-i3c-download
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 623c6b2247d9f..b18dda89c4737 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -1102,6 +1103,51 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
> >  	return ret;
> >  }
> >  
> > +static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
> > +{
> > +	struct i3c_ccc_cmd_dest dest;
> > +	struct i3c_ccc_cmd cmd;
> > +	int ret;
> > +
> > +	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
> > +	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_VENDOR(0, true), &dest, 1);
> > +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>
> [Severity: High]
> Will this fail on most existing I3C master controllers?
>
> Looking at i3c_master_send_ccc_cmd_locked(), it calls
> master->ops->supports_ccc_cmd() before sending. Many core controller drivers
> (like dw-i3c-master.c) have strict switch-statement whitelists for supported
> CCC IDs that do not include these new SETAASA (0x29) and SETHID (0x61)
> commands.
>
> Would this result in returning -EOPNOTSUPP and aborting the entire bus
> initialization on systems with these controllers?

SETAASA/SETHID are only issued when a device opts in to the SETAASA method
(i3c_master_setaasa_locked() is called solely when addr_method has
I3C_ADDR_METHOD_SETAASA, and SETHID is sent from within it). Existing
drivers are unaffected because SETAASA is a new capability they do not yet
advertise; they can whitelist these CCCs when they add SETAASA support,
which will have to be updated in the individual drivers. This patchset
does that for the DesignWare contoller driver.

> [ ... ]
>
> > @@ -1878,6 +1924,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
> >  	if (ret)
> >  		goto err_free_dev;
> >  
> > +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
> > +		ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
> > +		if (ret)
> > +			goto err_rstdaa;
>
> [Severity: High]
> If i3c_master_reattach_i3c_dev_locked() fails here, we jump to err_rstdaa
> and eventually free the device structure. However, i3c_master_bus_init()
> later unconditionally broadcasts SETAASA to the bus.
>
> Won't the physical device claim this static address during the broadcast,
> even though the controller software no longer tracks it? This could lead to
> a bus collision when the software later tries to dynamically assign this
> "free" address slot to a different device.

Address conflicts between statically-addressed devices are rejected up
front in i3c_master_get_i3c_addrs(), so it should not cause any address
collision with other devices on the bus unless the same address is being
assigned through ENTDAA. If this is a concern, we can avoid freeing the
static address for SETAASA devices even if software attachment fails.

Let me know if this needs to be done.

> [Severity: High]
> This is a pre-existing issue, but does jumping to err_rstdaa correctly reset
> the hardware if reattachment fails during SETDASA or SETAASA?
>
> If i3c_master_reattach_i3c_dev_locked() fails, its internal error path calls
> i3c_master_put_i3c_addrs(), which marks the slot as I3C_ADDR_SLOT_FREE.
>
> When we reach the err_rstdaa path:
>
> err_rstdaa:
>     i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
>
> i3c_master_rstdaa_locked() checks i3c_bus_get_addr_slot_status(). Because the
> slot is already marked FREE, it returns -EINVAL and silently aborts without
> sending the RSTDAA command to the hardware.
>
> Does this leave the physical device holding the address while the software
> considers it free?

Pre-existing; not introduced by this patch. Better addressed separately.

> > +
> > +		return 0;
> > +	}
> > +
> >  	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> >  					i3cdev->boardinfo->init_dyn_addr);
>
> [ ... ]
>
> > @@ -2741,7 +2816,19 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
> > +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		/* For SETAASA, static address is taken as the dynamic address. */
> > +		init_dyn_addr = boardinfo->static_addr;
> > +	}
> > +
> > +	/* Update the address methods required for device discovery */
> > +	master->addr_method |= boardinfo->static_addr_method;
> > +
> >  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
> >  
> >  	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
>
> [Severity: High]
> By relaxing the PID validation for SETAASA devices in this function, pid can
> default to 0. If a system configures multiple SETAASA devices (like DDR5
> SPDs) without PIDs, will this cause a kobject name collision?
>
> During registration, i3c_master_register_new_i3c_devs() names the device
> using its bus ID and PID:
>
> dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id, desc->info.pid);
>
> If multiple devices have pid=0, they would all be named "0-0", causing
> device_register() to fail with -EEXIST for subsequent devices and preventing
> them from functioning.

Static addressing requires each device to have a distinct static address on
the bus, and PID-less devices are named from that unique static address
("%d-%02x"). The bus address-slot management also prevents two live devices
from occupying the same address. So a collision would require a malformed
description with duplicate static addresses, which is not a valid bus.

Best Regards,
Akhil
