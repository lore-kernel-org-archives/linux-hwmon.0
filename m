Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461BFCCA47C
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Jun 2022 16:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbiFWQxV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbiFWQwh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Jun 2022 12:52:37 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01AE5FDD;
        Thu, 23 Jun 2022 09:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWXnp8Dwwybp2GrEPI4bF98fJOdpiIAeyz1/3+el1lytomTsA++DhMxe1RMU37417+FgbkW5T8STAmzDbiMvXK9nmFb45IUmHRO52QkkAeE+mbyZ4YJgqa3yyVnkAyffPbm4lLbXyHyYp5FtKZTI9qq3Jz3/qF2VzX0oWi+aHRAYDeAHQB2IsbLtfMzU3IciZxAx/gQIC5MnMgK1XTDCu6UmbaOUaj/sfdOhKSr/b/ExI0szg9qErSkc7EM/oDNwTXtMrwdPYIPICUsPXlOuzkWq9HHR5Tqxx/oqon+2nDuHThn8eKxqIgZhrIgD8qAxqz0p5FEOQm3iuhQa4p4a4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkXvzgpj9E7kz/YhpR0nhPtHcC4y60tSoMNu3L4uW00=;
 b=hMpDPEWvZPM1ip7UuLnh7rJLjPBLm5wmtw0hBOaQp01zamLIv6gLKDmg7aazcRNUfFKk8H0El9V4xfj0nqteMFfinWOdU/KDtQuqK0fhO864NUUDowKWjr7OBKUTWzoewcHew+rgjKdmZi/GElRrpd3BZ8zR5aVg3kiz8Qmq4JPRCKOeJXaASYa4mHsY90xYguo2mM8W/gqAH3syJ1MMyU8puRTWyEFzAM8yALxNbRrA9eOje29qA9bnhuqEr/kzvI2dVoYFFCZNnLnxWU79DYsSjreG67W3XsiZ7WW8BU7ItCdoXiG6OaRnknt/d10rR5PiFCNY53M/gAqdlaFjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkXvzgpj9E7kz/YhpR0nhPtHcC4y60tSoMNu3L4uW00=;
 b=J5ZL5Omf/DuqrWR57d3WMIIOraG9xeci0fEoCT3j+a2JRyeTX4UapPDRigA9VUEBJQQJjx4lGadXu0FyApsaDR/B+HMXQNGMZFh4eP0uJaKAUN96hCm9t9uNPVDwRqb/cxn9g2hLdQiGCtmcrJooezQKEJHwH60BV3gm7XOf286f1gpgC+P1J7M7nbiSomYSno9G99hBSNIAcXVeazkAM6uKHlaXt97GjbMIsSzWsQYNK/dx5U8StSVFzBXMQIInV/x3/RZvIUtM/WeIits6IVZJKFx3bciqg8LP9HgkrlcN/TMUM/V4sGLrX9fTQY1+9t5qWJcrrCTnfpzt3mkgxw==
Received: from MWHPR12CA0048.namprd12.prod.outlook.com (2603:10b6:301:2::34)
 by MN2PR12MB3741.namprd12.prod.outlook.com (2603:10b6:208:162::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 16:52:31 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::b2) by MWHPR12CA0048.outlook.office365.com
 (2603:10b6:301:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Thu, 23 Jun 2022 16:52:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 16:52:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 23 Jun 2022 16:52:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 23 Jun 2022 09:52:29 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Thu, 23 Jun 2022 09:52:28 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v4 3/3] docs: hwmon: add emc2305.rst to docs
