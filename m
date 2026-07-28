Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF45346ACD;
	Tue, 28 Jul 2026 05:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217677; cv=fail; b=goAByFym5Cky8IcY7zFRf7KV9Gal77moBPyUFKs0qQbSJW5ej161G9TP4w+8B034nEa2aeY1rESGBVGBMa0ly8Xt/yJcp8vxHKiNGb7+e8A6nuFoAGUO/ukcuigz0MxSoY7ROaltlnhxZnmPvtKujql/yr2zswQQrj5OLpehSBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217677; c=relaxed/simple;
	bh=wakawn+zSq3BPNIn15exneLRzjjX4+VjxNmd3wYz2D0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OtWXAQRsD8yQMu+igyhE9b2WGzbRyY285AjsbWfAE28p64mwqHx2IPnUhMC2KjiWIOwGkTcMG+3KfXZfTSm6ARXFlz6hYeI2AKKUwP2KPe1zlq0FNbpX5N4MfG6k2FzHd7nwrirTgN+iDNqxM95RBQYRGzF7QkzyzhsH41cvMyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AQJxeJnY; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AQJxeJnY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUyVXtnUfRZaKeEC8VTL3mUjIQUh/3988+s92Z4UEa0jhU8Grpd/wO5h91pNcnvBHG/f/s85Ei8Mr3jKxbxr/ybfQqDXzwAlGB/5BY19V8/5JB8TlFgI5P8fWzrOX9mIFNqsvQZ7B8uhTHffuneX8xRRLlTYzsucTkuYWmOY+zkwEFJpl06oscucZkEdtR0OPwHt2V3GQtthXTiUASGY7x6ouAeRmfmtw8ygPVzCp6/z6BS7fBefpZ4OzXdUF3XuSGaKNo5vsmKRU3DYVYlEHVDPggF/5MwZE6MEto1DXs4EvL5EpUaaSjFqkW3vy4BA5uzhAn67n8GJc5Sdoq5lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceMkJo/kmqcEhMJ+WGWOYjuw6xZTTz6sLpP4vHRecUY=;
 b=V7WJvkVRheHN5BtHVawJxmpxzN76vpL3nzAPRaLvycu4aclR5VEC/7I0qM7TikR950jUZI04POcQzNa51TheiSJv1Pk+O3MPHzs3WoUrCogRaxjMg7rEiC/D6nce/ayInrVhE/yPfVwNclb4LIj2dbCNMWqa1g/iiG6/U5x3PpoF4KfGCP8Fw1/0htHZSHhIzoDlWB/G5UzReoGTQNJ4GO+cxEBQVGbzXOA8yN60ARQ+VdIKNNhjyhgIrvQwp945BfMOCnLcOmfZLedD1m6vCdR0MZx9D+DBerqvhldpSNhQavNkHFZ0rTf7weYRCe2nwa2CXQ8NYI8r8EMwgogUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceMkJo/kmqcEhMJ+WGWOYjuw6xZTTz6sLpP4vHRecUY=;
 b=AQJxeJnYolw5FuF8DnN4IoduGfVx0STZdFo8Y88hfs67bF3aNXkUHdB6Xe4hvrwtJGUixd/hNQPTGVy5G2cSdn9Iz+LkamvsUGsf9z7mDMhaabVJm2Noifbk4i2kQbpU6ycetUJ/QYiOj+ciwEBYdSKZSZFK/CUSK9r/mRsgfe5vRnQ6n9BzekJxQgBYiwQuWtDPPq92CvsiiZtdcWRPbvIR5GOakCf+qDLfu8b2RCpoLupxFULzkvF+32jXUfA9rMUzqRjDR1lbHn1aARLB5bAohxTDO+rhZ4ypWSHx/f7HYtk5CDKuz+UKofUgfkuiIZEkULvE8S1pCV85U/Iyjw==
Received: from DS7P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::29) by
 LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:47:49 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::7) by DS7P222CA0008.outlook.office365.com
 (2603:10b6:8:2e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 05:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 05:47:48 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 27 Jul
 2026 22:47:38 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 22:47:38 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 22:47:34 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@oss.nxp.com>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>, <sashiko-bot@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v6 04/12] i3c: master: Add support for devices using SETAASA
