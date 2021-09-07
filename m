Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65401C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49A1A610FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344772AbhIGNni (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:43:38 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com ([40.107.8.91]:29734
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344667AbhIGNni (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:43:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SASuh5fvENbReTL0T3w3/H/No05KLRGH/pqGzyIM8M17PiVwxunLQJshBUM6xbJeh6Po7q/aN5XcmF9e0wJNZLOUnFy41ilzovBqrSXBV1GnVUnxct4SNt1kSo52ormoVtKgJ2Y5Whh44IzKMBifDzR2Sll9fGu5qr1pAMhd/IBM/EGZYlmt9FaHY7xPKtGg4hmgIbfBjDefYfhPzbZrZ0cq0LGu1LAzajnRDrbIRvp0CmgknYLWdysIMtgUCkaeJCzKbT0agh9Pxf+Tr3/Rmso0aEiiLXruCjNLHxE6Un8b/DaTM9AeBgosYGnxTatgtQD/WWiUzoBWpgwrvl5RrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+stPsjZi9lzZmkF8ntKLZfNauWSfzcoK5fPmguFMGVM=;
 b=E09m6fw91QLSmTNtlIUCA79qaQde4XBz/KLQ4Uz5JfHm4SiWOXtfXTY9EjusbM1m+88gYlIz/uFMbvEg7XS0bJ32sbmzyg9ecmNinFSFm1Ylzfw7cchoWwYWN0YxpqBU3QeXGEfPkwOfCwAyQjFQnklzEg34OdiDpBRwfQ8lDYEmAQ6TOD4+NkS1gbxNY5QQx1Ms2fKIIpInD1wVbgdroNtJWYcFWan0y0ECP3zNfBNuJNoFjnZDsbut9sT2KFAxrN9GLUuKA6KiTDW6fRgJEL3IRCEc6TS7GpXsoTVmyCkA3nQ//oOFB8gTXwx/SvRKbclQHLUcjS8+wIGcUPqFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+stPsjZi9lzZmkF8ntKLZfNauWSfzcoK5fPmguFMGVM=;
 b=oSFbigA52jvGzGrZF6oZ7aD4HEcnrLVL2mSp52Mrp72SACHxdAQCMIh/2et60QHnXWcNQ0U9uBGlU+8+y+qEG9G7O6qe8gUOrhnqz2WzbJ6KEw1etmkgTbJaXBRKRvdrz0kMFlsb0oOR6ykucgpuAein2e2gzS9jK/FGZoKLoNA=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8127.eurprd07.prod.outlook.com (2603:10a6:10:270::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 7 Sep
 2021 13:42:30 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:42:30 +0000
Date:   Tue, 7 Sep 2021 15:42:24 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <08a5f07c635ec09a0852ba5e2c7332c4d8794798.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::26) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 13:42:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3928ac1-d6ba-43df-9b4e-08d972055606
X-MS-TrafficTypeDiagnostic: DU2PR07MB8127:
X-Microsoft-Antispam-PRVS: <DU2PR07MB81272220FF8917CAA942CD52EFD39@DU2PR07MB8127.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KBwvB4z+kzwqyN5R3A5a9SyMQsZrdV4Vw3hCt5SNXKf1n4HWisnD68BrtlX1d6XQwmlmC++lD5Qll5sEbCb8PCVGgUW7wIy0/jRaZro90rUw4tzLxj+Z6l6ONUAb4qnpB+jvLegsbdsoTj4CLFurv+EWOY7pn75hUlUZGqXxg7yoeNcW8jWJHPi/jRETIrtgwXpXuUxCYpOALBlaau1jXfnJy/DuONEKnLS2q8Inb53jNfB5nD3wSoDJfwlb/9VSs865Hn+RBVrSRt5d3Zbu0i2ukwrgj9/u3G4qiYD0kl88p8GxjCD9JYLjP6/HoBrvL9IFF0nQALsIMhWf3b4s6luUP6Ppm2XiE9L6bGa8YBZv0n+NNmqOZ34tfN4K8vtl3pR0dWJdYXXFbT48SoyiGY0/DUXmEwafHyQ5WlLVUbYwSjn15jFa5kYHle+/4rJg26qxmCZAICcfKIr5pRmMlnmvBlRAYxCYUtdXWPEQapqaLfFUAvfRaBcIYvA2KEKGzgjfpjI34wbcSvYCVz84bsKOzrHnTkUiHLaQgDpRLBVX7I+kG9+8tPSQtxUY6gmej07gj+rNO2qizg0n6Vbyb94iY6kurgEONaHAkU8yVcw81M/c9ABUiG7tFwTVB2ek4AZUpwmmThONLNRk88LAfgM/W9m1H7uvqWZDfhmEEvJUQOtyvAgCusz15M8Zjyxwsn7BFU23IBf/9MlIJUa12I4p3DtMYrPA/dp8I7XmZxHaA/ObguWWfcLCmKEZAIR/q55cyv4wfAlNtnvlJQo5MlaPfh2QA1M/Jxe7jWU4ZFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(956004)(8936002)(26005)(2906002)(6506007)(66476007)(66946007)(8676002)(4326008)(38100700002)(316002)(38350700002)(86362001)(36756003)(52116002)(966005)(508600001)(2616005)(66556008)(6486002)(110136005)(6512007)(44832011)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?InC4Ynm3+m6nwYjvpcluWHh38K0O81RzhCTGbDTlAOwp6hkF6HwMAwQpfS?=
 =?iso-8859-1?Q?fOI3vLDESSvKDU1nwUnmAlXyGMjhqB3WwrBhbw5sk/WgB0EowYfWHTLkyx?=
 =?iso-8859-1?Q?38LXocKrfsnV9S2wwXVH5vHVEUvnsDVuP/E+0CMX/t0juhhYS4ZW3xeEt4?=
 =?iso-8859-1?Q?Ng6R6obN+Ln+LaUmwgF8q/gFe9ehxuL8pHTQ/15uRPUiG4pkXW0c8wlLr9?=
 =?iso-8859-1?Q?ZTqjMbiuvcUwhCj2kGDXD0Tbpt2Kdchg3rv0J4DdVORCM/Bka9y+v1tQMV?=
 =?iso-8859-1?Q?WmoaNpv4GW0t7aI7DfWxrn/Rg+dkrhTTqos7Cs2S7I5K3LTCq3eteLn+e1?=
 =?iso-8859-1?Q?aCok7SsZY4IGBvh6lnsreDfao/wzSIOwDSDtTFqqVw+hAbCExryK7YIgrn?=
 =?iso-8859-1?Q?uSSMOAQw6DJSywUPOzfS66hmgcpMeRwuy0G1AaJkBK/qpUUPp0gdfSS1Ic?=
 =?iso-8859-1?Q?+lxQq21kPU+DFAXIO0jDajD7Q0WF6vhFuSbQA6o9aGJvUD662iMVCKHdOq?=
 =?iso-8859-1?Q?+9jsGRjPFXC0lEhMJzrV9LNV4j5GrUDO1l0TVMA3Ra9RbDe6V86O9RZM1h?=
 =?iso-8859-1?Q?3juaH4JyMRcLKDnK+8y6/GjvMWoCLKvAHx+u7E86wUY9hv1z4219VRTKuj?=
 =?iso-8859-1?Q?rUJPiieDzPlvJK6pXUNraOeoe9butoTgCHrqSUnsDGYJFYlubq7JIgB2iE?=
 =?iso-8859-1?Q?BtDIuScat//BgiS5dzERkxe5AYPWw5Izx5GN0vlQRaQrduwGEZcnlj82ya?=
 =?iso-8859-1?Q?RpcQc8Q3bwzqkIaeXshGS7/gYiPJ8wXnPV0bKOuBd0xRkmtTXB2nOo4V3w?=
 =?iso-8859-1?Q?/rRZOC73UBZqR8gTGdbtJUx6PonVw/lUkDASUU8FYWY7Rtxr/+fzbIzBXO?=
 =?iso-8859-1?Q?yY+1PGponxzeDXy/MfrpO/qd7vDWlNVuFCIAPyZYsVNxFtIQM7eLTutES6?=
 =?iso-8859-1?Q?H4IlyodYTuSG1ivCRB+2yLTmN+ol7kkhUov6hQjYx06VVppVknnpJREJ9U?=
 =?iso-8859-1?Q?WLX31x3p4lL81W9PxJhmHYTsDxFj74Z6X3zFE9Uc6cGtz3/xOiPYikmVvB?=
 =?iso-8859-1?Q?reM0NQj2uJfgoZerPF0crv3ADrcMUUPMuj1hZPn9VgxIzIPi/2LRQfiHQ8?=
 =?iso-8859-1?Q?pYDqGb+xpd3gyCZ4COO8rgNCj6CqsDRWo6wTtIiPwtQdMnRgWIr927LG3P?=
 =?iso-8859-1?Q?84R6grzPcXrRH0sQZtAlaSTK1F3Jh8icIKj7cd72kiuEyLSp6ucn15PLzI?=
 =?iso-8859-1?Q?3t1XYiFMDwyR9XlJYze1Iuyn2unD1ustSC5BfwsrcsnrpN905ukfRw5uI8?=
 =?iso-8859-1?Q?SkUpYqT38gZfM5W/3dn+YKzWJUNBdLxWKQZX3k0V136LS8L4KvC0DLs160?=
 =?iso-8859-1?Q?K0SAQu8kNb?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3928ac1-d6ba-43df-9b4e-08d972055606
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:42:29.9077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMYAFne4MsQo+Yonbgsln+bP5bTQ5gCWu/9GLtuXvGADFShtetw6ma1wyZG84i7/HsdbmOfwU+WNRAPDvKimN/ltrvP76cI+R6RldU+Oyps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8127
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add basic description of the tmp421 driver DT bindings.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 .../devicetree/bindings/hwmon/tmp421.yaml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp421.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/tmp421.yaml b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
new file mode 100644
index 000000000000..53940e146ee6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/tmp421.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMP42x/TMP44x temperature sensor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  ±1°C Remote and Local temperature sensor
+  https://www.ti.com/lit/ds/symlink/tmp422.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,tmp421
+      - ti,tmp422
+      - ti,tmp423
+      - ti,tmp441
+      - ti,tmp442
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@4c {
+        compatible = "ti,tmp422";
+        reg = <0x4c>;
+      };
+    };
-- 
2.31.1

