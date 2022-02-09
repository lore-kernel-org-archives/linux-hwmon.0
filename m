Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F941C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 13:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbiBINhR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 08:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbiBINgt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 08:36:49 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80098.outbound.protection.outlook.com [40.107.8.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CB0C05CBAB
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 05:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYnxi40T8RzSDxRqTP7TQje051lEb1jIdlc6F73nMiopnYcdOsywVHcle0vFeGt8sRt/rSg4F9UQGyB3HUs1UOVOwwIeFAs7dVry8kq9l7BqYS2C5KNdPlU/iM94xqmEdbQFWDik10qNTz994ZjLExM2dEk7/eczkFUypgYOqrqVZlVzTtZjeUqcOr7xq9RU0FENxPOvDTm9s1eYNDSF9o5EvYUWvqvw+z7MThVNwoZ12sf4KYD6KbZeffKRV7nLkfVclOdjvN3wqe9AepUPNz/usB/2R8Ec6iY2QxvNxWca9micdYqG7S8CiCwRauxDyK4AfyJyKF1U0hxMGOSvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siTEp5PjUgnJCrLh7O4d69TPpphP7rgQw0v7uJOdH6Y=;
 b=Aamzov0Xc0lstBbERmq/GwTSxY/szFldya+7xxZnyDKCaHhSvySKS/TPqJhZqQJelYUpDu910YspZHUbMsD5QkPfJfD2+jw5DXbXrlPoS1xnBlv9Xk7cYEs6zhylFCWOhgl8JgmytSrQA45gWKwijgCAUc5vCeXTwdgv12cSDD4VNkBEPPoylqjeVlkrr/OavIujzz2zNVqo2kKk/42uW/oJcJ58peVVedm8k5ZGEsuOOTCKZGyZlOyDRRYnPCOa27yioQfDYn/sMGIjTMVeacQ6QgAs3fUqETHqlOa2SA5l2xYSYHwdvJMXuURGsF7jyqqOE7te6oBxwJYulYXiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siTEp5PjUgnJCrLh7O4d69TPpphP7rgQw0v7uJOdH6Y=;
 b=blyXHV6+EX5xQGqwfjUv4DWyIY8OG0P/cmgfYpuRW9R2gQx+F1WrpMYR251GdQTNx2Ndt/72cK5/rFTuv0TH0gTzZkTo9/cfDBx+N5WpS4MHErorgD6crnx6s3IV5jAVSqne3WEQ8tuiVV1tEYjDTeRGUuNtJEAxV+2SfVO9U2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com (2603:10a6:102:7b::22)
 by AS8PR07MB8374.eurprd07.prod.outlook.com (2603:10a6:20b:445::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.8; Wed, 9 Feb
 2022 13:36:31 +0000
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab]) by PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 13:36:31 +0000
From:   Agathe Porte <agathe.porte@nokia.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Agathe Porte <agathe.porte@nokia.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: add tmp464.yaml
Date:   Wed,  9 Feb 2022 14:36:16 +0100
Message-Id: <20220209133617.67297-1-agathe.porte@nokia.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0013.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::18) To PR3PR07MB6921.eurprd07.prod.outlook.com
 (2603:10a6:102:7b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37692326-b457-4081-00ba-08d9ebd12ed9
X-MS-TrafficTypeDiagnostic: AS8PR07MB8374:EE_
X-Microsoft-Antispam-PRVS: <AS8PR07MB8374BFAFA5FF418E6476A0F69B2E9@AS8PR07MB8374.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdtqA0brj4FQ6wTZySyU8nNasvG259K9k0gxmE+bLQllWc0Bl6jSOwvWBkfFrWZpR82cTuxTPg66SkiayT1+df5cyxEecB4gdWohAwhcuG2ccmswBsS3pn3NviZgEIsVH5x+I6jWaf/zWtxdDoO3iL1hj9dfOuCR/Akssko9LpWfZCm8UdSQIP9xRDfpjDt3KdrSFvqOIF8RhxO4E4bwM/RvOuligfzbxHCV+egv3PTZjIH+XMrJtQGM+6C1vYHu9Gn+kvvYptPnRjfY46JHEabPBCue1+obrVykYJcsR3j1BZ2KzrNSyu574PoikCXbzpCIIXHWXCMOf8GF3bXSKKTJRl3wMVUWmq/oofrhP0dLhlpiw4W6V4DzCerInx2EzMS84nv8zZJrzTRt+1Y48aMFqAiVfgZBJxkdp+JTSxvKZMBy1MxK8ITOoiHGvnYzkWTimRiLdyVMBRhFfEJVgA6p+a/topxI4tAYQ+gYPRi1ru/otYCu9/mo78rrT5dD7TPIr4LNamuP9cPmK7bAGjmafsf3gRgJ+fKFGyKKXMrxPX1um3GvpYi6w81HoU5FskTUG0Hpx/g0zKO0J/oyq0XXipXhuSOteHys/U9mO4tEeH1tNvp6+/tVQzB0kwSuWTxivb/ynjm+bAeNPfpvb3gdfSG2pxnMjB264SFzLgj0dSpkRtue0yihY2Fan/MCFxGGPRAWLQL2fOKT0gEHCAOm+UxXIVk106uKYiMKFkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6921.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(36756003)(44832011)(5660300002)(6506007)(26005)(8676002)(2906002)(4326008)(8936002)(66946007)(1076003)(6512007)(186003)(107886003)(66476007)(66556008)(316002)(38100700002)(83380400001)(82960400001)(86362001)(966005)(6486002)(508600001)(6916009)(54906003)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmZjQTUvRE14VHFqSDEza2orbHBMaXZqOWRlWDhxS012dXRKNEtrVWdtMUN0?=
 =?utf-8?B?Unh6d2RTc0xiWFVIeHhITm1QNWVVbGVrNWYvcFRIRXBhTjFFcGNCMllWL2I5?=
 =?utf-8?B?OEpkSGhUZ3Z2LzUwdFh2bGJvZlU5UEQ0emtzam9EL3pkMkw0RFlvQzl4RUlX?=
 =?utf-8?B?QlJrQjIwaEZFUXFuRERNVkhOcnBrK1BuVTR6bFMyblNGanlYc3hEZ1JYcElh?=
 =?utf-8?B?YmJuem1vRGlhNkl5UWgyOFdnZmdya2pBSU1kS3czNDh4dVRIQUwxdlExdVlC?=
 =?utf-8?B?eVBWR1V4SnhFblNSZm1WZmVPZ3pvNlR6QWtEam9xb1JZNTNQbjdkUHRLaDRD?=
 =?utf-8?B?U2tRTTBYYnoranpxbmJUT0JuK0o5a25nVGx0b2F0clJOTFF1OCt0SkYzTzRz?=
 =?utf-8?B?SkhjclQ5NTdWYTI5dTNnYTNRUXpBaktMWFpubldlVlFiK2RlZE1vRmc5WTha?=
 =?utf-8?B?TzJpNU5mN1dhVktIWmhvRkdwc1Bwc3ZxSFF4bHFvRlYyMHVJK0NhdTE3bm5F?=
 =?utf-8?B?c0YzdkF1bFhpT0p6bUZsaFZtM3lxTm9ydTkwUDFCUHg4OWlNRzdqUTd6T3Y3?=
 =?utf-8?B?TlJGbmU2WjdXSzFmK01QaTNDQUtyUEhvTGozTm45YmgwM3FrYW5LdDd5dUdG?=
 =?utf-8?B?aGI0ZGRuZ3djSm1Md1luY2dFV1FMWFducEFCSVVGOHJvZGNyK3dMMjNUR1k5?=
 =?utf-8?B?SXpaOGg5dWNSY0p3VjZSV0tNRHh2dXFqUUhHSmdzUlh6dlN0b3BTdklOc1JG?=
 =?utf-8?B?OHB2bXhoWWJycEF2Nmc2YU41Q3JWbU9jTXhTckFPSFJjNGtDQmpXYzhNMjNp?=
 =?utf-8?B?UXFSWmhGT2RLbmhwbjBTcFNBeVFJWTQxbFpxTDdxSzhWYlZkVEhzQS83NVpG?=
 =?utf-8?B?a0xQRVRjZFJDRFdseHhvYzlwQXg4TFl2RlMvUmljdldId202TE16ckJQSW5B?=
 =?utf-8?B?MFBtSjZiNXk2SjdVcWE2ajFGczAzWllNaHRMZFRONHpueHplSENYS0JxeG01?=
 =?utf-8?B?WXNDNDVVMGV0VVFkY21waXhrN0xSMmRpOXExTHVjVzNVYVVWZVNwT2hDQmI0?=
 =?utf-8?B?NWpya1BHZmxyQVFXaVQ3NWpqQVhVbmNEa1grWmdkWENDQng4TkJmcFlYcDBy?=
 =?utf-8?B?bWFxK1ViOGlWTUdZTUhBVDdhVFQ3dXdqUkdXQnNBVCtBZWNNMlFOMDZ1UXow?=
 =?utf-8?B?cnZLUDRlaVVveFoyeWxQVC8rTDgzZGFGYk1TMFEwYUZrRGdrWXE3T0JRcnJT?=
 =?utf-8?B?QmNLVC9ubTBsbzEyRWV4VC8yQThuQW9RUk9ScW9iVXFmbk9jMWZHQUFZMmlJ?=
 =?utf-8?B?M3NkV0RoYXFhL2ZxYXgzUHcyVk1YLzJqN2hKVVJMcnpRTXlyamNueTB5SW1n?=
 =?utf-8?B?NFNNcjdDb3dOUWVqM0RXVzZvYSt0TUI3SU85bGVvWU1GRmJURGZBbitNNWZM?=
 =?utf-8?B?RjFDYXpOYmE5eVZQc0ljb1dCS3hPZGZKeHNxU1luMzhpRk4yNkNHYzdqM0g0?=
 =?utf-8?B?dW5FVjlXbUp2NEQzenBZOUE3Tlk0cE02QUNOMFpkbC91MlVKRERocFBWQjVR?=
 =?utf-8?B?SXd2bk5DSnM2S1dXSDhYT2VXb21ENjdnc094M1ZDbThzOFA0VUM1MXNnU2VP?=
 =?utf-8?B?VnBFSFV5NmM4QWprejFZSmpreE8zN0hnMW9vSXU2cDhOMC93cmNPZE5CYU9S?=
 =?utf-8?B?M3o3TkVvcHZSZWFnMGdtMGVLblRIdWFCYUx5bUJXZkdhS3ozRHRWV0JuUnFv?=
 =?utf-8?B?Z0xqcnFMQXR6OEVQbGxZMG5TcmR3b0ZBTXpaOWJLUWdnYXNFcmozV0wwdWdr?=
 =?utf-8?B?a1BFRFkzMmIwOFloOW5EU2ErWkNkVXdYbkdiUU05eWRxdU5wVTZMM1ZkUmNn?=
 =?utf-8?B?YkRXTDF1RmdhVVBqbVNWdE1ya1VhMW12ck9hRTJZMGtvbGEraVgyK1RLMjRP?=
 =?utf-8?B?Ym5FalpRWUNkNlhON3hhZklwUmx3cjJHTHB3dC9RVWd0UmZxL2N5VDlydVgv?=
 =?utf-8?B?dkdGNDl4SFVKUlExRzNzM0tISDFxUzF0SWhlQ0FxOVgrZVJZWHFydk4xeHNF?=
 =?utf-8?B?TnVERUJOekU5QzlabEZDUFRzNkwwbmpQT2NjbzVCd0NLcmROaHVpZzVZdHBj?=
 =?utf-8?B?L2hPZGdTT1YzSEdVYkFNdmtHOFJhVzZtVm1Na0hmeEY1RU9qME9BYSswZzJr?=
 =?utf-8?Q?YA61aTGUhSYyp2Bw4IcfJeE=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37692326-b457-4081-00ba-08d9ebd12ed9
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6921.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:36:31.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwExwM16nZRTvrRLF9u0XT1NJWZg4qVaQzN1JZN0XvK07U7W1cfZRu4ivNx123poh8Nq7va8ArqyZgQEA22AWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8374
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add basic description of the tmp464 driver DT bindings.

Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
---
 .../devicetree/bindings/hwmon/ti,tmp464.yaml  | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
new file mode 100644
index 000000000000..aaee652c0067
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
+  - Guenter Roeck <linux@roeck-us.net>
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
-- 
2.34.1

