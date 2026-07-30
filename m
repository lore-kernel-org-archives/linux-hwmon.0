Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051953B4EA5;
	Thu, 30 Jul 2026 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401897; cv=fail; b=sfafflcX1UqVrTO8ygMY7xHEQOZr0Qa9QyKE0pbnPEodhURCO2N7xWkTwyAmhXk3YXfAhk1h2dK/UAInHeG7900RfDjGHrD2xcqmscfbzhALuihWvYYwiWntF/JkjFb/mK82ff8QpiJJIHxlevP50vC7zQOUMlATCt7pIOsWYQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401897; c=relaxed/simple;
	bh=kqJjC5gisi4l0j2fha57Yq1c5uC71hQfLa09C5A5/H0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rtl6Rat2V46dbx6dWFNfqlX4upITX3M0maQuCfDMjuxe8XGMp/+afZ7d5LbDdgWiv/qUcasLXsvhXTs75OE7P5tDmxH9DqWdwWJk2Ht6Mg75MbO2IAm1SEnFzYN8+5afXuxqlUNdk+KLduO1tZyyaSlOxt81zwk8ettwvsHaXbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D8Inl8+4; arc=fail smtp.client-ip=52.101.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D8Inl8+4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTIr5CgT3KDSbz7P2qosdWui8lahRZJM+xMjJ9h0B+X7yHjonHiXnNKPGtvI4vnEM5FETdTvfZkW5NxHuqs3+GI7Si7qucow/iE2VyYsCEzmo2Cpdarq35sODMCjGNNoGFORncRpPnA1xBNlBoUkVs349dOT7W9bLgwROw4Z04cB7uw6HNqnSfsOX1Cc+wUN+WQx3I7VoCosK1MQgOLUyFuwXB1QI4Swo7+v5gCfE94iYitlDyV/mnjs+sJeWtRkMxBfYpJZs2BymnXp5PPhlSXYdZ9RIyEcDBNWwqukK2D9826FB/IoKCpz1nxfFG7gmNjtxyPqYFurHyMuAbmS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwXt1HBuG6tpgi6DB23CqREVkrDh6M3O1oJ4FCTC7ug=;
 b=pAdmflVAq1uLUjOO47GExFoTodRpxmjk8M8rNnDur79NKB9dZNF8K6oP5Gasyck36ea8QhEhfGwKHq1piTT0jofwMAg5510i02TMbiIuajppzAyKWR7MkcVRWgEMbVqABa+hJW8kupTks6mX0bpeGczW1VF+CYzk0npMTP8aCZPg6rbRNBYnOHLx0ydtBIzgni5L5+ykrlC/qr5sjKIc4buZ938fLPpynX5iLenZW8+WLZ3IhPR5n0eiO1L9FGf6OewvlG7MTC2y58aqc1xKhCsw1YGbtN21evB0SH6gK+u1ZPVbNQ8zg4acWNSoHsfWW2erd+tJ33T66gaxqLl5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwXt1HBuG6tpgi6DB23CqREVkrDh6M3O1oJ4FCTC7ug=;
 b=D8Inl8+47CcFqujvEQQvAchfkyWqXUr1SRvEnGTiNrKovtIlHCT4J0ohGo1ha+TFojVP2gvJo1loGF+Lc2UEeLD5Lm7iSRhtdUOW7uCMjVgB4/xX2lUfDlihzHDMxoQb6N1WhHbD1qH8lwTfaB9wiwou2k0jw64jGNyw+8JYqI5m3O86wK5f6uoI7IYs8EzAzXF3Yoc2588XI8khn5hMCn93pm+6lX3fBh2kBubNL5KIlsfzaWDmf+cCH2ZvR3kk/oVX21So4Aom5oQYpplhOa1JthzcAAQ8SD0jQc7EWarJ77hZG2hGHPpbKQYRyJqjroBdSRjS3OaOV1ti595YTg==
Received: from MN2PR15CA0044.namprd15.prod.outlook.com (2603:10b6:208:237::13)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 08:58:09 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::91) by MN2PR15CA0044.outlook.office365.com
 (2603:10b6:208:237::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 08:58:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 08:58:09 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Jul
 2026 01:57:59 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 30 Jul 2026 01:57:59 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Thu, 30 Jul 2026 01:57:56 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v7 05/12] i3c: master: Add support for devices without PID
