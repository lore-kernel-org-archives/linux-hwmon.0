Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795367444;
	b=rizapmIwFM4JEkYvGcHr4OpYnkXOVbeZn82MZjvjiXCgduV1+PBcFEeFrvkYsJQ1H95q
	 VIaLv7lc9V0UgiS2khmxBOwvgM4qpvdUpjuFxYaVKI9jhcxij0bRbvfMYAVNY36C6I1WJ
	 E+nh+gZ8MTjJrrMhedlc2AHxU1RvL9byOi95I6EtapAY4E62XwanJzB3sLrYlHyR2OtJL
	 s3tKaJ7W9bc8L5czKip2m8uIPJz+FPYJGVO686ITjNRHVJXTcMRUgRmqLZEoebvSxbLe8
	 YauUKxanV698YKK3OwlOYf4BbUP121wlA0l9+WpIl9dOyh/c/mHAGuO1GG4MzIw8S4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367444;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JC4p1tY5eHVSbeyTA6AxaeGNdtZDfcJQ5ovxxHGaIdk=;
	b=JrR5xDrBg2NF83MOLoHqYaF1gVsyCYzpzhTGP6sRsD8Bkfx1bU8n5qoPsjOwYfAB4d0c
	 e8+cvyhIIxHINbcJg/3DZu7iNfpsTZrqn9o9xgAIiXB62CHW+RSGCroSb4bqTGSZnJLCU
	 DzvOl6+MyjjE4j3osFHcM6EzdlBGRWo58HE5snIeaKCj+G3pju4WJfYhsSZgRUtN78teH
	 VY6nSEv15+PQKNdIY1VvfufsYjwWPHbgTJCZfFHDNKBlCHY4JXTuVd8wJoM6oWpgUIJXi
	 TrdDFyDAP8UYkXuYZ31dOc0IQvciHLJ5NS27ozysmYK0Jch/2VA5elCckLYdmvcE6zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="UX/aCxae";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.30
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1B606A32A;
	Sun, 22 Nov 2026 17:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D1B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UX/aCxae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNUFqhD/SfNqjTRCpGbpoIArW/nyFyoH/fRji38QxAv4F7om/r2nkoJoTsYPAXU3U4aa/65xFD/zCmvgIh907tTLdJ3H/1WRu/5Q2lgqvp1IWZMsGrDyCV/PZ2wwJdjp3ucN5Y2EqfHdBL6kRCDBc/eOfi7wHDWcSs5F+dZjZbVZz2BQcKuT39aOQMO2BuwG95RpzcA+fDayuY91ANsaTIJO3q5/hbQhHu7dzrH2In58CkeGVvgpLmgDS2Y87QXRwL7c8KPUIxC0Y5AxGYtdHINLjh+TLIMGsN+QpZ0FgRrVBpQx1Ox3fsnafJQmo15RCM2ftYk5iXg6+FlLmarT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC4p1tY5eHVSbeyTA6AxaeGNdtZDfcJQ5ovxxHGaIdk=;
 b=cCRyrl1SfYVnp0yTnUUlfc3pcE8Qylgb25WK3/xyI0ibJl8gkA5zsx4wpV18AAp534682e7BFboWtZkdXgR6p+RsOJFQNetF3IxlvO7gqkvyRZab6rjGVEdkm0r5MBtYpO9N9KxtzMPSzstVTNfJQmFoCCsd2iTSuqhEvjHgvpe6WxxK75DDuAQYzyAhNz8KHafFswMlEqLiHoHKQLF7hlG0PsPmAvNyZFRlXPHeC+u7GE4GafqnMSBAqPiDIFHMaO73//xEb8s7XC1h2sCV2VVjXSG62AVB8x1TLwXdYp/+0EaQPgAexwcAtXF3PYtkAZofNBBBL1msvF18QKRDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC4p1tY5eHVSbeyTA6AxaeGNdtZDfcJQ5ovxxHGaIdk=;
 b=UX/aCxaeSp+wefFqZlS/187BnrRTESlVFW5TNWCOD6JM8OizGHR1GdiTTbowwXyecfUp5KUlg0zOuzeMzJix2JRk8Rs1f4mTF1UWHHthxBTZZqsdJT2MlNy6bl+XW7wYbS1vhHLo5LidwtxFE9cr0UKlLbPMyV9Al7I6HMekBpMBFCxlFKGGnI0rWyt3FEQWf4jHxMIRNsNuGH/3kdUS4E8pev6tWE4ER5fhAD1vX/ieihLclzcd4oOC7LaYV+KVGd0HSspcUbr8k9KNHB7VTjECBiDguhtYquUtNqCbLNRj+46KVWAMKqzrJbwPgVT0nxS1qL+bWhqK39XrJmOn+g==
