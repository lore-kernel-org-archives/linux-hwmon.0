Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFD6EB64D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jun 2023 07:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjFZHaQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 03:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFZHaP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 03:30:15 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04olkn2098.outbound.protection.outlook.com [40.92.74.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C686EE;
        Mon, 26 Jun 2023 00:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnqMTJ6z2Iekd5ywtxyZBptF9KFHjRFU9bnujmueyhAnrjWk6fEG7pmXoDw7fh4g4Kl/siiMjDbHhtx2wxlNVLd+x4CHJIpPG+5KGSATjkKsnzpN0nw2WOZ01OmVJJUelfldQzblm8TmflVVun8U3isK2c1aut8fudp/6xZJTBsv7Lv/+o+U7Uq9l87GbXMGzKJ9WNm6WMnJ5pBCfA8apYttYMjDmVBtckYVjyhHBYfHhFBNnat3zbrxqbWbXdptn+K1Z9X+kgFmKMz1L7G3VFXSjk894u+3RDqt/EB9l09DGB0bcV2a8ltZL20AZU+0/ND6Q4XRbbgT02VJZSdGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb23gxmD/ygOGVCCSLcPDFuCUZWSKS88xPNJ2d0aFek=;
 b=GBBlhj+p+JFsB1AgBKRIH0d62DuLhMh4nyfAi7ljVlursVCoKURHDwt21h5D5irD2tyoXczGCtHHj6BUQ7dGQiiX65lQS9i3shsnqcdoJ9R+hh+Qpf5gDxq9OhwjawNfWqjCV1ILiDCfEzdNlZUVLpluzbK72b4BREYm/kzN0U9S/+V2VWhr+c8JInSS4OhuFdkNVad6OxPSujL29jt/0vqOzHxdil5/8s8RRPPbdqtFQaARJjknVxCaGrno3oA7eGDlc7KXygr8xIRQg02fjSkDnALg+qZs1j4fbWrl9atpINcUHPdH/j8ZwPLjSkUDHXIbATmi7FLI5YSOm0WGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb23gxmD/ygOGVCCSLcPDFuCUZWSKS88xPNJ2d0aFek=;
 b=TAtpVKseS3EshHGLVcJLHozt/e5vZMGBCyUSM5yrfAAsVYW1F2n7wcabLh55o+ipUgRYdxS7XZ7gXjzd3UgdIbyRyDKdLx+K6WhmS1xQGg0t6lYyFwDMxuETDFoO7bLOXiU1wpk7+c0DQM8WruL7vV1Kw9Hch9PjdyNucXzL0A3KmeYPxF2iMQxRihbQEEKZP66QEjb3EWRFV95P623nBxOgTFrWh6AsF15C1lHwGTn/vffDa661IcI70Rr1nK/B+A+4U7FpbRPU6wqf/wCLACf+d2aXEBvqIb5xsImpsbtyES3rlztVMKRVORVlF+63WeJII2xjOI+Ize/tPeAl0A==
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:383::21)
 by AS8PR10MB7858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:631::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 07:30:10 +0000
