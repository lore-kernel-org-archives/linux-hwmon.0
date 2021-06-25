Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A82C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 13:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6FFD61628
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 13:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhFYN2b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Jun 2021 09:28:31 -0400
Received: from mail-bn7nam10on2055.outbound.protection.outlook.com ([40.107.92.55]:10336
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231708AbhFYN2a (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Jun 2021 09:28:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUxFtDeJsWIh8UZtpJU7bs7WTDN7iyHama5shDIKEuifaDtplLGfU7O+Zs4ryxIoM4MZXJzqUBrnIkePTW3C4+rSrzWrwy+TqR1y7zrq/3fBlVuspf0hXS+PbbOuWWlbH3aHMz1iXlnWMBKYzH0Mg0cefi7OhFRY1ImlpK6KkX8LzvwVTX99z1AkknHcFBif2ELjdnAwTggUP6z31PrfDwxuumMxRNkNneVeAfJ065kO9RkJaKv+3gwxP6H9qR6rK0h94pvSUthNbmTU5yz7pGrrLkx2SM0UaBgLaIZvJTi+HmG8FShbVcIlEq4DACRv/ZVvYk+TAZnGsfr7ADRYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR1nLqNNzxt6CPpxphGQkw04PuVRroGHthGbtDtcET8=;
 b=oFLnN+S9ueNSUEg00bDe2sRizw9zUZp7D8qojfKoC3iPgIZGRIzFR7x/Oms8lmzZIK6Qsc5gz/uf5tk4mONPTBAKvERpswgnD5IZwOUOfvrTDQR1o3FNDcsAra0qTLgXu52NIm7w7RkUwiN0b66cQRVdvUB5EvFNQAjPRNjyDbB8hVUob7ZTNsk0iqz6VEiaNdtgNlRjzdUspW5WmTtaFN10DBigOY/MdtCp2Og1s1Om2D9JVdDLy7KZ2GANTjEYdzUKzQPA+Blgdqppc95mQW8fYyqa3e5wBMIatR1u7XvJQBBNr0MVaAGnnfZfjPBLv3bCt0ti33OocfplIJFR+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR1nLqNNzxt6CPpxphGQkw04PuVRroGHthGbtDtcET8=;
 b=draCeQdPeidaE/pnXjwtrmm6KhVRbQOgbJrKo+ETuqHo9azUwGvFzqP6cg21uHkHZyzcBq19vzd3gXJxDACkuOK/ZGtq/QFCkMQzndK2hNRWq4O6WBNBjJyAhSFrPDNMWZw783ebjjym8XSMzs1R7buwssQUsRu5pQ3B6snFkQE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5255.namprd12.prod.outlook.com (2603:10b6:208:315::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 13:26:08 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::1514:9ec7:76dd:568c]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::1514:9ec7:76dd:568c%7]) with mapi id 15.20.4264.021; Fri, 25 Jun 2021
 13:26:08 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Akshay Gupta <Akshay.Gupta@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 2/3] hwmon: sbrmi: Add Documentation
