Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051EFC25B07
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 17:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233453AbiHJRRG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 13:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbiHJRQ2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 13:16:28 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7A6832F7
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 10:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEaC6NculRn+QWPOx4KJR+QLSKYalBhe8WgTS1PrqvPQjZxkJs0mteOvMUfWSX1Brk2iOK+hybVABG0O4M/kYtppJ3C21GJkNqtZja2IpwHmMDDlbqt1r85tMXHWKtszW6T1zStr3Q8jBPXSv3W7jz5z5YYO0dCg1pYszmSi3muw6iTDAeYpRmdt2aSpMybCPwkUOFR4J4ZDpjdFSZC+A7Qow53iBMXtOSCRpeDV7+ok+iCmUutQac77XD0Zgfp3XPwIu1E43eDiQyJTbzm/vlP53ENGPlN2dhQhJnCVbC1H93zs45hwydH364FLYqsqpaohfQ+EpSuz62t7+Tk6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e4gZw4B/8oKczc3ChPEptCa4KGCmEptRIHmJzu08Es=;
 b=n20L9tW+dB6xMrPWFABXD06vhQjBOUjWdf/eeUdsVvmx+i0EyR8UFgkyH8Y9nxq59Mc+Wv3Phhsrt4ireky4RerW9n9kBtS1ZYX55rDfOYJZe50vSSmaEHpdCBl1edh03hF5nKxaN9pQ9zBVg7OGiIh8wXPDcQufZzbcOzC5O6l9r/AZfS2/6g3hcdJ48jMFwuopARzKZzS+Ck1/JH/N4lRSNdG7t1CjDdaEjIgfCXdsPCX6KX8gGantNw8LP0nGo9VMyLFTARbFnaz8+EGsQrRUGjHR4RguAAG8XOLZ/vmhv0FttVSxs4hWuOdAuAibIkZsI4gzRnEevbUL2zl/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e4gZw4B/8oKczc3ChPEptCa4KGCmEptRIHmJzu08Es=;
 b=QMWjx5pjdaRVbc5aKIYcvTNGRPx93jS+Os0q1hIbqQnPaL4g86RDKv0nE25IDfXkCru5TFu94Tk0pJP5fftITZjIOeWVUnx7gbjUoBkRIrQnd+OwoF9jd0mPQn9k7ssFsYsS8jj42VrVjQ2CRvCx1OSFD2CoqfL55Jgg2zXa8bWOAxAYUmI/b/5VER8rtV9n8z78DArrDYPoRwTHjz/w17dm8NQKIm/RyTL0JyJABgOcTFoREEPlUVYGvoTWRehensixhow8UEAg5WJ+iEHIsa9xj0PTyTpRcADhDxtlQvYDOXTjk91N+Oc6P+0HTp7p6N61cULDK04ZKhctN0OcyQ==
Received: from DS7PR05CA0062.namprd05.prod.outlook.com (2603:10b6:8:57::8) by
 DM4PR12MB6592.namprd12.prod.outlook.com (2603:10b6:8:8a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Wed, 10 Aug 2022 17:15:59 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::e1) by DS7PR05CA0062.outlook.office365.com
 (2603:10b6:8:57::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.8 via Frontend
 Transport; Wed, 10 Aug 2022 17:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 17:15:58 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 10 Aug 2022 17:15:58 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 10 Aug 2022 10:15:57 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 10 Aug 2022 10:15:56 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v5 1/3] platform_data/emc2305: define platform data for EMC2305 driver
Date:   Wed, 10 Aug 2022 20:15:50 +0300
Message-ID: <20220810171552.56417-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220810171552.56417-1-michaelsh@nvidia.com>
References: <20220810171552.56417-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83717e77-4c20-4329-dd5c-08da7af3fe5c
X-MS-TrafficTypeDiagnostic: DM4PR12MB6592:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEk47i5Uf1Nb9rQkKu6tSC8VuWH4QJNhatXkNMpWUh1sGpG9hz15NiRXL/2+G37P2FWphx2lBbfwdXO3TYjnqguXkMxS/nAAy12kv5dQnlQTcyLGHpTrexZxSkAlD1OgdB+plKiaa+1I1NgLjW6X5URuBdpTLj43lYohTia1jBXuSLQxNx2ROBwihGuhjmR+k2elynTpKL0o/E1UAIt58FD3G92I3oor5FeGrITBJ0wkLMrgCg5kAZtlzf1mVCYLJ0/guj7NXXPhR1f+D8OGHnl9spNVZsswVmgpmXCYEnvM9ufElDrUWGh9oMr/QSZ4M9w1/ij8xOTUP/r+BCCgT3ca7i9c76KL5FHKVDuAly6nj0QjnE3zT2xrwVzsP4bGH4Ev0yh6JAUKVbWQT/OOGbRF+s7rVe33LL19TRAn72cYA0XlJArOIv5i40YbusYQ9R/KJ6CuHXeL1YyRmaK2OS42vM09BXGogzzHwVwScXMehuUVI2OlfUX4tnpw2WXuIw5AkQn1/KsCm1utDu8z2qq1+1IieOhKaErNCGcrmqakrlFCyuuDk4r4v59SkxhMsBLnojpV1OHnjtfj+S5u5xnXDbBE0xbubhGDVt47bgBnkFRI2n25W8PDMa7aWepO/eoCVKxhXsrijv7OWq612ER5pjBW4EP0klbdGdDaDwPq26oVU+GfALZUDDaYgeunotvqODFlJ5HjMVy9h+fBmvKs9Z4IrCWR2H5c/xilwzRvM4+bXbsmIBo3xE39qRCzlL/Ca1+jXKzlMGrlV61QLeGmxLhQDAhqK3DnyObCrWN7WG75GRV/7uwTufyYpST8LihWzcTFTOSFxfL+Scz15Q==
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(46966006)(40470700004)(4326008)(8676002)(5660300002)(316002)(70586007)(70206006)(6916009)(40480700001)(82310400005)(40460700003)(1076003)(8936002)(2876002)(2906002)(36860700001)(36756003)(82740400003)(86362001)(81166007)(478600001)(356005)(41300700001)(54906003)(47076005)(107886003)(2616005)(6666004)(26005)(186003)(336012)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 17:15:58.8237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83717e77-4c20-4329-dd5c-08da7af3fe5c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6592
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Introduce platform data structure for EM2305 driver to allow configuration
device PWMs and thermal zones by passing required platform data
to the driver. If no platform data is provided, the driver is supposed
to work with default settings.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 include/linux/platform_data/emc2305.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 include/linux/platform_data/emc2305.h

diff --git a/include/linux/platform_data/emc2305.h b/include/linux/platform_data/emc2305.h
new file mode 100644
index 000000000000..54d672dd6f7d
--- /dev/null
+++ b/include/linux/platform_data/emc2305.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_PLATFORM_DATA_EMC2305__
+#define __LINUX_PLATFORM_DATA_EMC2305__
+
+#define EMC2305_PWM_MAX	5
+
+/**
+ * struct emc2305_platform_data - EMC2305 driver platform data
+ * @max_state: maximum cooling state of the cooling device;
+ * @pwm_num: number of active channels;
+ * @pwm_separate: separate PWM settings for every channel;
+ * @pwm_min: array of minimum PWM per channel;
+ */
+struct emc2305_platform_data {
+	u8 max_state;
+	u8 pwm_num;
+	bool pwm_separate;
+	u8 pwm_min[EMC2305_PWM_MAX];
+};
+
+#endif
-- 
2.14.1

