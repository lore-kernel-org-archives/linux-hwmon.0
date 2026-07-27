Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4372B41B352;
	Mon, 27 Jul 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163197; cv=fail; b=mpFk/KbOR3RRzkRcsnCwODl4t+e2HT3fWnFcBrY9McdbRUHepQhApQHeTQtbDnaDGXr1trzQgTpQp+NbJgsS1iZMO5iJKmEOPOkiqSViVooR0fawIjsJfQgSflAajjiePStAsojwC/21qaZ2lQCkseI39uKagwcjUCRRrNSqffI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163197; c=relaxed/simple;
	bh=RQ6drRcsNxg2b8M6ErAngx9KJpDJr7y+Iok2ZY09I/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYlef8kCkXMLSqZb+1A1CNwgLWNlotYob2BxOhWYVEb06C+mKuaALzWtywB8RxLGGBQits9zBhjS6Lrx/zINfXO3I55M3b76EGRyxk6W9uVkmq3hvixT/TP/5s5B/f1u6NIfORVbhneKerhEkgeQcNcpcyJmD8Fo+io4q7O9p9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U0kl/rmo; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U0kl/rmo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZ5A+whiToehZnBDv1HIEyyjw6C49MrJIH2kUt14a4Eq7lI6X01X2I3tkpaMpIQatqedR8TCA73sQ1WIfc+TWde75G0HPR7PfDi9uxPM/zWPMbB2cJ4XCcKW382r2lmTss8Sp+kRnUMu5hnqOkBvGSiLJxIyPCyJLPI4wejE390GI4hqpQFtNBHbG1Jo+JENrsAZpLXMbAplFGw2OUQU8DOVas+owNw+Qh1/gpF30oyMpAuo6T8GS8OjN8DDbpWGS6OVUxTFcWSaQnCCKyvIcxNYnHhXHu4dMjip+X6Nx9t88QAfiEVIP3S8+YAV1abKxLEbgLoctlx+0UcFMN3/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS2r/ogP8W8CL9TEICJECqIAIRcOekbgxLvfJOZC220=;
 b=XmPnWhWD0z/d+9ikUplOL37KJB0e609KtAAT20jLPKFygB3P8i1oJjJlYS4/ERn9Z0Hq1X8qw/EInw7RjXruFfb9EfvUBy5AwYQwdsWG9kvsegGrAVrCb8SnkUtWgzVzcizl90rprSsW5a3WM1eChbDGmNM1IYWDJh6quHnhy1y+kDuloU7E82O66+D57U/JPvVAqSTQqRRmC09iEHNnRDMqOI3gMZZTBPVhsV5+dkCmT6oPC+H8myv54aSfg7LLNZGHfh+sremSpQ/qKawiADlRIldraBleSCRyzbv0Y8/3kGgVEw3dtbqENsBtnzWBO1YvJcIaojuZqZkCUnnUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS2r/ogP8W8CL9TEICJECqIAIRcOekbgxLvfJOZC220=;
 b=U0kl/rmoaYHt9TAXjhKhDSzVGrIKDMfDkeKAzny8Hb152SFyNtjw/tJKDspoyylOkLxTqYgnTZfD6JUMscfbM2EcAqsZsoGFHBm5KpUQeNzcZ0j4p5RSO6burT7yHECumGVkhqkfv1nZAfLN8izQntq0A9pWjEBd+T4PjA8Gciq550JxvlvXjGm266WbThuKPnHa+PW30qeUYkcrMj59Sa5AC9JOGSGgJOFadvQMM/L+K9TYqyl9++wzYkK0FXFETbnfiuog7kd9tsUUV+4s83BcPYoXwIzEVEi/R6iPWjX5M35QKzp39ARQ/FQw3v0O0TjB3kKnY3nr9LY6VyAAvw==
Received: from CH0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:610:cd::15)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:39:51 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::56) by CH0PR03CA0100.outlook.office365.com
 (2603:10b6:610:cd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend
 Transport; Mon, 27 Jul 2026 14:39:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:39:50 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 27 Jul
 2026 07:39:33 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:39:32 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 07:39:29 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <sashiko-bot@kernel.org>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v6 06/12] i3c: master: match I3C device through DT and ACPI
