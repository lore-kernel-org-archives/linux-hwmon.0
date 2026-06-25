Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB740D567;
	Thu, 25 Jun 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380324; cv=fail; b=j86JEPhxalEoDqJhkChm8ZA15XpbnNfzEM2xjNvZoHug28cosClPuyzZ+LzQo7oQwi4IW4WlYfwaDSiQWUv0UGaYduWbWfI0KfQDWCa3KuNVsMJ8HsPGmWzGEbJ/F5ZioLBK1JmaEqXzxKjmhitbWQHQH2bD4BG/+XZBQvgPx5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380324; c=relaxed/simple;
	bh=9xKeG9nc5tg3XTQjU57ZQ48fhA7THD1iCnQDaw1jNjc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUxyfve96BLdqoMMRPeedKBio7IqslpsOmwdLpfP0h4kpVKc29UMfDGU/0Q0fDnFTAhJnpWG8yXtsiTVxVk7dwGHCZHve8HY1wLLw5eqDOMByxsoW9z88i3aJQpJUBYiNTmf2qiNHZcSbdqY9E0pjo5sUNOHqca76SDj7rG64Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l98A9RUD; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l98A9RUD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRnqlr/IUZf/yTUsjpZ2uAaoXNmFfsUlmW2PX4g7mSvF1JyARb68TzaLQoAdm01TIsKw8ourzBhkOWg3VzBiKwusTGMkODs7JyY5KXcAxccEoYLaPmLcfgcVH+ZOqBJi0yt9ymEflTQptPeEQ2tZQdShVKHLdey5Jl+zVhDwimJvtc1fggotlyzaPyK7kpiILN0lcgRvs5GtzyK7T+q3B6DZn98kcp3iw1q2fAn4B4XHvoOb94H33kTDvbHFZvFUEYRzga7A+fhnXvfdkFtWerzLdV0u5cyDJ/YQhRCWALzkMPvlV1x5gZBbTQ8jh0OVnueZZsNI2KeMjVCmZ82rJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pg48n25lL1iA9Cj6kylt7j5xobV3uQgCTOs6c9WQzs=;
 b=RgKpgS6BRmt6YLRhjeadmllh4i4P25ffaBIfWBlDPqus6czHc6ct+zyy5BBbM/BJr0BcYBw6GtvhLMDC312+kLoUx71j2SjMj97/PwNWD2s/dv9Qk1+YoZbZqKLJO47NIc7iFjIB0s5L5jDmeQYS6movj5P5yg3RndZPmEJddgLjCq84im6KomP4Lql5Bdj5lPvHDyvs9sPMpNB/NSG3a9otbmP5bcUTZADWvl2YjlDIHn4Gcx5sHi3x4FtVvT7BIGgrgWB5UikQcYJKfxURwgN+iEXrgP3DnxAlLUhzJGuJgikeTwyWgcG0XnmiiIdVEO/Wo1k3j16DNdqgmDIkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pg48n25lL1iA9Cj6kylt7j5xobV3uQgCTOs6c9WQzs=;
 b=l98A9RUDjVmhYrv4T5kIP+3h6NcPpzAFpd+t6rkZKCFqHN3jBVKbqKThnm60ytukgFUT1eUWSPsRTmQNF14S6hGC/QpI5A2X2Eizonj69RDQlTWXshf6/VPzRsnCDOimEue/P64bKYC4qPu8eJQ35+ToQQWDQSqXIkbBA3GRLPN0FHBZxjGXbA/H9OR3UfSvr0EE4NYZubWk7mUZwjUKtOGicSZ+6a4bq4e+hvZIoiVRgR0EddwDeUsPEzf8QammWMBQrVtIP92aTPXs74RzAaKtaFBfr2B4a11AD7KzJ76PvvS45GtBZuFxG1fiDHovQXpNmPWSrIwPQwagPBsbWQ==
Received: from MN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:208:52d::24)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Thu, 25 Jun
 2026 09:38:38 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::5e) by MN0PR04CA0025.outlook.office365.com
 (2603:10b6:208:52d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 09:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 09:38:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 25 Jun
 2026 02:38:21 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 25 Jun 2026 02:38:20 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Thu, 25 Jun 2026 02:38:16 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@oss.nxp.com>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <robh@kernel.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v5 04/12] i3c: master: Add support for devices using SETAASA
