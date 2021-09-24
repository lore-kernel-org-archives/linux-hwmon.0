Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC099C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8308560FDC
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244969AbhIXJkb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:40:31 -0400
Received: from mail-db8eur05on2131.outbound.protection.outlook.com ([40.107.20.131]:9711
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237056AbhIXJka (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:40:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9AwUFlikWOTXkt0LakycivDmOvP6hoKyiW/eqSXqi8KMzJcLEMfkeRP3ft0BzaddOh6geZZOWDhiQdbnncSMXnc7oHQuwiWe3O6NK4x3uj0kOv6IuRgCcJX6H0oZpQfP3AwR1zklV+sBAMH9oSO5Bq4Ii/nRb3jAjkne5WNQ/US2nggKfNWXAebYeUkmWLjJXTYYm57eAPO5Xyx1a+zXzhsmkS8tpQSRRdj2Fi+efV6bH2f3DM51njkRPGBpi1mMIi6wb621JJMPQtI0M+8QfUbvaJoF8qR3LU1QxBjAoVFFaSm+6R0mlIuXIFEOpyLw8CHz6oIn+zW0OKMDjurAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgrZ27t6yCBa3z1BU4tBB9AgDEl3t76umfJRGTrZR5s=;
 b=P90v3Qu8sQzn90yPb21n++VVLDpRE5Q/iXWSybW0FAR9Q4rNgcuPss08ytTgmea/VwE7MVtt4aj6mSVpRxwxV0LrO4f4QN4H0ptiVXzqC0HxhMwL0dqhVd0lF1HojtCJxP5Kbzn2giMiPXItZ7OwlVyIcpCoCsmTnElJBYbbqjB6PQDJ2e4G9Xi3eDxDY4NEO/sttjqSxEWKSLxr2KvkasPmAl+AxcExwPXjEgu+SwBB3ug7MbsdaSABSV5w3W3+B46gSi64I2jF+CjeS+pnsiy83CB+Om6Nrh+UX8TRwWHGIAFUrLfSu601K3jJospMKE+UbV/9iLvCGif9Uv///g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgrZ27t6yCBa3z1BU4tBB9AgDEl3t76umfJRGTrZR5s=;
 b=ZeFYGYMoEigJhCG8I1KYAsQV+nCZ75nyJnGmLThodHLEzf3f3MyVy4NHUTEjNZ4TXSfzGnc77vYPgoQaw1ElAWE7NoxB/wdYT3TeiTo6qwaclu07GLLkpdBKYDBW6ULENj1j406hsHRt9x7X2oKmKslxwV4MPNTJexNxUaVp+e4=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8111.eurprd07.prod.outlook.com (2603:10a6:10:270::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 24 Sep
 2021 09:38:56 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:38:56 +0000
Date:   Fri, 24 Sep 2021 11:38:50 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 01/10] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <cad7ca2084491b58d7f5d72e43f9b6dc9ec0fd69.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0160.eurprd05.prod.outlook.com
 (2603:10a6:7:28::47) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0160.eurprd05.prod.outlook.com (2603:10a6:7:28::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:38:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf4f5be5-df31-44b4-0dca-08d97f3f20b3
X-MS-TrafficTypeDiagnostic: DU2PR07MB8111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB811122A06E38160C62BD1E95EFA49@DU2PR07MB8111.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jd44doWOWsoQ/nHHsiNIpIJDi9qp7MActyPYElpz5sOARfaXw96wkjEGkCpwuPyembWoD5KiX+76zMvxuc7sSTAqpomLhrKUSE/0zztDF+XKFaOeg/mMwYRP0kiCv6VB/ldKbUtIxJ+JrZR/w/vQ1AEU3/1U+skP75fG+1SfK2L30iV/WbgzMBZ55Y5FwHGu12m7U1hz2T8xzwt8QuEfiCKOBruC1XjgOSu/i5zHu3a8K8f8o/z7aiyY/5nu1jn8YjqRhiUBwdGjaT/wueJXLRojgoHhDvTz8//bzGUgJr2x0xBRcV/3MOJ5jS24oJYrKxnSjrqeldyGaE5ds03BjJBpBhpC+PlDZ4xo8Hmf2iWYHUwKZnQB9yF5k+8FhkslJa2lOrZ4/8GVxAlByBBCQ9JUGy7EDr3agf2FThhZe8ieGmo6xfky1sDo/v5zJK2gN/11hhOP5CImnzdx12RMLSgTwgGRr2kkDSJTnocmk9Mo0jECAk3efd6ydq/q8Fp0HUJeruWOHdEuPhOQDnDXRXG5x6JMHxkuI18ih9p6Ob/GTjTxrLCW6s9ylsKq5ruHT631vi8tW9kVK/8gt4o727jRZyLI8qX5tgOJF9DxB8ioQ88voCAHBNoo6XF5BeC7X233iPNEcary8nK1gJQDVgjmEtvDOsykFCmiFVXurivqerJYHXAxiUHCNWQ04kLPh6RBbewVxVv6vNFBCD74gdYOvPY+9G7hfFAkBO7+Eq9RyR16MyUHRuExFlAhEbrRqk2bBrRpQghuRwuPRd1evu+YhcRGI62Nf8qzI9JpjRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(6666004)(38350700002)(8936002)(36756003)(6512007)(5660300002)(66556008)(86362001)(956004)(966005)(186003)(316002)(6506007)(4326008)(44832011)(110136005)(26005)(66476007)(52116002)(38100700002)(54906003)(2906002)(6486002)(508600001)(2616005)(8676002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iRPgCKdXpJHAqmCNSbq6CsuU4z4AO1PgGxF8o8sYaeZabfLXUotdA12kt/?=
 =?iso-8859-1?Q?v2TmQwC23f5QMF8sPM6ORaaYWVYYu15hRnltN22WNYZ/1jiPPYTuFUFoEP?=
 =?iso-8859-1?Q?bB4V1304Y/wY4yfYS43iXFniqZk+gmLTNvteh52OVxTuUsWxxPeYm/utXn?=
 =?iso-8859-1?Q?HdlkQi1ojgmggcaJXTKN+qZArQtkz2J1RV3I0FlW+pR/p3OdBKjI/FjfMF?=
 =?iso-8859-1?Q?CD0It90eCnDdZwuqsutO+DxL+iggCRcpE9Pr4wbp4jzMPbYF03iduHjFhq?=
 =?iso-8859-1?Q?b5DHAlUvpSxdcO9HBC8voF6q793UB+xdJfK5tcEen9rLB4/SXhezajtASq?=
 =?iso-8859-1?Q?VmooXHV4YwDbaAugtEuONz+vX3a5YeqOoKULYmDrPIQ26D3vG7dIsVkt36?=
 =?iso-8859-1?Q?14wmKLCvrkkuBKWZGtXHf3VZVgJ2Eblv+qkptqRs+5e0WDBhfRhtDoxQYp?=
 =?iso-8859-1?Q?PuHh0cvg6BprfSUiQAICEHoGbR4PmocXE7OCK/ySulzAVLtImFSKSb31J2?=
 =?iso-8859-1?Q?rG2pVeR2gxAc8VkQiuleQoRyheKYGvNE10xkeFtUnIpQEW3O1GGk/XzCQx?=
 =?iso-8859-1?Q?sArwGnvD1pseClbJdLkV0r80lpdLgLSnyNdGTaHRQ3v9SsOhbKrAq53Gir?=
 =?iso-8859-1?Q?BP+qEJBL26TGf/59CdBwgW6EHVNynZGF5OgnFf6BtEK+nGJ/P7cyOzCeeL?=
 =?iso-8859-1?Q?qhdqvRWg1+21s0NKxCDGmIlV82fMjSDRQSc9jjirEqXvtplJsEtX7dIw4y?=
 =?iso-8859-1?Q?4GlOocw7rs+pUbrQq2/pXxB73au+YfXUaiyRGm/KMFesaS2ljd9xEtoKo4?=
 =?iso-8859-1?Q?+gWuaO8mUuK+7hUpJf11Yus3TIH/h4JcPqS9WuezQx0d9IgwMuWRHLkwYF?=
 =?iso-8859-1?Q?l1A4mkJwmCdCEyrNavE9uC1dKUzM77noqcozX1hTuk232w1OOKkwzFFpIt?=
 =?iso-8859-1?Q?RUceQaHWzdyNURpqjk+OedsCyiA93LNgM7o3ChgrJqV+BffBoMo6Crauk/?=
 =?iso-8859-1?Q?X6nIsFR9dA+mn3Lh4UaiOowQZaqsypfkrcPlF7gbi96ek9UEimPMyZ2yVx?=
 =?iso-8859-1?Q?CnKVAB+1AWr08mxoaSw7bg6hS6AH1+oiZZ2ygkcHpWT9ynZS9UOqPcW0kJ?=
 =?iso-8859-1?Q?7vpSE8Xxcsr/5XN9wZwyMDx50v52RPPaIxbMvg7BYrhzfy9PPOVDFpnqrU?=
 =?iso-8859-1?Q?Z9eDwbABBg4qXO46na+w57aXpJWe1VcgHDOfC+/memoVbymas1YLU6riaD?=
 =?iso-8859-1?Q?xbF4bDjhUkumDYNq9SMbi9bwoIarsgve+axS+bmQ7CjuYr2V89jeqN3C3B?=
 =?iso-8859-1?Q?DwlrsDd3RKOtCJe3Ar7RzU/yM1cf9dIjDuevHWCv025AJqObv7zk5Wmzq1?=
 =?iso-8859-1?Q?UHxH0RInqg?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4f5be5-df31-44b4-0dca-08d97f3f20b3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:38:56.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mle6c0024CjrLTqUEMKUJnVJI75VVSONkOd/uvAXPkuFR2tfRw6ICtzY7H3ElxVZrvOlgfzdjmaECpFNZBM59vAhKuGxHiq6QDSomNM8bx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8111
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
index 000000000000..53940e146ee6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
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

