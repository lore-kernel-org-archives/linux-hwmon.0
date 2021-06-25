Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E762DC2B9F4
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 13:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D06BF61962
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 13:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhFYN2g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Jun 2021 09:28:36 -0400
Received: from mail-mw2nam12on2069.outbound.protection.outlook.com ([40.107.244.69]:52897
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231668AbhFYN2f (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Jun 2021 09:28:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA5X4mKmLvEb7utffFdEq99n1szt3Qr6aThfdQx+vi8XXZUc2nh7QrfoclMTHfczbKwtvtkDKMEk43QXlvOjY0x9O5fJrlnuxwdxRL97CnxUZc64l2RYZG+Y3K8u2Igq+KmwIWtkpvI8ntqrrwGmuRwhs+16E8wnE20kTOm2hBUB4WHi4ZC06jlUSPtjQo9l7aNECTrg4bXC6SK+Kd415L1wIGIC/jINVtg7OfjXcE+KKWzT+kgueAoF5fQiz18n/RqA2SiIqLCc+hhPQAwDxzwC5LW6oI0AjMj2LPLf28P7eQnA8vwSoGyaqyWIxx4aCl5avKIUN6x/0qb995wm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFoyZhPBenXNdPYqomVPZULFX4pYwTjfeMOg9yezwrE=;
 b=aR33PmIdetsyW3NYPmJm1FsEnVrgiRPf2mCb5+vI6GolWBlRx5Nv/zQDP9w/9pNYFkiEMCt7aoQzi1EgxK5SBSIihMF5F38cfgbnFmHYHh8NNnoEJWDzsuvov6G/6BWtKtrZ8dF59MbNl3c5+5ElCrhgGf6z6PJM24hvX9SmxCWphVG3BLu/+2MFT+A0InAKoGx/OMipcZIg/hZdi3Z56Eu90wb1VDipfysr7lblZq56eqV1jW3H1HpSw+b2Wgd/MCvO2m6ggzgDNMKmxNixaWBMZMWpqrkWLmymhvnWwdOOxTP9ymrhNkmjZ29/KdsMsicGQ//8Lb/XPMC9SzuoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFoyZhPBenXNdPYqomVPZULFX4pYwTjfeMOg9yezwrE=;
 b=xY0vtSMg11g9gmElhTPtEH4dkr9z5JWAoVQjQaDXAP3wRKViffkAJPc6MHqPtNO1J2EHMbxZA+oFVbfJKi65N4nTnAKNmyuobYUcGPb/bDNbSE0uwaX1lL4HO31hXYxL5zzh+c8EnZusFbVM48EzSZLBUfXJWqS3cOP/wE062AA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5255.namprd12.prod.outlook.com (2603:10b6:208:315::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 13:26:13 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::1514:9ec7:76dd:568c]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::1514:9ec7:76dd:568c%7]) with mapi id 15.20.4264.021; Fri, 25 Jun 2021
 13:26:13 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Akshay Gupta <Akshay.Gupta@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver bindings
