Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7A9C00140
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Aug 2022 08:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235802AbiHBITD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Aug 2022 04:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236184AbiHBITC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Aug 2022 04:19:02 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::607])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F355719285
        for <linux-hwmon@vger.kernel.org>; Tue,  2 Aug 2022 01:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXZn+plDVMPpwcONQlEUQiCsulDvbZB0b9/R+tGN9FcgeUiypk5WSuxrdxYI4loMKyBAhAfRXsM2G29KxzFUac+iuk+y5H8PWOl65D7hlUvjR2EkhHHJtu9/YmMtDDwMg9CGB1BAH6exd8C7NvHOl5XpdhlSq0Tb+d1xJXUA/mJrzKY7wu2dzlsect5mYuVT256n7wbcPK/AcAnt2E3J98xtqQAEttt/pthfL8sliruCAC3DuIC4b5OewL0HzOjdVqr5UJqjz3vo/JarA/d/XeyKN5ssWC7TR2FQZwaC4yPMqnX/PjGWVUSFT0x8vdJgwHRJ6ew2OIC2wmsh81Wslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkXvzgpj9E7kz/YhpR0nhPtHcC4y60tSoMNu3L4uW00=;
 b=icq64cgEfh9g2HnexKRYcMxFicHUpCWUrVamXEFn+9rKm4Lz63FkzPrAFgw2vbZVsRWC2mb/xObdgb0OmSeQXAdfR4unB093O1L4jeLN05oGeyHHNkz4MwXyrG38/mlWbf/cjSlAM6/b8+lblFOoiK+TO3J5LPLr5PXBOMHYpieMj7yOwnvd9+5qxkbRDiY5SigrmoJCvbmO4HPkYfKVycZXTC+ybBrYQjq6kPi+sB9ztcjUNl3DcNnestT+jn2dNIBaByoV2p8+BBE9r8BqHyD/le+NdHR31JHfYE0cfEc6VWTJ3bU/9pkOKNQ8QhUTX07+beTY6lt6Gy3aE13Enw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkXvzgpj9E7kz/YhpR0nhPtHcC4y60tSoMNu3L4uW00=;
 b=F4QBJMIHqV54roMPjhgRvM38XCOmkgRY4N+RE+vdcCnaEjlB9VwygzcLUkUZwUZWP32/eiGdJFYcIiSAw27JnKp4VDSmRN/a1nvOGo9g56Hst/Otg1j/wECev13BC32zPpUfeJtQyoiK2l4nMs2NUEPtvQWAnwlZRkSbhOqIbt/bhlT7siEqp8QhVXoftXNHcR8jMY2CpP7Q/g5ngjL9W1twa/1PX2dW4Q4zUqFT4R7EtM1zxKEBNrev/HP/w987yBjN36A6bVYEg/Fx5ikfj+dOrZnCdO3+HZ6iOv69cTopaIIq59gyLeF++oOhHA8YBPDmzuCDRBTU3vZGXrr0Uw==
Received: from DM6PR02CA0166.namprd02.prod.outlook.com (2603:10b6:5:332::33)
 by MN2PR12MB3744.namprd12.prod.outlook.com (2603:10b6:208:166::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 08:18:57 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::e1) by DM6PR02CA0166.outlook.office365.com
 (2603:10b6:5:332::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15 via Frontend
 Transport; Tue, 2 Aug 2022 08:18:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 08:18:57 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 2 Aug
 2022 08:18:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 2 Aug 2022
 01:18:44 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Tue, 2 Aug 2022 01:18:42 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v5 3/3] docs: hwmon: add emc2305.rst to docs
Date:   Tue, 2 Aug 2022 11:18:32 +0300
Message-ID: <20220802081832.6692-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220802081832.6692-1-michaelsh@nvidia.com>
References: <20220802081832.6692-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4095e0b7-89c3-4b64-ed18-08da745fa5a9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVwPSES+6F/IktCmHGpCGJvwBvNOx3vdqyQnHiCu2sxHOzzjwIRCfoO1QS3f9GJpn8vPwCwGZdiOMRC9zFhVr3FBt1tkGFajzh8cAgmqjO05bvKSY67h414S07QMluB+zMyqY2r8aFOqKsv6UTmDYD+itIHWDbZ8dnWrNy23o1AKkXEmm0kpAy/WTS6Ey4WDlrhC16BHHwRWU6+qeIs0+qOO8KO2bGmmrog5yCk3sKaRQtMddxAAg9vZS999rRiB1q7TARq+BpqLUUdLi3RSWbgLY0DEbLnvUkqeioWMLMWJmdxJx191n5McfQAG5DkvORM5fhz79vZK6jiP2xrdJ+lurKVFC8jIFbMv0KTpfLh4/5r6GL4x43JKc557xP5DUharIlXVSlbkoHu9Zl61/DkkPoO7enEpmHN5caccSwnA59IRd06vbEB9rhzSC3zQxiSl8MGc9F+VbECFpNXhJ4BOxJkfZoO7TNnSEcA9uUeZkgHLYMwRJsN/Rz/AliS8kGws8XrELVqVEpv3YGQzZeWM1xzjZKdwQu5v4PYdO+orbGOhRQlLzB31zIy8i9MqYZGb/B1nhlmNfUddVi4fi3HRNEhH2lZtMa76tyC+iT0YL4KUo7cOVxIw7wSUTea24aZrK4xQ8oq/+DQv68j/Cm0hvLdklt5R+DqiKqpNqTbtUvAVBhdflJFoE7BXAFrx+uZkH73+nn5LtL8CN5+CuKzZVCCxBOcFYlTbftuCRV5Gyx3lZXQzAkJDMnoErW7HdP4baWGW9p7toP378/dglEio6YU1/5Eh2ahr5u9LqFwtrBQiljo6e6IIVI550dEYtkEp42HB7kj4tYV+JfY1couMXqMtDn/QwiAlw78t+f+QDogiAOZFq0msrH4Ha33slM3OAxmm5Cns8xDaZoDvV3TqjYKkqZvVogG3ZnuY/j8=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(47076005)(426003)(336012)(186003)(1076003)(2616005)(107886003)(36756003)(26005)(36860700001)(6666004)(82310400005)(41300700001)(2906002)(478600001)(2876002)(40460700003)(5660300002)(86362001)(316002)(966005)(82740400003)(6916009)(54906003)(81166007)(40480700001)(8676002)(8936002)(4326008)(70586007)(70206006)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 08:18:57.4251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4095e0b7-89c3-4b64-ed18-08da745fa5a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3744
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