Date: Tue, 28 Jul 2026 05:47:33 +0000
Message-ID: <20260728054733.541172-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ameDgqvp2pAKDEsE@lizhi-Precision-Tower-5810>
References: <ameDgqvp2pAKDEsE@lizhi-Precision-Tower-5810>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4efbc3-5a01-479b-6695-08deec6bc1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|7416014|3023799007|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KljFiHqYO8gabeQORfHWDM9h81tpr/zRWesMNgHuj8MZGZmxLOTrVc0Na/JRpS8z03PSn1MWwAalQgTgETpEktIEopkG0/geJTwYT3i5CpFYLOoDYcBLR0TfFR4RKo+G8NxhrvdnX0HwbFxagrITZRCS3Twbsqsx1atGTOga4HixNNXsZjGojvrISUzif1pxEQ7Yj2zjJpc7d8GhJwYnKQ3MKX6j9z/HWDP3Ogn1ffD1eL9MB/uigyIVDsOQY1TtBMNCNj9Xfjrtc8BIgDkpYAsky8/71QAdD9FkrcS4wmS66Vc4rJM+OOoKvaRymF4X7iYFs7c7gRAW+yF5p/NSiW6OZ7elT/JUFo2PfEBvDKwrVXs1c5v7kjChAgTR4utonDWkTicrhFSEaAwmeKP+Wy4nUV8IpJPVcCrNUfKxuhQm8swiaZIbObMSWJx8ZsbU/Oc/JWgej6jJ6+LNL0HfWXNkBP7zsP8Clzg4XoHe+C2GE/JMlxp8/hcsmfwAyLClvPpxOqZej1h7PmnMx1HsfOr+q2Gu9ImkqpiFSkOof9TlXtXNiyp4V4mOjsSMtqMwH+58yOHh63zROuEHw7Fd794I26WEx0UwzIEs3oCamGaQKeL/HAbOqKnc6RX6Qtspg7L//OnvqYRWj7Nc9yu5HmnyVuqcTpSOOJdEmjWeFOMW/Ins8dlxXYaF93zdtcCFcqouHACCdNSLBbt1ezooWA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(7416014)(3023799007)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NzxzLUMvhFMB3Xe+r2EBxhStrLWmaY98gxnfwNw/y56RQw770M3PpVkWORoE3nyghHaXNtvOh7wXljj2R+DasdI2DYVbs1c1nFa7Aespocttopi3XhbRZ2avoUwvO31bBALZqCfByyA5PieL+z/MsSbUaTn5DlZb1VQkF7d7UwumQeY7tX034IJyGwMc45HLi7OBbMTRjsgGIJzjKqxHjd8qNJp1zjLh2SG2G6fZLQukGi8K2RpI3qbT9GhBtJuPKjdT1TJ9PrK3qlXVRyVeud78BnuW3WbK5945gIFkr60I0OIrQUhtYTutpAN2JyQSu16729nAFPhl6C29NvnBRtoHVEL6UXWT9qYuXf8NWFrILBrFN3ta06XyI1Gj/7rWJzyf0bL1CQOLtUSxyBdQpur2Udx2Z7GHK8Y1/AWy7EGNfyEKIlz/qLa9qcu47b/7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:47:48.6928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4efbc3-5a01-479b-6695-08deec6bc1b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967