Date:   Fri, 25 Jun 2021 18:55:43 +0530
Message-Id: <20210625132544.18094-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625132544.18094-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend Transport; Fri, 25 Jun 2021 13:26:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a2ddcec-380a-45bb-e1a8-08d937dccad0
X-MS-TrafficTypeDiagnostic: BL1PR12MB5255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB525505D444C6BB35EAE72F32E8069@BL1PR12MB5255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ih0CuTZEwEPOiKTpMFBOJJOW+EUjHrRNCHSKzbkhFj9auW2KDH0jAi0B4iwc8SZPHYw4kPcy7PNSRxuuo7xZjssbC/OW21g/Y0fwpdLnod5g9YDjq+oV2Xs/f1BHqLaVnC3f2bKpfddeiqtFOBgjmgph2szQzdZJGaFx7By5716WCFQroAzkYMxA97IaPEXoadtb3hRZxwuzDpHCpJ1H47XryUEgyZ3HduwINrN77/YHSNcct+cN1DIzDMXtRX2+2D5IZitGI+tBOXPibBNPSUifmsfpnd48GdzYTQkJXNKx/ev6kOZculagy1Jt/PJKxLgcUjT3rQKWoqkn8GIjJbHUW3r3YYdo/y1/uWbkwrgFQSMLGr1JcGiPaStJk42KPr6SLXVTXSg9qbpe5BE+mamthfWHcysS2RrV/6ngB/6kfGNhPODE0gqiztlGGDCAUDC9QU/L5O6V8VNQ6v5npt04vS7wozH6RfzisFNQeCbZ9mjCrYuqYq7uB+qUlTU0ayFL1k3ADOj8yMIo0J3wvJ5TB0ynPHJbz1ZvKWjExb2/8wXaUwvPNJRhUf2un5YKxIs37IQgRSMPMAdHolh4+Wzim0kMy7GzbkA3K/ZPzsYnIKhWcLDN8CM/WlFkSaYx7Lvez/JM68b9N8i/LqU5YvI04fDSDH9TKJC2nlkUha6/9u7kbDGd3U677l0HIv7pPJthRpfs1afYXlkhOD13oLLW6+SgPEXkc2PwHXJSJ44uyNWq6VEzBC9R70uQ2faE5M9dJLOgsZWbD+LlPGniAPSUYXzh3vJQtSFowY2YFMiYvCGYPrtlY6DbpVkhtXq0+vFZmFDrm6e4py2qdWjYpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(1076003)(8676002)(36756003)(54906003)(2616005)(6916009)(956004)(8936002)(4326008)(2906002)(38100700002)(38350700002)(26005)(186003)(7696005)(83380400001)(6666004)(966005)(66946007)(5660300002)(16526019)(66476007)(478600001)(316002)(6486002)(52116002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mTN+DR65of9BrEoZGkODCIPo9pJVWEBNtUCKK+eV9+M75oSCZzNL/BcTm+xl?=
 =?us-ascii?Q?xur0c7q2z6IrWuCOJqKq6XDSCDGMwe4M+HgF+rDG0Uo9y/q9kfjqnXL7qx78?=
 =?us-ascii?Q?z1UlmSVxYnw8MKxW7fiYXziekKJ7le0WqSXPr3Nm5rmBAvaFFjNcWSxLNyLN?=
 =?us-ascii?Q?zAUkYRh4yJM4kqivkas/JLDxAH3AsFyvaf7cWLrUGVhkD6lhcERPLipIsepW?=
 =?us-ascii?Q?E/ewpD4C+FVGhiI6So99NV9FHbhYXURwAMidHO4/Cmxxw3m63AC3kj8C7mfm?=
 =?us-ascii?Q?9frmqTLu1pY/vIQe0fIdS4zmJPkqpCHI5A4cszCuFFhiB2+gOxBfxESB5f+N?=
 =?us-ascii?Q?WAY7J4a6/GZzrctZD22D5ve0X9QhRtPj2DAN8EZPg9mCCzUrfqCF2VpzaESw?=
 =?us-ascii?Q?KziNpr5Imd0Gx7UnyJXD6gxZeVr4+At+OcELjYc3YM+UKPAcbpVMhRFK/ufH?=
 =?us-ascii?Q?LLRblCkbe8tooe1bPHRXqsW/ovCf1h30bTf0wuLZ7I+F1jq9ez3mDPo11Z4b?=
 =?us-ascii?Q?lI7nD0kCC7B9zzJ+Uo9XvYTL12POMBcHYkxm3X7jMydhC4Us2vdULcoDYxZv?=
 =?us-ascii?Q?+loc0HmLfgHU01HdabgUhAuL80SwOV174X4ihM3JfVwAQDL99dPGz51Ci2Bn?=
 =?us-ascii?Q?CqVnEqXeb1oEuZXSQxz6Ym3EoOG1knsI7D5NXi0aXjV+vg+LPLKl7MBrF0vD?=
 =?us-ascii?Q?MAk1Bk1/hgzEBfn1QETjRGn35ODRovmFlPH0K4Aiv17G4JYJP7KeGMXTEwEf?=
 =?us-ascii?Q?lZJDOhE/Aq9P1Nk8eywboq2bOfcYixG7AGxGoE3/aKO8Tm91UUFYwwu49Qlx?=
 =?us-ascii?Q?W3KesgqF2m1EtR27rPKbNwqfi1y3qBre5AJUZJCy913oFAbyRSZ9MFr8N/Ae?=
 =?us-ascii?Q?ydcQ/HbbhmyNXt8iSUwJf2UGJDiupDgSdnjKkp5mke/dr7zoTwrIwfdDobJk?=
 =?us-ascii?Q?RRb6LU2qIZL1BLY451Hr/S8HqAPrGCCErUu0zGv6tKVWBZTrL2ffQwm4wM71?=
 =?us-ascii?Q?6st6lMUE0Fwuvy0X5IxxuNuwa/vXbtvu3GZXVkcBOkgB9ESGaAaSTiqWlYRr?=
 =?us-ascii?Q?U+Fezn83WDn4ETJP7BH3J99LpJ5sFiEJnobisjfNKHjQNqlJ+N+nCqT5Fo8n?=
 =?us-ascii?Q?dQHVtggfijPTaZm2SuBgcTeKw6dh80KRpzgCP3MaA1g92eE44/vQXJYlw0rK?=
 =?us-ascii?Q?a7Fg+Bl6FtpKBflLcQzMWHp7R2I+a5afl5gUAIkA8m5pM/MXR0Ve8NZ681Cj?=
 =?us-ascii?Q?doQv794z23VLqnehWwwurKmS/7vfYjbROht1rSU1LmvdouiKcmHc/IzUARdX?=
 =?us-ascii?Q?cL2E98W7Pr+3+ncqs+1s+Ynk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2ddcec-380a-45bb-e1a8-08d937dccad0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:26:08.6517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3vCTT2b3Z26J0ntCmwPMBTlQQvlUiEgy1aISugBXGdAkoELD5PjqX+04TkpsuN7OeB0D1oyub4Wyus+WGja7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5255
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Add documentation for sbrmi module

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
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
index 000000000000..db50393167bb
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
+power#_input     RO    Current Power consumed
+power#_cap       RW    Power limit can be set between 0 and power#_cap_max
+power#_cap_max   RO    Maximum powerlimit calculated and reported by the SMU FW
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

