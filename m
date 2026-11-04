Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793784780;
	b=T/iUjpvrN/edXb2CApkBcKGzc4jYi3LVatFWnOw/1PwEfm/2fsPPzVubdMkqiEUWPHMN
	 fyKQVl6InpRo7b/anRsZjd0YvunN4rUF2E1du9V7e9f+hP3bbtQOB2HNu/1ogQSXsy1Xk
	 d74fOQxDTgl+Ps151b3NU5cg2vbc9sSHilKK28eY6iolkA8juFwzalDWdBr2kZVMg8slF
	 sufUCYEAMCfbZgdl2L9FqyAFSgQkSURmyPry+Is2llkbanrf/P+UVccDns0VNWxY9uOE1
	 4EpoG3+Yvv8VYmU/+SHdBDGvS3mjrSvDw/KeK4ivcpGEQxD1alxP+Pc7WMEztK7VWow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784780;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
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
	bh=0LOV1IlXm4t3jMMlh34IpWysFNvj2MeevKbVoXGFuqk=;
	b=zKrB7shbsZ4n6WjMtRWqtnBfgpMHla25teGoSqVB0ViPkzJxLfY32G9VBBu+yhylXQGX
	 FYp+YxohB6ajpL9fgBaB2QZuA3NuEe+jD2VwV46CSrm/AfEcJUaNs4njISc/wm6yjS8B6
	 oUJFVKZlmIrCFe54l5TNfNJGxjHs16ny4seBzgJoJSIH8kqSuMB6vTTNz7b1DX4bsnfdr
	 zhy1NcEgkTxsz6ilXooW0PWwhG1qWvce8iKBbAIN0nLfJAsK94RNUXvqgqI7aNuIq5UkE
	 knNmYtdrUTJkwVxi5hQdUnCA+Q6HwFA/1qkUoI1YUbfCHNRvtyKGKGk7pp7tglQJL3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iLXtr8y5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.8
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB866606A326
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 09:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB866606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iLXtr8y5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTnmANsj0KwEisjR22mv6hXG+4V/mXKTkINkYiTSNlVJN1vH7JKOiQBQOhsTxD3NWFvcns0xvnDlZ4tcJkcaVXzjEZPylZFQS+JwHJAKV0qKyP4Zxgn3R9XI64Wlm8hjx/qCdKJgfJ5+DdyPeTTeNmFXqq1vUWwBh4zzatVys9PxjIR1wqfQEpB+qlMH8Fn2RsFAX9MP4fYKE1u29nPeGIijRr16gxlrsNkiuSfDEg68geh0UawZl+7/jTPvSyWsHF9a5ggvCiKVS+KBFFbEpLuxQdGSev13jd+1niSi6Nhs6lj091svryuYOKDjH/5wgHZ9kIf+ylGPN9dauTDBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LOV1IlXm4t3jMMlh34IpWysFNvj2MeevKbVoXGFuqk=;
 b=rgMR65AkdLY125q9T4/mMkE6bULItt79GC946ka96gfEOQv+TP/5+PYGciYaQHN7S1rLacRSZPcznN3hMctzSgTNT4DUn+5S5A5YupoEJOcQhWHQWmHaS7jgi/rv0YQetH3HTnNy4OaubsL1sQizc4wsbxNrNOqOuQWGIS/16/8+FjKEphUmKp2gHg4veH+bPVcZjK+3Hw2n+DNkfts7+3sWZhUnL0TRqXYXNsQ8xI/0N/CkqQW3REpb9STkZv6CzFlSqAH/TpLln25Knw3HEVZn4WPsWV/4faPhC2hK3G4S5gtxNCw4EkRcGf7Y5qgB0M3PR/NsnMJZXWl2/MCmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LOV1IlXm4t3jMMlh34IpWysFNvj2MeevKbVoXGFuqk=;
 b=iLXtr8y532NeWozTx2FS0coV0t7+dpLV4PTjm5oqcfE3IaYPg1l6/8+tmZGmpYs+UdNGPzg3H4a8ODhO15mgX/WOfolTexvd82xY3sm4NEk+DYyg5gX7SpNXYF86QAebULlzJSx/YyPFlZNaAI3OpGeoI3iyhhbRWVDieIZBs632ekNF5t/4T2kn1pwW1rBvNzdy8qwifAOPzC5Qe8XvtTBpfpFbrfzUJIx+r+sZqVwjYM+BP79soeUj+yM+vQ5yTvCmL3uy1rf/L/AHA3DEsdxVlGp1Q1rQQ5odGTSwvvPtWWPfRyvzl/71JBZ3QWU4MVoorBxmYS7RxSbcfDZNMg==
