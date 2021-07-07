Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAA7C07E95
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 15:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7388061C6C
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 15:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhGGQCi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jul 2021 12:02:38 -0400
Received: from mail-dm6nam10on2089.outbound.protection.outlook.com ([40.107.93.89]:6176
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231915AbhGGQCh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Jul 2021 12:02:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq/JvP2cz6DWxiRIFoX92mTQCS2G0yWQ9JH0cpDEU88uSry29o6aT/r5m3p9K3THpViMutHoQVoAycWUOvBrV4UVJ/LeIA3ZKuahbC4qpo++HK5fFuzWv2sjqZWVltFmKNcRc+tXmVUsE8auMH5sg2u764rLs0zCOpNRBDHDBoli+tYf/HMBSEilxaC+XEuWv5Rwt9VXwN3FgGcSwjZCJyBRJ4GP2QcTXvu5E80WqwIRFcj7IBXMYtNhA7SXYMQuj8sxRP0Abj61CwRhaBARrGvkRFM8OvW2KfrLzyUdOggBg1II+CqtoqgNn1oTa5zN8vIjl1GVjm6AZQeI1shgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN0xp14tJkYZ19asBQJsG8iwflpUSRdmPrFjX5q5kAk=;
 b=auvHcuPKj/0TuUkRF1Futf3PRMIpctF9ETw4SONOs5XdLw3DwB2M/MKlw7ISNtV2uNvgRd3oStOruMk/sxXUpjs+pF/5WJqMQ6xAcT0m7EwOHck/YcXMPU8QcxMzrQ9N4FvElLtj/gzLIb6mAWw4nx3nhtpf1mypABmbefvj1l/X/W/Hn9Or4AKgrxP33ns+C42sOUpUQae7+chpzpEEiC1ly3EoD2H4q894sLSKrmh6To3CP3RefQ6relo6gpI71fjuEpwsXVdwFd6KsTP4vPfZ3tNhyQWAuyG2oziRUHKjPzzLdb1ERA8vHBOZzLQPZGFHSc9WK8hqtho0rXB3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN0xp14tJkYZ19asBQJsG8iwflpUSRdmPrFjX5q5kAk=;
 b=0r9uba906V5WBKDht8OqN5/1/ytQv5QZpTtPUkm62Kcn7pu1LPRLGN/ZRRa46nQyrPTgsRIN7sk/lXYdVk1IyWcYArHTbEbvGKZCyt1Sr/D5YQN36u2xk4SlyPKLkJ4IXF/iqIl9YkdB2odA4WQXN5x0usdIkhP+z8QNFFVWvhc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 15:59:56 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::8ce:4339:7e20:7022%7]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 15:59:56 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Akshay Gupta <Akshay.Gupta@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver bindings
