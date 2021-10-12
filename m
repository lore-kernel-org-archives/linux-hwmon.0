Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3997C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:15:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8101061056
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbhJLJRE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:17:04 -0400
Received: from mail-eopbgr70120.outbound.protection.outlook.com ([40.107.7.120]:52964
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235009AbhJLJRD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:17:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KML+xvdODsnpPCi7y4YolmAqm3XMNWq53VeKdUAYHbuGfQNc6CaqM9ZVfqtKN0/G8nB8cw0Wdz+VTzu0qSHyqO2JURgzNvF9CX7ep8YxLval6W+4BeKhu7UyGp4MHSWw9gxY01+4C1dIPye4YUEKsY6M/t7XXqxowgpCCQ+xktG2HKcXWt3oWy7eTbH13qp/xB+dvjF1Lqdj8fwqb8Mmpmf/I8Tovg8gzABiTibAR03NhS66iQpGjWnec8KQCcZFUFVRyhy2y2XEkLA1GX/tAQ3IQsgyeOXJtYZ9+HVafdgM0FZ2Pp6vRS51iGVyscc65/IeKIeKkUCtkWZXkKtp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JnMgallAEVSahvEuRRsw1xv5Qb1jfBdoRGTH1oFWw4=;
 b=Pu7+F4vi3pAWelYb7Iu7/lCCKDjSm3WIZT/jsxCI0ku9236D5vmtIF9iVUj9vlOD0h5H0oZ/kF6mV759oiaGo2XjaqaK6U4HCAv3VylrkymvQ+M2nKRsOnfQl/y5gIpMbfosiIliBhzhT8AQ9UvMU0XY3wbm2X31EHQj/BLKaK3oZyafYXTSnQ+skbGwOsF0Ql0C9goRe8jUAL2FQxbAotvf2FMAEzhWfHfSB/dq9kJt/xMWlPT68mG95HSs7K43ktg2eHgb5cg47jUfFiu4iQQGzd7QFZKB/WB1kGWjDWm9uUQkkfevFZKNZn0PiNNBOc4CTDmJ/ToG0DrP52g6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JnMgallAEVSahvEuRRsw1xv5Qb1jfBdoRGTH1oFWw4=;
 b=o/B4HeUW6DqtMg8MTLVxBVk4LmWVEIUIl/kOfuKNIJg7G7AQWIDqvxQAgOkZn2NnHDeAujUVBVe+hwq9WvtqIBdd6p2psaLiDT2cRtE/Jk9SG5Qa9hY6wCsM70Ik5txUA2OT9+ch5GxvYN+CQK1dyomgeiyCtSH8VwPWhTkPEZ0=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8167.eurprd07.prod.outlook.com (2603:10a6:20b:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.5; Tue, 12 Oct
 2021 09:15:00 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:15:00 +0000
Date:   Tue, 12 Oct 2021 11:14:55 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 01/10] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <f974cc2d02d6c1e550e457e7be5e081c219cb81f.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::20) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0007.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend Transport; Tue, 12 Oct 2021 09:14:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7338df93-c66d-417a-d6ba-08d98d60c40f
X-MS-TrafficTypeDiagnostic: AS8PR07MB8167:
X-Microsoft-Antispam-PRVS: <AS8PR07MB81675D407FF723C602FBECBFEFB69@AS8PR07MB8167.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJ/1zclku68On4vvrmgmri5QgAok9HV7YWmxirVDdrcuP+EWNYBmFwFeLWyMsYSQqLNOs619SChl9LS4t+yu6x29kgfqOR+ZwRkCaKCL3Cw6ZjNgI3kwmnaJTkq72gPpZAZWTtgCb5yW09KoCmG2PlZc0+s6hY3ZzfBgg3+cow+n9IPBpWwrTepvEtLBQaiPwFrrbD3jpHlYjptHkHO+lEYfipr60vRm/UPW6eggAABVdckRVBnyQQ2c1i6JBdQ3s8iptJ+V6dvyBtoVLrDIL7m9qvhOMhsIzY9/o9zztrPEQwJpgnfEfRMpDoEzEKqIRGZCnwj+htQ+X30p2nYDQOoNKbJUaKIol3tyt7nhZ4iz3jiumSkh00dH+yCJ++cJ3vQNxRlr5aJrYuH2M1PCYW3Ai+JjJ1lsJkCQB2Fmt4EJ7HJaumUpMGOqIoqOCACeCxrelk9yPxCMLgRq/uyhIOWA8GnHTVen6TjauWMR5OdiyJ66d2XWAz9UCeByxU/ChbFl2HoohyBG1LQObTL42lF+lvbzcR8/gCAzeYtYRDB/5eqZum9wME/dio8byV8kC8fieFK9xg/eiv/sFTvsfKNIEJAgMXlGCiq/Jgwl/melhK0Wl43CJ3IEqqPQvLescIht3k/MXuQIGg+fF78czrNyHV5yKqvjnWr8zfdfRum2/JUg+zBIo9NPNOHeCaA2Sajo6OXHG0taYzXMHQ1vxUYEXAhaZDW1lsV/s2TwaNJyJ4NHrUnLVDZZNmyYFiz4Ff+dlWPt5GPAKvSODg1deiHK8RMNXjzUZINApVRRvQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(508600001)(4326008)(6486002)(6666004)(38100700002)(86362001)(2906002)(26005)(186003)(8676002)(6506007)(6512007)(966005)(110136005)(52116002)(956004)(5660300002)(36756003)(66556008)(44832011)(8936002)(66476007)(66946007)(2616005)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yXGdqP613zT1kTQ0B6SRBYJ88Hd6uvKSwL9O6VH5zftJvJFJ9Oth/0HpCf?=
 =?iso-8859-1?Q?XNYHQtNU3SJK/KHJSeBiFD09/xTU/HmI26ydgs/3QNXQSQ9V6vro/2hel5?=
 =?iso-8859-1?Q?QvnShQqLYY8WUO8BMXv5X7TykNXnC/Ws8sMV28AOGzZgD7kB2tv2nkqM7w?=
 =?iso-8859-1?Q?5QTW1Ipl5p07IiETov95u+UYo104CRKV+X8IZxVlyhTTuTqDTwbVZgfWbJ?=
 =?iso-8859-1?Q?JaVqQUGqyeQ6QHvDF/q+YTr8sQT68sgVC011tSutBFj1HvgHF8CL6GqWru?=
 =?iso-8859-1?Q?2LOnVC5MIeJvncDUNJn84VIT90LHLWtoEYfEvZv2SuV9AmgutagyA3Tfat?=
 =?iso-8859-1?Q?9RRVTwTOLrDMhvEbfiKiwVJaP0tHzKoEtoJIHiiU/+0VeObopDAYDEcAX3?=
 =?iso-8859-1?Q?dSGKG7QwNoQlzZ2bKPQuuoOeaYJxJkSyTDL9sheXCFIZnC2SzvgD4h4gx/?=
 =?iso-8859-1?Q?cujTG1Cqd3wXUuEJ9p6ekshfaYBR40spCr1hlU2GdK9OlY5GTAPq64a/Mv?=
 =?iso-8859-1?Q?tZA5unqCXlGYzZC11siiVSTdwgH8zUfZzvEHvTBh1zg4ytofE7ecEa+Xec?=
 =?iso-8859-1?Q?PlwL4d87wBdtk5779gw/QkvEzUj5741vjACFWPtCSXnS+BAz01L5DTrLiI?=
 =?iso-8859-1?Q?SIQAsrgnDkQUdzGcgmbrU//jhHFc5PWroKgmhIqqVKkWa2nXOe1F1ASwzD?=
 =?iso-8859-1?Q?JhzKL/NfNtAL3Sbl1UrYYl1gW7io4Q0q3pX74CW9lJuIWQTckQFzuXJz/N?=
 =?iso-8859-1?Q?I9haRlmhCuAUGgjeOjOV6VlgCkW9zDiQQ3qVhL+E6SEPcbDiLuY4J1Ri/5?=
 =?iso-8859-1?Q?yuHVDNkpDUE+OpqRWi1xy7lj7NOLC7FdwoQ22tQUb/sb6KNco1nhG0wChZ?=
 =?iso-8859-1?Q?co5FsfABf1PclAzU7qnveRkno0l9RMO6Fi+t90eRO/WrJbLazvxI5tWJHd?=
 =?iso-8859-1?Q?WrXFUixt2UJxGe6M+3AkENNP3G/Hht1Y1qLbjWRxyc7Nlcs/qdn6v39CsJ?=
 =?iso-8859-1?Q?H+rCS5NxdbFpDaa8Jv8ylBUpq4LiDDaKMm/npdijkYnHGiBGwNHcCy684D?=
 =?iso-8859-1?Q?mMGhVLVVlOdZekLXh47ZlMozp8Pefg/Vk257TaQiFIQMNxyNONcpotOMIW?=
 =?iso-8859-1?Q?lemn9gKWvgOt3f6YaDQuFwgXnmcap1eTGvjL1hDiCY76b66B8gbWJO8XZV?=
 =?iso-8859-1?Q?9kUBxOuc63x+7bwPgEmGZZjiLr/k/7e+/yrp1lG9HwKpnFt4mNawaCE4+X?=
 =?iso-8859-1?Q?OX9CVkqNPSmzH2FZ6yNJAXWl1p5Z7pKuJ1BtnnxFqWNC2Iy96TWiMneyvH?=
 =?iso-8859-1?Q?8ScApc4+COST83WaLnUpSHOax9Yf5e8dcdW6kSX4H2nchd4ZpxY4OAcXzv?=
 =?iso-8859-1?Q?V1e+REzYI2?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7338df93-c66d-417a-d6ba-08d98d60c40f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:15:00.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wg3ZnRMycaeySZWtZoWDGoJa/2kGvB1uCzXNm6TxNSZNKBZ9he0Q4LY7CeHibbi1SfrDzViR4hL0mBd/7m+634ZxtlHQpmxMmUd0E7nDFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8167
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add basic description of the tmp421 driver DT bindings.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
new file mode 100644
index 000000000000..47040ace4f73
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,tmp421.yaml#
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

