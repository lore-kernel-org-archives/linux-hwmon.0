Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC747C432BE
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6AB260C51
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhGZM4Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jul 2021 08:56:16 -0400
Received: from mail-dm6nam12on2058.outbound.protection.outlook.com ([40.107.243.58]:36160
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232527AbhGZM4P (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jul 2021 08:56:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Srx5/xfyb06XVycsuWWHhnz/4k3CWuEkpoKddQiKN5l9+kCXHJaHyMXgcM/UAzBb/F0Ab8G7o6Y54PkCPrsxp2ZUTnM/w0bwoU48Q+gJq6K/OuHNqdhmzPwhBHi2yaG1GR77myK1PVLLbtWtdJGPkFm2b1YowyUCR/qc6V4cULEJWNqwkxdoIR5Ca3Z/w+A4M+gYOPLgdX3qWn/NGD1TT33QIs+m7MGVs4r495NO+unkqGpP3zR9vIXkdYs2WCDqqWnGQ+tx9RScd6lL/a9TtPKue9dspwy+560agZn+fHSNK9i7Ew0XJxPPnpARxECX8q9Siq1B0xe7lxjaeAYU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyTJOZHOhVaO+t4MTcz5G7me7LAA0+sQ4qQYFzQXi4w=;
 b=A2ghZD6rPeYsYvSFBjbPkO81ftVKZMOG1tpNZ1tye06hnWItphEungcqjXQiouBzhZh8v34o3Xjpl2hd+mRNU51J4NbsoTec0EPm8EH3hAOXk8KI/l0WgYsfxZFcm8S7gKMm25gJ9RPU0j+FYCM3kvqndzeyjbBoqURH+q5pR4jcCevGgf5gPH6HUhM5dKnQnrEcOceoAiLYnN0MzDatFfbDYDx/+wLJEDEKgA9ttWEZaCeCfDvb0DbS3N/OZWFSI+GlB4BUzc+On6nHxjxtmzre+XsSb511BwkdbjqyFjH4rRDs7qaMMc6PqlSvLNe6rW7ESYUyvfCZwfPZ6JaPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyTJOZHOhVaO+t4MTcz5G7me7LAA0+sQ4qQYFzQXi4w=;
 b=RJVQnuaueOpz2oCICowkoiYnaPrX4rJJ3ZJ6lOoXBZuAgljfacRkqAcGXxyUnq810NgPDEec9A67ibpWcf9zx9kdgpmyYEZeDzAYcVGHGeRSmtsG3Li0+ooy4T9Gj7phkhL3+YwAe53ZjqEZiuf5QFxbjuzQ9b0C8Y6e4IMsisk=
Received: from MWHPR10CA0049.namprd10.prod.outlook.com (2603:10b6:300:2c::11)
 by SN6PR12MB2605.namprd12.prod.outlook.com (2603:10b6:805:6a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 13:36:42 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::c3) by MWHPR10CA0049.outlook.office365.com
 (2603:10b6:300:2c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Mon, 26 Jul 2021 13:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Mon, 26 Jul 2021 13:36:41 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 08:36:39 -0500
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <linux@roeck-us.net>, <robh@kernel.org>, <jdelvare@suse.com>,
        <broonie@kernel.org>, Akshay Gupta <Akshay.Gupta@amd.com>,
        "Naveen Krishna Chatradhi" <nchatrad@amd.com>
Subject: [PATCH v4 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver bindings
Date:   Mon, 26 Jul 2021 19:06:15 +0530
Message-ID: <20210726133615.9709-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210726133615.9709-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210726133615.9709-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 163f18e9-395f-46fc-0c9d-08d9503a674f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2605:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2605B97C13FB7370626E34D3E8E89@SN6PR12MB2605.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2iNh5i8Is9OQlM7j10omxcrc9aQWgRc15BdR8Q/VQVKxGIjdvJanFGmh9HLP32NIqIFG2t+CXGy4ojnpw4fAE8UXlNn0EecrY9SEpkjPG6cHyYhamX+d1diVhzKIjHczZB7uO3wlpAE50SkDszBcz+Kv9E7l9t+E7Vfs4BZbhyRLk5Nfkc89xPjK91nN+Lf+40hM4BDKAGJMOFWoWBOlbskhThl9HXajUi2XYimGkfZG49ujCVpj6Pm7fXrYuj//q8vDhYqD4uZ8/3nwULBkOSGBAt6DvZMvwiZNdB8wuAgFRkJrE+KhTnXhW+A7sMzIdmen1+DvNz4+OasGH0yU/yujRXHAnLI1xkVQK7PbstmKWKaKaicDf+TtOrl2RZHlFf7Wwjx97r4fFnfE+41J7YSVyXuBAA9JvbVVdCiGBSRXAXaXYjmQ+xrllYVG+gZczFPyAjbu3NEEWqgV75ntQml2SaFracAr+KEfLXWez8/hYQpScqsM4cWCD1VxtSayKrnkAsLR44OmCAN1hsfFXtJxWBto/mV2wKu265uIOB7HI295tsFW5rZXyw/P/q6JMYSibI55jsXngugGMF5jrzDyuyXAR+BA6Mgvjpk8V/yWI+uNT7it/CKopyWLvXfE89/L8rKBcs/lNpyC8BqYCDFAR2SMRMfjUV2bVvdXYqyudlA9crpor5c0UA3oen+A9o4FKTg1GB4HbUgcuAJIz6Q/Jt+K9II/1JAVnu+psSqRAL6b2+t83WjuaLtHKl6I3VSdvokm2E77ecb/diW+HEc27MzZqwla08FV+MOJqcMA8/gdlEzoF0AZ/bUISjU1
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(6666004)(36860700001)(82310400003)(336012)(426003)(70206006)(54906003)(47076005)(83380400001)(81166007)(36756003)(82740400003)(966005)(478600001)(2616005)(110136005)(7696005)(8936002)(316002)(5660300002)(186003)(1076003)(356005)(26005)(2906002)(4326008)(16526019)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 13:36:41.9535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163f18e9-395f-46fc-0c9d-08d9503a674f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2605
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

- Document device tree bindings for AMD SB-RMI emulated service.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v3:
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

