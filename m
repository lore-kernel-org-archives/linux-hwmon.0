Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793907183;
	b=sPWS3urgChi0Tc7PDxqGsQzfVmRgQyszPG+zykXO3ltZ5uJm7yGtKiboBjpd8Oso/l3L
	 T/fmBPHk8/oeiOcQD1cz0UalKG+ijJqyp4dWBlpR+yqtgZbg2ezaPMUWScRrm7nkEHyAW
	 7eVzkkcsZlwv2v48yKicMqwWq6p547z/07EFzDVtNjxyfKj1ezg0AlR6mFZrEIV66XJ3p
	 3Mnu39BmBb9oOQmmCQimOSuy1e/8bfLhOtp5PnHZ5bLcIPv2ClwtNJhLc94wCn7LS30Ok
	 xL4h7gKscA5G3WUcxuJIPlx3+CVR+6OTQ75kszq2PWwNr45iV5uaH2SHRcemXIfVh5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907183;
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
	bh=f0/TX/AwVHXH3XTG9asgPbcrmaIQ4l0T5Am/760rpRc=;
	b=MUf2Y+B0hXQ7F3ZVcVhwvHhaF6GTOiqmFbiVaeuJaHYnTdTr4toSDutoXPm/I7aq3f2Z
	 YaOOB0CMWO1rXoiNnb4KlYOqTvNyVdvzCNp3GAcXO1rApcIGg8HhQghPNR2Oo9SBsGYLI
	 5a3HaNtZ9FLZlTNrFsIULEnEflSwAm4WvI3gBk7m0gj+F7lsp8/3FE0jr04d97t3AoGO7
	 wYynrGoPhcwfBDoOPmWlCNhsV7QqVGGN+YjLlVge988fUpnyZygayUPdWFO1eDs0us8km
	 oScKJ1Ka/jfB8OvPs0m/llXGalcwQRv68bLPI1qHMWnN34PRojb+wJNk96yBdKtIy9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bCd347Xi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.37
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD0D606A6D4
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 19:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD0D606A6D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bCd347Xi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9EKyK4tNpKCrlCYhaYSXFxSsvo8yZJMpWiBokTA0dVxUlODxu442ypOGWzW8vR0E+GiQIOIoIXc+5VFwlLqmFMmJd/zCZ4N7ts91JFYxqUE90fEXOtwnsF8rqrzcEGtmle1J63Zq0fYIN3isJxp0u3wTsdm6c4Vx1Znf/QNo3QkPBl/izQYGv795Q1koJNL1PRTS459WfwFsiUV1J4x28CFc/BBRi6ajZNcUuMSesIv+NfLAA7Vcw9C09jNf8O1T2Y/doSv7V2hTOmgO8NYgb9DMDrEBxb0TemS9BA1/6VZ8dLXOWl0anFhjlS3uEWIS4giddZ3wiEHT+LjX8QKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0/TX/AwVHXH3XTG9asgPbcrmaIQ4l0T5Am/760rpRc=;
 b=rgzM5l686oPD8KFmb5yslaOpyIJIIsJ93m6hDoOFcL2OtOTq15SEw3AMYe8+MrSsX2qiI3gjfPgcUsRbCzqbcTGL97ldHyzIpk3wNbQ8HiLdV/ZMMrX4mVCj9jXQs8VvdQ2jAPsP4S/IVbkq3KovNcpw4zKG8CGM/hyefTQBbesrYRVLL1anOGDJnhyrEHiBh2AvIqIIGGRt0DZtUSJVP2ZWuQWueTDzVo2+rZVO17E5MxJ38ixMn9v62XUOLwBfDvwdo/DF5XY4yNYbLU3aFxXAjJypHznvI3YqOSnJqrIRSbEWjBDaotDSicWrWxeGzJwLtR0xcfQ+NgmjcSl3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0/TX/AwVHXH3XTG9asgPbcrmaIQ4l0T5Am/760rpRc=;
 b=bCd347XiiaUlczk+4+DBffmiV7YNnTtenEHC07d02Leifdsvxnf0HXhfR5RC5NH2qOeAOmm75K0BZXWAIsFsVawvu5AJt3KyStHM1tw4c+YvOGXMQsyJ9XrXlIQPvB8soyfBbR5FMQyiXHRzIVIkdHioFGKIXec9nGJvdXvrRA5RjqowedZk+KcSAXwc5n+j0JwhIQFvY/7b+ObRnbgEc9Z27Rv5JpKiqQSrNYQlQYLoiMCcW91eTcTu8Gt6CoKiRLAeKpdFBWr27MUwo/S4RActqBJZJ2sXQGP0wZO5G6+Jx/uNuTk/Tz2Y+jpmndLY/x5N2T/Y3Z0+CZsCGUb1Sw==
