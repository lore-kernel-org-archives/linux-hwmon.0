Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830597;
	b=ERArhe3Fubr0xAVSg7u28EPFE03hdB8ySac0wcEZvPgPxptxhTW//XKxrx1k0QeCvYvK
	 Za43YC2fUq7EeIvklqkNWE8r1i+EJh75jTCJPFhRuOWkyKaVhZOvBFoCSLvdZfq3tCS7h
	 BNwgMCMazBNAU3sT26SfL7RDgbamTb5y5v+gs9SzDZ2J2ZNU8COD5XjZKYx51Vh0HiTy3
	 +n8dIkrH58Way/hWHJK+xjsndubdYVfJcuwFqyernsuqV7aGowjbkX/RkEZk+sU45xZii
	 wQMHYmQy6TCHdJDIId0a5uOC91CrOBEeQcu4sCavLRFPib36GjYIN0WDoU0XSxS5K/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830597;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=I25oiglLrUzVRCEMM9jHZPyTbD7zyy/tDL/QDW30Qbs=;
	b=m/Vn7tKWVR9O9k02R5cE10KtGiG1iTO9kjeeQUvdBnJLJP9AMS+7wyviJG1sF966zBdj
	 H5fYcpdUn78fRLoTkAc8a6/o2PJyDB3QLGvrlT8ym38rkVKgw7gzKgINuU8qNLz0/IU3u
	 EnF4lLcRHpmZ9WfPczNzxB7qcaHBC14RWQQvlxNi/VioFOsTSr1HSnMPbFJ2rAeM7dd/U
	 7koAw93h/w8VSEgkDiYT35IBPOa4N1dnEDEFBIW7c3WhgnGQZKUBCdF13ebP4OsUmPktH
	 TrafuTh4PgtOolg8fGj6Vx8Xsftlg061gF38wrDJ52G2w63nkYtGvAcXMlQh6Hl6omg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q1wyvGcN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.60
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52CB606A881;
	Mon, 16 Nov 2026 12:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B52CB606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q1wyvGcN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNNRLLmEuzqDrTosZ8e/QAzD9C6Kjb0W4Q5tujOrSlwY6h6WQFG+0wRX226ou7YEq+Mw3IT35BVZ5sNjlcTygixFe3zUowwMjhGTNLn0cTz4C/xxPbfo3299+bV8nyBrf4xFXVVYTcbpiYhOaartkGmsO4Z8SUrWt//hHsk0KV9ExBj+674ndds+H9vfbfwIJxScbKopTs4Lt/Wu8PtiXdUjaRAQnfxdvskgzlxJmlS3eOSit/HMu72U9iFWp3pw8A7jh3AXw+ECTcCfm+KfbKUT4TWXuUwoujUM0QGK/mV/P2rBfBsLBMNkYDEv/B6qGy/cILIsRXCGj7bI32m82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I25oiglLrUzVRCEMM9jHZPyTbD7zyy/tDL/QDW30Qbs=;
 b=SkiISaJkgMSD0RvUfa4NwOG8vrd++91zfXXbnJNttdyW3NzOoq9zXNu1mYtXl/Shs2TDpXwCeJ/y4eUW0SnqVfQecU+R5/uq50oZVH+zAKZ52f1M9Po7QH7E6aYznVj0vrx/NGjDfgxlXyvB7DajUTjsAc31z5P7kTVAONHpSUvsh2BwCOsFphCPDbfKkUgpO5uU5f0nAYI4wzFV2pCZZ2jv0G5oxNCiyhjF1cXszaU+csG6UzEGSvd+0591J9yaB/Onp5jtO9dIIUXbUbfAHAu/V7RliWbZ0ftHgiVPK0fCR1AoJTBv25a/FdPk9Fy0v8yFQf8nPZHGc1dzY6AgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I25oiglLrUzVRCEMM9jHZPyTbD7zyy/tDL/QDW30Qbs=;
 b=q1wyvGcNh6iBzkpoNPSGeIQ4Ihfv6HWZbySpacFFV9zJokb5b8oi9vfP7YRydR0DIYp9W3L/v9wGQjqUD1rkeCJ1P3t7v7UvO3uHp6i/Kn3y8p3Y/zujpJ3mB3xXxCcvbqANguWoaoQVWPbZ+cUjOVlLgwK/YiwEJ9wDNxce3e0=
