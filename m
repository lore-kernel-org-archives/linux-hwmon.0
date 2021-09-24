Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADABC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C0A360238
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245306AbhIXJqf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:46:35 -0400
Received: from mail-eopbgr80110.outbound.protection.outlook.com ([40.107.8.110]:7294
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245228AbhIXJqe (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:46:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJM9AeogeRxu9sANW/yw5ewuSDQH0C6XnmtZDqnaKHghGPW2s3DGUOeZq25MvWlTFVyKfSdO3PLafdXhxvNZb2Lo7tqQNR071f5a29/LzLFVbNdrYF4UU7xWZWCKo67RLkJ0uFrmcxwsgIST8MpyByZ0nKT1MCGwPS854T3qJ2dGd5bYuXdwaIJZXRzhtx3CeQS0gR6VJJ11W3G9d7sEuhK2rerpu4NsUGpTvFEZtqM0MH3U36ePSdLFeN2BNqMOuPJgwUl0b+aB2TXeDEMMNwzdHI/eRQOTToUVNyFIoobRb/7PppQNWSuSs38cz4u1Ay7Ja1N2C/WnhXgo2VZuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFwXBbyk7KPlXQGiYvswXycuWcxwp+jDEbZnCLi9muc=;
 b=WfX4UYZR0bHnKDzH77bbtjI34C46OXSi79blKeagDImjbb+BdgeJmDZo1jliIB392UXSMcujApXrJFv1M0Q4knHN4vCSltoef5ZR1Y6kGfPmVqxRDFPtqZcLZd0bH0mMTVqwAUDi9m0RJ+SYDlWY449sxKCzLNZe6dDL78zjQ5S2w0fFGkiB50pgHikWy0uZaqt0yaRviehYzYCmTiDs75dr2lQi8/EWKeCb09DZOocI1qtnCn3KB1H92Ws+nHu55TPlyx5Qn0P2G+Gexi1JBA45zsuMVUgy8p5u/oIXYUX7nPwH5s2OYCnpC33KLxtpci3/vRxVDl+s640xf3LL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFwXBbyk7KPlXQGiYvswXycuWcxwp+jDEbZnCLi9muc=;
 b=xXmdeq3ifax4wna8DQQXjdObRp9yCtYPp/R6KRcqQHq6lQYk1iuMaGosexzsEnZDdJIPgEDhrWH2lCX+MhhpXc2NLKwRu4Kb7/3LAxLbQAoKkuHtwsLaVkFIMNDA45398HyPT4+tKgLEn4sZLNd0KK0loePfHJXW85cp8FCilig=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8151.eurprd07.prod.outlook.com (2603:10a6:10:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.14; Fri, 24 Sep
 2021 09:44:59 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:44:59 +0000
Date:   Fri, 24 Sep 2021 11:44:40 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 10/10] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <582639597503c27409b432a5ed9576cc1b447480.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0133.eurprd05.prod.outlook.com
 (2603:10a6:7:28::20) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0133.eurprd05.prod.outlook.com (2603:10a6:7:28::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 09:44:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0273b0e-5c7b-48a8-58b0-08d97f3ff973
X-MS-TrafficTypeDiagnostic: DU2PR07MB8151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB815190C145BDD3E0CE87C918EFA49@DU2PR07MB8151.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6b48GlZJq43jltR6j2iYv95faW0XvwnE1KUDCPvTRRdTVMQNh+dhSDNXkJW5EGC7A/RCwxs24kmCbWl1J0wZ14wYmyfmFfPaHeo6nowP5tCuH3IMFVVnD2UN2liupl9EPMmhrD5prHw/iQ7x636k+g4souy4A5qnSCu7egL1XcaMitKq3mkppIBoG3Wb07L6oBmMvP/1HKxYgrnEsloXN5Yc0BFqAHVKmKd7DlM0fpJ5bzWtabp9kQpQ5WZnekHUQWWpEKbQvyvxcQtGgBIK4weizq4Q0ifYFNaNvmBOoUZp/59FO0gEMr6ggqfaMW8doHCe8qKxGtxPB5gbPX03Ir95V3ikpwTfdQLmNZkSQGRMVONlA0VRwISyKaFiPxa23DdsdKLiHtViqgARhokdSmGav3EHpRGJTrxicrzFun9ujTUoS16lRcawL6qAHbpOyWSBWP2YC+pyA/E2ZhHe/PJ6qObZZbkWQuvYf2ABibHUJDzX/cvmJekBHv2Uv0qr5JdFWZa+UbI6vMke95bhcQfB6dCdbY9sVakFc4fcus+Uakj5EKqewoUz1Wkx3Uj3zTn2FXJFgQqpIzTmbi7Fy6FZhlap5VH8UP/YdmTUfbUC7YS7fjKueyjaS9v5yHi5DvY3VOaV52O9kH3K9sZjCODRE71eLyfv9YVHDNwcbeiWRJvihCHc03tyPosDVmwZTvZYmgDQyNWiHXqu9dDlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6486002)(52116002)(66946007)(4326008)(107886003)(8676002)(66476007)(508600001)(8936002)(5660300002)(316002)(54906003)(110136005)(6512007)(2906002)(956004)(66556008)(44832011)(26005)(186003)(86362001)(36756003)(38350700002)(6506007)(83380400001)(38100700002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h2SBYVeCCy54uArFQ32wJssSz5tHNMcc7C3SrGilpIPZl7nMXP3Tfh8ZSDcu?=
 =?us-ascii?Q?X2IbG+vO8en1HycaDVpqL17yYvU8EzYBe6NI3ERYT1WbyxbmMuBd3o7fnlgb?=
 =?us-ascii?Q?r1SxFg6o014A58lHdCrZtC6xGBPiGWllg778lxsEUFKsBQbY/c8biiY7b7PT?=
 =?us-ascii?Q?Dww3C1fmX7zN0f/cNPtKI8Zt7OvNEJJb1yx3KfKGBV8cFMx2g9CvAP5UoqQj?=
 =?us-ascii?Q?EDyM84CmMDhkssO7wMbMvQNXJqJIi2YK1iVmKOuY6x7TqqOUWxjpHdN+WLsQ?=
 =?us-ascii?Q?BV2shPpnnE1VjOdHoU81UfyYIwHC6ZijerkBTExgS9XyASVobwIuSusVpWwo?=
 =?us-ascii?Q?e2aMfCIYTqWtc23BZ6Rj7NAzquRP7ng0T/Mv/Frox4e3HSZSfy/I2xExu/DM?=
 =?us-ascii?Q?pTHFX1o7ztGNJsy/GfANnhagUHKXv0Zj8oCjaFNpOsd6lO73tR39lA2ZG+6T?=
 =?us-ascii?Q?RuAr9GqJJI9HAG8xqysqgiab6n86gW9Wg20i65gMXuDRAnan5y9FfhW8jR6g?=
 =?us-ascii?Q?sdN5ZAI4gxdjBMsbibeX+DgQ2PHqAlM2ds7ecH4tUnHqRFvj16vqcbVILSrE?=
 =?us-ascii?Q?mcdWF168z+u5MwsBvrQRnRxvgEOz1xOneAa6VXACLEW6pugS8Ry2LiSxmqXr?=
 =?us-ascii?Q?dcT0KH81+wxOMTNxQY9EewED+F0wfMsfxvke+REkzYfLVSPz0KeinUZkMyux?=
 =?us-ascii?Q?AfRsjVYHLHpJoNEW6AGZOO+W5Zjg9h7gvUHHYB6tXcUMC6nhs83LrXRsF651?=
 =?us-ascii?Q?w40JQe7SN3NrHTBLLtOSp8sbAiL2k+JovlOHALJcMPcEyftscPCiZoqVnldx?=
 =?us-ascii?Q?lDpLq2Nv9HC7Lczcvti1sZlky3TUb+X+/z96bMws/YqiOcv5U1CbLQJ1sauA?=
 =?us-ascii?Q?dn9p/+xL4MhRGds9MpBIDr93KpI/75Q9AeA8fX1CVSKJQartBBET2oHB2P3F?=
 =?us-ascii?Q?RRbPvPML8CcbwQrF1MfuYheoRHhyeHcNETzVnzRmFhXcUl/iDOiXRhqtDb4L?=
 =?us-ascii?Q?bVRPiDy+K5zYbMfjUw8FQMLY41ccimmeW5XYYeH9hJVTSe1jyu+XLlQCPaP7?=
 =?us-ascii?Q?AQqj5G+5o5lorivuSgpZOgCmNiF5dporaxKpZUKRUMoVDgfmEAzlG1Ex9IMO?=
 =?us-ascii?Q?VqoTv627YoOxjrwI61glxoqMCmd5XC8y+rTnGTmsqwpcipQGsF2EFbpHaBDO?=
 =?us-ascii?Q?pmrjt5anaCTcowzaJS0LdpIJlIohYPJPeC0U2xW6vDvLDqy/W/MczI+2kFHh?=
 =?us-ascii?Q?c5zX4UG7Ny0Z12lT+o+dF7WmwqZxpMG3ntJAgqfbUE+pl4FTMzREvE0cds69?=
 =?us-ascii?Q?iOsvcytuUDTIexrYdWmpzUCL?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0273b0e-5c7b-48a8-58b0-08d97f3ff973
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:44:59.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FapOQAsVFLBkY/NemZqjxQ3C2acCgTGI+wX3Tpwx1HSZH3ID4DxVID5FPHYNHIrrwVKLn4BnOzSiy8K+8lWDxOVbg9R7/DapHCbYI98EALE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8151
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add binding description for the per temperature channel configuration
like labels and n-factor.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
index 53940e146ee6..56085fdf1b57 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
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

