Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDFDC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Apr 2022 11:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbiD3Lyj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Apr 2022 07:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbiD3Lyj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Apr 2022 07:54:39 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2047.outbound.protection.outlook.com [40.107.95.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB691A812;
        Sat, 30 Apr 2022 04:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IO7ZiEFa8Qd+/dWtykru4uq/U3WAukK8fYZsy1nXMaDQvQ7kvIF54neWn/5/BxADtE1KR2TNetaUZoif6VAO0g4+b/hG8ldDVjkA71pukkL/q+nMzF5I7nwtbLfwrPM3Ohmwh5oCRdCNb3YXAmRN+4Ab7stw8EcBnoEHRUIWxFYxEzWSKtXaHBlDWyA3OftbbGa1ImJp/+2OxZ3wHcuv1bRsi9/2B0F6EVmJU4dep54GLbIrF5EYAIiJiTAcUFopxU24AOKZOk96uwHASCLROGwlZSWgE1fVst+BABft8sLcuGhIqG4Xa1ioaY4r0jKkZOGM8QNuPy/tMT0Ng8TX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kip9RHh3ngZQ8BJPfNXQjlwy70fX6sx6wAkm5DuYWsA=;
 b=HIaGDHk6u8OjvP4MA4Bi7vq3NUeNOlNCvIDIjbylpsuIsVAArYqVnyvGa4vc8NyRrGMI1V2chE8beQOGSekPib6iLw4HIAE2XKleWUG8CX1zFvvtgPf+Kk74oNiz6iZKTuan3k+C+URfsznwBupGJnGNDttMCbg+E/gxXCOgglaaqPcbKrqdSN3ujxbsZKo15DK0dsjci2cakCTUWPjla3PnVHRBjhgAsYhAQoKkl89klI0siRqo1Dg45uYWNDfMJvW3qT0ZhCNEEvPMTi5hLSPrflAaWy/J3mgoiKgwcC3Lg+JdXq2keSYDFttbHg5wTX7pg2CUOrk8WRPpOTjQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kip9RHh3ngZQ8BJPfNXQjlwy70fX6sx6wAkm5DuYWsA=;
 b=UrPlIJA5+i79etUFhMwe6YLS5MW1axcVK2/q8tPytGPbmk9JN/a+XL6h2/Ks+2MKIvaAlR8hARdwJr6PNTzbpKZm09zT52DHv9owbLM65gw09NWxKm8HrLyWAV4KEWcZyGMvEZ9xRgQxIh7yhDs7QeXTdbz0eaz+iLgapKpmOQbzKGoS/T5laf992rA8mFRbNA8Hbbqi6HqWsnSadyLidbAX1czD4M1v8HXBlPwRyva+G5pk5yodoRLlYaB95khn3zA0G+zx3+Jx+qHuMjg/YjxRHjActoL0hOsprfFKR3WJsYwZvbp5Oxf/uE4hAa60slAYNaAzl5nVAC/6bZTuug==
Received: from DM6PR06CA0049.namprd06.prod.outlook.com (2603:10b6:5:54::26) by
 MW2PR12MB2539.namprd12.prod.outlook.com (2603:10b6:907:9::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Sat, 30 Apr 2022 11:49:17 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::8b) by DM6PR06CA0049.outlook.office365.com
 (2603:10b6:5:54::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Sat, 30 Apr 2022 11:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5206.12 via Frontend Transport; Sat, 30 Apr 2022 11:49:17 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sat, 30 Apr
 2022 11:49:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 30 Apr
 2022 04:49:16 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sat, 30 Apr 2022 04:49:14 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 3/3] docs: hwmon: add emc2305.rst to docs
Date:   Sat, 30 Apr 2022 14:49:05 +0300
Message-ID: <20220430114905.53448-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220430114905.53448-1-michaelsh@nvidia.com>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e09a92-c491-4f2b-768a-08da2a9f74e6
X-MS-TrafficTypeDiagnostic: MW2PR12MB2539:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2539E9FCC212AFC165410D91D4FF9@MW2PR12MB2539.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/CVlE5BfqE2Z5TuFUfSH1xQdanm+6t6Wprh52DWUP59CEsya+GvFb0LRZK342PUBt4BpYePE3Ik+cpdtWqJkHexT1FG05FyxRxLSaAY2JzhzWvuZY080XxB4DlJj+fwPYKeOTlwUWeK39A7ygKZYuq68hRM03b1nGNlgX2FT5nKQhSY3U/wjoG5vRJauoKJ+TJPRq+/V9WAdQVCBTHjx1Y4mbIoomi7RXWXqhmF7XUZPadzqNR0LIzxgENRNddrV9RYBT/PKZp9cr+p2LKBoDJCWgucMzvzztMI9FsbpIvN1OUy3l72oq6DA9L8xkaDP9g/V2e2XPZ4SSpqKncD+4+Qt9OBn4FaY3z/82sFsteC1vDl7draH2ZJHAyL7XnzfXsVDpiKfKB+H7PtrlZcIMP5JsOyEzfkjBY1nU+Q3c/YlfUNygHFJLm5V6tVqW9N5/9MHcbwEHXqHxosnMDBTqrTcDO9LidWI2q18aTxSN+Hq3NfaBX/bCM261bPe6PUeyLZ3+6/Nf/OTxQtMIBhUXLuwyYEmNq/zrtPrQltP0ilUAE6CBFy7w6KZHMbSecxsWw7YAj99nXgKDurOOYrbmssu1nULMHsgRsVRGTbq2gH+CaZEGJIEx6PqPrR4aNLvgmVjO+BJZxT2aq8AlfzeskF36IfyWKwNOcBJVCprYvkEPcDz7JjpgQ9DJOcL8goyoZsY98dzbCin0/LYNX5Vbj7FbP6F7aEDikzhhBSHbeceyXhNxje1Bs/zETEs1l4CN5ZR9lf4ns9Q5hYPRqFgf2ujokvtrQUzykvnxMV8vw=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(498600001)(40460700003)(186003)(2616005)(107886003)(81166007)(1076003)(70586007)(70206006)(8676002)(4326008)(356005)(26005)(6666004)(36860700001)(54906003)(47076005)(426003)(336012)(966005)(110136005)(2906002)(2876002)(86362001)(82310400005)(8936002)(5660300002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 11:49:17.4523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e09a92-c491-4f2b-768a-08da2a9f74e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2539
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add description of emc2305 driver.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 Documentation/hwmon/emc2305.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
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
-- 
2.14.1

