Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B92EC07E95
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 15:59:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EAC461C33
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 15:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhGGQCb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jul 2021 12:02:31 -0400
Received: from mail-dm6nam10on2063.outbound.protection.outlook.com ([40.107.93.63]:27936
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231685AbhGGQCb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Jul 2021 12:02:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYKAPg2YQhUo008WJbk6/YlNF8P7zuQ3G1arkx1GOI3Ng7c08EuEpUT/o2lM8ECNQQcz+7fW1qdl0RgTEE7ep3R2CiX1Z5Kdr3bs1L3gK9wTCVRHuullNnqLhSzPtRVLOdbZCRXsEJvnANkAzzaIda7nAlzUiO2Qq15qrwxHv2eOH2dF4ATjXIae5cT1hXm/Ml3BPStXWzijI4v4ixiT0HDElmryLW1U0tPum3SV+a8LkjxCqezBoMovC8GKYDBFik3h08vTTBFigGYagB8mq5jM1HeiNZYi+MpG7DPftcoEnGlzaUlnhNeEGJH/4JiAx4+5c5lAVY4kY2gEikACrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SID3vOKI6Gz1SoYemi/CdbCph+me+3Id5iZGr2o2UMM=;
 b=ks2rh2wV263tDzbqXnxo75s2PXcJkfhS8PHnQ9fbKKWEkgSq1UKnvLRh0KFQvtKVkjGdCOOQYvGPwkaF294kb1QYL80sI0kUPEoWCMugFdLEc55l8HA+eKO9ehRAmOdVPrqJl6fQhJcv4juvKXNWWOt4Lg5cTwHD5EtsVzotA9F030iQNLiTO35ZY6fG+e3CcbwWY5Sa4stwh6FbFcHKEy0mPlhSJFznOhnoTexF+W4NmXDsfmnSua9VGy4nJigXZyDxT1rTIO2PlpYEPkbPOT7nQpECiShpqYjeXdMZ9Da8gxanC3GgBFmSf1wQpUv4ZXUE5zck7sWdepBW32CHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SID3vOKI6Gz1SoYemi/CdbCph+me+3Id5iZGr2o2UMM=;
 b=f82yiFMHFrQUijaMQSmoRCvNjvkBKgQSbWztDFhur0xjee5G4Mkr0jV0icwfm+GkswDri1Kb4EYBYr7+AOYaawQrg2LmuBufSB7TWoToOm8bxWcnvIvoXPewPgoJVuF3uRnB22DVW+AESgVC4Iik1t9SzSndBqARh7YekOTpPr8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 15:59:48 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022%7]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 15:59:48 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Akshay Gupta <Akshay.Gupta@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 2/3] hwmon: sbrmi: Add Documentation