Received: from CH0PR07CA0019.namprd07.prod.outlook.com (2603:10b6:610:32::24)
 by SAVPR12MB999122.namprd12.prod.outlook.com (2603:10b6:806:4e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 17:10:38 +0000
Received: from MN1PEPF000793FD.namprd05.prod.outlook.com
 (2603:10b6:610:32:cafe::8d) by CH0PR07CA0019.outlook.office365.com
 (2603:10b6:610:32::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 17:10:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF000793FD.mail.protection.outlook.com (10.167.249.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 17:10:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 22 Nov
 2026 09:10:21 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 09:10:19 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH v2 2/3] hwmon: (pmbus/core) Add PMBUS_FORCE_PAGE_CHANGE flag
Date: Sun, 22 Nov 2026 19:09:48 +0200
Message-ID: <20261122170949.3059743-3-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122170949.3059743-1-fradensky@nvidia.com>
References: <20261122170949.3059743-1-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FD:EE_|SAVPR12MB999122:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f64c21-7b20-4566-12e7-08df48bb87a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wGWN35NPBZNmvpSf3uGxap7If/XfkhbTCdgQLKdFsI1uLViRNWVWypTIVw7ROmvn6Xp7CmZzMmUKUuovj5oakzXDsIKuG67EAN9s5p678bkDZFj/1fhulRcRaHl87uzIKEADrXaavGL+5oxIXrJ/fdmABq0GlcrFRLQTamlWYKurhyRNS240dOAuDRwq44f2M4d0Cg3GGiYi8wZ2a8p0DZhU1LpnlJoVun919WIAxXM7ZthN2H/pV0l7Plq/7S/tyeB8BLJ2GUbPsLnxmBnpc1j1myl1cIwx4kKPJsjFMBhJjc+nVbcojJRWurplJyKYjNXEyzyp00d61fZMvLAX/aFebQDnCmYaOWBzI6anwwwe3W22kf14WWQGJ7VpDjvCYzpgOebDt+hOKAFN6KqH1kJAaSZpADtNVLY9QKBrhq0ugc94sNePMircjuEnhoixubdUXNHDJkT8sJM68O023MeAxJXTo9DiGVlJ00egIBTiywANabpAl53meuioN0Mx/oeuWKWAQVoXF8QrFpyOBd3TrLU8YgcgKrCuS71GMauGEkiZp9EGAFw24xIO9d7RNGXpUpTZCrw3o1PuEYB6IG+Px9SSvSj2L7tNG+4eMskaGjNn6BfwgFXRmHRpe4TsJ6Xlsfkbx9gTQ63yzSI8yYUupHQVBcU+8UKEAWsIQyRdACpq4ZN9ZZ78wrRzSCy1L/CAel+ucz2ICVEOaqKLng==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VKfKnQLkTol0TsKL/OLdNxJY5tcTC8K7PXHdayTmX192skAQKKAsMirvHyIW7kYkwvu8kRQ9ZQvi1uFj+KZz2/QVOEP45heBOMDWtoxSJe0LvGca9mkqSXNwaIenZJ+jiAtqdQdINdAg3D5g3rrYRPzFgDGdScfDO2KEz81inHkGhrMqWDms6FfyKsevLymT0djEg6XKtF6jv4udo4vG8xVSX+61LdBx85PKJQPFhgQ53XB89fU5jOAOVVjZJzRSc1feGkVg+YWrixql5GibbY5/AYCVHmOpdc3/s2RUwKDY/HeBGng6Z8KeUeJPMgq6JX0cwHDXA1PyiA4tcskqkXFD2cga8Q355siFaFFF2EkHzF5Byyysb/YdRtiHDccgyZgV96bQqiYyMTawr8J60qKVYoiru6Beii5EkmTEBtK5J4HmMAvPY0Hkmrwn6xyA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 17:10:38.0132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f64c21-7b20-4566-12e7-08df48bb87a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999122

The PMBus core driver only changes the page of chips with more than one
page, and neither writes nor verifies the page of a chip with a single
page. Some chips with a single page provide manufacturer specific
registers on additional pages. Their drivers write PAGE directly to
access them, and have to change back to the page the core expects on
their own. If changing back fails, the core accesses the chip on the
wrong page.

Add the PMBUS_FORCE_PAGE_CHANGE flag, which makes pmbus_set_page()
change the page of a chip with a single page as well, so that its driver
can access the additional pages with pmbus_set_page(). The page change
is then read back, and a failed page change is repeated on the next
access, as for chips with multiple pages.

While at it, drop the outdated number of flags from the platform data
description in the documentation.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2:
- No changes

 Documentation/hwmon/pmbus-core.rst | 12 +++++++++++-
 drivers/hwmon/pmbus/pmbus_core.c   |  3 ++-
 include/linux/pmbus.h              | 11 +++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index fdfb23773148..bca387518b6a 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -298,7 +298,7 @@ PMBus driver platform data
 ==========================
 
 PMBus platform data is defined in include/linux/pmbus.h. Platform data
-currently provides a flags field with four bits used::
+currently provides a flags field with the following bits::
 
 	#define PMBUS_SKIP_STATUS_CHECK			BIT(0)
 
@@ -316,6 +316,8 @@ currently provides a flags field with four bits used::
 
 	#define PMBUS_VOUT_PROTECTED			BIT(7)
 
+	#define PMBUS_FORCE_PAGE_CHANGE			BIT(8)
+
 	struct pmbus_platform_data {
 		u32 flags;              /* Device specific flags */
 
@@ -388,6 +390,14 @@ PMBUS_VOUT_PROTECTED
 Set if the chip VOUT_COMMAND command is protected and protection is not
 determined by the standard WRITE_PROTECT command.
 
+PMBUS_FORCE_PAGE_CHANGE
+
+The PMBus core driver only changes the page of chips with more than one
+page. Some chips with a single page provide manufacturer specific registers
+on additional pages. Set this flag so that the PMBus core driver changes the
+page of such chips as well, which lets the chip driver access the additional
+pages with pmbus_set_page().
+
 Module parameter
 ----------------
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5138c802d8ab..aed1c4605952 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -226,7 +226,8 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		return 0;
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
-	    data->info->pages > 1 && page != data->currpage) {
+	    (data->info->pages > 1 || (data->flags & PMBUS_FORCE_PAGE_CHANGE)) &&
+	    page != data->currpage) {
 		/* A failed page change can leave the chip on any page */
 		data->currpage = -1;
 
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index 884040e1383b..b3bc4cced461 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -87,6 +87,17 @@
  */
 #define PMBUS_VOUT_PROTECTED			BIT(7)
 
+/*
+ * PMBUS_FORCE_PAGE_CHANGE
+ *
+ * The PMBus core driver only changes the page of chips with more than one
+ * page. Some chips with a single page provide manufacturer specific registers
+ * on additional pages. Set this flag so that the PMBus core driver changes the
+ * page of such chips as well, which lets the chip driver access the additional
+ * pages with pmbus_set_page().
+ */
+#define PMBUS_FORCE_PAGE_CHANGE			BIT(8)
+
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
 
-- 
2.34.1

