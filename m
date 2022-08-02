Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD30C00140
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Aug 2022 08:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236309AbiHBISq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Aug 2022 04:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236239AbiHBISo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Aug 2022 04:18:44 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF74537FAE
        for <linux-hwmon@vger.kernel.org>; Tue,  2 Aug 2022 01:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogyOyqHBzwFw/YCInA4QdCEr+GUyb1hg4l75LwfwXuSOTmiLm4Jgn5aqlqXAVJ2lNit9Wkedw0ZXTYwLEuTTpTUY1FRtow26r7LOA2re1HUSyHnwXMQqfS/At9hWTkWS+n55wtRPjAn0v1RVYitsxSFnHekUOrvvIOX9sHovNEnXG+tf3M1HjrGb5vw/yaLmXYU3FWrG2KiIjqZLnkFBNzOxReoERWCWgfQXLEqwOPWBcwLNPbw+hNPdrj/6olgiK1wlyW+xMRt9qDrprBc+69O1XdS/bJuKa60wkL9ab6b5159xG6aWff3w2yzzIgp2Gv0H9Rabd/CH5s5FrYtdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e4gZw4B/8oKczc3ChPEptCa4KGCmEptRIHmJzu08Es=;
 b=LKG4Vjh5Dzou/JJx5gHxL+tIFRkNsa21uLt/9g4XiiGqKce+MYEc8cRV/lC+DAs4Y2x5fatY3J0lfBPY/2PGnNadR85IwLrhGxmS7avKt8T6mk6Cl9fGMjGKsiTU1w3UxqlhsbUHprYV69t2iKyK0kM5mZXOO9TdjIPV/LpPlKY9odI9Wq9BFgp7x7qbxMaoJt2gxItLl+BdoepKQDmXxpr1jUTRk/IEkgRkP9VEj0jsmg4zPlyhi1t3wRINFzAl/DU8pLt54DtsFeiZ80WuLShVOkLji2tat8diNSuQByCvfniWmoD0kzFguU6rvxcIUX3lvVdY4kd+WBzycFLE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e4gZw4B/8oKczc3ChPEptCa4KGCmEptRIHmJzu08Es=;
 b=mlxNQvSseSAMCwZR58+7QWGqZb2Wskw16NLOJMIYWlQG/rFDW5SnXZQyGukuN7F5GGS92KPpGLkeNAnhDxbdilU9CGnH3xu8un0G+QMxKR8wHX/wRizaXEYNzrp0IP4dgEsv6xRUWw/rnqYnj9tKEqVDqAVFUeOl2yQgKl7/BhByMSaGobwmP6tvLVSl5aa1tQFEHMWoTp98FqtqzkcrJ/Fa1GmTqyOLocEMg1jHV7+pL4mDj+ljI0gNu5QYGvip3rAY60vJm3kROu7OyYgeojw8KSnAU8D6TJR0EQzWKCPxE8UgViJqeBfJHkV9Y5rrkZS2LzXdxDv8ngya27NnQA==
Received: from DS7PR03CA0175.namprd03.prod.outlook.com (2603:10b6:5:3b2::30)
 by DM5PR1201MB0009.namprd12.prod.outlook.com (2603:10b6:3:de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 08:18:41 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::1f) by DS7PR03CA0175.outlook.office365.com
 (2603:10b6:5:3b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Tue, 2 Aug 2022 08:18:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 08:18:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 2 Aug
 2022 08:18:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 2 Aug 2022
 01:18:39 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 2 Aug 2022 01:18:38 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v5 1/3] platform_data/emc2305: define platform data for EMC2305 driver
Date:   Tue, 2 Aug 2022 11:18:30 +0300
Message-ID: <20220802081832.6692-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220802081832.6692-1-michaelsh@nvidia.com>
References: <20220802081832.6692-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 385c10d4-1d34-4aca-075e-08da745f9be9
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0009:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KCnQb+2kDLQEBuzUUC/Tb00WHRahqW034HQjAaOK2xAVqUXw0OOeymB4i4P07LwfSlZmQTbHEqG2axxYhhdctyTw800O9/MzPIva4Fj8OiXggiGRC2sSz8U5OtSFXzWae7g+Yj99x7VNwcIb+y8IPizgZ5IiDKCPqPYmzkCB4/sPDgpj2A3XXP2wRF1qo/MIvlaaSonPsZFl2JgKBEFOSeiRbnwBtUev87m/7AQc4iSOTiduvjDJXY5GYb2RU3rzhM+vpzhtwKU3oUWvZM32+8AAizKV5OIvH/jY0zde0TosFji8ek9Q+VQmOv5DZzYzvFRY+CohsmCDLHxsNKA/CztD+9EsyNQdvQG6LLwzVntBSoUlbK1OZvxwOg1D3/iauGl/pYH2L8yel2/4Wid4LB9wnghgg8Br2VUUoKo+RCzVWtzOqyl/sCm/mWylQF0+/0K80dlZ4ePFT0xwd5Tb9kRKmwFP9LRbgmywG9Bd96E58RMNQhAI2SkEhO7DlXDaXivFjGTZVCEk7xqVEyS9qyIHAK60hdR9QQCd9pNHwXi47x2HleonjWViJXNDzib+H3JQPLZ9i6JlAcZ/r68G727e62iOEm6ifjrJgFfVCkTevN6tnuCqA/X6saldm3bU2oD0EbNjGhQIgwcBPQsrLKWDKSzK5e2wcAPcde+1vRKqX3fSBEjcWhob9vWK+sEg722Peos3fCraRVQcclAtcJxmnQvj6tkSW/ww1kIHRVzCjfSqsTlzO8VfrhEzRMSKnvlaHYyZwUTWmLtBKt87PArstySanl+kXzGMdOWkdytCWU4wmIQ3dbZWgSbt7ZrrY2tj6bgNy6/bJFJUxiOeQ==
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(40470700004)(36840700001)(478600001)(336012)(426003)(47076005)(36756003)(186003)(40460700003)(1076003)(316002)(41300700001)(2906002)(6916009)(54906003)(107886003)(8936002)(6666004)(86362001)(2616005)(40480700001)(70206006)(8676002)(70586007)(4326008)(2876002)(5660300002)(26005)(36860700001)(82740400003)(356005)(81166007)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 08:18:41.1864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385c10d4-1d34-4aca-075e-08da745f9be9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0009
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