Date:   Wed,  7 Jul 2021 21:28:58 +0530
Message-Id: <20210707155859.86240-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707155859.86240-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210707155859.86240-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend Transport; Wed, 7 Jul 2021 15:59:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c161a3fd-5e97-46ef-632e-08d941603f71
X-MS-TrafficTypeDiagnostic: BL1PR12MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB533345F26FE3E54B979F8D08E81A9@BL1PR12MB5333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tDaGhBtcMX9PwuIcoCZvR6+XXlYPXFR+47nRkUEgoinsbQDZEWwKlJrVtxPTiTfDVII1r+IRQ4tpvODsotTYDreGPPvgW1l2idzPWvc83ROXfO1QzpPGRoRJ/zvIAdBGKuGOPWuJt+4rY2MgpXB7r+oEcVS4/ewNQElIIPAh+Fxp4zPQIemE8DWJM2g5RBSuJLURF5URr+O6SdTytq07lRf7IBADq67cIvwz1numjBV+clW8g7u0CKdv01TF/fqSlIKyzvSZY4UwFVhHVVBozB8CrrtgQFVR1nW3w8RhEfpwYLfn4ULxH8eLi5TkVJmR9FjQ9XQWPCuwntInkZcz8qT94yr3wmDdZQ+W1RTQM4sUSVTVZ6jj7TbRShArYYUlTNKgmUJGY9REm3dsrUlINJsUhE+CwRACMI1yoI54The63M0HSIm9VY9WwhohQa698FDFKWreyrLCGxYN0vDh8FxkgJBhCzT7YRN5T2a+QaJtBd0YaTwdkx2dUdfizPEpw2hDqJyUMixdIhq71dBtPo66XQ4cZQHoAyVw88aOLl16Qh2yyG2/jn1cQgn7+sbfAJo8iqDssPrjSQ26Fixz4Vfp9W0JSwRO/gER62TC+S10iiKnhYU6PLSwBWymCvgjkaeieK1J6G3wTClZsb1+U6lCl3MVjDJ0vQIDwDMlvSIJsizIUfjt6g0CtqwP8Waa7zCM8hqPqCgA9BCz+Ooi5h0zqKQZQIfCRTztM7X3U20S2RHbYoKXrEpjqlF11mX/Ra7u6aRvJhlH1NX0BfSusce+jyNtlc4Tv/UPovCPHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(83380400001)(36756003)(54906003)(38100700002)(8936002)(956004)(38350700002)(2616005)(66476007)(186003)(6486002)(7696005)(4326008)(6916009)(6666004)(5660300002)(66946007)(316002)(478600001)(66556008)(26005)(2906002)(52116002)(8676002)(1076003)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WkozESuhFk5ysun81ZA4DKoR5VByncvVrLLwOeKvyLZOpmlvfLOJGzNdvLEj?=
 =?us-ascii?Q?8cF30i6R5hk5LPbFVkV7mADUYKOfiF9RBI4dojl/e6o0UDA/s7br6apZOqRP?=
 =?us-ascii?Q?8ALJB+ibKDqs7rd2mrNJggJgOtnvz2sAW99ZQOXm3+Z3CIoAHbdQFFXuRfDn?=
 =?us-ascii?Q?/6UR1+RktCs7P3qqMclXC+H36WN3emtwlWfmcjxP0UFryyHDgPo9a1Ktb8vx?=
 =?us-ascii?Q?+HGu4EuphXnUMQiTTGdjk+qZ+K+fYXqo/dP4R52HMvjbcwzSGZWezvG3GZXA?=
 =?us-ascii?Q?TzPappBQ9lhhlh/gouklE910S3V7ZVakR4hemagJs3Ua19z3IYl1kl7xaTTa?=
 =?us-ascii?Q?viRaZwRsUTdv4sFuHgpsBKO20bRPayapvWxEOd9hiGK2rIBoAYBx9zW4Kmpg?=
 =?us-ascii?Q?TIgGTvj+VOZyd7GzbGU45/aqgWJi/gJqh6zoOoPbpB/sWYd3rqRGrDPrJ0sB?=
 =?us-ascii?Q?ArCAjS8nW4JUPlLaQSpbNE9zOTw8vmFeoddjFGuI+phH0Hgy9FyNcREUygP9?=
 =?us-ascii?Q?7AaW7jLnaBpq41EMujktmtVUIQTf3wLJIWHdZR03tSJWbO0nGvwK0NFVOJu9?=
 =?us-ascii?Q?APBoWjeKLvHK34qHn7bjbiuxVfqtd4MHS2Gou+nRJgNVnl4lYokQbjmGNb+Z?=
 =?us-ascii?Q?46piAKgykBtvUboO7/iui/eV83rFGkoJkRAWdfZ1g+B03VFnZLzuLDUflRPP?=
 =?us-ascii?Q?dlXI5NCUPEdTFWhNb7gFgl+irkgQC7rDMDrqdcn1U9od73goh2+dFhpb95or?=
 =?us-ascii?Q?mUH4WrEKOOvRQFCg1+V+vRCy8ufUYAmDCXyNpnRCT35BlGTbC54cUwXQu6Nf?=
 =?us-ascii?Q?5c3qMhL4mwYmLPx7R+jF928Qz6NTE5WFIHESVPzeFShpd61T06fSAC0N3Ecu?=
 =?us-ascii?Q?I02RRwnyzVy4GPcF8bOdy6ZZb1jc0tYdSpmxRHXNh86nKQG9VqeJt9hk8qSM?=
 =?us-ascii?Q?yKF12CoH+y/Tt6wK+5Q9sBaDGSKsmJC0UNIBYnGP2HYV1//oPNUqzA0fvfO9?=
 =?us-ascii?Q?tNo8BIpy2XqP2WCYzMo6d/tiwqAwZSYiUY2MCfyOEuugavz2Xd7qk/Zv/bC9?=
 =?us-ascii?Q?Pn6771pTxZqRwZVFc327j2E2S3ETY+Svjr0DsBbW/gdKOAZN7x2Qo95q2fRA?=
 =?us-ascii?Q?KeVu54sBq2/Y6pzJi4qgCgYNGKUIqpc+Ot06zEBV4N4jCLk49ss42/3ZPnjV?=
 =?us-ascii?Q?GNsR1mFz6H0jGKrebA7kqRrsnTeESvc99tM1bBWZqPVF2SK8517s4S7kj/9l?=
 =?us-ascii?Q?ocYSvhYg9jlPEChjNxsdesGCacS6me4bQAd9fmltBSOxPfI9OTuuW3RIlq2E?=
 =?us-ascii?Q?OOB1qigm9O8wM3QzasrpQanl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c161a3fd-5e97-46ef-632e-08d941603f71
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:59:48.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiR+l3Ck73/TxJPn9VveSdqmu5plcNI4bl2xnu2UvuULEZaA5fIOqKRziCx4M38A+TRUw1/6exG6UITn1q2psg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5333
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Add documentation for sbrmi module

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
- correct power# to power1

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