Date: Thu, 30 Jul 2026 08:57:55 +0000
Message-ID: <20260730085755.2456630-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728072040.9B1591F000E9@smtp.kernel.org>
References: <20260728072040.9B1591F000E9@smtp.kernel.org>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ff30c2-2341-48a6-385c-08deee18ade4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ww7ih4NSmA23s8gq7p7AkAK91bKUDGia+LblEEvL+kGv8gtuimO8XTYarWtR8OZqP+maXFSDvkCu+f6uMOcHCTpItkSM6cfSPxlzKV1OIuqHMWvvcHUAmlZlfEK/zZUR2mVGRZGnmUEcJt421AL3LD7dmtpoxxFRFaNDB+DtMEkM1DVqb75HYw1wIemIDOx1vgHtPPqUtmUs7is73PKjhksU0we2yEF/GEMPl+G0WOOEtuieSHTB4k5WFTVln8o3hGXULWI/qseadjMUDECLxS3uFEh0QIjCd8Fx5RPaJZe23g3D9KP/W8XSrTyp5+jeGUzBDwZrv5Rh+0cbR1vOo+/EXTlpzgpxRpqKK+qQmCCIEa5D3uSpEdQAM5lwvZKT9eowZf0K5Xc5rA9h4n1lQWDbm1EgpeEZRxPimn0OYysKVhqq74P+r5tOCOQT4YWbnWSjKaf5pkZjY1hdx+3lC/TdMd75GTqISvBtGhr18lSOZmVTEBF1+VvN0dFUfY4hA6P/5GF8clKhTnjkOR7Bw6s1rnowbenTr4dlnmvxB1cGm3FAAJYumIp7/KI74S2UY5xzAe880QRG/YH88yN9p4X2WP9FFol/uPCaeGclo34Y7MRgWfsSMFJj0g4PPL6Z22B4lQhCnO3IVENkqxcW2ORtg7D9jE4WD6FsUM/1xoLPVHz2OBcceQTK7skaTL9wYigVUvRy2S8amrLIVpznZw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	va6lLMEjNS2vI3GiW5qY71jqdFUo159KEfRIpP0YoVETLug4dgof1KEIfSKpJyoclbPMn2YsH/ll5aY4GQkICrra4lRcEZ1s4cZpBs+VBG3c3WWjUNUL6bPckfPQY532ZQUKm1mVYEQ+fFgVI2XUrRhj/7FionT71smAHcbZrwJOt2TWPmY/b45gPeDs6YGL0cg3U6hVo/9SlphJY/Hhw/S0hlu0eukUesICcGvWQY1ijA50NrXYFIXf2Gkz/u6ciKAZnexffPmetK9TMIKNjqMNzFM6rTQhM53n37Xzz/AP3LON3wu0H3CA/E3R3G/bc1MYU03EcLzHE1ou2SOgK9LAB51ylRGuDF2caVoHugYm8xrl7NNmoRK8FaZW/yYa8kGgnzusa1QrlvuziYJMcv1uWU8xghxRLH2g52nCJN4jYfxGK8dmk1qun7ylDuSK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:58:09.5333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ff30c2-2341-48a6-385c-08deee18ade4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672

On Tue, 28 Jul 2026 07:20:40 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit 978db33da88aedc2a14abd69fdc128b5e3961e92
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Add support for devices without PID
>
> Devices using SETAASA for address assignment are not required to have
> a 48-bit PID according to the I3C specification. Allow such devices to
> register and use the static address where PID was required.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 87749a739e62d..488177d95e484 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but does device_register() failure in this
> function leave a dangling pointer that causes a use-after-free later?
>
> When put_device() frees desc->dev->dev, desc->dev is not set to NULL.
> Later, if the master is unregistered, i3c_master_unregister_i3c_devs()
> iterates through the list and dereferences this dangling pointer.
>
> Could desc->dev be set to NULL after put_device() to prevent this?
> [ ... ]
>
> > @@ -2401,8 +2410,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
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
> [Severity: High]
> Will this fallback matching logic fail for SETAASA devices discovered
> dynamically?
>
> If a SETAASA device without a PID in the Device Tree loses its dynamic
> address and asserts a Hot-Join, the master will execute Dynamic Address
> Assignment (DAA).
>
> During DAA, __i3c_master_add_i3c_dev_locked() allocates a new device
> descriptor and initializes newdev's static_addr to 0, because the static
> address cannot be retrieved via CCCs.
>
> When i3c_master_attach_boardinfo(newdev) is then called,
> i3cdev->info.static_addr will be 0. Would this cause the condition
> i3cdev->info.static_addr != i3cboardinfo->static_addr to always evaluate
> to true, skipping the boardinfo assignment and preventing the driver from
> binding?

A device without a PID cannot be discovered through DAA, so this should not
happen. Per the MIPI I3C specification, a Target that supports ENTDAA shall
have a 48-bit Provisioned ID (Section 5.1.4.1.1), which it transmits during
the procedure, and Hot-Join is only compatible with ENTDAA - "Targets that
do not support ENTDAA shall not use Hot-Join" (Section 5.1.5). A device
that supports both SETAASA and ENTDAA does have a PID and is expected
to describe it in DT/ACPI, in which case the PID match applies.

> >  		i3cdev->boardinfo = i3cboardinfo;
> >  		i3cdev->info.static_addr = i3cboardinfo->static_addr;
> > @@ -2416,8 +2435,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
> > +	if (!refdev->info.pid)
> > +		return NULL;
> > +
> >  	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
> > -		if (i3cdev != refdev && i3cdev->info.pid == refdev->info.pid)
> > +		if (i3cdev != refdev && i3cdev->info.pid &&
> > +		    i3cdev->info.pid == refdev->info.pid)
> >  			return i3cdev;
> >  	}
>
> [Severity: High]
> Does this logic lead to duplicate device creation for SETAASA devices that
> participate in Dynamic Address Assignment?
>
> If a SETAASA device is defined in the DT without a PID, it is initially
> added to the master's bus list with pid = 0. If the device later asserts a
> Hot-Join, the master executes DAA, discovers the device, and retrieves its
> true physical PID.
>
> Since the existing device has pid = 0, the check here for i3cdev->info.pid
> and i3cdev->info.pid == refdev->info.pid will fail to match the newly
> discovered PID to the existing device. Will this cause the master to add
> the newly discovered device instead of detaching and updating the existing
> one, resulting in duplicate devices on the bus?

This also needs a device without a PID to take part in ENTDAA, which the
specification does not allow, as above. A device that already has a Dynamic
Address assigned through SETAASA does not participate in ENTDAA either
(Section 5.1.4.2).

The !pid checks are intentional in this patch. Devices without a PID have
pid == 0 and would otherwise match each other, and one of them would be
freed as a duplicate. Devices that do have a PID are matched as before.

Best Regards,
Akhil