Date: Thu, 25 Jun 2026 09:38:15 +0000
Message-ID: <20260625093815.1794492-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ajwamrU8ehBINzxq@lizhi-Precision-Tower-5810>
References: <ajwamrU8ehBINzxq@lizhi-Precision-Tower-5810>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ba63e3-d908-4e2d-7789-08ded29d88d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NyaYoNtivXhW0Pady7qzrQ8nv31caJ5GKBqQTH1l9jiKGLkvDVSA1oetMJFkyN4hl0jy7kneKtJxueN0d8wGxkitylJr3n4To+mEiiqL0s8gr/2fNuo2zr/YM/FLPdju5+FyI27pRflIJ/XUr6UdObVh6p45NsuZ5bBOZNrIzM8qs4f2nP7i51f+KCi54cnHp3+OqQXfGJ6k6MQETqTe9KsvunTWARI18o6IbTKww5wbkNHLzo5pKMs5B+Y4I38D+Il7HbNr9kE9sApwikF0nA4Gxsml2KKWPBldKFuA8YnlJAE5VzbTkAy9O7Frg5/4cf/XEVeGt4eN7EXI3PqOEXdJ0Y61fkIVkv4NCdKiTPpmAmqjc/H1phf52gn/LIOjE453HFlbeD2hKewy3qoRJ1aIBl+7mfAJWfnZMPUHGGkz3asRzMiFd0zqtY7HlAG60hhkVoEWXJPuLb3FirzOOM5e5GoKQe0D7DQGm04QwWLiC94UgsPhtxt8DOeFcvvMTpW1oaXxW0MQU+zyEV35Njhgs47PqON5ZBrNmLEyita0HcuFStQEpjd23tV8WMKnGmnGzCLJKYTrZnmK2hiYLRh17TTIXvVIQVXYJj+3IrjmZOkJd3xfouW3bEqKSxiIxRmoquEGpKet74JUqGBcPOK20dSgODNJ4P8AwViq5Kv3/JfA/CzZi0oalnWYipL2u58RlJoXizXInwnCDnD1hw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(3023799007)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FAkjHJDhNE4OcquwbEPAsOcpX2H3cUJ6bAIwsoLN5QEELlxJM+F10uuUw3YEX3kxcsXWNWWyhZap7PDPoiQ1GyijvDkLdZy2uvhLOFcclReQGtzvC1LzJzTo8ZEIUzDNUmnZrRKvz27Ve24s5HKPsp5lgjZC5FFjFYLv8aSjjbbtDU8IqGdNlR7N6+Cipar65Pi0JPcJCKqp6VvbfU4i9fYG9TJRbB6VGf/LOp0YO1aTg1rA+ymj3dgIwfXcR7X8h7k9jM0M0+Pl9blhVcInylNHj6hYfXhYhcRm8fN7gwn23xuOmRgEGU17h1cOCILlSyF/h3GLbvamKfP3u+xkoSz3J83mJdxNSVrsVBlXy818P23oJbHvZBzUNDbpXb3hIMwRlQZedHJsokLVnWbhKPGLtikqUB3ozy74guPlRULT/aZjtq3srFzfPND/G6TA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:38:37.8961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ba63e3-d908-4e2d-7789-08ded29d88d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893

On Wed, 24 Jun 2026 13:57:46 -0400, Frank Li wrote:
...
...
>> [Severity: High]
>> Is it possible that sending the SETAASA broadcast before direct SETDASA
>> assignments breaks initialization for devices that natively support SETAASA
>> but are configured for SETDASA?
>>
>> According to the I3C specification, any device on the bus natively supporting
>> SETAASA will respond to this broadcast by adopting its static address as its
>> dynamic address.
>>
>> After this broadcast, the driver iterates through devices and attempts to
>> assign custom dynamic addresses via direct SETDASA commands:
>>
>> drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
>>     ...
>> 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
>> 					i3cdev->boardinfo->init_dyn_addr);
>>     ...
>> }
>>
>> Since the target device already adopted its dynamic address during the
>> SETAASA broadcast, it is no longer in the unassigned state and will NACK
>> the subsequent SETDASA command.
> 
> Look like correct, but I am not sure if target will NACK SETDASA. Or should
> use SETNEWDA for SETAASA method.

Yes, this looks valid for mixed device buses. I can move
i3c_master_setaasa_locked() after the SETDASA handling and before
i3c_master_do_daa() in the same function, so SETDASA-assigned devices will
ignore the later SETAASA broadcast. Does that sound good to you?

Best Regards,
Akhil