Date: Mon, 27 Jul 2026 14:39:28 +0000
Message-ID: <20260727143928.177022-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721042558.925AA1F000E9@smtp.kernel.org>
References: <20260721042558.925AA1F000E9@smtp.kernel.org>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: b011299f-be33-432e-0810-08deebecea52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|6133799003|11063799006|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6PcZuelbuOTjRh9pDeWfOCAh8iG21g/cY8jcVF7s5CC7VlWE9nk/B6B94kG4lOwMk2uPeec2wKtJdsWiTyJLNLz8WXGUwWyVC9soGa4crcXRHCJK4YMj0DVDxN2YRoIPmmi30WYba92Hhm7kqTNtixmneQNjJcvwzAkg6TiBELoE9rLOUTPMQE0FfJ3nSX+kRIE+Bszx8WYanZ+7QHCcUF1Rr4WT1KmNl6g0aj+VcsCX/CTSPl2fR9kMF+06pcHdPalWicXvTVqiVHtPSSZ/b2t9j7DNRneYkNmnZrjJrzoNaVXQArcr2XJUyrjosq4qqPHq4gQuJRTedL4l9mFnZzBD1GncmVJc3OOQYMDuy7t/ljq7Fn5jSZ0SnVnXhYm/iPvXm3C1nOT+ltzTyj/9TCfir4NlGSgR1PflHLsossfXKSu1rHidp5zEEsRCZ+/HVr95nTfEi+25kGYOzPKHICs/5B6y4zQI7XCgifGyazn9RIom8ejfU5YGkr40ePvNT28ydMZUrpmZ3w9mZRNp65o8BwkprBxpEeHp5obRtij/0HihX1ecF7RgrsnWGJhjpuMVTF/JXcV9gx8fcpOlNW7j6bam9m0rf4k+ylLbOh5BYg03kQwzUSjBBeUEdFcS1lzvyHGehRj6rksH0/zrIlI253Jkyy9d08TeWAZOo7BdwnVM2rpxIRu9fAbu3jugBYbRSGD/Avs9igm5yM4Pug==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(6133799003)(11063799006)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LCWKCFKWUUnOTPqsSB+fHBYookDr5/4lCnqJSK4xsrMuYBuyy8d6Naob62bYWJi22dRuYIQKAWWvQOVl/L6IPOmUT54VUZeR8NiqqKrYOzmOO+zM3EKBSw+zp+1WwDQpsr6JBAzrj8LfSlBqf849X2sobj3z6SAqjWQlSlIJiLq+1kJGOPaPYd2TK5QBgJAZ/K0bGghakNffRjb59EV5Mr/lK588+7hMIKhG/wLJa5JN6vRlRCh7STrTFlhvXjUCjjCX/3vrPaNA4IHM6lH8Km4SDr+CadfPmfnxBetaRXy5nncQQW1m4grZST02mSM6D+cY2elOctbC5F9DtXKSK2jaqfIDJS5dhnYpPw62uHMxYyS7U2niXd8xc10/n7JHU6Os6He673yOWCsZTJPtVC97QyuZgagpP47XfWsEKQJtN4HeyZAqATAlz7tez+hw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:39:50.7877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b011299f-be33-432e-0810-08deebecea52
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465

