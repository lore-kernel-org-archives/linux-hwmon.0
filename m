Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA3D30568D;
	Mon, 27 Jul 2026 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161558; cv=fail; b=pMpEkEJy6gV/JSQQP667QihQ/CUUYuuY793TbnrL3JeVhIy0/zrf1ABPC1AUeRlUFVqe7i2+Z2XuIB64xNDzdRJE57/vszy82dJQXx6IHbofvxoCSHk9fmjWLa8gimJB3/48nJNxqCsYkpt+XFyLmfptlL5kcFRhBnWUQrQv0i0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161558; c=relaxed/simple;
	bh=aLfAokYwZ5Sy7K+kesaw9/G/Ns5Q/5fpRWhRsD+3XUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdMQ1+b98aSSrpY47of0YNbps288W/sdj6VpWpEZkfhqVUDUY5Doc3Tv6o7SB8hh/5uFVhpY6DSnZlAMDVMAl8D87Slh2rUjX2XzmAIabGaIEEnt/74wGLE7LUvLWqt8Xch0vwzNoergy1YBDU6EV6qZEGetdjh2vEkOQHvgwck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EtPmqqyy; arc=fail smtp.client-ip=52.101.52.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EtPmqqyy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeEybnZpXu3gTNFuWC5NBSw6Oz/PnO4eu41+/eM+ab0TnhYpPMpY7feqjl6yUTZAKazcdiDovTGSVa7oM14R4bOrh1QD6CZh8P2+bPkDDrYocI4isOHyHRte1jp+cyu3aFeFuo6vvjS8NSuzrFZ6IiyYC3CjupG9bhdyjZWhuGv8iAPTVxW5NVrFuhdTfVEhYffrG+y0iqGa0q7DWdmGZulQF062pKJUGJpGqiCTSzTk8ZGwC3URmBlqr5bBGpsTMLYKKLWZx2Z4S4spfGg2PLg2I5dp/PWAjRqtbwl4PjS9ostUbQa4nzspqA2JTImPuDFFSY3n6QKhk4LjVQrKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S60XBqFr76tzZWXzTso9h5tbDGUZngHBG4f/C1S/l2w=;
 b=AoOG/RBibzkt6zDBWA9SitJp1O5/qg5EBD11LcVAUL50R7OA7ZIEwwglLEmwuXq/pnrO0KRhxEajhUjd2P27iHRhBeqbI4Y9lPT8zXyvay29md3ZaFkkLm8Cq+mAzhXY3FFGVGBcyYI/a5J99jc7NYi2TbcvSVvwjycUQBD8DZOp0kcMoO+EZ5Ik8QFrH4QWophRKvxgP4/uC9zwI3K1EBo1XcRlOFVShKpHABdplldu5ZNHwq2BBx1an84eOAIhU2z1N/cJJZU/bVxK/K3hjiD9D48bNuA/qd/pxLyodPecavEfSqec9Aw275a/SwXF0g732K1apgbN0Vo+ZRXrFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S60XBqFr76tzZWXzTso9h5tbDGUZngHBG4f/C1S/l2w=;
 b=EtPmqqyy/4x6lyU9kpuWa2ooUp2RrHjC+zBNET7Rci6w9RexrQgETGNidYTXNrLihsniXHtARc6QIalvWv2xHpGi8EA4gSCHQ6fmBJw0hjze2tsbpJLH8mDome6ES2CaYAlQV4gR152m4z6oEyse0l6LWo+G9RJ8n23+qDZcGFoA41S3h96gRAUgGLozQHVmBPfsv8OCuJa0HdbcBssFkj/TZip3zJP0agKyH5e1lTW5ybuJ/KaC1i3hcu5SBWMPOhblAFz5lFCG53kZ/+O34nKwwTLb6bH3ny2+CXqb4GjBYpkvGk7PpYp9gk+3NRLRJza4Vc1S5xGP7ueoIoZe0w==
Received: from BN9P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::12)
 by SJ2PR12MB9164.namprd12.prod.outlook.com (2603:10b6:a03:556::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:12:30 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::71) by BN9P223CA0007.outlook.office365.com
 (2603:10b6:408:10b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:12:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 27 Jul
 2026 07:12:04 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:12:04 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 07:12:01 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v6 05/12] i3c: master: Add support for devices without PID
