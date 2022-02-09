Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5E3C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 15:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236316AbiBIPxb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 10:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236319AbiBIPx2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 10:53:28 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80132.outbound.protection.outlook.com [40.107.8.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37880C05CB82
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 07:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiVBYA28z3Jk5Jbs875NBmIvvM0Vx31VdblDDcizdptLDe9jMTr4JS500Ve7F26wy9FWzpimyufFTQIq5xa/GzUwECaRYXylrYqxJAN/5aWEZralBUrzKzrro4m5RhJZdLYgKmJdk+oRIH36qFaxRqHeM2zNH3LQIWvaa+z0zk87esbhwOrAUrHrbPn0aTUBAg1ZHkUmTkCxmOwEeeXIZBL9dIDfMSZW3nNYa3mltIGFY5HbrH5rjw5PtFNaTzbecIGCrKYpShOVph7nXEm3xdt0mjAiQIPm9xjW8d4sNzK73zvWW2pK1vwQ0LBZKvIl0D433RXZ2TSp9duwnzXkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu1STLv7KXcIh24/bT2J4P37kmjIyNblxS5mx2MkaMY=;
 b=av5uwshRsbCEbUS+9u4spVV1juhytFKCeQSiiPzyhUVVoE6u5pENpnXcU9bI4qs1yaDiTPVbFL4s3dW9mF3vQmxF1NiGLIVk/meQhCQSeArnxBMSd7d/4x9WTaOw6RIUG6BtKqr4LhOq+7P6E4VKUTV6MT2PNCrj5I65w4wBGEFso2UGopEYXUjedB4EIkIqkatilAkWHeMCa1UZTmtihmrKBmejEpJ08Tz4yLgMr5ReMz4w1OGXBwPeWhDCWTDrEnRKW0itFfRovRvbPkXkUjWFP8m188GIMXMKHjYldIl94WD9O9bXY/k5+useGOTAwIPlukVKTCyaQkSjrlCKDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu1STLv7KXcIh24/bT2J4P37kmjIyNblxS5mx2MkaMY=;
 b=h0UYyMw8ruIQKagm5LTdvKGS1sq2Vr4pgwDUXx06vMJ6eU4zq+ScSxGkfXwkq1buERbx+C44hPO0LH7jarEkXSM7ENZasw+H/Z/FGQwoo9jCAvceJKc6ZNZqHm8RE0SswkuaKWDE4BiOft+pBx0BJIYSsHq3pvnGg/Ym0ioQeb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com (2603:10a6:102:7b::22)
 by DBBPR07MB7627.eurprd07.prod.outlook.com (2603:10a6:10:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9; Wed, 9 Feb
 2022 15:53:28 +0000
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab]) by PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 15:53:28 +0000
From:   Agathe Porte <agathe.porte@nokia.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Agathe Porte <agathe.porte@nokia.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: add tmp464.yaml
Date:   Wed,  9 Feb 2022 16:53:07 +0100
Message-Id: <20220209155308.88938-1-agathe.porte@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209133617.67297-1-agathe.porte@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0286.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::34) To PR3PR07MB6921.eurprd07.prod.outlook.com
 (2603:10a6:102:7b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3d0c786-a527-45a8-6c24-08d9ebe4509e
X-MS-TrafficTypeDiagnostic: DBBPR07MB7627:EE_
X-Microsoft-Antispam-PRVS: <DBBPR07MB7627AEFDD6B5DA83E4A56C489B2E9@DBBPR07MB7627.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRFVR0vXRFwmbBLQlS9E4Cl1P5r9r9Tv0FFtBNOnv2uLoXhx4BkOytba9GGzB3NsqszgoJUYenL8wzLiOaFRa069odRT8q2E/RsFvuK14AFb/fSHKhITsttO0YevEX6ftkn1DVmAfmhwgzLyQoBcA8+QqR5uxlCbqs0DjE8utP9muUxT+UQs3yL3eymMHQo5sQ6Sgmtu3rRUQK+e2SsK9Q9EXrLMn+lIQE0b6ASPWRqr0zFGobyVVqVsGjAVTkEnfjFva1fjilMLa9AaZgaUWSRE/uCRdQbCl/wE0+P2s5n7i6ZhcGBrpSAQ/S+lHid0VwD8UzHV3icoqVmzMYznFOPxEphfAU/j+nw92No7FW9rFI2MNJZ3T/MQbNmkniYdYiVv6y0eHj/4Gj5EIaT/RWQwoxxlwoROjdiayRfoDXNAyotrrQGZ4HQ/zFOygjor4mWzGx2Sx12Pao96qjJn8XVZH55gGoVzDyH4hKAnuDhOPtdlLm0Ndt08RtTLYI8gutZrQM0COoigipwHEIULqDomMUDgPd+kvlI0rm5ITbNw/t/iIuLrma596kBO2W7aMDqP8VasPpB3nzDrWO0nAX1BPzQFmCqqkgLqp38qT6Zltwqz6oS4p4Td26qaOiTo3LZsOj2TykyToViC+HnVrfTKoXJqULS8ZoTNEJz0QjTePLBpfv5TA1AUrtKl/QBviC1dTb//S+Na3Rv04XAf57Arqq7zonZrBrt4B5GU9BI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6921.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(107886003)(6506007)(6512007)(4326008)(44832011)(36756003)(6666004)(8936002)(1076003)(86362001)(5660300002)(6486002)(66946007)(966005)(186003)(26005)(66556008)(66476007)(2906002)(6916009)(82960400001)(316002)(38100700002)(54906003)(508600001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2ZtcjNFSkltb09WWXFxb2ozZ3N3Rk0rakVyYXZmZDlqUUIxN2wxRWhuTy8r?=
 =?utf-8?B?ZGZIcGNSQk9zb3VrVnVrc0dkM2RoZXV1ZTJ4cWNWV3NiWFpQWWtMbFI0S25v?=
 =?utf-8?B?a0hoK0E1S1VteFVkSHJTRnpsWDRVcWlIR3Q0OUNNWVR6LzlhV2hxSUVBdzVD?=
 =?utf-8?B?OHoxMEVYVWRTcytNajkrQ2U4c3o2WGpQcG50OENIK0dOUGNXWVhsclVPNFYv?=
 =?utf-8?B?cTVJY3pYa21HRWNBTFYwUlBFSlRQTmluTktkYktkU2JsZVpiOUtJVkJnZEU2?=
 =?utf-8?B?SFR5WVJtOTh1ZHJHNTNUeDZwSkFTNXo5UnVxUjJwYlRIRDlmUzhMMTJjbGtT?=
 =?utf-8?B?b090TlJPd2pSTzZGcGZtSEsxVEtoUGlVMGc3ZkQyY2hFVnAzS0VGa29jQUcr?=
 =?utf-8?B?aUZkSlVtY1l0bi9reUNCZmRIVUpHckRiZmthaklZZnMxa0l6Z1dFZXRaSmsw?=
 =?utf-8?B?blY1MmRDZFJWQlpxUTNKWUNUZTE4SkFIL2x2ZENnSTVqM1pWcXMzNDIxdzdP?=
 =?utf-8?B?QVpXM1VreDFGQmhCLzlrQmU0NHZqUnlVZUllaTNLYndsbGNhWjJ1Z0o2ZEtq?=
 =?utf-8?B?MkhXMTBnVEUxVVg4bGRkeVpTWnVPMWRiNlNuUStxWG8zUzhIUkx0dFJmMWVU?=
 =?utf-8?B?RElGV2cwZHg1alVJY3I3T2NTcHZ4SEdGaDBPUVdGb2xhK2VTTGNrM3VOSG5v?=
 =?utf-8?B?K2J5RThReHNEU0ZNQmNESmZkaHV3bGxQYzRMVHI0dEpkUVpuYUE1Z3lQcGNk?=
 =?utf-8?B?Q0xkdUQxTXpwYk81N21TRTMxTlFzRllhZG5EQWtHWFlyUWd3V3kvSnArVElW?=
 =?utf-8?B?SXJRUmZHV0NzQkp0WTl5ek5MaS9XTU41dlV2L0FadFlRYThCWTl0SERSMHd5?=
 =?utf-8?B?UG1KbkpuUk54bDErMUxPaFNoWktFaXJ6N241WTVxWXl4Z2R4NGlzNG1vcFJE?=
 =?utf-8?B?T3JvS1VHYXcxUlpFOEx1ZFVaTm96WHdtTk8xQzNvcitVbVpjRVdmSzdOR1Ev?=
 =?utf-8?B?aUY3cHdUYXNxTjlCd21VOVRibE1kVWh6MkwzQlRjbHVMWi9ZT0FBVWhhVDBm?=
 =?utf-8?B?MDhNZUJZL0JZNm1hbVMvN1JmNTFBQnE2Ti8wYURhUUdEQ1dDM1dGTHVZZHho?=
 =?utf-8?B?M1MyZEJnL25LQXhHTFdUWXp0VVpGMDk5NDVaaXcwREdJMktJZmlTL1p6NVd3?=
 =?utf-8?B?bENIUHBVWmU5a0tUYTBENEFHVmdYc2xiTHFBTDAyZFowbU55VjMxSGN5WlRt?=
 =?utf-8?B?bm11Yk1TVDRnTnQyNTRkSzhIdm85K0JRQ1VzQUF1WkM1aENNYUZKUmZNUTR0?=
 =?utf-8?B?U3JMVllYY1FwQXFlV2R6b1gyNFJGclY5cHY2OXM0blorUDlOUHN3VjZpWjAy?=
 =?utf-8?B?Wko1WmhJZ213cjBHTTlLYmk2TVNNUCtFS1N0TWQrT204MGIwcFY2eHBTbWVo?=
 =?utf-8?B?Q1IvWGtGMkh2TDh4a3hkUmxDWjRYUmwxbEY4S1l0elBHUzgwQWZObTlZV1NR?=
 =?utf-8?B?bG82Sm12YXZwb3RDYWhqY0FkV09YRDJGMTRISVdxRzhNMndwQ1Nkd3Q5Ym4r?=
 =?utf-8?B?Z2ptWHRCZ1VkTmZEcFlUWVplS2hCL3BmK1Y3aVVYS3pDdkdWbjJMaXk4c2RP?=
 =?utf-8?B?ekpIK0ZQa1RvaDhweDNnWXFXM2ZVU1A4WEEzcGVva1laQWhUOWpadWVzRVRt?=
 =?utf-8?B?STg4cTlnR1BiMEFrR3cxR2l3ODBnYjBsNGM5RXMzaCtnOUcvMG5sUGYreDgy?=
 =?utf-8?B?WkJta2NubkhsSWE5ZVlQOXN4L2ZmRGVBTjh6VUdzUjhNbnVpaUMzc0FOeHpC?=
 =?utf-8?B?NFVGZzZ2NDBSdi81WWtyTDRMOGZ3cEk1OEp4aHRNc2VENDNWb1JRR2tXMGJ6?=
 =?utf-8?B?TTlucW0ramtOcTlONEV2Q2VJYSt6MjhjRHlkRVBteE85Q01uaU9lL285a2Vz?=
 =?utf-8?B?Qm5GKzA1OHNEQkJBbm9HWk9Na2V4SllzSzI5SE4rWUlhWXQ5bStDL2F6TDlu?=
 =?utf-8?B?UnV6WnUzMzdoTDVkUWN5dHVoSURSaFdKWFZDSmJDWGpneVEyaFhWb0J2L2ti?=
 =?utf-8?B?VTBoNmNaQzhMb0kyd1d4U0RkRk9MRXdNcTRoN25OOVhGWXBta2UwV2oyUm5L?=
 =?utf-8?B?MVRBMmNsWDR6YUV2a1pWNDUxbzVicnRkVHRnUWU0TjhpR2NDUy94KzRvdTNY?=
 =?utf-8?Q?7WCVZICUlPVPsmy2g6gXY0c=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d0c786-a527-45a8-6c24-08d9ebe4509e
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6921.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:53:28.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkuvHQnqK72MNK8nRwVKDr3uYdit+TRHjiHQ80B1tfAK74gphF/RH/Y6MZFKWd/uyN+MZ2+nUa14g5TqfvrJOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7627
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add basic description of the tmp464 driver DT bindings.

Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
---
 .../devicetree/bindings/hwmon/ti,tmp464.yaml  | 106 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
new file mode 100644
index 000000000000..8eb43e82f5ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,tmp464.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMP464 temperature sensor
+
+maintainers:
+  - Agathe Porte <agathe.porte@nokia.com>
+
+description: |
+  ±0.0625°C Remote and Local temperature sensor
+  https://www.ti.com/lit/ds/symlink/tmp464.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,tmp464
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
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
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@4b {
+        compatible = "ti,tmp464";
+        reg = <0x4b>;
+      };
+    };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      sensor@4b {
+        compatible = "ti,tmp464";
+        reg = <0x4b>;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 3e461db9cd91..136cd34be715 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19457,6 +19457,12 @@ S:	Maintained
 F:	Documentation/hwmon/tmp401.rst
 F:	drivers/hwmon/tmp401.c

+TMP464 HARDWARE MONITOR DRIVER
+M:	Agathe Porte <agathe.porte@nokia.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
+
 TMP513 HARDWARE MONITOR DRIVER
 M:	Eric Tremblay <etremblay@distech-controls.com>
 L:	linux-hwmon@vger.kernel.org
--
2.34.1