Date:   Fri, 25 Jun 2021 18:55:44 +0530
Message-Id: <20210625132544.18094-3-nchatrad@amd.com>
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
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend Transport; Fri, 25 Jun 2021 13:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ccb2e43-4a56-4328-35bc-08d937dccdba
X-MS-TrafficTypeDiagnostic: BL1PR12MB5255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5255FC52864F43E69BB6FC0DE8069@BL1PR12MB5255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsNNQypyuStPAEQjAgjbF7V4EFrznZMAoaEkTVpYfabTpzH9CPXH43OPZIrh+qwe1bZIhgThQq+1roEuyQuwzPK0ZTiTYJfGOQv2Ouq6aW1GGAmBxTOuWLySuZf2bmNCk3PhpeJmYozHw6vawweIRdCQUAQ5+4Ij4ZjADMpMdiPY1lNDz3eqj9jf2MRvRPkiFLeUVk9QLQEW8GsoFAEHrWPvbjoo4NPKgqxDRNGR3NRqU7CJ3shPJPi2HjE/jARXhVxPm04Wk4/KdBBqlsSoF9JYNhxBhLVwIIfbOp6u7T9Vi7uRXoQhkL7uGf0lqL3BzTl4aaPbROKuBY1Pw57gdwPFGogHPWvHUfwJT45+SY5ZwpX+HU1gDAe/jOxGr2H8KHo/2ZvkitoeXgiLUg4zsJlYlyK/mxskOZE18wsbcKuK0hQ1KqZU6vu9t2l7B5LkDjn321wcF3Pmi1syz7p3kvlpFYOZzPjo5xKnO0PN6rWQ5uBh6i7rkyNc+GZoTwVYI8GsTMDFrYu1cdGstuWMrQeAdDkgy/l3oaFJrZ/9hqRqFSinzRxyF3wmjZ9vEDlwpxz437SkviLJifrMsbBl+bgwYK8gNaz9MmIMtU36wj1IXmWk0wu72To7uCz3R2rITOvg9blaY4Hi4oTE449hyktkAD/XpzGtYS2Xqe6TSEs1ejSWS7c2FbFWJMLOnDZ8YUbG4FwH6TvIQLzCqDoICW1HEl/yubckxN32L2jGYLYeOIWFCm1ri8oH9vfDiNNG6rdQlnLfw9pRfB5HLriSdqpWtKm7z66TY7yQ3AJYcdNbY0QOTNhBTT6APClMQjVQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(1076003)(8676002)(36756003)(54906003)(2616005)(6916009)(956004)(8936002)(4326008)(2906002)(38100700002)(38350700002)(26005)(186003)(7696005)(83380400001)(6666004)(966005)(66946007)(5660300002)(16526019)(66476007)(478600001)(316002)(6486002)(52116002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tIBlfLnNtZBb1gSpJ+1eM3de5A086wyRqlxQ7G6oxyIoJE2iCNzaFo0dmcKI?=
 =?us-ascii?Q?CyMFlA9tcJMt5KJ0+9NLq9P+V93EB5C6iv6s962D9nT5R13NhkJYuXheFm7v?=
 =?us-ascii?Q?9z1hKKD+etSvyeB5IYVVyZaFC53GmP59N2AP8AMHb01i7+BrloSVOPsRYk6v?=
 =?us-ascii?Q?bl5lsnRo9fhquGq+q74B14lmWeriURN535Nk8iebKc5S6wX9GlGtp6b2roEp?=
 =?us-ascii?Q?TanQX0z4nwNB32AEpVuG+0LW1SVNa6bz14jcSplgDTFCTkJSLIzzN9pi0+5V?=
 =?us-ascii?Q?JL00lfjC9+l1PSciSmJHaFJI96kkO8oEyrem86iz+mdhGVa40H2friUBi1ji?=
 =?us-ascii?Q?rXiP97EcO/yUhsFuCUfFmVtvg0n2ub6ydXX2I6j/Ww1QyyLpB87h2lKmGpfU?=
 =?us-ascii?Q?xByiGeq6KOwoTrsls0myEvnc+oc3hSrTlJMXLXu0cw2ULgEmDkt3T7KO7BDV?=
 =?us-ascii?Q?Q3KERZtryAayqLNj9jE/Mx91oOyepPiZ62tA9+hAHQ60SY5O69HTHieBq/Ge?=
 =?us-ascii?Q?pfSB5nyh8+xXmtWm+TJpWPn1tBpif9PZh4wEAKG71FDLDEMMIXEjiv4APi/T?=
 =?us-ascii?Q?5jwcU37WY1CVTXvAiQMd7CwipITqZ4FjEmZrUPQ9Utl+ZjM/+dBnsUFt2R45?=
 =?us-ascii?Q?ZKA0dgN31/vTJsjjozUrGY8CIL5Ed2B4Kpzu5ShcBd4kUaCkbOViTxAaZxMx?=
 =?us-ascii?Q?+T2oCmCElgLHhnwsh8X3DtRv5bHXJWrVTxZuIuVOEoI9kWwAPPGcUb9emQn/?=
 =?us-ascii?Q?qchZAelE3wqNGmlfoPLE9fRuN+AuCtSzp/z52RjqWdPu6BaZopMhszfgNMe8?=
 =?us-ascii?Q?coctECxevShoHWZmTPeTv71SLSn/7HwPDSf3x5VwpxJCvPckFWKdx/xS5HY0?=
 =?us-ascii?Q?4MDYO3vRcJ2tDACWocAJ1mJ17Uq3M4gCk+5vixvnmcgSLic6p5x3N9bLf5uq?=
 =?us-ascii?Q?wqgOXnXp+8EJMKXwjEuYW4SHXbFNHQCz1A2tnoKtFei6YcjjrI+j5XgaIl9m?=
 =?us-ascii?Q?CbUh3xgCuAqSgSayEUw+2+Fq6k1TOFPMeHYCY78VmJaZD/wyY+h12ECQO18+?=
 =?us-ascii?Q?oAPZN6l7OZNYRAouAT5jGalgNoFwInhs2NkqPNkjEO0ugSraKvzOp+oyDdXc?=
 =?us-ascii?Q?TukStxxb2OI16/JwQVfHYp57qhuabTMMmre7GdeHna/Bd+IYVSSulxc4v4w3?=
 =?us-ascii?Q?SLGHem5wKPEph8QUxChpDVn177whiLgqYj7FTBxugoFvAXCKQA0eYsjfH3yZ?=
 =?us-ascii?Q?49whR7RbozvtIBYinU8owoUkjzPdA+eiwWv2FSkBJWTAH4g/DC7G5KZLu51g?=
 =?us-ascii?Q?XOJi37amkAMKPpTLXFASSsOO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccb2e43-4a56-4328-35bc-08d937dccdba
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:26:13.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBZyCZTlpUupren/PqEOz2Xgf0TwZIo9U1gV+pkFjj/I6HtKwHauLNmIsyAyIcJKVFGeswieDt7kztOIyrlR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5255
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Document device tree bindings for AMD SB-RMI emulated service.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
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

