Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BA1C07E9B
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Jul 2021 05:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C68986113A
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Jul 2021 05:58:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237515AbhGTFRf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Jul 2021 01:17:35 -0400
Received: from mail-mw2nam12on2083.outbound.protection.outlook.com ([40.107.244.83]:32096
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237412AbhGTFRf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jul 2021 01:17:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3cTQY5GeFPuHe8XZ5EvzcQy98Bb5jmADBHhi6e0Mf2Bf59TODF9Gm6EfYPjPHWRLG0hT2PGbIqW9s3RP4BYDbhUNO2TYAYtoANgsZ24J+8fpG8f/mQWcUOamH9Xpe42zELz7MdOrDzWgkp4X4ZCr+iXBU+Q+NzIdQ9JxZ+vAT82Z+KMgOUI1F2ix3Rx++NU/iGn7jlNzqROcwYicenHk6hNLe1oWtnobo2LWrfjhJg0unzTAWG/DhIQOp0aqBa2wPC1raPwADoRqCt39OWNKT1PMkHo0uUeBT2RgwumeYPrqny/472NuWSrSCBddJNRydsOtvmSwnwU+0UNK1im/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoJyu5e68HRM77hIpMy09/puLXX4w35gtc23r9I7/h4=;
 b=FiNbBtioRhAF+S3dVYzJ81vZFt4xNivNfC03wwpq8gyFF1VYmOQznhjIpLrAJS0KbBt/fFhNyGkIvmX+Tn72LgzaSX884HCQOZHwCKIWNVDnkc58+qTUIjJ0scDwaF9MmCVloC1Jd54zQKabl+1+LoHxCt/BiWe3iCTnyG+8sI7Ie1QkQ1Vs1SXlq2NeIuMsknS7mxGbsYB8N9lpjJOJY5tSO0oWF2hq5JZnrwLUO4HJCTRPJgK1xP82G1YhwLZ3xvthaaBi4HNTe97ih1mVz2nrdsE+W+yV5QM7ym3qjx5wfKx984VLjLxW2L0q5q8U+8QlDltUApLfUOZXaY807g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoJyu5e68HRM77hIpMy09/puLXX4w35gtc23r9I7/h4=;
 b=ClhM63dO7uEcmAD+aAbK0EvmLsh9IXaTCo2xeZAk/EfJye9+tL8adNYDYtqGTgQWXHJRgsPtrArC5SvvcxH5fdl9cxNiGEy++D9v1kJXUTX+IkFO5jh5l/unABCCL9T1REOlGIfVfF7LDTc6omV1v2rAZplo5AcMUHCdLhDIx5E=
Received: from BN6PR14CA0038.namprd14.prod.outlook.com (2603:10b6:404:13f::24)
 by MWHPR12MB1421.namprd12.prod.outlook.com (2603:10b6:300:12::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 05:58:13 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::89) by BN6PR14CA0038.outlook.office365.com
 (2603:10b6:404:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 05:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 05:58:12 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 00:58:10 -0500
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     <linux@roeck-us.net>, Akshay Gupta <Akshay.Gupta@amd.com>,
        "Naveen Krishna Chatradhi" <nchatrad@amd.com>
Subject: [PATCH v3 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver bindings
Date:   Tue, 20 Jul 2021 11:27:37 +0530
Message-ID: <20210720055737.8666-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720055737.8666-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210720055737.8666-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81635d80-e8e3-4453-2c28-08d94b435bcd
X-MS-TrafficTypeDiagnostic: MWHPR12MB1421:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1421C789FF7CD038BE0C88BDE8E29@MWHPR12MB1421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KlqkpXGZrBwJ/xQEsYq2fOhF2DyHq8JzhEA2leizztFIen6Kmeh6tf3LvG2dGUK6vM/syq8Det/bnKmCQz1RIhV2s5Z4M6GTEo2OA9BFYV5lZqVk7atzfjWWfm/V+tJFIrIog5cW8TYlWPUzp0mFeanb/jjQCJz1K1DDcsO5Ua38xsU8M/62JaVVzPMU9XkNBIYqJpFPB3PUs2zakqjD2kWyh7fI6W0LyF/Mxk85O1n4FsKyywHaZZT4ZO6+kAJoYjB6xtLGvWWSbdeCwVO4tCeXejY4tPycY6WMJnT4rwG8KfJ5nb//9pR/Sw3zqhItFHp5J75kSbJyYqfHp2jGpz8W47ELds/cz3tkdazy/8Dql//ovRO5uD+Qyh4IAa2AYLXwt0ZdQ/w2/78ByDzB5ne1iA26KmWGg/oBFC6AJwactpgA/zhh9BzO7HdsuLtYz/iW8S3Tr1g59O5imZs5ENQJoTtCtqZA6h7GAzLgweBXESVCakjHantQ13yaPFTrLA+mJnxk5iJkcTrepEnbAxaB9YBpqQWPcAhJ9NRIfYoSZi2X5bRBfQ/hz6cnx6VxPp2h+VrBIKd6qSHbPmeWfmUbsyT5cGAoZUI3buytv4dx2laHc3UVkFPw63kPa4+tWBW2zwUW11MisFBed0ugsaM/1RSwyG5PSYuqAGmy+drcj8g0UXxbq4SIxX1rU6xmSQuSKUZZEooB4lOirKRMMQtP+Uhh37AbIe71a4cSJnCb7HYZUy8xJpfjnt+Mg6mkibd747MiY5Kexvour4PVIU6WN6ld/EpK1qTsfBsNfimDRR9mDRUOfRMaRvpxdX5F
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(4326008)(8676002)(6666004)(83380400001)(6916009)(36860700001)(47076005)(2906002)(8936002)(426003)(1076003)(336012)(508600001)(356005)(16526019)(316002)(82310400003)(2616005)(7696005)(70586007)(186003)(70206006)(81166007)(26005)(54906003)(966005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 05:58:12.4171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81635d80-e8e3-4453-2c28-08d94b435bcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1421
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Document device tree bindings for AMD SB-RMI emulated service.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v2:
None

 .../devicetree/bindings/hwmon/amd,sbrmi.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
new file mode 100644
index 000000000000..7598b083979c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/amd,sbrmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: >
+  Sideband Remote Management Interface (SB-RMI) compliant
+  AMD SoC power device.
+
+maintainers:
+  - Akshay Gupta <Akshay.Gupta@amd.com>
+
+description: |
+  SB Remote Management Interface (SB-RMI) is an SMBus compatible
+  interface that reports AMD SoC's Power (normalized Power) using,
+  Mailbox Service Request and resembles a typical 8-pin remote power
+  sensor's I2C interface to BMC. The power attributes in hwmon
+  reports power in microwatts.
+
+properties:
+  compatible:
+    enum:
+      - amd,sbrmi
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C bus address of the device as specified in Section SBI SMBus Address
+      of the SoC register reference. The SB-RMI address is normally 78h for
+      socket 0 and 70h for socket 1, but it could vary based on hardware
+      address select pins.
+      \[open source SoC register reference\]
+        https://www.amd.com/en/support/tech-docs?keyword=55898
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sbrmi@3c {
+                compatible = "amd,sbrmi";
+                reg = <0x3c>;
+        };
+    };
+...
-- 
2.17.1