Date:   Thu, 23 Jun 2022 19:52:17 +0300
Message-ID: <20220623165217.59252-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220623165217.59252-1-michaelsh@nvidia.com>
References: <20220623165217.59252-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e462d1a1-ee16-49d8-96a6-08da5538c355
X-MS-TrafficTypeDiagnostic: MN2PR12MB3741:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 90+9hsVLHzQ0D00AFRiFKQn1EGslgJPt7JFdGM81Ud9tEelysY06Do+9cqvxEoYXuB20kWJEkSU+oNC0D/5soA0G3HGldlsK3l6B7bfcn/+OMTfcb8UJ/Ow4QRbOfH41hLn9WZO7HTM6cxbnN558srNKGaCDg75+xBCYcpi63shix0eiqvCfLGOnfDZ1E+toob+pu8bTsLkMdZIHym9EukpmsfykIcsKRfCRAFtvvTWora32NlXD3ywlqZVrPSxOT84KjBuT0LG2OMaBBY9fhzc9SXaQ2j4uIQz6f47RjGuNSruPMHwDpshudM5QJx0IxuhUQg5kfIRnf5ybkdXh9WhF8Pdrrm3QpJiewCy28KepTdpnsAYLJGWGD/k5lhUMUSk9rHlOOd3XRd9zT2h0/2ErSOiKFuqaD7IhYG1Z6h/OWeu9oeefPRZhYW9j/K4uzuH8xGqd6rIsQnNbXiQVcxBFZbB5YzsaSybMoh3chjXSuCd/XNPOFE0GeVkQlfyIcsCmDCfYZCq8sOgODePJoi9r7dD6zwXmOUdUUtsLIn6gUlKc4TS1jOPrMy1jypgD5So2YVxs5YwVdDdaF10beOIXTHTdNJx0iVcbKnVZXkm32Y9ew2NiUFpWf2tL+dHW1yCtMN2fuZuvT1N39WMhdqUqfoplORKj+S+10rB3cN/y9TvKpnPDBuiGJi7mq+SNxhF+y2zAIDMbsBIhw3SN1IIkEzMRMCk9HldBFDZhSwO9BPx5RgmHO6YGWwE2EeJNGLYqgD8hVpmilF6Dv7D6moMBjWRG9MjQEiFwpf+6BiJUr3t7t0tyhEOq7TpGbZSVWO0sKRqc4n5eue/h4fqvjQIyc/7fwCp9UfcyZTpq6wIDwccZcd17KN4NG+A3HZbJapEBxnd0UWz5Kf2/t3xC5l5aIBODmIOyfdkRTLmN/YE=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(186003)(6666004)(8936002)(36860700001)(356005)(478600001)(70206006)(54906003)(8676002)(4326008)(41300700001)(966005)(36756003)(2876002)(82310400005)(81166007)(110136005)(70586007)(82740400003)(26005)(40480700001)(5660300002)(426003)(47076005)(40460700003)(336012)(2616005)(86362001)(107886003)(2906002)(316002)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 16:52:30.8792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e462d1a1-ee16-49d8-96a6-08da5538c355
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3741
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add description of emc2305 driver.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2
- Add document to index.rst
---
 Documentation/hwmon/emc2305.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/hwmon/emc2305.rst

diff --git a/Documentation/hwmon/emc2305.rst b/Documentation/hwmon/emc2305.rst
new file mode 100644
index 000000000000..258da49d18f9
--- /dev/null
+++ b/Documentation/hwmon/emc2305.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver emc2305
+=====================
+
+Supported chips:
+   Microchip EMC2305, EMC2303, EMC2302, EMC2301
+
+   Addresses scanned: I2C 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d
+   Prefixes: 'emc2305'
+
+   Datasheet: Publicly available at the Microchip website :
+      https://www.microchip.com/en-us/product/EMC2305
+
+Description:
+-----------
+This driver implements support for Microchip EMC2301/2/3/5 RPM-based PWM Fan Controller.
+The EMC2305 Fan Controller supports up to 5 independently controlled PWM fan drives.
+Fan rotation speeds are reported in RPM.
+The driver supports the RPM-based PWM control to keep a fan at the desired speed.
+The driver provides the possibility to have one common PWM interface for all FANs
+or up to the maximum available or configured independent PWMs.
+
+The driver provides the following sysfs interfaces in hwmon subsystem:
+
+================= == ===================================================
+fan[1-5]_fault    RO files for tachometers TACH1-TACH5 fault indication
+fan[1-5]_input    RO files for tachometers TACH1-TACH5 input (in RPM)
+pwm[1-5]          RW file for fan[1-5] target duty cycle (0..255)
+================= == ===================================================
+
+sysfs interfaces in thermal subsystem:
+
+================= == ========================================================================
+cur_state         RW file for the current cooling state of the cooling device (0..max_state)
+max_state         RO file for the maximum cooling state of the cooling device
+================= == ========================================================================
+
+Configuration is possible via device tree:
+Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f7113b0f8b2a..83b082d222af 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -63,6 +63,7 @@ Hardware Monitoring Kernel Drivers
    ds620
    emc1403
    emc2103
+   emc2305
    emc6w201
    f71805f
    f71882fg
-- 
2.14.1