Date:   Wed,  7 Jul 2021 21:28:59 +0530
Message-Id: <20210707155859.86240-3-nchatrad@amd.com>
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
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend Transport; Wed, 7 Jul 2021 15:59:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a37b2ec3-d4b4-49c7-d59f-08d9416043db
X-MS-TrafficTypeDiagnostic: BL1PR12MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53333AD3C82C84A6F0168C83E81A9@BL1PR12MB5333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EeSwGhEZwtAkAccPOqJEOTZlG9wRYfCH/QG6UND9sZX5Dc08XR7cqxxIlf88zmAClj4M31vhleePNDjNm7TobcRK053EJOP8/GMr+M5yeGYagVIvSNjz41w/w03iO+0pF4xV0/jtfq6xMvHZ+j1qEWnWzvfT4DVg3S6Jo9ALkarIPz4GM0rwD+9e86bveq1gecs9Lvx5lX+BlxbwFdik+rQJnp2YgrFvpw7s1CIKGMQ7O169N+/1NJlSxu/F835mSHGd9l3KkkdlgdtYm1//28iB50Ie+VBnrt1UI75iEfZZKmv22HSFED9LNVWELF/oQ5izrpTjnYsTl8RZSv/3po0J4ljxQckkVA2YGWg3hVGODb999rUJ6BIERbvEcFaXGSL5jI/j4Duc2ml0QRUrarOOVL+xE/9o8Z7Wp+zabpkIQ7GJ41svskktFOQIbfAb1zg64gU1iz/e1trTTNXLvhRpVWW2SOY8YbtOADPrJxz2H9Dy5ZdxbEX4ZhMPM+3zLSwVZaAtLa1y39pKKGyn2M8ZH7f045jVuPVFQcQkb4lV4pmimzWfBg+ydDnhgR3DCAhKT5mO9XyxkeiCjFugFl5aOBAej20uIawg+HmE5zM23P6zgbXGgzTVmeOK5QIJy1L8Kry0AaWfkhDzMlB1kd5cZ4C2HyBO7ZszdvY0TBrqumy9HRcB82Ggmas42EyuE0xo5p6x7RGUsCYXQkAXBQEWQeIe2Cj7GQDVur0vReEuo2IwzrXEeVVLOL+HxyDXYLZozM3dzKywhm5De9Afw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(83380400001)(36756003)(54906003)(38100700002)(8936002)(956004)(38350700002)(2616005)(66476007)(186003)(6486002)(7696005)(4326008)(6916009)(5660300002)(66946007)(316002)(478600001)(66556008)(26005)(2906002)(52116002)(8676002)(1076003)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ke2lA67TWB0Jf/2bp1deRyV2ROfB4rJv2ejy5IF8RQm3vC/fWcpizIETsvCT?=
 =?us-ascii?Q?1Jfqw4rTVS8p5HwCnBZgAc3B6ti/q5Mj1eXWZ+HNgpuCljkGxWOjsxTEiAea?=
 =?us-ascii?Q?6dLgjC/Sa9uL9r6UigkWb8inDixUkw6c4rYDS95Q2j/FUEjJmcAjIPh57Pzx?=
 =?us-ascii?Q?26g0EkEZwhcYGa1e6U6j8wHX4Qqwu23j1QYAvHT208F36OqdEsF6P9IjOp4U?=
 =?us-ascii?Q?JSm3pGjL/2V7mDikB8sHo20gWF6B9Z7GnaRzSxPhM26TXdEEzuurRH18Zzff?=
 =?us-ascii?Q?3qP2+rgg9YdDtFdFfG8/fBwTLfS14M/l7tXYyfRcNwwmZIyCGNS7/rJuiGUD?=
 =?us-ascii?Q?jFjYIS28y/s8Z7XFCKa/PJYCfrMbvbEAP8YlUAnq21UI2wjk52xEyo5MJlch?=
 =?us-ascii?Q?5hkCKqz6P8olbOgqCw5V1rkksjLoRGt+cSpV1EJVFmbW4+psLqOVTJN0414R?=
 =?us-ascii?Q?iqmlu9DokV7r4ACTtpYenbc0Q/2wfOOKeijEoV1NdCuRGfJYzKMqb8N5BWGD?=
 =?us-ascii?Q?GMToQCtyC0kngU0FFkQkKQJC9llKEmst31eDBRN30hsA1Obr93LiEi55zQpA?=
 =?us-ascii?Q?4M73Yzf4M1AWWTmZbRUPYyLh1Z3urSEzT6muWuQO22wZEs5XrzC/vFYmstP1?=
 =?us-ascii?Q?x7vQ9jS3cV2g1G97iMD4DWjSHPUIqsCLKX4J4Gl6j+0JHDFMzTzHPp/gPahe?=
 =?us-ascii?Q?AWG06mXg2RNiQA3eT9oq/Uv7C2Xf5JEE32TLgsswQnV0quBJs3x88qvv/LRq?=
 =?us-ascii?Q?gG3VuFQkPpX7AolX0JtusrN2hMu9GWwWTdhMqX6oo7v532CV09aHLJEJH+iS?=
 =?us-ascii?Q?XE4oZBfyhJQ3QS66ATJdbFli/t1MFrnrtoaiCVIM5QnH45NKwVDYbocxPly0?=
 =?us-ascii?Q?5qJnccZz2tv6wCsJnfJjcnijDMY0CNlDFMUDtrKHEgmqOP99y0ZDjYA61Xff?=
 =?us-ascii?Q?dV89B5qitG+WtmoUxa3zvn/ou7z7y2vDM+eCm7T9ZmzKbzWthBFyon/7VlDm?=
 =?us-ascii?Q?xPypZa9Ge97uNd+xkd/goWu+Sjxne4Vvti/qQkzwYCND/9POd1Hvxnn3qr5A?=
 =?us-ascii?Q?9Msdg4PW8geKwy3LcW7S+wkFquYaTwsd1DouIOS8RqCrV0Z0EUXku3CI8tcF?=
 =?us-ascii?Q?JgGvuwHIBjI7FXkjImOMYUNAzj+H2g+QkDr3T2ffal0/L4aILM836NO81dAH?=
 =?us-ascii?Q?d5jfMffhNqKDV6/3L2V1RMkaC7ljHfta06Hs8lGOKvhlOQCClzp9GxqPk/NC?=
 =?us-ascii?Q?ORHq6/DHM5y1KTwo3sRoP5oDtsUulZ578G6tMfxjEEwGlHMKSYIRzEqvUbfK?=
 =?us-ascii?Q?tHyPKT93mN7AUdAX3Yl2/fiZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37b2ec3-d4b4-49c7-d59f-08d9416043db
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:59:56.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvNLpfV69u0QDhJaeXCK47Q0vALh6hjVO+thMkdPbwaiEcdwOdQe2gVmDVKmROGAvRXc9qcJDrTtQvFcNlsSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5333
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Document device tree bindings for AMD SB-RMI emulated service.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
None

 .../devicetree/bindings/hwmon/amd,sbrmi.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
new file mode 100644
index 000000000000..7598b083979c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/amd,sbrmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: >
+  Sideband Remote Management Interface (SB-RMI) compliant
+  AMD SoC power device.
+
+maintainers:
+  - Akshay Gupta <Akshay.Gupta@amd.com>
+
+description: |
+  SB Remote Management Interface (SB-RMI) is an SMBus compatible
+  interface that reports AMD SoC's Power (normalized Power) using,
+  Mailbox Service Request and resembles a typical 8-pin remote power
+  sensor's I2C interface to BMC. The power attributes in hwmon
+  reports power in microwatts.
+
+properties:
+  compatible:
+    enum:
+      - amd,sbrmi
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C bus address of the device as specified in Section SBI SMBus Address
+      of the SoC register reference. The SB-RMI address is normally 78h for
+      socket 0 and 70h for socket 1, but it could vary based on hardware
+      address select pins.
+      \[open source SoC register reference\]
+        https://www.amd.com/en/support/tech-docs?keyword=55898
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sbrmi@3c {
+                compatible = "amd,sbrmi";
+                reg = <0x3c>;
+        };
+    };
+...
-- 
2.17.1