Received: from CY5PR19CA0077.namprd19.prod.outlook.com (2603:10b6:930:69::26)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:32:45 +0000
Received: from MWH0EPF000D8952.namprd05.prod.outlook.com
 (2603:10b6:930:69:cafe::1) by CY5PR19CA0077.outlook.office365.com
 (2603:10b6:930:69::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 19:32:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000D8952.mail.protection.outlook.com (10.167.249.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 19:32:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 11:32:21 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 11:32:19 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH v2] hwmon: (pmbus/mp2975) Get vout fault limits dynamically
Date: Thu, 5 Nov 2026 21:32:00 +0200
Message-ID: <20261105193200.1570996-1-fradensky@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8952:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: d3dfaaa7-2968-4f9a-6838-08df3b7390e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|261022105027099003|56012099006|11063799006|261022075727099003|261009223027099003|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261026140227099003|261028144727099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	l3YC3q0d+RbxqGVL4abCFvCZFkBudGPeqv0PN38zdw4M1ZBOZojrpWQX5MfSdUwM6mUeedrjplvCy830gcWCUkNsZmVwqM20Zq2dVhY/CxTzp/Q3zs+rYsbp7v67gVmVI3Z4nY250+jFK6cWTgdgcpCWIU9AGpUxVjH7ta8GlaaZMywxIE/7k3zKO7+yik2D7+3hcn53L+2uXjGNgsILCJmRcdHrwbklmaMauhpojzju6CcT+N4pOWKbIoLnmFzeXD72hRM8BMOerNoZJiI/IgbKr96FMRsRsr07huyhBs6qRIWfJgVy+9/Y/Rr1VV4bPlQU/kCmPVqeMu5cH66NSjwdzl66y5LkadHiijeRTW6ICv5E+XOrPVVAw43fvPoEsGLrwPE2WnWuEYb5RiRw0DadfcavrZVNk55wKsUYBvxknsDOQocx3fKPxqE1jVT3LmB4p2VVVJIpXl89RKh8eJSLHXGcTBJLagd0lDWGkElh02SaXlNNb0I2erXquj0Xa6N2fn4r/3KsxYZYLS1hADMHUxuhZ6R/Pwn1/ubBuSHWKdmraclzWTrXdVcZFKO8cp9e8eu6GbP+y9LuT9bsCZgnzMW++cwjeeeYJuFPtftJvlShENFQbtXAAAJQyNEscPZphLD4+RWSiK1Kr8iGIpJXgYrb4sHsic4qUPFlT5nM/enKE/fSC8jkSbFVssoOY0twxzLMoLRW6CJusPM2hg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(261022105027099003)(56012099006)(11063799006)(261022075727099003)(261009223027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sKS/kD8JjvBqutnn/gv/qHsU6EEltC86LyivwUgr5QuqhDkHi6DFdb5L+2WcxX+iUSyH70nz9+eBSOmuREKx8lGRSZyGss0izi009cDey36oivMhWyvrH3Vt+Mw/U3guBnT+fPwNWOncw20YTOuRYlhnLsFbmOPle7A0MUBb0NBSFXhyKpuu58ZlsadReV/IDqXvAhICixyUrCo2YYF/jbTm/KyVvIXRYg6LtGC3/NxsfoH4VhOE+NrZYTMtT+zFf0/y8wqhABiglsJNloYRX7eX+S2I3r+3sLn+MOd2B41yGcoI433f332IplG28PjO2EfCPWrq9zy2aJS4d6ZphlwLklKBNTsl0NHsTuvu8WhJhnq4zSuibFcLk+MIctN1Mss8MtHKGkIm0c3qS/GpE1/IF3Y9apaOMWv283SwfFTxv4c+jW92kupgrkbnDqZV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:32:44.6901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3dfaaa7-2968-4f9a-6838-08df3b7390e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000D8952.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

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
core does not issue PAGE commands, and the page is changed directly.

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
v1->v2:
Comments pointed out by Guenter:
- Drop the retry of a failed PAGE write, and setting the rail page again
  after a failed change to page 3.

  Neither works around a device limitation. In v1 they were meant to
  keep a failed page change from leaving the device on page 3 while the
  core caches the rail page, since the core never writes PAGE for a single
  rail configuration, and since pmbus_set_page() can fail after writing
  PAGE for multiple rails. They only help against a single transient bus
  error though, which is no more likely for PAGE than for any other
  command, and no other command is retried, by the driver or the core.

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

 drivers/hwmon/pmbus/mp2975.c | 207 +++++++++++++++++++----------------
 1 file changed, 115 insertions(+), 92 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 8e5193933ceb..e2824b14160e 100644
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
 
@@ -460,12 +457,77 @@ static int mp2973_write_word_data(struct i2c_client *client, int page,
 	return pmbus_write_word_data(client, 0, PMBUS_SMBALERT_MASK, ret);
 }
 
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
+	return i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
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
+	if (ret < 0)
+		return ret;
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
@@ -482,19 +544,35 @@ static int mp2975_read_word_data(struct i2c_client *client, int page,
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
@@ -503,8 +581,17 @@ static int mp2975_read_word_data(struct i2c_client *client, int page,
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
@@ -753,60 +840,6 @@ mp2975_current_sense_gain_get(struct i2c_client *client,
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
@@ -911,25 +944,6 @@ mp2975_vout_per_rail_config_get(struct i2c_client *client,
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
@@ -1043,11 +1057,6 @@ static int mp2975_probe(struct i2c_client *client)
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
@@ -1064,7 +1073,21 @@ static int mp2975_probe(struct i2c_client *client)
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