Received: from CH5PR04CA0016.namprd04.prod.outlook.com (2603:10b6:610:1f4::24)
 by IA4PR12MB125293.namprd12.prod.outlook.com (2603:10b6:207:14d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 09:32:45 +0000
Received: from CH7PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:1f4:cafe::4c) by CH5PR04CA0016.outlook.office365.com
 (2603:10b6:610:1f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 09:32:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH7PEPF00000016.mail.protection.outlook.com (10.167.244.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Wed, 4 Nov 2026 09:32:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 01:32:29 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 01:32:27 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (pmbus/mp2975) Get vout fault limits dynamically
Date: Wed, 4 Nov 2026 11:32:13 +0200
Message-ID: <20261104093213.2422350-1-fradensky@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000016:EE_|IA4PR12MB125293:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b7eb35-65f6-40e7-0e2f-08df3a569568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|56012099006|11063799006|10067099003|18002099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6eC+poFOlJwGjo2CeGEjdRHG8gOBqAg7sS/UsTQGnzt6d1qKehnLW67tL4J0v7jUpfh8DmKi8qv+gAODPwSOKLXKvYu/pJKn09G0Uq6127U1xisgpXE3hJxLNv5LDJEodGNq4teIuYrMeXoeDC4W28hQgd4Hx0ACYAoI95qpu/t1DFQHJjUbSYRxS9ULZ/Tc2sxFwbTRrx0V37+OAqz1hDmwu+/dOfj2KAa5oielodqvnOV01WX9mDHjMPIFta7WjtihPunFhKEPk1njidTGNH/RS+YOUiXoBUMae+hJUrkv+iCPXMPqYZus7dd0jkuzmRrHxq1kB+Ujv4hZs2N+sEcp/9zYnlid9hEK+9KmW7O2FeG3F65VUs982x2WBdM+nCdAhXGTpX70wW2oizIHbFRdiaeWoek6uE6J3dP3Z+9AFRh0InazwookHdKrq4LEunntXtzkp93NjwJA6DiB5IlWHxpvlE7AN97XDzcWRtQbsJBvKB0QzeuTurmu+fv8+2eRxRa0+uLJpeFeLfDbi3wtSNcQHOUX3QVynO9bpVYBJbFFlMKbTfjF7fLwW13HYTLT0VopHCF98fvG22ED+4en2kZl2ZAo60JAqP72ql4tn8UM8tw+Y23wryfrw1xxRL4R/SBU4JKLN+MrE6vKxUwEOl1JMo+MJANSB0EL5Xgux58N+YvbreqlhZXtKxvle7KvBcktbPh08FhObf+Rfw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(56012099006)(11063799006)(10067099003)(18002099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	16FxWLGgxOVR7T9vn2LHCZEYKHq2tlrCQ9o679j85TAD0Ae4HJhxYiwkFKw1tutPRbLtMFdH+6JVuNNdv1NJ+xW4EKHWXQxu6L49Gqhmb8MGTPkpfpOcsDdNbU/hP0Asr95R4qapKSP/+k03AVCJkD0TCw4DirI5cih6IR4ltUP7thdWaJF8iq8T+jU0szvXYOmv9vQrkCYlq8cSMOI8k9z7kx6al0pnBF/E96mvKx/21/rJD+WK954EzTxQolklN3wuSzwbmjrgANWE3r0A+RATS4QP/Qd9AlMxeGSwAx5UzKbkMky3o3u+1g+cJYXFGkvWnbd9NWUkQeKts8PG344+uw/KlKA4fq1U7+UC7OZLTo7gxzhc2RyaWCHkqg6kU8wZUTbTm1oR5E/EpMISs4A1tZ4iO9M7nfouCjOkbACcPL+6ufq1BvrFk2gSIFlb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:32:45.6789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b7eb35-65f6-40e7-0e2f-08df3a569568
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB125293

The over- and under-voltage fault limits of the tracking mode are
relative to the voltage reference, which follows the VID/AVS requests
issued to the device and therefore changes at runtime.

The driver reads the voltage reference once during probe and derives the
limits from that snapshot, which the PMBus core caches in addition. As a
result in2_crit and in2_lcrit reflect the operating point at probe, rather
than the thresholds the device enforces. On systems where the device
supplies the CPU core voltage, in2_crit was reported anywhere between
1.15V and 1.70V across identical systems, causing false over-voltage
reports once the CPU voltage exceeded the value latched at probe.

Read the voltage reference and the over-voltage offset selector whenever
a limit is requested, and mark both limits with pmbus_set_update(), so
that the core does not cache them. The voltage reference is available on
page 3 only. Let the core change the page, so that the page it caches
matches the device, except for a single rail configuration, for which the
core does not issue PAGE commands. Retry a failed page change once in that
case, since the core would not set the page again later on. Likewise, set
the rail page again if the change to page 3 fails, since the device can
then be on page 3 while the core still caches the rail page.

With the selector read at runtime, a device configured with an
unsupported selector no longer fails to probe. The OVP1 threshold, which
does not depend on the selector, is reported for it instead, with a
warning.

Clamp the under-voltage limit to zero, since the offset can exceed a low
voltage reference, while a negative value would be reported as a read
error.

Fixes: 2c6fcbb21149 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller")
Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
Tested on a switch platform carrying twelve MP2975 devices, twenty one
rails in total.

On the rail supplying the CPU core voltage in2_crit followed the CPU,
reading 1150mV at idle and up to 1720mV under load, where the unpatched
driver reported a constant 1195mV, derived from the reference latched at
probe. in2_crit and in2_lcrit, which are obtained through separate page 3
excursions, agreed on the same voltage reference within the P-state jitter
between the two reads.

The remaining rails have a static reference, and reported the same limits
as before the change.

A single rail device, for which the PMBus core never writes PAGE, was
exercised with 400 page 3 excursions, with no page 3 register value
observed in place of the sensor values. A dual rail device, for which the
core changes the page, was exercised with 800 page 3 excursions, each
followed by a read of the other rail, with no page 3 or other rail
register value observed in place of the sensor values.

A single failed page change is recovered from: the rail page is set again
if the change to page 3 fails, a failed change back from page 3 leaves the
core caching page 3, so that it writes PAGE on the next access, and a
direct PAGE write, used for a single rail configuration, is retried once.
Repeated failures can still leave the device on a page the core does not
expect, as is the case for page changes made by the core itself.
Recovering from these within the driver would take state and write
callbacks of its own, and still would not cover block reads, so it is not
attempted here.

I would like this patch to be considered as is, since it fixes the
reported limits independently of the above. If you think it necessary,
I am happy to follow up with a separate patch to pmbus_set_page(), which
invalidates the cached page when a page change fails, so that the next
access writes PAGE again.

 drivers/hwmon/pmbus/mp2975.c | 228 +++++++++++++++++++++--------------
 1 file changed, 136 insertions(+), 92 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 8e5193933ceb..9e685a9ed47f 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -109,10 +109,7 @@ struct mp2975_data {
 	int vout_scale;
 	int max_phases[MP2975_PAGE_NUM];
 	int vid_step[MP2975_PAGE_NUM];
-	int vref[MP2975_PAGE_NUM];
-	int vref_off[MP2975_PAGE_NUM];
 	int vout_max[MP2975_PAGE_NUM];
-	int vout_ov_fixed[MP2975_PAGE_NUM];
 	int curr_sense_gain[MP2975_PAGE_NUM];
 };
 
@@ -460,12 +457,98 @@ static int mp2973_write_word_data(struct i2c_client *client, int page,
 	return pmbus_write_word_data(client, 0, PMBUS_SMBALERT_MASK, ret);
 }
 
+/*
+ * Write PAGE directly, retrying a failed write once, since the core would
+ * not set the page again later on.
+ */
+static int mp2975_page_write(struct i2c_client *client, int page)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+
+	return ret;
+}
+
+/*
+ * Let the PMBus core change the page, so that the page it caches matches the
+ * device. The core does not issue PAGE commands for a single rail
+ * configuration, thus change the page directly then.
+ */
+static int
+mp2975_page_set(struct i2c_client *client, struct mp2975_data *data, int page)
+{
+	if (data->info.pages > 1)
+		return pmbus_set_page(client, page, 0xff);
+
+	return mp2975_page_write(client, page);
+}
+
+/*
+ * Voltage reference is available on page 3 only. The callers read a register
+ * of the rail through the core first, thus the core caches the rail page.
+ */
+static int
+mp2975_vref_get(struct i2c_client *client, struct mp2975_data *data, int page)
+{
+	int ret, vref;
+
+	ret = mp2975_page_set(client, data, 3);
+	if (ret < 0) {
+		/*
+		 * The change can fail after the device has been set to page 3,
+		 * thus set the rail page again, as the core expects it.
+		 */
+		mp2975_page_write(client, page);
+		return ret;
+	}
+
+	vref = i2c_smbus_read_word_data(client, page ? MP2975_MFR_READ_VREF_R2 :
+						       MP2975_MFR_READ_VREF_R1);
+
+	ret = mp2975_page_set(client, data, page);
+	if (ret < 0)
+		return ret;
+
+	return (vref < 0) ? vref : vref * data->vid_step[page];
+}
+
+static int
+mp2975_ovp2_offset_get(int ovp_th_set)
+{
+	switch ((ovp_th_set & GENMASK(5, 3)) >> 3) {
+	case 1:
+		return 140;
+	case 2:
+		return 220;
+	case 4:
+		return 400;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int
+mp2975_vout_ovp2_get(struct i2c_client *client, struct mp2975_data *data,
+		     int page, int vref_off)
+{
+	int vref;
+
+	vref = mp2975_vref_get(client, data, page);
+	if (vref < 0)
+		return vref;
+
+	return vref + DIV_ROUND_CLOSEST(vref_off * data->vout_scale, 10);
+}
+
 static int mp2975_read_word_data(struct i2c_client *client, int page,
 				 int phase, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct mp2975_data *data = to_mp2975_data(info);
-	int ret;
+	int ret, ovp1, vref_off, uv_off;
 
 	switch (reg) {
 	case PMBUS_OT_FAULT_LIMIT:
@@ -482,19 +565,35 @@ static int mp2975_read_word_data(struct i2c_client *client, int page,
 		break;
 	case PMBUS_VOUT_OV_FAULT_LIMIT:
 		/*
-		 * Register provides two values for over-voltage protection
-		 * threshold for fixed (ovp2) and tracking (ovp1) modes. The
-		 * minimum of these two values is provided as over-voltage
-		 * fault alarm.
+		 * Device provides dual over-voltage protection. OVP1 is
+		 * referred to the maximum reference voltage, while OVP2 is
+		 * referred to the current voltage reference, which is changed
+		 * at runtime. Protection is tripped by any of them, thus the
+		 * minimum of the two is exposed as over-voltage fault alarm,
+		 * and OVP2 is obtained on each read.
 		 */
 		ret = mp2975_read_word_helper(client, page, phase,
 					      MP2975_MFR_OVP_TH_SET,
-					      GENMASK(2, 0));
+					      GENMASK(5, 0));
 		if (ret < 0)
 			return ret;
 
-		ret = min_t(int, data->vout_max[page] + 50 * (ret + 1),
-			    data->vout_ov_fixed[page]);
+		ovp1 = data->vout_max[page] + 50 * ((ret & GENMASK(2, 0)) + 1);
+
+		/* OVP1 still applies if the OVP2 threshold is unknown. */
+		vref_off = mp2975_ovp2_offset_get(ret);
+		if (vref_off < 0) {
+			dev_warn_once(&client->dev,
+				      "unsupported OVP2 selector, reporting OVP1 threshold\n");
+			ret = ovp1;
+			break;
+		}
+
+		ret = mp2975_vout_ovp2_get(client, data, page, vref_off);
+		if (ret < 0)
+			return ret;
+
+		ret = min_t(int, ovp1, ret);
 		break;
 	case PMBUS_VOUT_UV_FAULT_LIMIT:
 		ret = mp2975_read_word_helper(client, page, phase,
@@ -503,8 +602,17 @@ static int mp2975_read_word_data(struct i2c_client *client, int page,
 		if (ret < 0)
 			return ret;
 
-		ret = DIV_ROUND_CLOSEST(data->vref[page] * 10 - 50 *
-					(ret + 1) * data->vout_scale, 10);
+		uv_off = 50 * (ret + 1) * data->vout_scale;
+
+		ret = mp2975_vref_get(client, data, page);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * Offset can exceed the voltage reference, while a negative
+		 * value would be reported as a read error.
+		 */
+		ret = max_t(int, DIV_ROUND_CLOSEST(ret * 10 - uv_off, 10), 0);
 		break;
 	case PMBUS_VIRT_READ_POUT_MAX:
 		ret = mp2975_read_word_helper(client, page, phase,
@@ -753,60 +861,6 @@ mp2975_current_sense_gain_get(struct i2c_client *client,
 	return 0;
 }
 
-static int
-mp2975_vref_get(struct i2c_client *client, struct mp2975_data *data,
-		struct pmbus_driver_info *info)
-{
-	int ret;
-
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 3);
-	if (ret < 0)
-		return ret;
-
-	/* Get voltage reference value for rail 1. */
-	ret = i2c_smbus_read_word_data(client, MP2975_MFR_READ_VREF_R1);
-	if (ret < 0)
-		return ret;
-
-	data->vref[0] = ret * data->vid_step[0];
-
-	/* Get voltage reference value for rail 2, if connected. */
-	if (data->info.pages == MP2975_PAGE_NUM) {
-		ret = i2c_smbus_read_word_data(client, MP2975_MFR_READ_VREF_R2);
-		if (ret < 0)
-			return ret;
-
-		data->vref[1] = ret * data->vid_step[1];
-	}
-	return 0;
-}
-
-static int
-mp2975_vref_offset_get(struct i2c_client *client, struct mp2975_data *data,
-		       int page)
-{
-	int ret;
-
-	ret = i2c_smbus_read_word_data(client, MP2975_MFR_OVP_TH_SET);
-	if (ret < 0)
-		return ret;
-
-	switch ((ret & GENMASK(5, 3)) >> 3) {
-	case 1:
-		data->vref_off[page] = 140;
-		break;
-	case 2:
-		data->vref_off[page] = 220;
-		break;
-	case 4:
-		data->vref_off[page] = 400;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
 static int
 mp2975_vout_max_get(struct i2c_client *client, struct mp2975_data *data,
 		    struct pmbus_driver_info *info, int page)
@@ -911,25 +965,6 @@ mp2975_vout_per_rail_config_get(struct i2c_client *client,
 		ret = mp2975_vout_max_get(client, data, info, i);
 		if (ret < 0)
 			return ret;
-
-		/* Skip if reading Vref is unsupported */
-		if (data->chip_id != mp2975)
-			continue;
-
-		/* Obtain voltage reference offsets. */
-		ret = mp2975_vref_offset_get(client, data, i);
-		if (ret < 0)
-			return ret;
-
-		/*
-		 * Set over-voltage fixed value. Thresholds are provided as
-		 * fixed value, and tracking value. The minimum of them are
-		 * exposed as over-voltage critical threshold.
-		 */
-		data->vout_ov_fixed[i] = data->vref[i] +
-					 DIV_ROUND_CLOSEST(data->vref_off[i] *
-							   data->vout_scale,
-							   10);
 	}
 
 	return 0;
@@ -1043,11 +1078,6 @@ static int mp2975_probe(struct i2c_client *client)
 		if (ret)
 			return ret;
 
-		/* Obtain voltage reference values. */
-		ret = mp2975_vref_get(client, data, info);
-		if (ret)
-			return ret;
-
 		/* Obtain vout over-voltage scales. */
 		ret = mp2975_vout_ov_scale_get(client, data, info);
 		if (ret < 0)
@@ -1064,7 +1094,21 @@ static int mp2975_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	return pmbus_do_probe(client, info);
+	ret = pmbus_do_probe(client, info);
+	if (ret)
+		return ret;
+
+	/*
+	 * Vout over- and under-voltage fault limits are relative to the
+	 * voltage reference, which is changed at runtime. Do not allow the
+	 * PMBus core to cache them.
+	 */
+	if (data->chip_id == mp2975) {
+		pmbus_set_update(client, PMBUS_VOUT_OV_FAULT_LIMIT, true);
+		pmbus_set_update(client, PMBUS_VOUT_UV_FAULT_LIMIT, true);
+	}
+
+	return 0;
 }
 
 static const struct of_device_id mp2975_of_match[] = {

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.34.1

