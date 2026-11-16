Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830574;
	b=h+cr1Gqmr+M2reVmhUEc2DZZInHD95hS+jM5hcPsh0c1TBBZwllu2HZF1bzDH5qWzNO8
	 JFivF+/86eFgDf2ujYy8glLMIj7hFvkWwF2UIovv1e6IseBQEiWUk+6RK9kgglLyk798i
	 MIdpTw7aIwNhi0Y4wOLqovBvesgLOyh+awMp64iwCZ3vr7AflCqRHE3kKNtzZjqbVoNKH
	 hBHRTMNWO9GJcAPsu9Dn6Yyk3Sa8ppF6xz8tKkmYEpX7Y9NpWpHhLfII026db3Bmm5UK2
	 k9om3qael4Zb1KOBrkQLfbmJNtqFSSeWkGkN55pmm93a2M7PFRuDHwhN/WKkVsGVMUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830574;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=syPS5w91SKjFrtVe9Mq28t/5RjkAfA5VSyynxYLl4rk=;
	b=dSv9fIkEbgcfKZMLtINXeP7tFU+TTUGAuGSJAGhVltiubCAKv+K3Q0Zo/Nzbx33d10+7
	 mFxD8JDGS0MV/Js7g6a+V3CRZRZKODm4E3EQnMP5BSm6g4krJatCwMVhzb4urUdMtmVwC
	 zUxPRarqojdCsRVA4kbbmia+FJ580s5PdPVEt28mhEbNWLthNwblZPpbg20aFidnKtghL
	 jgfNUNZsB7zJl0umdVTltolVXS04BYE80Hue32P8VWjattA/OiewM91/ICi7o6zhahdii
	 gy1VPllsaIotkWgDlpVbBSRUd6iq/980A7mYSCByu0lA5sAaig3aOBsh1MTiE5AQ/wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bhgTAwG2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013007.outbound.protection.outlook.com [40.107.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00533606A31C;
	Mon, 16 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00533606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bhgTAwG2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxypYPm3nc3kWantdgJN2ps1cJ/fX2+ynx4iqCT1tNm4xVNUN1aMsCu6ejznxkS2supeX5FqM+h/RVjl+Nu7cDWkldT0wnDn3ukfL1Bbp+1gIc2MNJ+62HoAJR6Gy6XUAono2bcxBc4d62S0gjRFfurvN+ZOhhoQ0EBnk4V8o6Ox1O2j0W9t3Qmnc7UkykJ4xJ06mcVfHBuYgcBVomoZTDQPppdqmjx72ri8cgoeCjRrkxgs6at/+KsGAFmfU3BEpY/bwH84y4mpH5ic3/uXCuR+zyoQ6L0+tjxT/DzF3e57NQT28/se/F2IexDHW7FS3M0O/0c2HeLSJD3PAL5KfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syPS5w91SKjFrtVe9Mq28t/5RjkAfA5VSyynxYLl4rk=;
 b=mdapyXxie26U/XRUdwDV7DSw/geum1Dl62EKFEwivnlhNjYVMGGIKEQm19EYTepT6rknt9eeFDn6QOVvHp1SlDrFDC5TzEwBDkbAHWKcT1eMtwUOKi+hfygxEJ36Sftc2IxoyqEe83rWSfg/Oj9v+4PzzhAzbRe7JHh6+PxcTetEEBG+nqYfWohjk4jsvelQYxfXoSOLMUQ2MuK4VmP+9IOnXce5mW1ceIDiQG1MW4sBjPsh92g47WvjOI8u0GW2sS8bmn85TUECCNsQ3mlhx1YV7SXQ9QC9Ac6TcJLRKbZgB8gUR/P1zMrJZdnYbgq/fXqMvP7LiKffFOys55zStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syPS5w91SKjFrtVe9Mq28t/5RjkAfA5VSyynxYLl4rk=;
 b=bhgTAwG2oysenC9xgduhrxPQQI+5yr65aujRrC1Eoquw27czLNonpOLrcuOK2eo/XCrcSuZmLIpnIxG9Mr0JwvSvNyBQyungjXvbY58vUC7m61MiAOhYCWbDp156yW4hMKBJ3yy4ybacp2wB1YzSj3zwEXwPDAFPRChzr8CcFrQ=
Received: from DS7PR03CA0210.namprd03.prod.outlook.com (2603:10b6:5:3b6::35)
 by SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:02:48 +0000
Received: from CY5PEPF00000E7A.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::60) by DS7PR03CA0210.outlook.office365.com
 (2603:10b6:5:3b6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 12:02:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E7A.mail.protection.outlook.com (10.167.247.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:02:48 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 06:02:43 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 0/4] misc: amd-sbi: add DIMM thermal sensors to sbrmi
Date: Mon, 16 Nov 2026 17:32:24 +0530
Message-ID: <20261116120228.865196-1-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7A:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: a495a48b-9618-4705-448c-08df43d9884e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261021121427099003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261021123027099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	b4XM1ZjjEmQfoA7qtAJzGHRX3eHR5IjnQdAjjh0fj9TJYorKzv5Oe53xcen7G7AQ0OjsUsyaFVW7KbbMf3YG6chTitvVqbSTUEoj1dPLD0hU1ecRopcxA9tzh+X9lNM4JyjFL8rorPJCIhsyDn9fRaM1cg+9dJnDI508Yk9ZYrnM3FJ/ja7hC9cloIvzT6I9m8pdKl1PfosxAhXglHB5d1sGnFlzzPBS1Awx0S4Bp7BxPCZ14nE7asLeTc/WlmigIoJhVj/V88ff4U9pXHUeRCFPHqKxTlOw5/cMgsgw7EFMGlM/1BmBW1ubTJal9B1fFiWxY0CVHj7AdkGj1uGsp9JWBjNtz8VB86yfDer0eCdZQfdGn9LnniXyhTR+3ebzWcwcTcn+MTZzsE++IfDiaqgnBUfwNuE7j2Rb4LD//1mghNp6mV/tHlSsdkKP5gibFTp6nj/ugjkRZjCo7xYELia9HzLZzn49dpkpCg/POvEraV4ekeZjHF2w4m+dAGlD2FYgkTgxfuau2l/MyVsWSHnbxagYfmITiT90qz/Cl17Vg2+lPNtSQE9xT6uos5qaPDKwJeHcohBJsVvzuUeHW6CammKTXKMlz91ZO45MMKmTti9dzTclJN6wDlSXDOpxdXfWz5vHQWKt039sD8U5cmM1cSlUZHGx/Ya7D6ru62ebQYFaZ0W6SIOI/Jg343dcil4WRAS2yVi4UCinID+1PA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261021121427099003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LUFycC46AEqeuFgOj+ln6/33enQQaV1k/eh3r3nrhpuCZ0qolgbnKc3rp8lCO6ju3xvLy7SaHAGAotBWYQUMiHvbEfxcYh+4+ztB1NnnVVbF9B8RU7aE9apt0nwHD8V2Dr2JuRFWAnfIqp5HmTNH8JxIvnQmNzR/yA9CJVzX/Fs5Z/YkmvXF7WBwfUksnSxt5V0c2PuB19ZjHU5alkeglMgYmpbqEo4h97LZqE1JPEDmNpKCpJbbryJ3XKBakMES1bFGB3PKAByv5wDyIQirOgpOxnGmCvCGFMftD7G5BqpU27i+0dVwwFDgD6JxPYQwDPLT3waynv2Gw6DdGJd3JsiXDQr6zFdWL3U2iOT2/x0YSrqcAyTFxX3tJPjFczqrLjrV88xHBRJJ9VHaU3c+9n5QzV+PSHftX7bl5EFrldCP/35mM9SsuDDSOvlBl2ID
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:02:48.2795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a495a48b-9618-4705-448c-08df43d9884e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614

The sbrmi hwmon device reports socket power. SB-RMI can also read the
TS0 and TS1 thermal sensors on each DIMM, which a BMC needs beside the
power attributes. This series reports those sensors as temperature
channels on the same hwmon device.

The read is mailbox command 0x48 with a Mode 1 DIMM_ADDRESS:

  bit[7]   1 (Mode 1)
  bit[6]   sensor select (0 = TS0, 1 = TS1)
  bit[5]   reserved
  bit[4]   DIMM slot
  bit[3:0] memory channel

Up to 16 DIMMs are reported, two sensors each. DIMM n is temp(n+1)
for TS0 and temp(n+17) for TS1. Each channel is labelled
DIMM_TS<t>_UMC<n>. With one DIMM per channel, n is the memory channel.
With two, n is channel * 2 + slot, and the addresses interleave
(0x80, 0x90, 0x81, ...). The temp index is the DIMM number, so a DIMM
keeps the same tempN when other sensors are left out of the map.

DataOut[31:21] is an 11-bit two's complement value in steps of
0.25 degC. The driver reports it to hwmon in millidegrees Celsius.

Boards differ in how many DIMMs are fitted per memory channel and in
which sensors are populated. Two optional firmware properties describe
that:

  amd,dpc        DIMMs per channel, 1 or 2. The default is 1.
  amd,dimm-ids   Mode 1 address of each sensor to expose. Only those
                 channels are visible. If the property is absent, all
                 32 channels are exposed, and a read of a sensor that
                 is not fitted returns the firmware error.

The binding and the driver reject an address without bit[7], with the
reserved bit[5], with the slot bit set when amd,dpc is 1, with a
memory channel above 7 when amd,dpc is 2, or listed twice. An empty
or unreadable amd,dimm-ids property is rejected as well. With one DIMM
per channel the allowed values are 0x80-0x8f and 0xc0-0xcf. With two
they are 0x80-0x87, 0x90-0x97, 0xc0-0xc7 and 0xd0-0xd7.

The mailbox transaction and the existing hwmon registration both live
in drivers/misc/amd-sbi, so the new channels are added there, on the
hwmon device the driver already publishes.

Patches:

  1. Switch sbrmi_data->lock to guard(). No functional change. The
     DIMM reads go through rmi_mailbox_xfer(), and this lets the error
     paths in that function return directly. The patch stands on its
     own.

  2. Add amd,dpc and amd,dimm-ids to the amd,sbrmi binding, and mention
     the DIMM sensors in the title, description and example.

  3. Report the sensors from rmi-hwmon: tempX_input and tempX_label,
     visibility taken from the DIMM map, and the 0.25 degC conversion.

  4. Document the temperature attributes and the DIMM-to-temp mapping
     in Documentation/hwmon/sbrmi.rst, and point to it from the SB-RMI
     section of Documentation/misc-devices/amd-sbi.rst.

Thanks,
Akshay Gupta

Prathima Lk (4):
  misc: amd-sbi: use guard() for data->lock mutex
  dt-bindings: hwmon: add DIMM thermal sensor properties
  misc: amd-sbi: add DIMM thermal sensor support
  Documentation: hwmon: document DIMM thermal sensor channels

 .../devicetree/bindings/hwmon/amd,sbrmi.yaml  |  59 ++++-
 Documentation/hwmon/sbrmi.rst                 |  37 +++
 Documentation/misc-devices/amd-sbi.rst        |   4 +-
 drivers/misc/amd-sbi/rmi-core.c               | 148 ++++++-----
 drivers/misc/amd-sbi/rmi-core.h               |  10 +
 drivers/misc/amd-sbi/rmi-hwmon.c              | 236 ++++++++++++++++--
 6 files changed, 395 insertions(+), 99 deletions(-)
-- 
2.34.1
