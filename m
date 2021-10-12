Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78DBC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 788FD61056
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbhJLJcx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:32:53 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com ([40.107.3.98]:29326
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJcu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:32:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaUWFMUEhkY04EOB8vkDVhB2llm15oo0zPCMhPj/4NS5wrgWus5RMBTVeSgmm4Ep29cFviN7jMlDXS/9McF3v0hShuN5IvjXdJjBlZbuqIEsJuB8Ms0fD6az+J7YWqBxan98/9gaeQXk1Ud1hLi3/RmQNiyoOAw947VGmBuUTQXVL/Roo00gZyh+7ojfmm+941SkWlr0EtTHMGjkJMq7bMkr/GPr97pOOCO63CCEp+I69DnaWwcRjCaBJ7wTQ3i2INIfIOXfXz1gDY6hGZy4cp8j+9VwRvU9FxjMVR2Qs4Bn2gnlZiUxKInR/Eu9ZPEnQ/b7LdZoV1ghhEh6ObEOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HW7MvCvkbWKARFWbaqT5XpatFvbmhHgkUkm9/u5nTI=;
 b=DpdrnCQFHKtY8RjsgUCZibhFjtLBA5D6Fm+5tUsnVqemnyCqb4kgyertqU6ntJ94bjJNIZ5SNeRTZc2UbhSSKQUcFORF0h+AYmx12JOpxFKnBpLclbsc/wK/Bp7OEeKUuEq8kHCarkP7sdPtxeKUhystOInbnxEfSJEVEc+DDBdIYV8OnzmSC0PNMyIBPr+LmqJ1gXQor99SR23CRvq+G9JDDOrqSqusJwZXa6Jf1HKt8FS7H6FXNRNc0UET5x9Yul+3b4Vc+hXGZyGMxl24pxWZM5QuXHBYtPcpOhW6OklV/dzGEADF/PhqeEEckjXqkKn+b38WINKVzFnuPUw3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HW7MvCvkbWKARFWbaqT5XpatFvbmhHgkUkm9/u5nTI=;
 b=qG2rfPbtVICNS3VBSzfDQJ9KQNoxMeHLBNn0u+dWCns51xrKLDo3Sjoyb2Pvsv8F8VIGzDo9SojRuCu/BKahGfGU+3zqbQ/kZiMwmIOvBeBqA+dCHAn0uJ+dPDZSW+ig4idzpJ3tLHnQrI/atKfC7hDM8oTyH5I9ZiD5siGv9ik=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8328.eurprd07.prod.outlook.com (2603:10a6:20b:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Tue, 12 Oct
 2021 09:30:48 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:30:48 +0000
Date:   Tue, 12 Oct 2021 11:30:43 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 10/10] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <88fcceedd14b9411209e9c70b10540832aa97da3.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::24) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0011.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 09:30:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50d9bcec-56fa-498f-8c10-08d98d62f955
X-MS-TrafficTypeDiagnostic: AS8PR07MB8328:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8328C07B39D1D530C88B5D18EFB69@AS8PR07MB8328.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7H99n4DNInxvZUL8nSW7HfipW+QZaRLRLcj4kC280yd5P7f8lbbPVZsHwO8KxyCILIlpWvby1dfHSYogxEkaFPwf6HzIxbo/gJgt2Yi5qBbvRCPNcPrkwdg3Irdx7Orz9cmpP8M+24qBzSVPHvmyS99Ie8QTALOrFROae3tcD3GD5zopDP9At2J2boNc+uHOUKGGZJqD2UgNSovzf+nbcaA5uvI2UR70d4V9w2UcHNvX8OfUrwhuVpwCcgtuTLlUNNjmivKd6BVqouajS5hvA31jBjQmWc5DPslfzc/12DNBVDUSWZbYpDyCrKVUvko7APSxDinjWteRBQdb8vzz1rdOUPPHjGRzn/CGrTMq7AAtZXqrfAKymTfBNb/2WNStFcLzf1ugLN7BijiSaHYiGATjUG1qnJLgJwOtBdvo9+mPJfzYIfO6w8sDhdrzg9J7quB9UOPDEmWMe/guqGH7HlcmQ72Z69mp3YA+mAsj7w1vvHgXgU589WHl/70CGRIrv2AO9o8MJmLFCHby0brGeIZ5T5g31CiPuiILrOxyXoNe3IkaQC8Y6vXNxOvo9iZy9Hc19s6//fvJzV7bqzb1ZnFSBEj8pIACaYV+Q7xgbEtrJ2RTsEtKPnVsXm0+SswkKpRTr9cyNJXF7jVjrm+ez/D/M2y3xOjPggKjJPFhjffyFhbkZrdllpOtjasCbkZY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38350700002)(186003)(26005)(956004)(316002)(110136005)(66556008)(83380400001)(38100700002)(6506007)(2616005)(4326008)(6486002)(6512007)(2906002)(8936002)(8676002)(44832011)(5660300002)(508600001)(52116002)(66946007)(86362001)(6666004)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fhnmh5mGzn8l75UIHjAO0N99Eo43mBiFFjpgygS4/sGjwtjfLyICNifqhWnM?=
 =?us-ascii?Q?hx4WG42RFhBCqpiKvodJYX6FnBKaJkGak138Ku8ecHxxWzxGLH/hV8BJ7OlS?=
 =?us-ascii?Q?PoM+So9L8gjzCKuBK8Plzmjl9sbBQWE2x0325Xe0hP+l9F8Y0skktXmPi+Nk?=
 =?us-ascii?Q?ZmfE0IIhpzKWkBpbUUoQ9kQvQJKT0satDMGRJ1ZI3REsPlhiQ89nrkMVXyjn?=
 =?us-ascii?Q?HLgvteffZmpbY96jfcDn0HEZytQ569+Wzakg9BKyICz1M0YMmUtnFQt1wCCl?=
 =?us-ascii?Q?+lRAuvA/sYPfHu7GgyRHxqcd8sW1qeLzbDbNb50IgzGwow7zoIBqgOwQn6yC?=
 =?us-ascii?Q?HPdFPV/RM8tQHe/YkNYb4deQMu0p9PeV2TNHVhudfgZlH59YGeAcL0hbNr1u?=
 =?us-ascii?Q?d8nogC6Mc9EtrMi0Eknoy5P6XHD1CP2Z4BJdEzGopbH1s8X35LR+NYEZB22I?=
 =?us-ascii?Q?PADM3YUOKO6FfonLnsOW/I6F5bCpY0UOfzcYT3g1TAHGXS9VlS0FtTKAZX1T?=
 =?us-ascii?Q?W1TNjbfcohQtRKb+OGCONN64w3PskbEePNDT4X7JmqP2foc/gva97SYdHhVr?=
 =?us-ascii?Q?Gs3Y+Z2V/JsWqwseTz+/JJZvwhGUrpwMblCUyzEo21HZM110EJUadF1J0cNw?=
 =?us-ascii?Q?PRwhlsDBkYuwMUna49docf0pta+JAKuPhw4fWldpP0aH89fG8mJ8NQfSp+Yp?=
 =?us-ascii?Q?5euVTOkzOmiUqUNpcmDNhip0WXm0PwozXC/AlifnmjRdECiZINR67NmOaI4B?=
 =?us-ascii?Q?QQVQVsHFmr/GY9WMBNlGDUKoxLiusZ4CTNskXVd6WOkyry1jSZJxjZYYG9NX?=
 =?us-ascii?Q?JV63JqEbPKsZ44tB0NxaRfp3cGcE15DheyS2EYP/JmAhM5yShvbbcHCQP4Ox?=
 =?us-ascii?Q?CnA5S0xQeeNsDhlpGwM/aqeV4zN/y/gDNN5Xc1HTM4l60NbyKDLPnbH/j76W?=
 =?us-ascii?Q?geclrCgLCa/RQ66NUweHT3Bv9v12/5TjU+XMRnQ5ALE3b4m9+g0X/Fb2tysd?=
 =?us-ascii?Q?PpsqKyACTigYksoJsOY+vP0sbnUmDRuMTCT0f2G+0MEYtBKx99OHDMN9U6Dj?=
 =?us-ascii?Q?q2aN9ytYbzpPCfLUp9riFIGWSG1XXhTrMkMHtJcKODVImxKTpcN79zXzSI1p?=
 =?us-ascii?Q?+2hAPZLiS9dqPTFHCXEFB/4D/ngKrzN79826l6uTkJiNYqxPm35BngZWqLlH?=
 =?us-ascii?Q?fY2HYag+eZLUd4HUy8J/LRhnyhx5MIWiiUTabAUDDbPBJkpv/7LPlojBGEQY?=
 =?us-ascii?Q?sXJIQ1bRbm0Rn/zvCPkefVxjRIC7dI6aWYtguULKEE/dnDUkFV0dxPA+XiM8?=
 =?us-ascii?Q?K19P/OjhPGiomPgpI9pjVRBY?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d9bcec-56fa-498f-8c10-08d98d62f955
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:30:48.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8K1ZIwEiC+wJmj0zxwp/Z97jl89fG++9v2LuPslS87tpMyHzXRNVTSdq8C3DNLAUFY246TlzLeLB74h7jsmjEYHN82u+LxmQc8dFpF3Xq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8328
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add binding description for the per temperature channel configuration
like labels and n-factor.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
index 47040ace4f73..36f649938fb7 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
@@ -24,12 +24,50 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
 additionalProperties: false
 
+patternProperties:
+  "^channel@([0-3])$":
+    type: object
+    description: |
+      Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: |
+          The channel number. 0 is local channel, 1-3 are remote channels
+        items:
+          minimum: 0
+          maximum: 3
+
+      label:
+        description: |
+          A descriptive name for this channel, like "ambient" or "psu".
+
+      ti,n-factor:
+        description: |
+          The value (two's complement) to be programmed in the channel specific N correction register.
+          For remote channels only.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        items:
+          minimum: 0
+          maximum: 255
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 examples:
   - |
     i2c {
@@ -41,3 +79,32 @@ examples:
         reg = <0x4c>;
       };
     };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@4c {
+        compatible = "ti,tmp422";
+        reg = <0x4c>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+          reg = <0x0>;
+          ti,n-factor = <0x1>;
+          label = "local";
+        };
+
+        channel@1 {
+          reg = <0x1>;
+          ti,n-factor = <0x0>;
+          label = "somelabel";
+        };
+
+        channel@2 {
+          reg = <0x2>;
+          status = "disabled";
+        };
+      };
+    };
-- 
2.31.1