On Mon, 27 Jul 2026 12:12:50 -0400 Frank Li wrote:
> On Mon, Jul 27, 2026 at 12:57:45PM +0000, Akhil R wrote:
>> On Tue, 21 Jul 2026 04:30:58 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
>> > commit e158b576a9f733695d868ee16f34bacdb43285b3
>> > Author: Akhil R <akhilrajeev@nvidia.com>
>> >
>> > i3c: master: Add support for devices using SETAASA
>> >
>> > This commit adds support for discovering I3C devices using the SETAASA
>> > procedure, such as SPD5118 and SPD5108 attached to DDR5 memory modules. It
>> > adds the SETAASA and SETHID CCC commands and updates the discovery logic.
>> >
>> > Link: https://www.mipi.org/mipi-disco-for-i3c-download
>> >
>> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> >> index 623c6b2247d9f..b18dda89c4737 100644
>> >> --- a/drivers/i3c/master.c
>> >> +++ b/drivers/i3c/master.c
>> >
>> > [ ... ]
>> >
>> >> @@ -1102,6 +1103,51 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>> >>  	return ret;
>> >>  }
>> >>
>> >> +static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
>> >> +{
>> >> +	struct i3c_ccc_cmd_dest dest;
>> >> +	struct i3c_ccc_cmd cmd;
>> >> +	int ret;
>> >> +
>> >> +	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
>> >> +	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_VENDOR(0, true), &dest, 1);
>> >> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>> >
>> > [Severity: High]
>> > Will this fail on most existing I3C master controllers?
>> >
>> > Looking at i3c_master_send_ccc_cmd_locked(), it calls
>> > master->ops->supports_ccc_cmd() before sending. Many core controller drivers
>> > (like dw-i3c-master.c) have strict switch-statement whitelists for supported
>> > CCC IDs that do not include these new SETAASA (0x29) and SETHID (0x61)
>> > commands.
>> >
>> > Would this result in returning -EOPNOTSUPP and aborting the entire bus
>> > initialization on systems with these controllers?
>>
>> SETAASA/SETHID are only issued when a device opts in to the SETAASA method
>> (i3c_master_setaasa_locked() is called solely when addr_method has
>> I3C_ADDR_METHOD_SETAASA, and SETHID is sent from within it). Existing
>> drivers are unaffected because SETAASA is a new capability they do not yet
>> advertise; they can whitelist these CCCs when they add SETAASA support,
>> which will have to be updated in the individual drivers. This patchset
>> does that for the DesignWare contoller driver.
>>
>> > [ ... ]
>> >
>> >> @@ -1878,6 +1924,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
>> >>  	if (ret)
>> >>  		goto err_free_dev;
>> >>
>> >> +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
>> >> +		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
>> >> +		ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
>> >> +		if (ret)
>> >> +			goto err_rstdaa;
>> >
>> > [Severity: High]
>> > If i3c_master_reattach_i3c_dev_locked() fails here, we jump to err_rstdaa
>> > and eventually free the device structure. However, i3c_master_bus_init()
>> > later unconditionally broadcasts SETAASA to the bus.
>> >
>> > Won't the physical device claim this static address during the broadcast,
>> > even though the controller software no longer tracks it? This could lead to
>> > a bus collision when the software later tries to dynamically assign this
>> > "free" address slot to a different device.
>>
>> Address conflicts between statically-addressed devices are rejected up
>> front in i3c_master_get_i3c_addrs(), so it should not cause any address
>> collision with other devices on the bus unless the same address is being
>> assigned through ENTDAA. If this is a concern, we can avoid freeing the
>> static address for SETAASA devices even if software attachment fails.
>>
>> Let me know if this needs to be done.
> 
> Try it.
> 
>>
>> > [Severity: High]
>> > This is a pre-existing issue, but does jumping to err_rstdaa correctly reset
>> > the hardware if reattachment fails during SETDASA or SETAASA?
>> >
>> > If i3c_master_reattach_i3c_dev_locked() fails, its internal error path calls
>> > i3c_master_put_i3c_addrs(), which marks the slot as I3C_ADDR_SLOT_FREE.
>> >
>> > When we reach the err_rstdaa path:
>> >
>> > err_rstdaa:
>> >     i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
>> >
>> > i3c_master_rstdaa_locked() checks i3c_bus_get_addr_slot_status(). Because the
>> > slot is already marked FREE, it returns -EINVAL and silently aborts without
>> > sending the RSTDAA command to the hardware.
>> >
>> > Does this leave the physical device holding the address while the software
>> > considers it free?
>>
>> Pre-existing; not introduced by this patch. Better addressed separately.
>>
>> >> +
>> >> +		return 0;
>> >> +	}
>> >> +
>> >>  	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
>> >>  					i3cdev->boardinfo->init_dyn_addr);
>> >
>> > [ ... ]
>> >
>> >> @@ -2741,7 +2816,19 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>> >> +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
>> >> +		/* For SETAASA, static address is taken as the dynamic address. */
>> >> +		init_dyn_addr = boardinfo->static_addr;
>> >> +	}
>> >> +
>> >> +	/* Update the address methods required for device discovery */
>> >> +	master->addr_method |= boardinfo->static_addr_method;
>> >> +
>> >>  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
>> >>
>> >>  	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
>> >
>> > [Severity: High]
>> > By relaxing the PID validation for SETAASA devices in this function, pid can
>> > default to 0. If a system configures multiple SETAASA devices (like DDR5
>> > SPDs) without PIDs, will this cause a kobject name collision?
>> >
>> > During registration, i3c_master_register_new_i3c_devs() names the device
>> > using its bus ID and PID:
>> >
>> > dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id, desc->info.pid);
>> >
>> > If multiple devices have pid=0, they would all be named "0-0", causing
>> > device_register() to fail with -EEXIST for subsequent devices and preventing
>> > them from functioning.
>>
>> Static addressing requires each device to have a distinct static address on
>> the bus,
> 
> Any check and report error if two devices have the same address?
> 

Yes. For SETAASA devices the static address is also the dynamic address, so a
duplicate is caught in i3c_master_bus_init() while reserving the address slots
before pre-assignment. It fails with -EBUSY and the bus initialization is
aborted. For SETDASA devices, a duplicate static address is rejected in
get_i3c_addrs() when the device is attached.

The kobject conflict is resolved in the subsequent patch, where SETAASA or
PID-less devices are named with the static address instead of the PID.

> 
>> and PID-less devices are named from that unique static address
>> ("%d-%02x"). The bus address-slot management also prevents two live devices
>> from occupying the same address. So a collision would require a malformed
>> description with duplicate static addresses, which is not a valid bus.
>>

Best Regards,
Akhil
