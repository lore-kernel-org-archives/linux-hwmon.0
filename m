Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830593;
	b=RR6yADP7VIFS77aEwCqu+rlFxad5hWmTp+sTRRFKmz7BELr/e+kkxYjfGki0b8vayIaT
	 BBHHowcfO8/cFvEMocHHmr6R5stG+Hd6Vu1APCwTxJ+PulBaDX4/k/d+j3xsEZIs/uTit
	 YYMQmhbaAL+G6LUQjJLAdYGvcPLJeXI/eZgF6qzyX0NQaQwyGlS1V3xqb59qFZjkkp0uV
	 aCQDqlOK4mps1PqAyaEETtqeBuzYPLSjUwGLoOig3M/EfSrMbV/UkzwezAKXjs5B96pZp
	 QCmo9On33WnuV/3nS2vdQh1WTddZ7JkJCv37d+acjiRdm29FRWeaRJcdNQvp1wNw5kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830593;
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
	bh=I9LsgJZq8ouU0Tva1N5V9mJR0tKXDNZuwtU4bYcwD/E=;
	b=JG4BEh0GEQMq4U+4wX6mRunBX/Fa9+i8CQL4BVADVMrn0yKGfYgQRosPfrpGSCf9ezti
	 f6HFBFor1KQ4H1F9v8oHk9PZ/4bUwXKN9Sz8jaDD//ha62+2skpdx6RoVsfZs6MZXhJIC
	 KW3B6K85DVImSrqUNP+bHeXkKr/tfGC3nH+nA2O+f8wLRX6trdCpHGgfXR/4GZhBboAIT
	 J/VvcLJEB2N+zStzlQ4CJ4yTpoS9p6TxWL4bUobDJhhd1DLAbmno0cEDP6pnNPYdlMfRy
	 imWQD1Oexcnmr1fMdDW0AxxEyZ1l/UHp0qYP6Zkb8N3MOW2ugA2y2VkE3DFACPoxtTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=svQLaKSg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.3
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818A606A323;
	Mon, 16 Nov 2026 12:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4818A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=svQLaKSg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4RgiU6OIKAGQ8Np6qk1GpBRJFswCxBioXZ01eeUSPj376HOxdtuRMUSqlj6HC5fdZAg66zP2WHutJM9JIw2ISfRM5675e6wHRu0ubKlGDQtH/YgvbCtyvV5EvywhEXtUMP3yTjhvK2aR9UeSUFxczc78U4rVtBkIdk4sG994CWIb+oyL6iyQOGgnqVpv5+90vyaOkYABF/GxJbHwIKzJeB2xwO4YJm3jnU3ODduqTH9wwkZbJWJ/4u92SuAfVsA+winyYSZ/FfHpkpWD0ciOemIMkeCAdoeRhfNcMh/cHmIDobXXt9ZZObTYV0r1KZnmexoNuFF0VICkRmuHGGsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9LsgJZq8ouU0Tva1N5V9mJR0tKXDNZuwtU4bYcwD/E=;
 b=y0UpBY1/AWAgfMA36O2KCFh2sIojwM4hddqxtEhQyhEdVU3De7fCcxSdA+4K8Uy3e/ej62LJRkYg6M6AeVPBR+BNJ5hBd3ukAxsZni8v/FDTMeUBF4pbvkfN+SFBHdb9FdEsgBxfefSUOzqrTafMaaQy4tef2Q2bRclLfipojcic9y30NAqxpn5SmxEdXyuwko8n6oXPuk6LlZtTWCV3e8TqW135ukVvEootFbg2/aQXWK7kXj4+x0p3dn07P6LtnA6s7fMRdFSprBq0epm6WhB4HgvaqPHgMmM1yQB5MTB6X6ZQYNNLJA36daQKTkMYKLGln+Tkbexj2xUA12AbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9LsgJZq8ouU0Tva1N5V9mJR0tKXDNZuwtU4bYcwD/E=;
 b=svQLaKSgKdLGZ/hZ4VaoAwjAYj4+EtiadBLKD2nVnwYCH546kQ1+zg2MUUzzdLd28gunVwtATFJM6NTLVcxUc6yxAYYiz5TqORB6MJm42JjoZ5jtZhYhUBfWfskjZPkncTk5m9Ru/7D3hbL6ldK8r5GQVGTNWVBOPu+29yyaDG0=