On Tue, 21 Jul 2026 04:25:58 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> commit 7db2eb24719ceb614bd3ec6e5efb369d3b92fe6e
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: match I3C device through DT and ACPI
>
> SETAASA-based devices cannot always be identified by PID or DCR; the
> standard I3C id_table matching may not be applicable. Allow such devices to
> match through Device Tree or ACPI.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 7b2f819bf4437..43bf530bc6619 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -345,15 +346,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
> >  {
> >  	struct i3c_device *i3cdev;
> >  	const struct i3c_driver *i3cdrv;
> > +	u8 static_addr_method = 0;
> >  
> >  	if (dev->type != &i3c_device_type)
> >  		return 0;
> >  
> >  	i3cdev = dev_to_i3cdev(dev);
> >  	i3cdrv = drv_to_i3cdrv(drv);
> > -	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
> > +
> > +	if (i3cdev->desc && i3cdev->desc->boardinfo)
> > +		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
>
> [Severity: High]
> Can i3cdev->desc be modified concurrently here?
>
> Looking at i3c_master_unregister_i3c_devs(), it locklessly sets
> i3cdev->dev->desc = NULL during device unregistration.
>
> Since the check in i3c_device_match() is done without locks or READ_ONCE(),
> could the compiler emit multiple loads for i3cdev->desc, leading to a NULL
> pointer dereference when subsequently accessing boardinfo?

i3c_device_match() already dereferences i3cdev->desc without a lock (e.g.
via the existing i3c_device_match_id() path); this patch adds the DT/ACPI
branch in the same context. Serializing desc against concurrent DAA /
hot-join spans the whole function and its pre-existing callers, so this
will have to be fixed separately.

> > +
> > +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
> >  		return 1;
> >  
> > +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		if (of_driver_match_device(dev, drv))
> > +			return 1;
> > +		if (acpi_driver_match_device(dev, drv))
> > +			return 1;
> > +	}
>
> [Severity: Medium]
> Will this fallback matching break the assumptions in existing driver probe
> functions?
>
> Currently, drivers typically call i3c_device_match_id() in their probe
> routine and unconditionally dereference the returned pointer.
>
> When an I3C device binds via DT or ACPI through this new path,
> i3c_device_match_id() will return NULL. If developers add an of_match_table
> to existing drivers to support SETAASA devices, won't this cause an immediate
> NULL pointer dereference during probe?

The i3c_driver probe callback does not receive an i3c_device_id, so a
driver that looks one up must handle its absence for firmware-matched
devices. The spd5118 driver added in this series matches via
of_match_table and does not rely on a class-table ID.

> [Severity: High]
> How does this change affect module autoloading for newly supported devices?
>
> While the patch allows devices to match via DT or ACPI, it appears the bus
> uevent callback, i3c_device_uevent(), was not updated and only emits the
> generic I3C modalias.
>
> Since of_device_uevent_modalias() or acpi_device_uevent_modalias() are not
> called, won't the uevent lack the required of:N... string, preventing udev
> from matching the device against the driver's MODULE_DEVICE_TABLE(of, ...)?

This is a deliberate trade-off. Emitting the OF/ACPI modalias from the I3C
uevent suppressed the native I3C modalias for standard devices (the
regression raised on v5), so this patch keeps the native I3C modalias.
Firmware-described devices are still matched via their firmware node
(of_/acpi_driver_match_device), and probe/bind was verified on the target
ACPI platform (SPD5118). If OF-modalias-based autoload also needs to be
restored for such devices, it can be added without clobbering the native
I3C modalias as a follow-up.

> [Severity: High]
> This is a pre-existing issue, but can the removal of an I3C device leak
> uninitialized kernel stack memory to user-space?
>
> When an I3C device is removed, i3c_master_unregister_i3c_devs() sets
> i3cdev->dev->desc = NULL before calling device_unregister(), which
> triggers a KOBJ_REMOVE uevent.
>
> In i3c_device_uevent():
>
> 	struct i3c_device_info devinfo;
>
> 	if (i3cdev->desc)
> 		devinfo = i3cdev->desc->info;
>
> Since i3cdev->desc is unconditionally NULL during removal, devinfo is left
> uninitialized. The function then proceeds to construct the MODALIAS string
> using devinfo:
>
> 	return add_uevent_var(env,
> 			      "MODALIAS=i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
> 			      devinfo.dcr, manuf, part, ext);
>
> Doesn't this deterministically embed uninitialized kernel stack data into the
> uevent environment variables, exposing it to user-space programs like udev?

Pre-existing (the desc == NULL case in i3c_device_uevent()); not introduced
here. Better fixed separately.

> > +
> >  	return 0;
> >  }

Best Regards,
Akhil
