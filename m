Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE2BC4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B45CE60C51
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbhGZM4M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jul 2021 08:56:12 -0400
Received: from mail-bn8nam08on2059.outbound.protection.outlook.com ([40.107.100.59]:36321
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232527AbhGZM4L (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jul 2021 08:56:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAu39p0sGQGZGf1gR3TCj/BxxrbwazQEUNwKX/9F6dzukZe0K/IY4Ky6LdPIoNEIec2vtuPeXYsviADnJV26SA2Ng0YP3VD0t/sDaXVQYHQM+qioe4BR4tLHrQmXA5DZ9X9K+gzJZkMT4bV44xaU+3rb5M6qhORSyuoc0sxA4c6vsvqbBxHjTFRaOnWiPTDlV7f2uk2pm04KPYeiEziLLPDJzY1L7vdYkBTzwbKURZgUSYKfrcJ8CQ4R3wMP2r4/tVz4I6AtLgmbmMJ/cSqC4oHajD9daZoI/TI44GcIH1cjMwu4Ab+aVt4HV60cb8FavatQuMG3MVneblpKUOp8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3TJVuZfIV/5RzMeaEbfveUebm2NgJMdKs0FJNBHP2o=;
 b=efP+BQxWmDP6m8zKmGG29F1WLNhbHy5dN60GBgNxsiKXxgNnDtnW7NFbFW6prsU8grYAO8BaPK07NpVpnRtzFU8hnhtrkSzFxHxV7yXFY1UT0vpm5YE/v0IYu7foejyBtYzvLHXquUvdcEns6cPrLdi5uiTS8bJqSsINMWXLRdTUkxjjP/qibAzhqXdBlS+f2xTpgfNlvvnFdgfnPQ4KaQGaUfcU1ELkWPVpdP9X7YtETtZ0HWEoJRWoE0kqQBw1Ys9oinVOXCPixtbVVXr4jwfHuBTrp8SiFHPDC2sly3OyJeCm/rUUp3AxBrQ6iIClffna8pYAosE12+dUfXrnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3TJVuZfIV/5RzMeaEbfveUebm2NgJMdKs0FJNBHP2o=;
 b=feGAbUwT1u7JF4xfbl4QlFQ479Agdsf44dzzdd/dR0VB93EB0hsEVd32aL1zAUlTfk20NnZYna2ReBrQDIbTFrvawUMu/AXKQulr9Q/LfP5K/BpprQPPl8G8Y7QMZisXvKx1JndeFz5Wx/LZ05B84XfiAE8qfRA3udFLpYGcs2k=
Received: from MWHPR10CA0058.namprd10.prod.outlook.com (2603:10b6:300:2c::20)
 by DM5PR1201MB0073.namprd12.prod.outlook.com (2603:10b6:4:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 13:36:38 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::c6) by MWHPR10CA0058.outlook.office365.com
 (2603:10b6:300:2c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Mon, 26 Jul 2021 13:36:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Mon, 26 Jul 2021 13:36:38 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 08:36:34 -0500
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <linux@roeck-us.net>, <robh@kernel.org>, <jdelvare@suse.com>,
        <broonie@kernel.org>, Akshay Gupta <Akshay.Gupta@amd.com>,
        "Naveen Krishna Chatradhi" <nchatrad@amd.com>
Subject: [PATCH v4 2/3] hwmon: sbrmi: Add Documentation
Date:   Mon, 26 Jul 2021 19:06:14 +0530
Message-ID: <20210726133615.9709-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210726133615.9709-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210726133615.9709-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6133f2c9-a456-474d-02b4-08d9503a6513
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0073:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0073BF0AFDF5F73994C6F8F6E8E89@DM5PR1201MB0073.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jHACx7UuFKsAmyRQ1S9bDbh+90FfX0dw4+C23VVEQx6EXj0nPplrh6Y5XAdTpF3m+ZC7xXQtZFNRoYR2RTyh0HwReAIVTbKP687b8roWDavnLrQcDxSdoFZyKR+h+eoNeaIYbMRgeqFe6uAxz/BAf0KmIr2kBb58KR1BCeZdrJS79lQ6r9rp6osM5OIqrmhGVdaIGlhIpCsBTKXdiIqadgRyvM9mHemRdeYu184wv148O/MJgHBmLCAspkbLNGzplEPvckQpBKlVB6spMtoAf0NFhuWOzTstIFU3oA+WxStHXsKBV5mliOFMl4mqryLofI8kCGaF0KvYOx5yxPg3QOxCbh/2Ptl0UkNkevMkn7P0ULUV0liFnDDTLbBDYUCJ/pAwWO78nmY5og5WMDG5GZoAkVHGNxHM0s4wD0UH0/lgSgN/OmRrdrTMTj0OZ+nDNJ5IsklzMcVUAt90vLV10WnixUbB2eVxJlOU8HsDj9TUQz5VqZ9LEHYleJr9jPYu0FwRmFz073NQcDa7yN/9Xliic8LsGF8snfJmnfPq/xtTyNEID0QFTqA3svnqJWUW9gfpsyCwmZF5fnfZirDBmAM01eZtvnFPE53CqLotY4qK7xEG0tk5HS0K9gQ7F34uqKHQA9ygC0o3VffwyYAnWmps9l/ex3PtpN6gdwOfly1vFTtTVbryNCnWJeoHvT1jOUp4zbUney08hro0PPFewmnI6/HnaX3ga36KoqSE4SEt2v08nzHFClzKNIb11YkDMMgq2cLbTPP0oHTyV4ZTkDo6PlKUdY5L0uINCfnDXD4uyafxnqtFi9sMEAJd7bkD
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(356005)(478600001)(1076003)(7696005)(36860700001)(186003)(2616005)(70586007)(70206006)(110136005)(5660300002)(336012)(81166007)(83380400001)(36756003)(8676002)(82740400003)(16526019)(2906002)(316002)(426003)(26005)(54906003)(8936002)(82310400003)(6666004)(4326008)(47076005)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 13:36:38.2036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6133f2c9-a456-474d-02b4-08d9503a6513
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0073
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Add documentation for sbrmi module

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v3:
1. Maintain alphabetical order
2. Added reviewed by Guenter Roeck

 Documentation/hwmon/index.rst |  1 +
 Documentation/hwmon/sbrmi.rst | 79 +++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/hwmon/sbrmi.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index bc01601ea81a..470f2c50ecc2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -160,6 +160,7 @@ Hardware Monitoring Kernel Drivers
    pwm-fan
    q54sj108a2
    raspberrypi-hwmon
+   sbrmi
    sbtsi_temp
    sch5627
    sch5636
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

