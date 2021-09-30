Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF203C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB5CB615E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348432AbhI3G7x (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 02:59:53 -0400
Received: from mail-eopbgr00135.outbound.protection.outlook.com ([40.107.0.135]:43547
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348428AbhI3G7w (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 02:59:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKPJS/iIpbrkt+o0uY0plNcfGVwqfM1KnrLYeaNBIpZoy8LXq2rw2XXmLclCpiPCokFH+kbAhh88H4jYy8ZoFRcGoFaHIysS/NeWDivoycG2lcv//cIiSGjUh+Ts7NQ4Tus82RDm4RF4AeC7Oam38WBSk+2YJKa0oLmA+fAFyqHgGf51ggAT4MMix6eUfjXUYAPqsHv1MeYCIFjYwwCEa0TH9Lmfx1RFQNmUoPbTWhtkmWeFncDfnDagAgFsrNHp35dv60A1pK5bhGgqlicZm/4UNmOIgTZrOvbs0UakXMxvcE3GM0OzBL187x82F8s5pbRmgLkzim41czEQChHyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JnMgallAEVSahvEuRRsw1xv5Qb1jfBdoRGTH1oFWw4=;
 b=PwwU5SA+oRHI5Vtu9HKhyKLGY5AgbLSfdXX4pvvMg8QG/BfgDtQf/bqlIBnG/GOr4Q4EmwCzpJjaRyaAyGnLhMp76ZvCiS40psss1p8dWmww/mpPuwx4I7IRSpjdKCBIkeI6ZufHwMFLTLxN+/QgxKX5uqwERE6VyXDKKKGX7H0FNraklNO2eOrbAVWA2J1S9mSXLxHoTM7MzkYfX9urD8Hw+gvI3Eh9gF6Q/nIUOE+79TxHJ4nTlaTG6IVuMQWilr016+r5RHCiNVqUw2O74cVmrT9OXgDLkA2tgGb5DYdGpiMW8j70375Hzbk55OL6hyXdkPpqHCHWvFL4SlIk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JnMgallAEVSahvEuRRsw1xv5Qb1jfBdoRGTH1oFWw4=;
 b=G8LmHD01d3gkGSA7ng5HeHsegCtU8Dw4DpcaawcdeJIaJBH9Lg5x/befwr1r+m4x6393Zu3ngxltFkkcS9bN8P8FNRlgkzLSgt+IOraE0OJMBUT5aU08tjmgjH5D5OuYOBEnJBY6aBXLUE5DVqJUeHxxKvNsE7ZzgPhWPyQSCSc=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8079.eurprd07.prod.outlook.com (2603:10a6:10:23b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 30 Sep
 2021 06:58:08 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 06:58:08 +0000
Date:   Thu, 30 Sep 2021 08:57:52 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 01/11] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <4ec773876f9e73c05c1328eb60a95b1197f26909.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend Transport; Thu, 30 Sep 2021 06:58:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9066f5f3-be40-4161-878e-08d983dfa84f
X-MS-TrafficTypeDiagnostic: DU2PR07MB8079:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8079F031A293580A22AB6005EFAA9@DU2PR07MB8079.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23+EKPgj7y9l+D0dHHyWPxgbD5Z73ZALLRkTxqE4RpfeqJY17o1dy3UjFFhvcQO4OXGE9XZSD6xaHWNC5Bvh3UpG0SkWN/108YV/fY9zFhqdLAs7cbp93/lG+Nc0HQOt2UJvy93YOPk0rLG7WGev9TChlrKaRfzjBGb1qHUtCvGgb987Np+6/qTbo/oxNsbUPl60DC0HAq/o/YY9ZS2OpN7Du8/6QeP1LWmoblqK8J5dLJei42hAgmDfwDNJ0qed3DKgsbjxy5oebWfNLHZDqA5V9kt8lGO5KyZ+hnkAH1qk2hJ+eCRi2/guDJhkPCUBl7nTpSSg3I+y+UtTrEauPBw9sfNRHzbprNz2T6lVciSi/HsUyAcBljbKOUuR3RRS+wyZX/RU8bdB3I67YrPFUGERcVWaZ1B8ciRt+cpehR7ne4q/Kwz3tWNGAXz0S0tfcCCPQVhWQMXmthRvgE8mq5exi5Dmr2vGjD63uJS3WtkdkIMxn6TK4qztPY84O0d52jqgQCC+bwo2m6cV+VAgYZPRTGmK7I/V+KfkYDmmBm9WGCfzjSi9bVDAJpnvaPCEVBmTObTp3PVupbJKghuL5ZIrd4UK/9zeen7znDVZlSWx1rnEsrUTkj5en4KVUWB27EslEEodtNVCXTmxY5Ef6pQxCP1Nt/gBfvFU8wUYzM8ar1pAvDqkhGModGlF+e710Ds3Dmq70j96weAq6NA5gsYRO1b7vBSKSNt/MKb2BTkrZDdN4iXYY+SKVnDikuTy3Up90IAu2tUAiJMcec8PKXhvFT5fROt88NjrOXE/yHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(5660300002)(110136005)(8936002)(66556008)(4326008)(8676002)(66476007)(6486002)(66946007)(966005)(508600001)(316002)(6512007)(44832011)(38100700002)(86362001)(6506007)(52116002)(2906002)(186003)(26005)(38350700002)(36756003)(2616005)(956004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6Kf0lVte7CQTduT7+ASvmeqxYmVZK4lJ1IYfj2yMkLGBXJaYjM9IVPvhVK?=
 =?iso-8859-1?Q?vlSJG/BFyMrUUnM01Ev4/Acq4Jk+j1kMixICHoV6z5xKmOJW133uZ7sj9Q?=
 =?iso-8859-1?Q?Ms1x89v+a4/+wtVEPdbGxiAe8KUfzDzawQVJZ7Tj9rEr9n9N08weS/+/pW?=
 =?iso-8859-1?Q?XXTBwA/eGYulfbGnfaDc3D1+i6Qq06wAIfKprx0M5sOi1nWEn6uoWdmULw?=
 =?iso-8859-1?Q?Yc6TcQXPDxF6do7YAX177TlGMZQUsq37NK5T+feQrk8ZDE0hqHfx3HCoFi?=
 =?iso-8859-1?Q?mvijjr2fA/57S31GB1B/x6lv5tGAA7MXYumoARu0Sn9cDyBEyASWUmuii0?=
 =?iso-8859-1?Q?9S1Jyhc3Yf8y2MVKvfWZejfH7iEWrGt7rqwCeEr9KNeF+18+6A0ZEcffGf?=
 =?iso-8859-1?Q?CRP7Q85GI+J1TvGZuVdvRr9rDcMPsZBxMXaCKJTyyQSI8ZGa9aI/omQ39B?=
 =?iso-8859-1?Q?YvrIdKp4p53sKQn3277uDuUeWx1e77RSRvlRUhBrDS5ibBGZ+ISy0h8WTv?=
 =?iso-8859-1?Q?pSxjMKs0I9lJI8LgQIgopLknBK2i842z5QPp8vrN/oYo8nEPRhNuNnQDFm?=
 =?iso-8859-1?Q?ZywEjXDK7cOkFkXfXeI3XJSDcLNSDaziECNKiIOYAgY2vNwqnKrAg/VE+p?=
 =?iso-8859-1?Q?GsLoHT8khvcF+9aSnPKvzoUxJWIdih7ecVFIo0pz3appHUaV/4GKfg+RFw?=
 =?iso-8859-1?Q?tIpiOCVrWO0P1kui9rZnEvAcxOoGAmE6sRS1g2P8uYsXZaOKQwFmvgvdSo?=
 =?iso-8859-1?Q?2+q2bItekR3jE8aLhEuTt+fO+aFivOriCO/vm+56W4eLQ6Y1f8C0Clam38?=
 =?iso-8859-1?Q?WlcmOFtAdV1m5vbnGwO0yQa64UFUpogJaUEzK+3wCOha46l5r5XyLHzmPP?=
 =?iso-8859-1?Q?51IPfuqAqS1t6SdMPV0rfbngXa8fVlN7pObovXYAGoH3kxlZoZ0GHeoaPB?=
 =?iso-8859-1?Q?bCFQOhSdOj5WEY3CL2OMVpL6TWZ3mrm88vXdIusIgxRwnwDDea+KVkXycR?=
 =?iso-8859-1?Q?f+bIRFeH0A/LnwcUQUgr4T6ACvrN82rSqOyEgCsgGQeWp0EhG+NhdMloom?=
 =?iso-8859-1?Q?+weI3cCDASpeyZqkfq11OM861Q38JkzM7XSLGSdpMZ6M0YYWk1SO1BPH04?=
 =?iso-8859-1?Q?IO+xIsWdfLefjw+CGQSj8l2Idcx62p9FljPAfIx46Z0h8nk4gTT4PUHLgc?=
 =?iso-8859-1?Q?5/ifdVK5UU1DVfjDUE7Pu7j/uRAt8VRpNmBkIu4QQ+FknUmJCtOF+LPDNz?=
 =?iso-8859-1?Q?U0q4BIiVY6ilcywHdSEzlraWjyVi5HDNWy/ITNm2ykNbz+rygJMl8dFuhI?=
 =?iso-8859-1?Q?2EcuIeGntapY/KXGOIU1T+XysQgaPRbvfZ48+XCZwLMaAa6n+vg7PVCTGD?=
 =?iso-8859-1?Q?T9cskmWNEL?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9066f5f3-be40-4161-878e-08d983dfa84f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 06:58:08.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CduSA9HRtNrrKv/WcpwAw85FXEOb/OCKxk6frBoF8djzGGw9J8RpxgBywIjYmcR8OO6bTtzTt1DK4/Bg7rEEybuCs0DkPze9ckATjiMX89A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8079
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