Date: Mon, 27 Jul 2026 14:12:00 +0000
Message-ID: <20260727141200.171715-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721042604.87E791F00A3A@smtp.kernel.org>
References: <20260721042604.87E791F00A3A@smtp.kernel.org>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SJ2PR12MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdfaca1-b6ae-400a-ccf7-08deebe917e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	w8z2Z0lwWhiyu4OrR8vPZhJ/SJ3zMVh79HUCBbp728STvGBXMQGsOtnQdPyTtSG27AQPMLp1VfNCP6CIqN2/v3HaG8kW2bjWFdEQ4+lYwKivKQS2fdLoLEHo6Enteg4IRufI5viSRYnCV9EEiYxiohNetysk379RINVrxL6/tNRhOhOF18H2iDPhAjgFTmsvpXLtQVvWk5Pt4paqfO5EFK84f7ImzAtl9R5NLZcc9HwcuPOz+XWsHM3+PL7JBnt9p2PmEjVVVSlC6RNu6VVpDa+ldh5P0qXet/aY6hmFKzYdXuekSZcG90QfjyrEeKCaCDgVybpZT/8K5im5shthlQLMqeoM1evGRTnId5rZaBIxXFbRyiEbILIrf00n0b2/4bfOv88lYNddJg1U2HqCE+rahv/GbO8yiVXVqyw/tyoker2m0RZXDCgn8NxVbt693tBDnFuj0TWwmWTL2oOlGE1bU6kVE4K8juZkUo7KSHurjt6sSoe336DkjI5cPv/e9Yvb1+PaHBNqKWVhSA7VscrERRlrQSBNbHHQe9/k/xPfDNu5AX6U00dtnC3MmFIOAfzH8nxS12zOI4ohTcX/Bp/Ax41JmjvPOc1RCMJesuD2lOWLl78xplCaG3/RNCsy9BPMwLrJ/+d9/aaryXH62C5t4UdDKCFx4iaNLIMjXNGbA/r/+xOK+EZQaYUnIZssLoVAyumydFdgVi7r4+6Klg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NZiFZDfeMUn4dmQuDAy4Vm7I5Q2gk0VC8Jx3Cex8Ok6f5ttNTkoqXMex29P5U9ealCWa0lPqaIdsHA0SBWFqdZh2p2hcskBiOGli60N0A9ROcmUzeg1hk+EN6p0OpceMHSNNuSVqjIdL3mOrNww3DjePBjTNAPtn8LqiV4G1P9zz9e3Y/5CeM/OlDZcDqBdF0ODm8/nQic4EMdjRmzt2uqxBoipZ/GPLX1nFN56/wmdItq6y6TlyfGbF6hbsVpIO/ClsLopxJJxW3hjJBvQS3u1T4Vb7e1UmqK+lkIJeoc3ISJHOlDHmclgrd7K+HpvuMMkjmbtGZfTwM330ab8ihDOwjVTvE4R+JB+henskyWLxFO/P3uCmolkiVGuj7gbaqUtwDiYTGs20LonbIJHkk3lKPUoyioIkP86NBDXoP+YVieD0GxP8B3L4sAu9lK+N
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:12:29.2015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdfaca1-b6ae-400a-ccf7-08deebe917e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9164

On Tue, 21 Jul 2026 04:26:04 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit 671c3fae66002e874a13051a9c956e9987d76674
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Add support for devices without PID
>
> Devices using SETAASA for address assignment are not required to have
> a 48-bit PID according to the I3C specification. Allow such devices to
> register and use the static address where PID was required.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index b18dda89c4737..7b2f819bf4437 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -2389,8 +2398,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
> >  	struct i3c_dev_boardinfo *i3cboardinfo;
> >  
> >  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > -		if (i3cdev->info.pid != i3cboardinfo->pid)
> > -			continue;
> > +		if (i3cboardinfo->pid) {
> > +			if (i3cdev->info.pid != i3cboardinfo->pid)
> > +				continue;
> > +		} else {
> > +			if (!i3cboardinfo->static_addr ||
> > +			    i3cdev->info.static_addr != i3cboardinfo->static_addr)
> > +				continue;
> > +		}
>
> [Severity: Medium]
> Will this static address matching logic ever evaluate to false?
>
> Since i3c_master_attach_boardinfo() is only called during the dynamic
> address assignment (ENTDAA) phase, i3cdev->info.static_addr is inherently 0
> in this context.
>
> Because i3cboardinfo->static_addr is validated to be non-zero at creation,
> the condition i3cdev->info.static_addr != i3cboardinfo->static_addr will
> evaluate to 0 != non-zero, which is always true.
>
> This means the loop will always continue, making this branch effectively
> dead code that fails to perform the intended matching.

This branch is harmless and does not affect functionality. It is kept for
symmetry/clarity and can be cleaned up if preferred.

> > 
> >  		i3cdev->boardinfo = i3cboardinfo;
> >  		i3cdev->info.static_addr = i3cboardinfo->static_addr;
>
> [ ... ]
>
> > @@ -2848,9 +2871,16 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
> >  
> >  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
> >  
> > -	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> > -	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> > -		return -EINVAL;
> > +	/* For SETAASA devices, validate the static address instead of PID */
> > +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		if (!boardinfo->static_addr)
> > +			return -EINVAL;
> > +	} else {
> > +		if (!boardinfo->pid ||
> > +		    (boardinfo->pid & GENMASK_ULL(63, 48)) ||
> > +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> > +			return -EINVAL;
> > +	}
>
> [ ... ]
>
> > @@ -2873,10 +2903,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
> > -	if (!reg[1])
> > +	if (!reg[1] && !fwnode_property_present(fwnode, "mipi-i3c-static-method"))
> >  		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
> >  	else
> >  		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
>
> [Severity: Medium]
> Could this change allow devices requiring a PID to be registered with an
> invalid Manufacturer ID of 0?
>
> By permitting reg[1] == 0 when mipi-i3c-static-method is present in
> i3c_master_add_of_dev(), it appears we can bypass the strict Manufacturer ID
> validation in i3c_master_add_i3c_boardinfo().
>
> If the method is SETDASA, which still requires a PID, boardinfo->pid is set
> to ((u64)0 << 32) | reg[2].  If reg[2] is non-zero, !boardinfo->pid is false.
>
> Would this result in successfully registering the device despite the zero
> Manufacturer ID, violating the MIPI I3C specification?

This is only if the reg property is intentionally malformed. If needed,
'!boardinfo->pid' can be replaced with !I3C_PID_MANUF_ID(pid) to fix this.

Best Regards,
Akhil