Received: from DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88]) by DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::628a:d617:46f:2a88%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 07:30:10 +0000
From:   JuenKit_Yip@hotmail.com
To:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, JuenKit Yip <JuenKit_Yip@hotmail.com>
Subject: [PATCH v1 3/3] dt-bindings: hwmon: add sht3x devicetree binding
Date:   Mon, 26 Jun 2023 15:29:23 +0800
Message-ID: <DB4PR10MB6261859DA1087597DDC3CCB39226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
References: <20230626072923.340544-1-JuenKit_Yip@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [6yPhPoc4Dq5X9ZAqiDulGJ/CWar5OvZj]
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:383::21)
X-Microsoft-Original-Message-ID: <20230626072923.340544-3-JuenKit_Yip@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR10MB6261:EE_|AS8PR10MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 2699ffb8-33ba-4492-ea2a-08db76172c62
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9XmoK1BMhJ23Kz5QNzC6tLv1kWwKgcoOJfubRRY38zbChyi0uOr1OVFmSSHEV1/d1rjRWic/3GB/dCF9bBr/WlfcVIwddPvBgY9xMwmtPZR7SK7SECbNbYHbJC7RL14iYx5F1CIyIMloJEX1mtGdrzDrDXRs1ggRUbAkZ3E0l8m6Js3jYyY/ToUvmj9QwvFma/I4v1pLEd5ltGECW5lVSy6Jlyn4ERNsXCY4I5KuNrAh2M6mV+SJS46qdvIJsV66nAqndOABPfjTooqeryFHh7iaQARxYhJ4Oi3vA499H+6Z2L9rVc7FexPie9/QnRCgSdiffI8ssMU6QHAhvCNVoE/3So+vhsN8q3cv5qn1WIzyV9OIdEa+t2q+CJIiPQBJyf30cMjGlujq93Vr9nFwNHRBjOM71KP0qRI0yvxDxHy5ZKn+zSVIcCBJq6UhOHNs+JVGX41PRKyhJhQ1RSShI08ebnYxRHewgDSnbuDShO5nXkodcoEtqT8f6Uw0AxbdUT1KVimt5KdYOXRQgRFoIQ3zYgqkHmOqerIuit8LpPAx9WpqhymcclEFcUxgf+V62CHF1PcRyK0xmEeG5t1GcVRKnCRFlPTqF9WHQJt4K29tWokVVo0Xr7iWoIBTaxBx6KTrOsfbwpSMwEyQJIBSRBPQXgTFBecN6vnqkqjQBHeQMiL0GcmdPoYqWwGE7YoY6WETNi4DP0XZmU8XZzuG5mHFFXtRzdn4NK57e7xRaRLynnJDcVe/DIhKnUbbNP6iqTvo=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 193Y5F0BjDBg8jPhn7ZAePBsYoAg9QGjK67/7bqKaxTX2hxOQKGqLqKsLsuY5djpE4+TXXim7DXArjfdX1eHOZMvFO2JTlv19h01FXlebsdC+gKZ2EGBHrGUyTQVYjur0VSsAekd8xvmS8csQOwJ6XjPi9m15hE8p4JKjAXYLXA6o/00lmCK8gQI/RdkLaLxiHjV8QNvijix1kKLYv5ToQMyqVo731yW4Du9EgJ5SS3bLvOFTKJfBDW2JedanG2xDK9eneMt1CNkG9aQ7sECk1BdEHqf8KnfaAWWxxlgutdDFYHMy8qe13JQAVBrzW0aSVfogqdPyE/IUdDNLfA6b5hI4aAVFQhmgCbU/2i/KKL+geI3nUV+jAHuT3JQTDVxgEp8TnNFZKaGPNxmQ7iy2uxivprJ2oX8vMCB+RYhkamzTWNyUESrtEX54M/RV7Gsk90r9PTWIgHDAKrRsJJxkHBg1CSQm4FkxX9hLMA3p25wO1NIHTN8+duXPIpy8/98fkjzWmSbIo4PuNHuOXtx4d6McUMXnFF3nVD01qvJ32SlFQHwdktAhzMYccUGXMfU5h6oMNWQhHLwER70RP6PoWqEjBjXY7gHpo7aikf3JTvvNf+vPv1Xuhoae4AX7Ixi5IGOSwJwfKg9ntSPjOB5uw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u4wjkH92HYojTuFd++E2n3l27NJ84swEetmuFtq8+jZpppimWGJ4PI7oDw1d?=
 =?us-ascii?Q?/WCi6K5kcMAoE86W2AM+DKH1QfEGf4jCl7rpYfQnIotlX5fZ3O0b+PPI91d4?=
 =?us-ascii?Q?BpY7y4nFoEmcfBLcZUrD+yD4NsMrlOlFbM0t1JUCg7iqfZo3JfjRwsjovgWr?=
 =?us-ascii?Q?cHSr65F5us0HN1aG85ySSfEdL+J84XCETuERZNpoTzAvwBUR4YFwer0Z1y/s?=
 =?us-ascii?Q?HgM/5KmFmlZlGT/kdXqkEWfDFmH6nCseGDzxJmM/iuxU6eG1L8L3eW9epyoN?=
 =?us-ascii?Q?cz98qTAqqRUFnGWAc00hgDnpXnBWn1y08Gy5hOxTUnfTJekhKf3SEEjQPyBg?=
 =?us-ascii?Q?aR6wFumRZLKDxMeDyHFOmgZayxGyAvPPQ/Nf8jeaO3h/tVCPYeq+QndKKFZW?=
 =?us-ascii?Q?47W9WBG/IOQ4YUFlvxJK4NhHTlln4R+iUshcpTAEXCdnUxpwXuSqZ7ilEh/P?=
 =?us-ascii?Q?CB2ZtH38skNSCDbIouit1okZo5yEw8FUt0OC1wReKV8XheZCWvi7nwwIy5e/?=
 =?us-ascii?Q?v0iJVrITHiRjCAnK+F+3Ndfi9sQ3MrsxABX2rvGHTw+2WLBr+McFLlaO2qFD?=
 =?us-ascii?Q?+llxU/lJjTtR/T7emaIX94dPzPNU4RvCntjn9rIOuBrI5vSBLoHsZftIbNEp?=
 =?us-ascii?Q?owkOHOqMtQ92m67RWXUDRAViI7vhGxFz8I7j1rQHaTuSFofjNpaYVrGAWJLH?=
 =?us-ascii?Q?lZOuS+DpVaN13IuVyNQ6Nd5Wh00HwZLa2RnKlHYOU1DZ/YzBj/8opDVjUuNX?=
 =?us-ascii?Q?ocktaDPmyLoePjignBHcRYq4fBbQSxkb4zpMZkmOPr3w+SL0MMO+NTjbqdTZ?=
 =?us-ascii?Q?U7AynCAt1bFeQMn7EjJUEC9AIwUxRkvsRszEO8JsUw6gxCbpsuvc6X/Oeleg?=
 =?us-ascii?Q?4FdPZmt2PbM6yJHKIBqi5QlmmPe934U8dyh6CfoFvixwNogDI+qNp3Ut1JvJ?=
 =?us-ascii?Q?cTyFpI5k4SHO8zd5P+5g1RAhzc8cjEBHdhRyCf0AekqpMbQ4P+plbO0JGVtE?=
 =?us-ascii?Q?Y6I4dClOSHd2Qy6FAosyfP8dDmPmX4rhTpUlktptVykaGrePIcBMqnt5j+Go?=
 =?us-ascii?Q?JfMG9QLKs9VsuoDumqcG6Ib+2PcI2Xjr3TKauNupUNsw5b8zETh4ewJC+n52?=
 =?us-ascii?Q?a7VWvOpTlFhKT5bvRfBCu+hIMW7eUS7wloHcrTeygMYaWbYw/TV9dg2BK3wU?=
 =?us-ascii?Q?YzLHd8Q1lirfCI4wWFjXBG/utp/+rfdYaZgB/0BwEn5AjTVh7ebNK8Vxywk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2699ffb8-33ba-4492-ea2a-08db76172c62
X-MS-Exchange-CrossTenant-AuthSource: DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:30:10.5842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7858
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: JuenKit Yip <JuenKit_Yip@hotmail.com>

add sht3x devicetree binding files

Signed-off-by: JuenKit Yip <JuenKit_Yip@hotmail.com>
---
v1:
  - fix semantics error

 .../bindings/hwmon/sensirion,sht3x.yaml       | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
new file mode 100644
index 000000000000..71a50bd57af2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht3x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SHT3x-DIS humidity and temperature sensor
+
+maintainers:
+  - JuenKit Yip <JuenKit_Yip@hotmail.com>
+
+properties:
+  compatible:
+    enum:
+      - sensirion,sht3x
+      - sensirion,sts3x
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
+      sensor@4a {
+        compatible = "sensirion,sht3x";
+        reg = <0x4a>;
+      };
+    };
-- 
2.30.2