Received: from CY5PR15CA0057.namprd15.prod.outlook.com (2603:10b6:930:1b::32)
 by MW4PR12MB7335.namprd12.prod.outlook.com (2603:10b6:303:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 12:03:10 +0000
Received: from CY5PEPF00000E79.namprd02.prod.outlook.com
 (2603:10b6:930:1b:cafe::8c) by CY5PR15CA0057.outlook.office365.com
 (2603:10b6:930:1b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 12:03:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E79.mail.protection.outlook.com (10.167.247.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:03:10 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 06:03:06 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Prathima Lk
	<Prathima.Lk@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v1 4/4] Documentation: hwmon: document DIMM thermal sensor channels
Date: Mon, 16 Nov 2026 17:32:28 +0530
Message-ID: <20261116120228.865196-5-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116120228.865196-1-Akshay.Gupta@amd.com>
References: <20261116120228.865196-1-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E79:EE_|MW4PR12MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f9c34b-7922-4747-5001-08df43d995b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|22082099003|18002099003|261009223027099003|3023799007|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	okW/2EVC9c+rsq8hTRKUxxNxkA3wyLeYUvgfzGFHYItEKyXcL4ttiip0okTKle8/9MwKUzu6nGz8lsLNERoavz7FODOYNzieyP7cgz6jl9gYHK2AvTq06RhD4SSkJySKjV/s6UAOwq5RRxF4lNrN4z7Is5S5wnrTQ6RNOHlHEURjb4Qu3h+1peRSwf0Mld+/4OH6et/PWlYLJZOQVyrI4Yc2Vv0/sHD2Kew/irjEV1B3ol+PYSjATtiwXVVCEvCt7jNjbAFlkK30RUnsKoX3VIYyz8a6ot+s/MH791GRx5Ox09ZU3iVVfnFFRiBFZdOXUxcD2EhyF24B9O7f9ECuvhGZ1l9cicyOpPRe+63+XNzQXTULPIK7DJB5KrL0P08nm67I3I8sV2OBu8cYC4JZeCTZE9cf+UbpXILBkCQNY44Kop3XDuc1Mhiu8kk1EkuXbZS3REMEFFLEyZdLC89iiJmUlebcAal3AljvdxVtbjFGAtipJbRf92Dyiea4FyzwEjcYF+Ib9zG/hTU476wj8+H++cuAdru5kp/vSjEN9Wkhi6+7flHOFTVg/ovNFJU91qLpnmhvqQ5BPA5XGFNnTJjwzmk/djxZx2WWqi8OEvRDmpXVNN72oyG56yxQgIbmzSsJnJaxehj1+DQrx8NkM3nfP47EJbF2GpsJzpWi+WfZ2Oyl4lHcy7knwCSnVFmGSNndTdqsmwiOiapy5jxGPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T49PMM+AqIVAQLxY2CLx4E2l1B9LKia+AcBx48O5kCoAH9n7yUedS4WLa4gJltNXbFp3MEK3Pt3Nf6Q42YaeuQb/c5Ui+AkXig6AKosS8vbI7K2H7R/XX+Rcx9bLetrHug+qcGTNdwejIJaK10eLOOKlxf99TNEK9NQXa51bzbrVeEuy8OxwPZELBizqPgSfvQm1u8lUtqrkCNZTmVNziUMkvV4cNvxUh6AFhlOh/QwHCGNrDwTE6bvVbjyOwsZ35EIOuj4dUesvzO7sq0oPkC0g0e6VARBvkD62J9j73NcjUMvnQcIt0V2nNEEdMQNUNjGnEvTjCRHPRScx5VGCThFfn5yfRM54sSUy/rk7UJtdCQqi9akjw4GmjdB679QORcRLQg6IU+sR84On/8ah8Od48adPdrThX3CNOeE8w62W/tsHItxzKdT0nJi3F7b9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:03:10.8028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f9c34b-7922-4747-5001-08df43d995b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E79.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7335

From: Prathima Lk <Prathima.Lk@amd.com>

sbrmi.rst described only the power1_* attributes. Document the
tempX_input and tempX_label attributes for the DIMM thermal sensors,
the DIMM to temp index mapping for one and two DIMMs per channel, the
DIMM_TS<t>_UMC<n> labels and the effect of amd,dimm-ids, and add a
sysfs read example.

Also point to it from the SB-RMI section of
Documentation/misc-devices/amd-sbi.rst, which listed only the power
attributes.

Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 Documentation/hwmon/sbrmi.rst          | 37 ++++++++++++++++++++++++++
 Documentation/misc-devices/amd-sbi.rst |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sbrmi.rst b/Documentation/hwmon/sbrmi.rst
index 296049e13ac9..08859763658b 100644
--- a/Documentation/hwmon/sbrmi.rst
+++ b/Documentation/hwmon/sbrmi.rst
@@ -41,6 +41,8 @@ power on AMD platforms using mailbox command and resembles a typical 8-pin remot
 power sensor's I2C interface to BMC.
 
 This driver implements current power with power cap and power cap max.
+It also reports DIMM thermal sensor (TS0 and TS1) temperatures read with
+the SB-RMI DIMM thermal mailbox command.
 
 sysfs-Interface
 ---------------
@@ -57,6 +59,28 @@ power1_cap       RW    Power limit can be set between 0 and power1_cap_max
 power1_cap_max   RO    Maximum powerlimit calculated and reported by the SMU FW
 ================ ===== ========================================================
 
+DIMM thermal sensors are reported as temperature channels:
+
+================ ===== ========================================================
+Name             Perm   Description
+================ ===== ========================================================
+tempX_input      RO    DIMM thermal sensor temperature in milli-degrees Celsius
+tempX_label      RO    Channel label, ``DIMM_TS0_UMCn`` or ``DIMM_TS1_UMCn``
+                       (n = 0..15)
+================ ===== ========================================================
+
+Each DIMM has two sensors, TS0 and TS1. DIMM ``n`` (0-15) is reported on
+``temp(n+1)_*`` (TS0) and ``temp(n+17)_*`` (TS1). With one DIMM per memory
+channel (the default), ``n`` is the memory channel and the labels are
+``DIMM_TS0_UMCn`` and ``DIMM_TS1_UMCn``. With two
+(``amd,dpc = /bits/ 8 <2>``), ``n`` is memory channel * 2 + slot,
+the DIMM number on the board, with the same labels.
+
+The optional ``amd,dimm-ids`` firmware property lists the DIMM_ADDRESS of
+each sensor (TS0 or TS1) and only those sensors are reported; without it,
+all 16 DIMMs are reported. A read fails with an error if the DIMM or sensor
+is not present or the firmware rejects the command.
+
 The following example show how the 'Power' attribute from the i2c-addresses
 can be monitored using the userspace utilities like ``sensors`` binary::
 
@@ -77,3 +101,16 @@ Also, Below shows how get and set the values from sysfs entries individually::
   # echo 180000000 > /sys/class/hwmon/hwmon1/power1_cap
   # cat /sys/class/hwmon/hwmon1/power1_cap
   180000000
+
+Reading the TS0 and TS1 sensors of the first DIMM without ``amd,dimm-ids``
+(temperatures are in milli-degrees Celsius)::
+
+  # cat /sys/class/hwmon/hwmonN/temp1_label
+  DIMM_TS0_UMC0
+  # cat /sys/class/hwmon/hwmonN/temp1_input
+  42000
+
+  # cat /sys/class/hwmon/hwmonN/temp17_label
+  DIMM_TS1_UMC0
+  # cat /sys/class/hwmon/hwmonN/temp17_input
+  41750
diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index 648d743903b7..a1ef4872c90f 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -34,7 +34,9 @@ among protocols as transactions may create race condition.
    crw-------    1 root     root       10,  53 Jul 10 11:13 /dev/sbrmi-3c
 
 apml_sbrmi driver registers hwmon sensors for monitoring power_cap_max,
-current power consumption and managing power_cap.
+current power consumption and managing power_cap. It also reports the
+TS0/TS1 DIMM thermal sensors as temperature channels; see
+Documentation/hwmon/sbrmi.rst.
 
 Characteristics of the dev node:
  * Differnet xfer protocols are defined:
-- 
2.34.1

