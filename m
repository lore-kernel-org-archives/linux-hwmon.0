Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5506FC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 May 2022 17:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiE2RFy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 29 May 2022 13:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiE2RFw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 29 May 2022 13:05:52 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2070.outbound.protection.outlook.com [40.107.96.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BE687A28;
        Sun, 29 May 2022 10:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1nxJLY1DwK8FEt8E37HdBlxA6+YLWa2SJP+cv+VhzfmNn8WBK0ey/ltTaT8iFXuw1Y7uDo5syHXcpH2dyfghLFTCyAu+GEgxBHHU0DSTy1yV4vF/E1tNDWuYW1FphZ8hIiIxtx409Fr9DLgygN1coXDEkbVo6/8DXfs1lTXSH/yZ+PNCEs5HfNY+oS4tPqutD8JKOziHbkTKzMG7syA2o4r8U7I9P/v3Lr2njkNu0IdenteEh5pvUEo8kfuXQt2OT3ZqoUtQaAlTnoZm4RaK5VHWwMyeAF6LYEA4IYHiU5caAJnWWa1lUuj4E2EmD3E+56mvf04eqk8I7exoxhUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZVJpewJNPFD9rQN1kIllzJ0nAZnggVXLfvUCV9esBo=;
 b=RxbJHfXzwNtU6a0FwOTdmZSanPCqROtfw8ZqU/cHFdmzjfsisyvydOiw4osOSiKAFx/hUfIZ9+BwPeU+exTBp2bJmALKXtmcDLnmlNnn/G+A+KvxmV4kdes+fMxVjpaoT/Qn2ufnDHK1MTp8NGFXJ97j/yJosYmOrYhX/iS6iY6UCV4tL2ryYzRnvqNTHvXA/bCJiBPDV+vmsPIw3W3jxu2KXnxPT/xYVPjAFD5g8Yq57UYRvBX4GLa7wZg+ls5LEO9LIH4v5aA5rVmb9IYnfAL5gXUrL75gDQcg38Y25hanwiN8DaLBVtF6bFA4tT0PBrWYwkpuHlXQAObI1ynfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZVJpewJNPFD9rQN1kIllzJ0nAZnggVXLfvUCV9esBo=;
 b=UJ/G3ZnTpUl5Nhyul52tnHxNBvLUtfcdYIZxN84huaPh0+PZ6b7LPVWZdwbZsx6MSbJ+VImiiSAb1xEk0eEQYsHFnEq0SJtTLdBfrG7/gdGejxngZsqXMfQcqb+xy9TKjdCw/VWlwS92gRrATEjCogI6VdFrX7x5QUZ6A4cYLNfuk3KH1mEAqSZZoQ6KZEXU9bjpoA0TZuzYTDvljQngr3+B+yh1W+Rdz5+EKAx/npbN5jULkOoirG2TBOMDK+Uk+J1dpnDoBsJDDqhUy+KOgWIkg4K9ie8k/kaLLYdlQiYYO+Ds3/iABHBmpZqbpcHzE6EKh/dUS9yPAlzTOdMAMA==
Received: from BN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:408:e4::32)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Sun, 29 May
 2022 17:05:50 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::1c) by BN0PR02CA0027.outlook.office365.com
 (2603:10b6:408:e4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Sun, 29 May 2022 17:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Sun, 29 May 2022 17:05:49 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sun, 29 May
 2022 17:05:48 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 29 May
 2022 10:05:48 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sun, 29 May 2022 10:05:46 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v3 3/3] docs: hwmon: add emc2305.rst to docs
Date:   Sun, 29 May 2022 20:05:36 +0300
Message-ID: <20220529170536.10043-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220529170536.10043-1-michaelsh@nvidia.com>
References: <20220529170536.10043-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 536ed9c1-a852-423a-7a7d-08da41957b2a
X-MS-TrafficTypeDiagnostic: DM4PR12MB5987:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB59870926B57B609965DE1764D4DA9@DM4PR12MB5987.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6UNMITQ/ZNbFjBADqQwqm0tr3ECNeSmTxa+wZXnZEQwiqbJWzvyv6kMPFAFUoz7Fb7u1Om5fHcYW3Pg4oGq2ge4THZ7v748nfrvcC0RCyhdp1mkrbtuDd1IumtsT3jsaAk6HCS3pd5EFGzMiV83ZNRZ2Iy3AWKwubwAnyLhbOLDdhG/1Qknif+JSwSShdmEkwbWmd0t7XBm/kUIddK2wiNNHXig1atM26QvhSnr1IUC+z0K3lMBVny0to8WaTj+iopv3EO9us9Cvswo7eQsqEbogiTpRCINYAUdbF+LhOAofHgK9JQ56iTBks5W84KPGQlixUEUavW7/C0xlLq+cqAWcXhTxkrLp/C2WKulsQguQKZcUKUtHU+IQ3BLKaCKnqW3k2sP8LiHON0VFTmbHL0WjaJeUUeMbL+6nc1I/6bEDEuBfqTter+cKh4eG53k/+RZ5s/wRClsn3bLrnem79uTNJBQGZMXkx+vDVN+NVH8LwADA7vItJ4pVWI9+tkuA+9fjrLsI1KeByW5jA5UUHT8heMSHPT0SH30zLnsAMxs55Ja0KDbJM+TH7n+p5OH6+ytIhroRtzzvZY7F6uY0dtBqw560szXd8aadwqgNZmVefttdletpLzqQgHYp36e4e7LJxWc/vuToojByXUP694MLXBZhogavnkFhJeP7355do8dpXtu0r/ATNmQVbcQ/RHrGa/CTtgpk/pLkCznABNdZ7azLhdIVeKgzisdSm/iYkxogOWgkTDJkt3zGtn2d4uh8olba5pqtAnn2VMQZBEiO3i9mRVlVTyudUUf7ugI=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(5660300002)(4326008)(8676002)(70586007)(70206006)(508600001)(186003)(966005)(107886003)(8936002)(86362001)(1076003)(26005)(82310400005)(356005)(81166007)(36860700001)(2616005)(2876002)(2906002)(54906003)(6666004)(110136005)(47076005)(36756003)(426003)(316002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2022 17:05:49.7098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536ed9c1-a852-423a-7a7d-08da41957b2a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987
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