Received: from DS7P220CA0066.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::17) by
 MN6PR12MB8491.namprd12.prod.outlook.com (2603:10b6:208:46f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:03:06 +0000
Received: from CY5PEPF00000E7B.namprd02.prod.outlook.com
 (2603:10b6:8:224:cafe::36) by DS7P220CA0066.outlook.office365.com
 (2603:10b6:8:224::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 12:03:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E7B.mail.protection.outlook.com (10.167.247.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:03:05 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 06:03:00 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Prathima Lk
	<Prathima.Lk@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v1 3/4] misc: amd-sbi: add DIMM thermal sensor support
Date: Mon, 16 Nov 2026 17:32:27 +0530
Message-ID: <20261116120228.865196-4-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7B:EE_|MN6PR12MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 75536462-97ce-43bc-e925-08df43d99291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8SQKBa9lmukor9XNK/ySRndnnJHVUS3e4H/uvXBIzwuN1qHZxO9aVs6ArI+tk+RV0eCAOb9fs9JhoQIaZwRcLc8eVZVnH43JBDB5ntx+jYzQEpLsSoQ+mhadOTXDT7Bxs1YEfYDjjXiou9H1QaYzKXxHJdheIiWZ2JGbX8pQtmW957B5cvvQzOyk66aPRXAONN3sx33Jr20dO4RnlVHI4erPz1vz5OtAhD490c1FlhJpI3NWL2I5CR3XZZYxawfeHF8umHpkXcWuGe6rwYYAnWLGyCUIeieLxmTyZT9Rl8eRuZx11J7agg1qLlVCIV8cmxogwM/yWnfp2Waj9UjI2cfU+fWkS0kAjI29htf+5HmvJHMGuCBRroy81DbhqDjP/wLHL4VyYJn9izIswDTan9Q43I1ltmzgi2CwYJTM3xNo6vKCQhEHaGsxSQQ6lgBqHj99culMdIJS909Ep3X2qRdbqvn273zjSD0LXniub+/5uu8Xfxnc2ar2IMat5xHMOMwqB6eJaOABKmrxODLbctGZjtuLNXMgVAtml0VtOk3wykrBi1Ccx5AfgfhAxYwatT+yPLZ6iUiYZmRd2tBQeNRULD80SfcW9j5CK+6zIZjCl/LIbuo4FOFnGcj3ziFRD1eOqILlsMuLC22fd+u/lWhi1WnrYKSZusxgEEUfO3y+4DAE/PKrzoD1cA0nfOyTPkSRXoV/YmV71IZvdu/bcQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v7jNvHxKW9NAg2H7kvEeZ4W1bntXJCPjN2BLTZfqW+Tlj7drTo25gNG2GfhW1LXbFzyk9n0Imdd5XY+g33dG17tB3/adBhLKV7CB6jOxixbc88Pr/h8Vf1u7EiDwBEBGpGCfOBkuIVrsFoUyxSdqadznKDiRKHDd/zX7Ke1T5b3BSMoUE40ZN5TlQnm3N5VjvQCV/NhCpfJM8rLOmlWqI/EWDowUJFtznQmMAVR1FLxmHs+7fJABJNFyGGm3Qr5Spf6QHmZbc3HUctQVMaamiq+L/tQzToSRdnC+KQ53JKRKg7cLcGaX7sj454ydhW/lHbDIigI4G1FBUpH7SEkPMSUVQNG7xP9Nas1ordu14Bs47R39Sx1OmZUXmxe8tRVjJw0UTf+3LChEb83OC5y7gKNvIKiROOI8D3USlfPdFSZTpyl54OI8PSh0d5ZMKiIL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:03:05.5176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75536462-97ce-43bc-e925-08df43d99291
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8491

From: Prathima Lk <Prathima.Lk@amd.com>

Report the TS0 and TS1 thermal sensors of up to 16 DIMMs as 32 hwmon
temperature channels using SB-RMI mailbox command 0x48 with the Mode 1
DIMM_ADDRESS encoding:

  bit[7]   1 (Mode 1)
  bit[6]   sensor select (0 = TS0, 1 = TS1)
  bit[5]   reserved
  bit[4]   DIMM slot
  bit[3:0] memory channel

Board DIMM n is reported on temp(n+1) (TS0) and temp(n+17) (TS1), where
n = memory channel * DIMMs-per-channel + slot. With one DIMM per channel
n is the memory channel; with two, the slots interleave (0x80, 0x90,
0x81, ...). Each channel is labelled DIMM_TS<t>_UMC<n>.

The layout comes from two optional firmware properties:

 - amd,dpc: DIMMs per channel, 1 or 2 (default 1).
 - amd,dimm-ids: the DIMM_ADDRESS of each sensor to report. Only the
   listed sensors are exposed. Entries without bit[7], with the
   reserved bit[5], with a slot bit when amd,dpc is 1, with a memory
   channel above 7 when amd,dpc is 2, or listed twice are rejected,
   as is an empty or unreadable property.

Without amd,dimm-ids all 32 channels are exposed, and reading a sensor
that is not fitted returns the firmware error.

The temperature is returned in DataOut[31:21] as an 11-bit two's
complement value in 0.25 degC steps and is reported in millidegrees
Celsius.

Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 drivers/misc/amd-sbi/rmi-core.h  |  10 ++
 drivers/misc/amd-sbi/rmi-hwmon.c | 236 ++++++++++++++++++++++++++++---
 2 files changed, 228 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 975ae858e9fd..15a0efa5dd02 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -48,6 +48,14 @@ enum sbrmi_msg_id {
 	SBRMI_WRITE_PKG_PWR_LIMIT,
 	SBRMI_READ_PKG_PWR_LIMIT,
 	SBRMI_READ_PKG_MAX_PWR_LIMIT,
+	SBRMI_READ_DIMM_THERMAL_SENSOR = 0x48,
+};
+
+/* DIMM thermal config; dimm_ids[] is indexed by hwmon channel */
+struct sbrmi_dimm_config {
+	u8 *dimm_ids;
+	const char **labels;
+	u8 dpc;			/* DIMMs per memory channel */
 };
 
 /* Each client has this additional data */
@@ -56,6 +64,8 @@ struct sbrmi_data {
 	struct regmap *regmap;
 	/* Mutex locking */
 	struct mutex lock;
+	/* DIMM thermal config (hwmon) */
+	struct sbrmi_dimm_config dimm;
 	u32 pwr_limit_max;
 	u8 dev_static_addr;
 	u8 rev;
diff --git a/drivers/misc/amd-sbi/rmi-hwmon.c b/drivers/misc/amd-sbi/rmi-hwmon.c
index f4f015605daa..f4a64a4a33a8 100644
--- a/drivers/misc/amd-sbi/rmi-hwmon.c
+++ b/drivers/misc/amd-sbi/rmi-hwmon.c
@@ -4,14 +4,109 @@
  *
  * Copyright (C) 2025 Advanced Micro Devices, Inc.
  */
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
+#include <linux/property.h>
 #include <uapi/misc/amd-apml.h>
 #include "rmi-core.h"
 
 /* Do not allow setting negative power limit */
 #define SBRMI_PWR_MIN  0
 
+/* DIMM temperature (SB-RMI Mode 1 DIMM_ADDRESS) */
+#define DIMM_BASE_ID		0x80	/* Mode 1: Bit[7]=1 */
+#define DIMM_TS_SELECT_BIT	BIT(6)	/* 0 = TS0, 1 = TS1 */
+#define DIMM_RSVD_BIT		BIT(5)
+#define DIMM_SLOT_BIT		BIT(4)
+#define DIMM_CHAN_MASK		GENMASK(3, 0)
+#define DIMM_TEMP_MASK		GENMASK(31, 21)
+#define DIMM_CHANNELS_PER_TS	16
+#define SBRMI_MAX_DIMMS		DIMM_CHANNELS_PER_TS
+#define SBRMI_NUM_DIMM_CHANNELS	(DIMM_CHANNELS_PER_TS * 2)	/* TS0 + TS1 */
+
+static bool sbrmi_dimm_channel_valid(const struct sbrmi_data *data, int channel)
+{
+	return data->dimm.dimm_ids && data->dimm.dimm_ids[channel];
+}
+
+/* Fill dimm_ids[] from the "amd,dimm-ids" entries, one sensor per entry */
+static int sbrmi_read_dimm_ids(struct device *dev, struct sbrmi_data *data)
+{
+	u8 raw_ids[SBRMI_NUM_DIMM_CHANNELS];
+	int count, i, ret, ch;
+	u8 addr;
+
+	count = device_property_count_u8(dev, "amd,dimm-ids");
+	if (count <= 0 || count > SBRMI_NUM_DIMM_CHANNELS) {
+		dev_err(dev, "amd,dimm-ids must have 1..%d entries, got %d\n",
+			SBRMI_NUM_DIMM_CHANNELS, count);
+		return -EINVAL;
+	}
+
+	ret = device_property_read_u8_array(dev, "amd,dimm-ids", raw_ids, count);
+	if (ret) {
+		dev_err(dev, "failed to read amd,dimm-ids: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < count; i++) {
+		addr = raw_ids[i];
+		/* Board DIMM n = memory channel * dpc + slot */
+		ch = (addr & DIMM_CHAN_MASK) * data->dimm.dpc + FIELD_GET(DIMM_SLOT_BIT, addr);
+
+		if (!(addr & DIMM_BASE_ID) || (addr & DIMM_RSVD_BIT) ||
+		    ch >= SBRMI_MAX_DIMMS ||
+		    (data->dimm.dpc == 1 && (addr & DIMM_SLOT_BIT))) {
+			dev_err(dev, "invalid amd,dimm-ids[%d] = 0x%x for %u DIMM(s) per channel\n",
+				i, addr, data->dimm.dpc);
+			return -EINVAL;
+		}
+
+		if (addr & DIMM_TS_SELECT_BIT)
+			ch += DIMM_CHANNELS_PER_TS;
+		if (data->dimm.dimm_ids[ch]) {
+			dev_err(dev, "amd,dimm-ids[%d] = 0x%x duplicates 0x%x\n",
+				i, addr, data->dimm.dimm_ids[ch]);
+			return -EINVAL;
+		}
+
+		data->dimm.dimm_ids[ch] = addr;
+	}
+
+	return 0;
+}
+
+/*
+ * Build dimm_ids[], indexed by hwmon channel (TS0 0-15, TS1 16-31), from
+ * "amd,dimm-ids" or, when absent, for all 16 DIMMs.
+ */
+static int sbrmi_init_dimm_config(struct device *dev, struct sbrmi_data *data)
+{
+	int i;
+	u8 addr;
+
+	data->dimm.dimm_ids = devm_kcalloc(dev, SBRMI_NUM_DIMM_CHANNELS,
+					   sizeof(*data->dimm.dimm_ids), GFP_KERNEL);
+	if (!data->dimm.dimm_ids)
+		return -ENOMEM;
+
+	if (device_property_present(dev, "amd,dimm-ids"))
+		return sbrmi_read_dimm_ids(dev, data);
+
+	for (i = 0; i < SBRMI_MAX_DIMMS; i++) {
+		addr = DIMM_BASE_ID | i;
+		if (data->dimm.dpc == 2)
+			addr = DIMM_BASE_ID | (i & 1 ? DIMM_SLOT_BIT : 0) | (i / 2);
+
+		data->dimm.dimm_ids[i] = addr;
+		data->dimm.dimm_ids[i + DIMM_CHANNELS_PER_TS] = addr | DIMM_TS_SELECT_BIT;
+	}
+
+	return 0;
+}
+
 static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
@@ -22,29 +117,52 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 	if (!data)
 		return -ENODEV;
 
-	if (type != hwmon_power)
+	if (type != hwmon_power && type != hwmon_temp)
 		return -EINVAL;
 
-	switch (attr) {
-	case hwmon_power_input:
-		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
-		ret = rmi_mailbox_xfer(data, &msg);
-		break;
-	case hwmon_power_cap:
-		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
-		ret = rmi_mailbox_xfer(data, &msg);
-		break;
-	case hwmon_power_cap_max:
-		msg.mb_in_out = data->pwr_limit_max;
-		ret = 0;
-		break;
-	default:
-		return -EINVAL;
+	if (type == hwmon_power) {
+		switch (attr) {
+		case hwmon_power_input:
+			msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
+			ret = rmi_mailbox_xfer(data, &msg);
+			break;
+		case hwmon_power_cap:
+			msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
+			ret = rmi_mailbox_xfer(data, &msg);
+			break;
+		case hwmon_power_cap_max:
+			msg.mb_in_out = data->pwr_limit_max;
+			ret = 0;
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		switch (attr) {
+		case hwmon_temp_input:
+			if (!sbrmi_dimm_channel_valid(data, channel))
+				return -EINVAL;
+			msg.cmd = SBRMI_READ_DIMM_THERMAL_SENSOR;
+			msg.mb_in_out = data->dimm.dimm_ids[channel];
+			ret = rmi_mailbox_xfer(data, &msg);
+			if (ret == -EPROTOTYPE)
+				dev_dbg(dev, "FW error code:0x%x\n",
+					msg.fw_ret_code);
+			break;
+		default:
+			return -EINVAL;
+		}
 	}
 	if (ret < 0)
 		return ret;
-	/* hwmon power attributes are in microWatt */
-	*val = (long)msg.mb_in_out * 1000;
+
+	if (type == hwmon_power) {
+		/* hwmon power attributes are in microWatt */
+		*val = (long)msg.mb_in_out * 1000;
+	} else {
+		/* 11-bit two's complement in bits 31:21, 0.25 degC per LSB */
+		*val = sign_extend32(FIELD_GET(DIMM_TEMP_MASK, msg.mb_in_out), 10) * 250;
+	}
 	return ret;
 }
 
@@ -87,21 +205,55 @@ static umode_t sbrmi_is_visible(const void *data,
 			return 0644;
 		}
 		break;
+	case hwmon_temp:
+		if (!sbrmi_dimm_channel_valid(data, channel))
+			return 0;
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			return 0444;
+		}
+		break;
 	default:
 		break;
 	}
 	return 0;
 }
 
+static const u32 sbrmi_temp_config[SBRMI_NUM_DIMM_CHANNELS + 1] = {
+	[0 ... (SBRMI_NUM_DIMM_CHANNELS - 1)] = HWMON_T_INPUT | HWMON_T_LABEL,
+};
+
+static const struct hwmon_channel_info sbrmi_temp_channel_info = {
+	.type = hwmon_temp,
+	.config = sbrmi_temp_config,
+};
+
 static const struct hwmon_channel_info * const sbrmi_info[] = {
 	HWMON_CHANNEL_INFO(power,
 			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
+	&sbrmi_temp_channel_info,
 	NULL
 };
 
+static int sbrmi_read_string(struct device *dev,
+			     enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
+{
+	struct sbrmi_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_temp || attr != hwmon_temp_label)
+		return -EOPNOTSUPP;
+	if (!sbrmi_dimm_channel_valid(data, channel))
+		return -EINVAL;
+	*str = data->dimm.labels[channel];
+	return 0;
+}
+
 static const struct hwmon_ops sbrmi_hwmon_ops = {
 	.is_visible = sbrmi_is_visible,
 	.read = sbrmi_read,
+	.read_string = sbrmi_read_string,
 	.write = sbrmi_write,
 };
 
@@ -110,9 +262,57 @@ static const struct hwmon_chip_info sbrmi_chip_info = {
 	.info = sbrmi_info,
 };
 
+/* Label each channel by its DIMM number, not by the address it queries */
+static int sbrmi_init_dimm_labels(struct device *dev, struct sbrmi_data *data)
+{
+	int ch;
+
+	data->dimm.labels = devm_kcalloc(dev, SBRMI_NUM_DIMM_CHANNELS,
+					 sizeof(*data->dimm.labels), GFP_KERNEL);
+	if (!data->dimm.labels)
+		return -ENOMEM;
+
+	for (ch = 0; ch < SBRMI_NUM_DIMM_CHANNELS; ch++) {
+		if (!data->dimm.dimm_ids[ch])
+			continue;
+		data->dimm.labels[ch] =
+			devm_kasprintf(dev, GFP_KERNEL, "DIMM_TS%d_UMC%d",
+				       ch / DIMM_CHANNELS_PER_TS,
+				       ch % DIMM_CHANNELS_PER_TS);
+		if (!data->dimm.labels[ch])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
 int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data)
 {
 	struct device *hwmon_dev;
+	int ret;
+
+	/* amd,dpc: dimms-per-channel, default 1 */
+	data->dimm.dpc = 1;
+	if (device_property_present(dev, "amd,dpc")) {
+		ret = device_property_read_u8(dev, "amd,dpc", &data->dimm.dpc);
+		if (ret) {
+			dev_err(dev, "failed to read amd,dpc: %d\n", ret);
+			return ret;
+		}
+	}
+	if (data->dimm.dpc != 1 && data->dimm.dpc != 2) {
+		dev_err(dev, "amd,dpc must be 1 or 2, got %u\n",
+			data->dimm.dpc);
+		return -EINVAL;
+	}
+
+	ret = sbrmi_init_dimm_config(dev, data);
+	if (ret)
+		return ret;
+
+	ret = sbrmi_init_dimm_labels(dev, data);
+	if (ret)
+		return ret;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
 							 &sbrmi_chip_info, NULL);
-- 
2.34.1

