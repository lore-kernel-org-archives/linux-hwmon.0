Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6188C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD2146105A
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbhIGNr3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:47:29 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com ([40.107.20.123]:21848
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234990AbhIGNr2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:47:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA3hTHdvCpfZVABYFSA2dCINk9DNqyHPjMqPBV9TsgX1yZ0W9RCK+tbmTEMlLBaz+cvDbmNlhRbDGLNPGb/yFFywLAKd8OIx/0WuDl2cHktRb9Bwcd8rE0ZwGhDRFfqgY4ET75mQN5/pNi0D9SiuGOuT9/hWYn/1NdC9Xg8J197PaMp0hLOQRjEX9nrDtMWKH4CRw9C+zYKmNfJI45KsyK2Fe5mVpWPfg1iYXxRcEx+fCutW+fY1cVliJUpXvnbw0dJt4OrtonjZtvEZ7oVnIiqLJCxxglvhblvJmaDhBuwR5mXC6HxLPJxXqKcEjlBOl2zI78kypXMfGZsBeIzBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lv7hZhYztViyKlP3U/a4yhf6YWbwFK+bPwcE83UQy2A=;
 b=O+1z4EtLwn3XzgLqBPBk48ycD/wtcDadL7RG+pWv9834LxtyrZ/zcpdLkt2AosNXG8QMbmGzDI4fom7fZvXgCslQVE5gAcECSr0zA6rvhQkr6lPDQ+moHZrAGsn4AaecommrPDXSVD9dFvZbTsEwqqTlabBMC5mqZ3cyuWzNTNfe66ke5lsrinWKiHQY6tRRaCuEkYsIz5qALU9EuchuV8rU/xR1dy0i6qzEzWnlnxpXbO3CoQEVNSu83hfPxkGkgVM5xFOTT2khLuqmQVV1f19eQIYMu/7ati6zK+PoZw1sHzM/OWH6hyfJPkut1DyholChlZIQ7vSl6JyrZolVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv7hZhYztViyKlP3U/a4yhf6YWbwFK+bPwcE83UQy2A=;
 b=U/klyc3r6fr8j5pePr2q17zEvGv6pChx5oSUDJodLloVFJ/fBCKC4xIVtzl3Kb1r37CEBPt62hyM8JksQxZoCQWOqj4zgbHAYkZg1LfQMwmLRHpHNClZr4G4+Rfh1n0cbgjRF49vTRRk6Y6wu9Zv91U45ojKo4a6myXkg5d6UD0=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8128.eurprd07.prod.outlook.com (2603:10a6:10:271::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.10; Tue, 7 Sep
 2021 13:46:20 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:46:20 +0000
Date:   Tue, 7 Sep 2021 15:46:14 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for tmp421
Message-ID: <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::21) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 13:46:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e88d41f-7d9a-45fb-84bb-08d97205df63
X-MS-TrafficTypeDiagnostic: DU2PR07MB8128:
X-Microsoft-Antispam-PRVS: <DU2PR07MB81288C47B62835239D0D6611EFD39@DU2PR07MB8128.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZURI2f3rWqui/hGX7HrJGs0uk+gBozuBaY8S9A64TzloVAgGJz8QfKuCrnnxuNGCi9Ar1gczIKlfM6sFvjhJJwN42iBZcjP19abL9KKoUh0eMyjGRdW6FUmBxmFj/+4gdAY+UsHkdtanADuO+qca23B/G0W7NJPVhdVobjw6jkJmb9VcDKG4dFcTAerhsc6XnIkwePNACPnCndJLCGFBjTHoN1HPDuB7rHeYat1rIikeEZ2JMTRpHCJmmh1mpMEoVISGz2wcM9hk7t7z94iKR4Zs36JBYSkbOfBGR4wG9N/Q8V8KeHp63vXQBqN6BBKgV1TVqG7/seJQKq+QZKudaV75xLGug2IDf9XO8XeF/ZgfzqfebXJHg3za5oJBX+E5c7HQhbPUbKBRgqxyVRgbE9SGv16upbNNq20eMqi+ymwXoushjZZ+VLu25JbeUsRZ1W0wy7stmrZvbn4YwXwAvHsc1fndDcOQvwtDVJKfdUYx0VWLB9+YWvCVlEJedVlf4wYd9CZtGqzJGpxCXI4yt2OqRI6QDKVdYFaKO+SAvKK4uyeDewOh9l6sBcYtguRMjxskJQpaOAovfQjg1aNtayst33ROeF8njFW5IObavX2Mmq4Uy1luAyC0PoFx3yEnxFQqJ/zMeP+CYyEiry+rUXo8zfCFvjjS07/vFrxQYaI7b1qBAeRzuu5WhhIcMjv09ZFDF5G8q367XqKDqYj/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(4326008)(6666004)(2616005)(956004)(44832011)(2906002)(52116002)(38100700002)(38350700002)(66476007)(66556008)(316002)(8936002)(66946007)(6506007)(83380400001)(26005)(186003)(110136005)(5660300002)(86362001)(6512007)(36756003)(478600001)(6486002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tuXjFmF6m56keMur6f5pzAIWhWJ+GUiPQklcImQyHarbLkanImur/RZP6Nld?=
 =?us-ascii?Q?2QT676pkJvjj1snB9586JIopbIwnd9OpLvqsbeVT/0hYEvEWxne6kstL0i70?=
 =?us-ascii?Q?lZGpR7kFz/LDFYweQuG+NwdSZGnPUbsVHiFOQXbaaq4VPRRrVLwvIEuHM9pR?=
 =?us-ascii?Q?6QeDZPpBSgsnSPBFuqZAvh3VMdzB8k1e38UFmzf/sUqNORQxGAFc2RqvL/t1?=
 =?us-ascii?Q?gHdG77nlzAhYbIG7JObYMke0a+1O2IWf4ZSjGYqJk3G8v5rGAmL+oGUazqW7?=
 =?us-ascii?Q?/2aSwnNHmVqLYEAoRyOqTJQ6j/Nro99SSJ20HQdnBEgsbXDsA611iLx8B626?=
 =?us-ascii?Q?y2lf8PS6qhFtOWK8bDGdGdngALoKqty/n8fqcPrtJiSncHOztr3vpPP7onMu?=
 =?us-ascii?Q?u+247MV+2akDw0Y2VCVC3XrilvOr2JZUikxCE0Yj/zaCIU9d45mjsIzk1SBX?=
 =?us-ascii?Q?yyzbas3tLMDvBV1poa3R3h9tK+8kMbFkcsegN9agxo4DX4IN9NlksBpQcD1R?=
 =?us-ascii?Q?Oxri0UsaTCcX12cflwB8v5tdVrzbzQ69igECD7Uu5Lix7suFHDstlrPbSkIq?=
 =?us-ascii?Q?BuNsmDdy79xlHhc8xBIee9cFNaQh7NaRFlrrkHN9YbLnlx8XxZJsAVuvpVih?=
 =?us-ascii?Q?7VOy/2IJoZihNCY/kV2oZBOZtIkMLuil57H8/S0xsi1nUq9xT0XDeggaY2jv?=
 =?us-ascii?Q?HtZt8bcbgFJgcP5iA8AIxqldjlGu6iPirLdYHRoZGsyg+4Ucm5aY79rm9RhS?=
 =?us-ascii?Q?t6KeLSPOkJCzP1ewy3bKdh32Ve7kI/31HpKe6Nbz6z24fKMcIZMJAmQ39nuV?=
 =?us-ascii?Q?pMX9TUq5nwtroW0VyPyinLMI9TpjMCI5y/+cTArgiNu+/C+WZjrWpMjPkUqF?=
 =?us-ascii?Q?JHPVUIg3OI0gmshz+p2Wpdnt0Ia23ZG/Pq6QerEuBhCwhGaHdJFjVKSvne5y?=
 =?us-ascii?Q?THIYm+Rn4Ne912GBUvwTvxfgW/U/HZo6bUx2g0+IIyQM2D9XcizFNAT8upW5?=
 =?us-ascii?Q?JskZ1RdlyzIJ6T4k+cx9WwbDJISfIEaRzA/yWXRz7s2yejfpxS0Q/YzqvFG4?=
 =?us-ascii?Q?HczbTlJ7sZp16PB7we7CWTqCXNcQet5Vx8/eH+TBz1ot6sqateLLExo7TfHM?=
 =?us-ascii?Q?RWJuNwjFSf68q3dsRONIknjUUK5g8Ab7KCklhXKufQmEdRKvcXhwHDSEg2aM?=
 =?us-ascii?Q?xAL2NvT7QqP092ugtKUSIJI2Mj487GSR5yQ/io5+bPAt4vh5mOelcUngGZom?=
 =?us-ascii?Q?KyIMIVogULn8xejGy2cCALOzedx+HYOBkdc3Pf54gew9L1Al2/81lw6OmGWd?=
 =?us-ascii?Q?ewdjhjx+WTTi08fHEYEcrsmw?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e88d41f-7d9a-45fb-84bb-08d97205df63
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:46:20.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9dqueqPG4eELkG8mlpMLiM8uj8hIbCabdzecAZiMeqwfUm33bnnoExK4Vxj9UddfLdvDee4vgpcv7d/OmnOyELgQstVfuAfjqPqrpyHk+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8128
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add binding description for the per temperature channel configuration
like labels and n-factor.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 .../devicetree/bindings/hwmon/tmp421.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/tmp421.yaml b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
index 53940e146ee6..56085fdf1b57 100644
--- a/Documentation/devicetree/bindings/hwmon/tmp421.yaml
+++ b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
@@ -24,12 +24,49 @@ properties:
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
+  "^input@([0-4])$":
+    type: object
+    description: |
+      Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: |
+          The channel number. 0 is local channel, 1-4 are remote channels
+        items:
+          minimum: 0
+          maximum: 4
+
+      label:
+        description: |
+          A descriptive name for this channel, like "ambient" or "psu".
+
+      n-factor:
+        description: |
+          The value (two's complement) to be programmed in the channel specific N correction register.
+          For remote channels only.
+        items:
+          minimum: 0
+          maximum: 1
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 examples:
   - |
     i2c {
@@ -41,3 +78,32 @@ examples:
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
+        input@0 {
+          reg = <0x0>;
+          n-factor = <0x1>;
+          label = "local";
+        };
+
+        input@1 {
+          reg = <0x1>;
+          n-factor = <0x0>;
+          label = "somelabel";
+        };
+
+        input@2 {
+          reg = <0x2>;
+          status = "disabled";
+        };
+      };
+    };
-- 
2.31.1

