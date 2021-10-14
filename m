Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E497C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FAFF60C4A
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhJNNOU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:14:20 -0400
Received: from mail-eopbgr80118.outbound.protection.outlook.com ([40.107.8.118]:8003
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230407AbhJNNOT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:14:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIZ6WUKXW75+e5o+K4phUFmmniY7KItHkYYoEyFUNqrSwLnLi6hEJrl7K8EdZ8znOQ15+dShwvBk0GSX6dHwXBFeGheUq3RvZ1UQWjJcQJdX+ay0gdYkw/YSh67Ntfy3T/zGSNsXskqbqZh6wNBoKai7qX77HMyRDFwzAHr5E15WhrrlUg+zcaLOlqs9J+yk761XMEM3NUESUJSyRz7GHAi0Gv/PCTxVD765Pm8BXU9VNUrBaO1bMC+pLiT/cUd5V7z1Dj+BNwjp3aNa7/iqwT5mnnDhNYZP4VJgxLI3+1pEBR38t+4pIs8Iq1i/fI6bBheicbRXe3w2lPDec5Hl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HW7MvCvkbWKARFWbaqT5XpatFvbmhHgkUkm9/u5nTI=;
 b=E6yc0B7HEGF8UtQaB6dHptfWepnJlw8EwztZcE8L5PQ0y1aFe1Fn9+RkqZVWR8ZY/wv6QEAjT+mJm5aB3I1gtamyczpM7nWXSLlJgB+ZCZozffvYTzzR+zWkb0uHMdh38UHGOOq7ESD1YT7dNNRt+46whmAyXSnMcAYVFLdJI9eVLv5KLn+aJ8OYGXT51hDMJKO/EoHOz58lNZV3XXFlwMwWQ0zTzgUjkL+zi5NUEkYkOyMIAzXCQtHSQL1O7zpLyYHmiDfSllM5AwQO7kf3EvwE3ZmUTsxqpXEantPasoQh+3PWiYFHVjpnSu1gPjmRCThr2XLA4+RoYx80whhwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HW7MvCvkbWKARFWbaqT5XpatFvbmhHgkUkm9/u5nTI=;
 b=EVyZnklcq4/1YEk6MGlEVIYL7iiipmJ3m6xywORSOl5nkaB9Ika67zk+rDa+Z6o3f4OdAG3cq/6cJHCG1hdLYU6RTqQJSivHzE4IYeV38S1emyZ7JeF3yqYGcplSNeI06zcr9g2T3lqvm+9pqwjjtpt4P+4XtU3D13rWC7QJ+Q0=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8187.eurprd07.prod.outlook.com (2603:10a6:20b:376::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.15; Thu, 14 Oct
 2021 13:12:12 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:12:12 +0000
Date:   Thu, 14 Oct 2021 15:11:49 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 9/9] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <d1721a50efc0f88728614b5b07c0d9332ae4971c.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR08CA0067.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::38) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR08CA0067.eurprd08.prod.outlook.com (2603:10a6:7:2a::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 13:12:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6198b3e5-5783-4578-1fb9-08d98f143c59
X-MS-TrafficTypeDiagnostic: AS8PR07MB8187:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8187B030E9DA5B0AF66CF0E2EFB89@AS8PR07MB8187.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6TZ3pd9TstBp6XgOTh/4xm75G6ZFFhrEj+pFooYz4pGflRbjTpmKOQAgagnajI7q85AByWzCY3O+4KlpaKmVRH3e1DUDJfnQ6f/bys7zGiifK1nNbqhtUJORyq1X6w0VQtdlZVFBzzOdP5DMvCqztSfwR2XG7ArZmw3FcuNQ9YQ98pFs0McBgS9zRCx4sW+ZF6OXjh/UYb+lvDu8vHPf/U26jROHyBnMQt3YsSolSY3J/fy9bl2ALvPD09CTfB4RsEa7jBQ6UuS3CvToTtIAUXqkZzuPkuXL1guS05Z1rIc5AeYrdj5VezRzAkqwxKwOozEWKoINN7rVlEnW/sGMluqcI4y1ymKVpqfxkv51RWOQC69+S7Xzvuaw1kQxxJM2s//698RY8W3v5DtwzxYOrWslFhaStUWJ90hCcZ2mEtgemDLkxq8TbhFTE8YcXXtmQZ/kmn9AadZODbCSjzTbXIW++RbjaKqK9y6mhoTgrfmj5r+sWwX4iNM1PqupOcC0Wr+BymknECIv5uc+j4aSsUtvuyfcKWd1sq09OQ8bzdjTxXEAOG0PX3RTociwXMaqO4RmxbwtIHcL3Zj8JqOfHbxqhCh1dIaqPYIOBj68WII7DGnP7hRs9iVQ0NfAQ39JM+7Gl+a4cQEtqsL/+DfVI98j/J4yu3jbNWNj7xbErD1UjULI5XGriIvVHxHVYrZMS3AdSuewlGiw4YdSXx7yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(38100700002)(38350700002)(6506007)(44832011)(110136005)(6512007)(8936002)(2616005)(83380400001)(66946007)(66476007)(508600001)(82960400001)(52116002)(6666004)(316002)(8676002)(186003)(36756003)(5660300002)(4326008)(956004)(2906002)(26005)(86362001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E8JnexfASX2XuzTE0oxuvYM2MQnWVKxdnbSp2uHl0Nrpou8RL0oB7UY1TMsl?=
 =?us-ascii?Q?Xrwb6/RNwi1PnkLL0ZUW3eXY1X372KQglsP/p6MEMMSaku+s4TB8oZRzf6Jg?=
 =?us-ascii?Q?AfyOTTVxCWkcp5zzv5OUXva08wudb0PeNKfJHlwcmwTTaF4Du8XkOKgjTxWX?=
 =?us-ascii?Q?/rAqhc0Zd2aB9xMfkXNgIp+PJERqCajJIY7UTKzLbnPmrSmQAt8a27BBc42k?=
 =?us-ascii?Q?3v4wNd2SatB5cFqi8GBowVND7NSvEgbwD5AnHVPWnuP8N51CL3WGeypcfC3N?=
 =?us-ascii?Q?Iqbq8J8lUuakPUudVlQDPDRpmNqyJsPUXoPVHKMLaIqgInkQHFqUy0lB1i52?=
 =?us-ascii?Q?O2ukJaP+50WwQvw/uzsRlqRZE6CdDUnzl4if8XwBkHia8EBPORGZC2kMfh+U?=
 =?us-ascii?Q?Eu3nG/xEok8RYv/21k3Eilec9irJK4YAAXE3YDPaUQhinjLh1ODB/b4bscFe?=
 =?us-ascii?Q?i0DeJY8g1akIJjB28nQjpyq0FG0d7HG1n3W+5NiyhDbMMyNsK3mw9oDLfy7X?=
 =?us-ascii?Q?ZAO/xHlZggZ5cYWSObpdkj37Kr6zVKDfF1u5Go+9eeKFXvMNkiBoF4yVL6Rn?=
 =?us-ascii?Q?9ybdiycnQ83gdWdKBUmBTGW8xPx+7Fx/5doRMsg5Gb3JnOCSGjEwbFHW0fKT?=
 =?us-ascii?Q?S+8VDTCUJTpEGLEI5No2Mj6gdO/bSIy7t8GJ2i+XeI9sJdILvxTTpD0eq0Dw?=
 =?us-ascii?Q?RlusIZD3uffTGBSEfGNon32itSqDK6XtzMNGe+BvL7PELFkdf1RaN2CS7eJr?=
 =?us-ascii?Q?e5xp+ps+mF5IlZY/cbWMKpO6DEFx8iY/n7Ta28SZKX4RjdgZE2rYEOklGB4p?=
 =?us-ascii?Q?lh7NtCeWIyWF7h/Rm98rDLQz8FM98GDZVMTBnCaFngq+Y+zBSGS7WNPLSuev?=
 =?us-ascii?Q?Lpcmz8Thia8HgJOkJeMQYlY9tH6xhJh6NzhI16uSuVl1MJwHiisTiNBdPCxp?=
 =?us-ascii?Q?w603PD0Jef7hGMRAwqT4s41zz1R8jA3jQdTO4ozFnCZoG/IaGqrlW1731L8j?=
 =?us-ascii?Q?HCpA7PORztOu4x6AObUunXkhnGxYrVnfyaqXF60VpIDSQM05MDdH3iAdjGFm?=
 =?us-ascii?Q?mh4ydHqhLOaO8w4OtRvGr2FMURaA0TE00BzuMYGdvfvrzuzGLVJCEJ/lwyrN?=
 =?us-ascii?Q?DGgXMQYSq9KnBzTsQG1FN28PeUDhicc1OSTPZ9eyhTOTFYP3nd4vvUn4Tmwf?=
 =?us-ascii?Q?nKktItKuI5VDXya5MEDuqN6Rp8/W5HHhF523RvLUFbxOCsnE6NZqLm7EgMB+?=
 =?us-ascii?Q?K0eEQ64+ic2yAzzHUBvwIJZZpiXk5jDMwUEwP+gIvpWYIn7umcb683rpwboj?=
 =?us-ascii?Q?pXQLpT2+BnwgTjHSzVryVAJF?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6198b3e5-5783-4578-1fb9-08d98f143c59
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:12:12.5093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edw0A1Als8DIgbElTaT4rd7ZeJdDkLWjMtyjQQJTZ+rie5bB1PPRM4KwSvsVcn5yHQi+JTbhUwJuHf5E2rQCguopg5OOoz/DeBOj1JpSp2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8187
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

