Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B7FC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 16:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239091AbiEXQSP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 12:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237117AbiEXQSL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 12:18:11 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736DE6BFDD;
        Tue, 24 May 2022 09:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWn+GiV1inaanMkim3c48ReSqzScmDkg/gW2xs1ILMcsKmLr41HoFXkSFnLCCaSTRvuDg+Tl2nDefabITcQO35NuDwMpRyrJs0T5o/FbOhmSGrVbhf8+ZpzBQprFlfEn6wn/qwf1zfnv7B+2W6OxATqC/0gOxUJ08UrpTXj89AUFLQDLwYjn5f8hbGxKVcawBwryAkIT5Ry5vE5lLkuv8K9kYrapwzBsmvoJkV1qjQ4O6UGtqeJHLIPSCv1XfYuNilpkkADSolBjNwZ/rzJOHkavQjoKmRP4Z2sDp6hZb8nV69iUQgtos98zRdcgAGPOaOIxCemPA43iMkeDn1uacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZVJpewJNPFD9rQN1kIllzJ0nAZnggVXLfvUCV9esBo=;
 b=hnRgvEVFwWeEDGWkV3Mtfl7mokqjH23JSEMQQ83ocOviFtch1oqr1C+VKcTAr9KThxiaWRXcsP719bP+1YURB7lgC25D7X6ZBzsyw6POfiRYy/LzWADnF/LhuAFC7pexrwV3NBQNvFk8GsO+aCAc0oMy/ZIquJRrafwAsDsiE5Ld4m4xoJ/bY/wewd9h46F0fkS/FLlY8xI2G3PU7anXjwsTko6EoNAmku+yxtj13Yi/2U2Nf2xaIZYpSZm7bJ8NF0KSgHl/SXDnTwBBesomQXL4nlTIXRmX6B60w7ilBXpfSdusKVZPTnwWuiMupPxEzbGKA3pX/fhpoaTF3h/uZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZVJpewJNPFD9rQN1kIllzJ0nAZnggVXLfvUCV9esBo=;
 b=onEF6C0In3IHOIc16772yeSmrXL6x9qDVRYlyimHuQnPlNcESY1MY6EY1SkDSwpcm6MjqJavMI88adFMyQxS+93Dnf2LMCusOoXQZ4amW2bojYUf+YhoVIKTZZbSOGMFMcfPvO2ic9CaorQ4M49ZziYy//tAoJm0sb4L4JME0AzAvlr++SqXpWthkP245NmigivctgwcxiNiYd7oFk6IEmswt/bOnds5tYZMVSvIhwsPUEYW4lolTrAhkWceWbSjgc4FqTOfto6GZKxgqoGa2T1WgDcTDRpk+zfBRDuoowHgQJMEZFfbYLbTgVk1zWdyi6yLYZtGFXHwphGMDl2y6Q==
Received: from BN9PR03CA0563.namprd03.prod.outlook.com (2603:10b6:408:138::28)
 by BN9PR12MB5113.namprd12.prod.outlook.com (2603:10b6:408:136::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 16:18:08 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::40) by BN9PR03CA0563.outlook.office365.com
 (2603:10b6:408:138::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 16:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 16:18:08 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 24 May
 2022 16:18:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 09:18:07 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Tue, 24 May 2022 09:18:05 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v2 3/3] docs: hwmon: add emc2305.rst to docs
Date:   Tue, 24 May 2022 19:17:55 +0300
Message-ID: <20220524161755.43833-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220524161755.43833-1-michaelsh@nvidia.com>
References: <20220524161755.43833-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aaa4419-5bf2-415a-32b0-08da3da0fdb7
X-MS-TrafficTypeDiagnostic: BN9PR12MB5113:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB51139392DB4B127E2676FB74D4D79@BN9PR12MB5113.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VEElfsVa9/SuZsM6TRsnPiVxZ/F3RzV08ZgtyRj1xQ0BP1b3c6jYQsVU51Qt9I3QN24SaAzIF1BZgmFLqWsyy4vqUKGE6tqB0oPz73qji+wG6rBJHKlt1NYj3m3MfZazoA3a1jZ6JYTrfJz/vAzXKHE7upo2MXFetazbAvkCX3Yjai92rL4szD9ugKSJqgiacl7gYkSJUWN8+KtnOb6zBhqv8DwXk+ImaX2SBA+vbO26KaR8sNpRFU4B7/C9SNfxo/PWeMhw7o6lN3JRI46MLJBkUmbEICc+4n2d688D3TzzKjzPX4SSuWZKlvgoGF7sB9LB2SCN11/Gkwv198Gp+HF0kmZByGx5GWh/Zwf8CLAZF0RgrL1I25zDI/TNjzPlvZonJ43b3jqyqlJOSbgWZ8Rp4onVk4J/TuwsQLbLqzPidj5jXokm2JWsynu4KP78S0Q1xbNXMz4mSD2A2ddA//1TBy4bvIZJegXr6eD/B0j6C6s8b1ov2/12E6Fg5QGwCxXH7u9ZgD1tsCKFqKn0uXmUx6RoXJHdoCl5ZhLdHGh34cSJJ1cBzo/dIhfQZZJHe2a+TGlSb0rWr9KQCLJ+D+DMMqmo0/saKc6Uiswouc2pogBIP2PL+IQ9lFfdrCwiyaJRlI/rOM9oe4eZgmsJPBytq23pHM8zwwZiLMvwyuCRjMZwO6w/d7ZUzL2EHGDS6/VQ2jv4vLbtcZgIKy0kaTC9gl4vQBTNV9EKLN6UfnGb06B2yD+Afh+lYHZxWd4dT9kMWM5Z4/aGaZlmXwd44L2AGJZfW33EaHc2+oQXDQE=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(26005)(70206006)(8676002)(4326008)(81166007)(356005)(6666004)(316002)(86362001)(110136005)(508600001)(966005)(54906003)(2876002)(2906002)(5660300002)(40460700003)(82310400005)(8936002)(1076003)(186003)(336012)(426003)(36860700001)(36756003)(107886003)(2616005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 16:18:08.5331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaa4419-5bf2-415a-32b0-08da3da0fdb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5113
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
index a72c16872ec2..c8f6f897afa2 100644
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

