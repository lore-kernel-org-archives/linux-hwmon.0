Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA38BC07E9B
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Jul 2021 05:58:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A40F6113C
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Jul 2021 05:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237410AbhGTFRZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Jul 2021 01:17:25 -0400
Received: from mail-bn7nam10on2063.outbound.protection.outlook.com ([40.107.92.63]:5025
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237028AbhGTFRX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jul 2021 01:17:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV+kSrg8b+9fNDdtv7Jc35iV10kITjmWpqQr6I0N344tuTQoyh9QpdmCnusNvt9E4Z/ueT3wwwSlj7ZpCyEKrb7+cCekmU36wvdv8DLi8QVniozehp1998oJwANybo8hAnH631BBG58sY8zk1JAJhBMMGJb4yzbFx8upuPtHi8Bc2mwnFWiKZ+h+HvrRBtRp1bvG564yFdGkedk2boTWQNzjRJFI0z1XEP3Jzp9yMysIIu/uCLTGLOKTn/9zxgChAHu/q6maxqxHCDRp8lj+RWGR5Sa4Vk3I7YLaiUTgPvyW40q9/7qUMtjwX7FjANL1/DwEEY3Rq0l1QLtGZXJHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVzXz5VwvYIB7KWz90KyvWC7tRpk8YeDkuXkk89HVhk=;
 b=jHwj0MfQ2vCu5oysrDRyf/aZn1a1IkoxBCNeco5gYnPCkhnI2JjV8gX86oxQgj4Fh88wIWRWtuXhuSSQwtSRNBy3M8faqIPsM8Auc3ePVMNTqqW/7FzA/sz8MwWJ314EWzhI0UaslJcxIjT48g2QMJ4vyM5/aPCVoegI7yMMI0ygOY+I29YUvHiST/laBm0jnhN9MuHL2rFVQw0af0chpI60lylV3O2dHcsgH2QEq2lPx7dcIMokndY6/8P+ILOwBZ+r3HypYSIa8YOer+pFQfCZ9QadW/iMld2VufiHIVtBTYOGT8ffPsRhSgPkJL/QIdva3GGAcgJIWItLAg70eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVzXz5VwvYIB7KWz90KyvWC7tRpk8YeDkuXkk89HVhk=;
 b=ntVDMXmMYpQSUSuQQSYSxYO67+oh0kzYTTVSLa6ZX/pZLOCbTbvq+WPgPITb7rtjfA3przZhLQUUgxvSF9lfcs1FA8pl9D4SvrkaRJ6FXX0BFffnkjMh9JR8vf1r2QWWpAdX2CImCXZMiY5zJnxx/KcXvRe2iACsJ9jHMUO/giA=
Received: from BN9PR03CA0331.namprd03.prod.outlook.com (2603:10b6:408:f6::6)
 by MN2PR12MB2893.namprd12.prod.outlook.com (2603:10b6:208:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 20 Jul
 2021 05:57:59 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::fa) by BN9PR03CA0331.outlook.office365.com
 (2603:10b6:408:f6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Tue, 20 Jul 2021 05:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 05:57:59 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 00:57:57 -0500
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     <linux@roeck-us.net>, Akshay Gupta <Akshay.Gupta@amd.com>,
        "Naveen Krishna Chatradhi" <nchatrad@amd.com>
Subject: [PATCH v3 2/3] hwmon: sbrmi: Add Documentation
Date:   Tue, 20 Jul 2021 11:27:36 +0530
Message-ID: <20210720055737.8666-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720055737.8666-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210720055737.8666-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c86d42b7-241c-4387-2a24-08d94b435410
X-MS-TrafficTypeDiagnostic: MN2PR12MB2893:
X-Microsoft-Antispam-PRVS: <MN2PR12MB2893A3D408B274F673B9DA6AE8E29@MN2PR12MB2893.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wqAzA3T5TC9BM4N7rGw0GCtrUAJoFzReixxYsYITH3JB2JIQOael8ZaoofaNEwv3r/xWfwE+eAoypsteVT/cBpWinWkdhOfBcjCmJVzdrStEm2wi8vauXCt5/8BhGe88dUPTo3bEJuH8cmuf3Iddj80eoGLuiGrxXA4pq26TQ+x0qMuCjNAfhaFMnyVZb1XnF/VWWDcOnXGvMEeZBniIKQpqcFYSn8hDb3gVLLjYrsgxPDKaq9U8kElA5sCfFe/npsvZX3sm8HPiUxU6uGZdhHEysZ8V9VQJ+Vu4e0XIDmRoiThV6Uy9dH78t78KM0BfLc4txU5LVxh1Z3jSssYoNgt777trKPBG5ZhZvowuCCin0kcwBtE6dec4Ybmx6ZXoOFo2Nn6qQlm6VtJE24LV/V4TGPQLo/GbD424HIjUqO69TJfXvSspE+6VsFEujfO3gDIdVepmKbD+Tj/msgpMT0wJEDcgtLonOcQJoi5hAXoMBI6HQP55dxlCe35r98yj0GZ1xlDIyV6K/+siC0L0wT3yhnrIwgnu3VktD1bj3UrkAIZiMiVKYBFRVBGP/BitaZ6nwCbQFkXDH3IDPgaLPAL5dlM8c28Ct4RYqY85ptqAp/QrDHhLLvj5keB6ZFO0G2cyTjGJScXhWWfm0OOMBzIyThdotW1QG5t2HC2en6/aJuSPKwcV+U2B534d6ef9/AUQgqRdgZ+0tvcrRVknWb8VsAv48EUZneEFIKxvd7YnYU1GI7/bI3+bTuThsRpAxRX1WvPHyQTXdxAO7lb2mX6GGpa3UM0KGC/eBxnZqo7rNIsCUOHnjagSNMQnJvL0
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(46966006)(186003)(478600001)(6916009)(4326008)(82310400003)(16526019)(83380400001)(26005)(6666004)(47076005)(70206006)(70586007)(54906003)(81166007)(8676002)(8936002)(966005)(5660300002)(336012)(2616005)(426003)(356005)(7696005)(1076003)(316002)(36756003)(2906002)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 05:57:59.4343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c86d42b7-241c-4387-2a24-08d94b435410
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Add documentation for sbrmi module

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v2:
None

 Documentation/hwmon/index.rst |  1 +
 Documentation/hwmon/sbrmi.rst | 79 +++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/hwmon/sbrmi.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9ed60fa84cbe..5cd4798fe193 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -158,6 +158,7 @@ Hardware Monitoring Kernel Drivers
    q54sj108a2
    raspberrypi-hwmon
    sbtsi_temp
+   sbrmi
    sch5627
    sch5636
    scpi-hwmon
diff --git a/Documentation/hwmon/sbrmi.rst b/Documentation/hwmon/sbrmi.rst
new file mode 100644
index 000000000000..296049e13ac9
--- /dev/null
+++ b/Documentation/hwmon/sbrmi.rst
@@ -0,0 +1,79 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver sbrmi
+===================
+
+Supported hardware:
+
+  * Sideband Remote Management Interface (SB-RMI) compliant AMD SoC
+    device connected to the BMC via the APML.
+
+    Prefix: 'sbrmi'
+
+    Addresses scanned: This driver doesn't support address scanning.
+
+    To instantiate this driver on an AMD CPU with SB-RMI
+    support, the i2c bus number would be the bus connected from the board
+    management controller (BMC) to the CPU.
+    The SMBus address is really 7 bits. Some vendors and the SMBus
+    specification show the address as 8 bits, left justified with the R/W
+    bit as a write (0) making bit 0. Some vendors use only the 7 bits
+    to describe the address.
+    As mentioned in AMD's APML specification, The SB-RMI address is
+    normally 78h(0111 100W) or 3Ch(011 1100) for socket 0 and 70h(0111 000W)
+    or 38h(011 1000) for socket 1, but it could vary based on hardware
+    address select pins.
+
+    Datasheet: The SB-RMI interface and protocol along with the Advanced
+               Platform Management Link (APML) Specification is available
+               as part of the open source SoC register reference at:
+
+               https://www.amd.com/en/support/tech-docs?keyword=55898
+
+Author: Akshay Gupta <akshay.gupta@amd.com>
+
+Description
+-----------
+
+The APML provides a way to communicate with the SB Remote Management interface
+(SB-RMI) module from the external SMBus master that can be used to report socket
+power on AMD platforms using mailbox command and resembles a typical 8-pin remote
+power sensor's I2C interface to BMC.
+
+This driver implements current power with power cap and power cap max.
+
+sysfs-Interface
+---------------
+Power sensors can be queried and set via the standard ``hwmon`` interface
+on ``sysfs``, under the directory ``/sys/class/hwmon/hwmonX`` for some value
+of ``X`` (search for the ``X`` such that ``/sys/class/hwmon/hwmonX/name`` has
+content ``sbrmi``)
+
+================ ===== ========================================================
+Name             Perm   Description
+================ ===== ========================================================
+power1_input     RO    Current Power consumed
+power1_cap       RW    Power limit can be set between 0 and power1_cap_max
+power1_cap_max   RO    Maximum powerlimit calculated and reported by the SMU FW
+================ ===== ========================================================
+
+The following example show how the 'Power' attribute from the i2c-addresses
+can be monitored using the userspace utilities like ``sensors`` binary::
+
+  # sensors
+  sbrmi-i2c-1-38
+  Adapter: bcm2835 I2C adapter
+  power1:       61.00 W (cap = 225.00 W)
+
+  sbrmi-i2c-1-3c
+  Adapter: bcm2835 I2C adapter
+  power1:       28.39 W (cap = 224.77 W)
+  #
+
+Also, Below shows how get and set the values from sysfs entries individually::
+  # cat /sys/class/hwmon/hwmon1/power1_cap_max
+  225000000
+
+  # echo 180000000 > /sys/class/hwmon/hwmon1/power1_cap
+  # cat /sys/class/hwmon/hwmon1/power1_cap
+  180000000
-- 
2.17.1

