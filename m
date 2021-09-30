Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8278CC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63FDA61353
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348653AbhI3HVx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:21:53 -0400
Received: from mail-eopbgr50112.outbound.protection.outlook.com ([40.107.5.112]:28174
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348636AbhI3HVt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:21:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAjpXazLGkj4oHOeZ0XdiwbghhvPuCm0w6/KS1/oILFpCrxI6ci+znIP6x5OX7MVy76rCD/kEiRTVh4YcBI2AhSXxo1wUJu29jqBHpBZPgymdRhoRDRkW4sZspvRaui/Q71aaUfRoIZmNOMPZPn8QEnmkxRtQ4aM9REz4yXfzRAzx/T9H3WWDioerSezEtC+pujSkoTH9QewlInZH3mdj6yf6wjpdno64Lo9GlS7TZchOed5eALuhFiULa627pV3K99ftaQzQsVdMp/J2zZyc9ZmiH49n3fBeynwberVbunEpvGIpEga2e7U9qucsCIaDiSuwvKVSFIa6SRo/WTT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRujP//mtPGhfx+kNfscSs8WsydUgbjY7+zRaOHoUlI=;
 b=Y7w4yyTXhAWLXN3d2ltSMt6PafMU4JXnKPxhoU3TR/p7ydY8Ou4Z0TaA0P6WwzHhCD/70sSW+z3tplAxRKfqSCuYdvjskPa1tmY4IKehr/P3aKHs/E3UqqmXhyS6iBqeXiFoF700yLQqRkhAxbfzueppG0AVxi66JOdNRPOOs8GnfdmO+wWOZQJwzQmZ5aXLuDoRrpDfj9wrgmd9i5m7nggzZrGqu55FDcFm3ULih1NLyp04I7QZq+Zg//it3tjgoWo8R241LpJ4GGxRgrlxq+td+UI6MCRQnq9taFVGakiEEku1hsT23It2Q+C+9ON+81NGrh0FlKYKwuClbo05Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRujP//mtPGhfx+kNfscSs8WsydUgbjY7+zRaOHoUlI=;
 b=omxrhtog2gZq4k39b85PuS5eFhw1nJ/z9lNw66ciQXA7NgL22wnrkvZsYc/Z5xaExqgHqfvaViwO3IRs2uWnqWEn0HNAtVaGqqP7YfniPN/vOA2+5sL9/Km5zoMp5brKh3k6yWFjKhQiofXksP1vvZ0eq1TdOOBOupr1BOs0BxI=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8223.eurprd07.prod.outlook.com (2603:10a6:10:274::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Thu, 30 Sep
 2021 07:20:02 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:20:02 +0000
Date:   Thu, 30 Sep 2021 09:19:49 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend Transport; Thu, 30 Sep 2021 07:19:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26548c23-bae5-484f-3157-08d983e2b7f8
X-MS-TrafficTypeDiagnostic: DU2PR07MB8223:
X-Microsoft-Antispam-PRVS: <DU2PR07MB82238CC34E22A36C68AB186EEFAA9@DU2PR07MB8223.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +H9OXoPQZ925wSyarTRYVwcq3NO8ijq8S7LmiJ1bDLk+KG1Tz5TdQ6GycLOLasSiTrXaeaZfqWFoc0T5b3Wp8vVM1fD4Eikwz1HVBDKRCnMCEpm/wMqqLmf9i/2zVC+5Gn6Gx4XNDfC6kG+QOCNTNZybw9ApAcQ965i7QWlm/DkmvQtGkrF17TCfTi8Y3KqqpIZT/uxjwHt4hvkuOz2GnS/6zh0An/HCM6QgUOjVDEj906gnouZf2cdWfh0O9Q//NyY2GtHwyld19S+ZjUlfufQlOA9VUc3rnR5qxtdhHa0UmEgpr6hPz90U5h81yUISpnJ43LthJ/bEX96YFh8yojG+2ewZh1vkuVRHm4mpn6J3ryn2WN3xIt+Mxy7rPwwarHV/oob7vdXYsGlkUYRRx3o2IkKl/4cCuzwC4oT8KzTFsVWedxGRp7kXhXaPzhSL0T4WFeiXFKmKQ+D/JEpRI+bGabM8s0Z64Ml94dFGtp+4Wq1NvnRxcrj+FvHdjcWBIp0AzjORFXLJtWjBUI1KqUEyVVbV2k0BHbKzKxUC4b8IzVepDwM7vwaxlxR6l1Wec2rMZ4j5ah81OnLirbmwdxlF8I8a0iIsrT1pi+CEfhDESG16jJfOqIN3fKjVJfvhyFZH0WASLUVnvpxLRUC1MTDe3/Y2IcOIV6PmAYg20YagllKwj76Uuj9+wSv/XzEY0ICXAq9wPE/PNLeAOwUsbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(66476007)(66556008)(6666004)(2906002)(2616005)(508600001)(44832011)(66946007)(52116002)(110136005)(316002)(36756003)(8676002)(8936002)(6512007)(83380400001)(5660300002)(4326008)(26005)(38350700002)(186003)(86362001)(38100700002)(6486002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WvxcQK2/zIIWdmsx9/ppDjWPP7iHgFxnISW2ChNcC/CLpl+CS0qLZ66J3ffb?=
 =?us-ascii?Q?RqW0X0TzphzSKhkARXPTXFVy1juxt0ztUnEA0Y5Es/EjDjMjCSVvMwQoD041?=
 =?us-ascii?Q?g1AcaUoRBt/SMw1BG7YO70PUws3nPuviFzTtocYJ8LGYRJnnHyoKvsLkeSEn?=
 =?us-ascii?Q?5d19KlcW92vt7GlZwzRp95BMWILDYbaxbE527igueB0VyuzkEuHRza+9KVFi?=
 =?us-ascii?Q?y5GJwqjjEBkX5HQjOl0xHMz1/wcRzZInrpwBmlIqyuxZQ4lItXO/FtQ3sMrs?=
 =?us-ascii?Q?RMuqSept6S6d4u1Ji9awVaGt3p2QVUgAL/4cf0L70lrkYT/xpGxnQFzE7z9B?=
 =?us-ascii?Q?nq/qxwVDaFPO19AoYOTe8+Yep0z6xFwN+ijzSf4bvk4wobm7INfS0yAdUhj1?=
 =?us-ascii?Q?c9E9RpC22/RAlCTM9D6fK1yUqd9HF4UWVe6RBNBJztFvM7+ZsS6l+twK8da8?=
 =?us-ascii?Q?BNbf1RsozEYSNAGfR6TNS9xvyE6tcf8g1gGostoK8jSaVHRD37fyskM1ILxn?=
 =?us-ascii?Q?JsElL4bW6BgPzlUdwg1v26Y97B+A1TLOYSmbYPmQwDyMQyk4Z0dVmOR747pw?=
 =?us-ascii?Q?0x0E90OZ8qjHHSq83bEL2VUa/KugOZOEHjHrJYYYnTlUEayMEiy9W6dEtXEJ?=
 =?us-ascii?Q?HrQFsr2safursKxSacpffgpMcaSrLg/ERSXSw9qcAxYBVwwgUL73kdIOhC+4?=
 =?us-ascii?Q?YtOgqplJ51bEm94Ep+XutqbXHuWcNLtLct31LM8/Njdi4rFMN619pt8U1y4G?=
 =?us-ascii?Q?Ra5GhxXIw0CNBwkUJVVv+6rg1Eq0+vlc1eGViCpYzxp2+zrttbJS+7dAV5oK?=
 =?us-ascii?Q?nWWPnxCdMvw5TUFgvIdpBm4Eo6sw4EWtsnIV1aISYfRH2oLsH7q2Fehj8HX0?=
 =?us-ascii?Q?d62hZBdQxk5xn4AQE9ZpJlHG78yX/MiNufbAfrGsAlvQ1ZAyqn3KWluXvjTf?=
 =?us-ascii?Q?CMucdgczBGhqAdw5a3SflBdx9P7PfZfE7M9spNXFiPmkm2DF+iFh9Y9ZMR9C?=
 =?us-ascii?Q?2xmwgg+0yVUyE46i+/toEvGljbO8dV1VvxdhjzK7ZyaSUCoWyQ5K7kQRneF8?=
 =?us-ascii?Q?6vvmadhNyMddMGu6cBMSN8Brj4nA3GRWL/oCjOMl/IosnUsJf7OclMvrENos?=
 =?us-ascii?Q?db/5ThV1k6XvJq4JUJQhCYU4tVliBxhMtiKiXugqm11efxtXc58d+KPwrbSk?=
 =?us-ascii?Q?nT71X0ct0kItiQIIkC8zgowW2HBBOXPZel4jly1rYx0jPFS2v6jb6hq4Va7k?=
 =?us-ascii?Q?+LNx1ij7M1DXMhdSWGySil/Y9bkRFAvNLBX6wRiDHpgPiFZY5kzQWNWa9ibb?=
 =?us-ascii?Q?jZMNnyYq6VXLnefxdY4R6zup?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26548c23-bae5-484f-3157-08d983e2b7f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:20:02.5513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9xOVx5JHwncMah2blvhhYDtuFliSFqiBIlfHJF+otc4lv795q4z/L6VwtsgnvjbPWY4/BaiLr2i465QpTd+ZdL0kxYRMpFaLMEVHpdU/Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8223
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
index 47040ace4f73..0d4ea2209500 100644
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

