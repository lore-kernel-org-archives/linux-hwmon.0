Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830704;
	b=RvqiB71ZorDYK6SLsCSvlKuhlUSixZLxH7M/b1zXx9J1O8CNbJJfGfKOf+vPWuZ7F25W
	 /PQ4cHr4xlRAWP2aV6O8nmqhLmdwG9Hw4t12zLofWY46oUeGp9F90+rEpfLyFpEoHCWbA
	 9X+RMWZ7IRxAQ/H/9ohl9dNM1s5Jh8u8xA0/49oLdtT4BVeobadcjxY6czMBKHoMPM8c8
	 QYiynIq4KpUa/FnrdSKGfE/Mj15BLiAHKmZvgHj1j561zFpCWcKSKdZCtoE70KH4OAodH
	 YuMhj/fdxrV6u7WrdxmDq/P0LyfUo7J60EKI6xGpYqLbhxcxOCoyT/fLlzKAzW+2ihQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830704;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ni10bld/X+4JFp5OUCcg7wDsdhnR6bTiDFXGeVwcpMA=;
	b=x/fdBVGj8K1pWixlzprbW0q+/AgnHsG2tbQDoafniDMNm4vK+pcV9kxWNWLmGnnCpf7M
	 K+O0ZGHoz8NscC+SZ1Ycq7Ban2tYs9wBdSEi89up7XbbsdHusfZdXCNPVdsLvaJlkDEZe
	 7xykzhn5SeVJOYBL26CmQh+ZmI/bvsBknuu9xdhMWmIQ6NlAdqLzGexuNPV4M88DgVLyo
	 lnr3DpGQr2inhrZRE9uzDwOkedJ9O8fsapjEXTDaxxz5H/jJoLCPnlhqR0lC/0WIjH1dH
	 q6KQlNFao2tjhyP4VjTJ83CsY0rkFHj/YEaL+Pqpn9U+B094ewKCUgjfKT/WBvz95bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=P2uJdYVF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.65
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8319606A888;
	Mon, 16 Nov 2026 12:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8319606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=P2uJdYVF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ4i3rQe/xKDJMai+1nkUvWR0kIHWqjRhpr9wC4IL6qrqmJSIErjksalr6BpjkZo1B3esA3cMC+Lb26RZEYW+h77E1KqVXCM0dpMHHeejG2RJ3M+gslkekCg2N1UK+UiPqnSUcxqBeHuogh63I/KWi/18svD46n1egGvwNnVRLpJ+tajILQ6VVG9KOK5R0ZTw91+ObpoNpzBe6ZKsewz9n0xKt9+ac2GQkl3PdII5+SA0A4lYgi3TsWiM4nVRQHdO4EJWr5HZ2IFMEAjjtatqYVXe3npVO2dec0Cagw2ulfxKX7ywuL/LwH5Vmz8vIwI//hpVTDv+WV6+hg7agZb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni10bld/X+4JFp5OUCcg7wDsdhnR6bTiDFXGeVwcpMA=;
 b=CgnqTHJPk5nU6kFsm/N0Sq6vNQ0rqMGlyhsHjr/aX/DJovmJF0LQgJqJdKlVBniV2yCwPmvyw5Y2XiEm4RldlCryG3KTRJbtE62p4fN9ZBoqqc3Q28SwgiBHKMMtmULX3Wcc1+N2dvX9VGqX3obYgNdDceqwW2yoiGddziIrp4L+rfGcyre2mH0mXQUqLS67DtYR1netIVDXeEsl6+CjZsa4K1yfv50IF9mirBeCw6zeps8f02GJL6B1lNoGggKE5DbldtyIiRUBcpO6PMOjY591mQrIhfXAMdykvpG60feRGHC/IUchb5UOBxftDmwGDqGFV4zQxWqBbp2Vx4l8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni10bld/X+4JFp5OUCcg7wDsdhnR6bTiDFXGeVwcpMA=;
 b=P2uJdYVF3mBTJLfVnt4I6WXdtvWPRjhzkVUTMHlv+r+4KKPz64rucih92MCwE6PL4gwA2RL2NgQ7PBQSvlEldzPM8RmKTA+i6epeBDvbWE+tqDVxN1MvD7aHSet+JMeuUYiDxdMkcd9U/CcOmwWKJr85nwBqENNxpdLSp7rieQw=
Received: from CY8PR11CA0027.namprd11.prod.outlook.com (2603:10b6:930:4a::20)
 by SA3PR12MB118222.namprd12.prod.outlook.com (2603:10b6:806:53b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:03:00 +0000
Received: from CY5PEPF00000E78.namprd02.prod.outlook.com
 (2603:10b6:930:4a:cafe::17) by CY8PR11CA0027.outlook.office365.com
 (2603:10b6:930:4a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 12:03:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E78.mail.protection.outlook.com (10.167.247.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:03:00 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 06:02:55 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Prathima Lk
	<Prathima.Lk@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v1 2/4] dt-bindings: hwmon: add DIMM thermal sensor properties
Date: Mon, 16 Nov 2026 17:32:26 +0530
Message-ID: <20261116120228.865196-3-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116120228.865196-1-Akshay.Gupta@amd.com>
References: <20261116120228.865196-1-Akshay.Gupta@amd.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E78:EE_|SA3PR12MB118222:EE_
X-MS-Office365-Filtering-Correlation-Id: 360b0e41-fc7a-45f5-cc6d-08df43d98f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|7416014|376014|22082099003|18002099003|261009223027099003|3023799007|13003099007|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fuwbkZYqXzJgkRKpEr5RT1kI6DQvazMtUNnP1uodtzNLO+NpgIoe8NyLciFM1WPK+59swMsPS24A1A/Eff3w232n3azyJnU6zCOalhza82uryPW52jcfUtyrZ8pd1wkDQlCvLyR0ExPOTi7Se0zawM4GB2fypYqM0ZmZjwU8Vr0kjugxnJzhZnUy2hQsDvIC4z3S4kk7bY4DtCX2dgZeRs/nm0zUpodKLsgOQ85O7CgW46BgoK3UWHOk255n1aAugxHeHIuowyI1XNTcW88idVZDpc5w6DkCISYXUibU3hJwscMc3o+1EsZGcEwrbucO2+m1MsGdKhddc0WTaLfLWRHP6xiacJ1yzbmjiMxf6NjeY+24OsGmQOVdwqG5lKhdQ57Wgw+4oWY9Sjf2WuOtDKNNXGT+D9vuAYbisxVD5hKTlOKFEB0t8XionY9G7pQfDod89A2za//Ekjb3ltOvir/Y1hQy+dcFmqeHGBcIEGM3jnisJ8iD+EJm0B1Z99ZCe/4OJgMsOJ+EtAchPCf7dnBCnvAcM4ETcyiHmsOWjfkrmIJi57ARvI5UeonXXAbMcAfmPnFh6pLKQRG9cRuliKg9CHM99d+8rn4jwZPFsY4mOVLNcAO8IBTlhp2dOSjfIBD19UldWWxOOYdQhscq+g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(3023799007)(13003099007)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dhUspuzbzk+SReDjn+hY2gnbyY7IhJXBEnRD4eeRVpX2fmOiDjpxAQLsYUqE4AzaETIUI38FYrb2SW9+PwKfJ0RY98BqrgMX5A02wnxZIQVacFG6Hf/QmlapO79S4Ks64g9vd5DAB+kHsAC7r71xXUIdsj0DHMUu00QUKnPycYk+Bvz7LZT3E5jWX0SFGfOJ5pyr8cgXeUv8oBvOOT9nzxBgstVw/ylDLfp5XwTY4CC3r+r+HluGmnJDxmhoEcdD2FAL7QSJbytwmAH43UmiGZOEF7PMvxNV07ItKJzh7MRdSPAx86hWr25lbDOhMLGHpwtZxu2M5cz6Ux4N+xQzr/ryvFN3bLgD8d7Tx2OS7O6vwHTx9U4DpMowFw8fw552KjPL29JunHIpqxzpn1yq44Q3uxZv5SgjWbZj0id6c/ehawO37pLN+yTPynoerbVV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:03:00.1933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360b0e41-fc7a-45f5-cc6d-08df43d98f63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB118222

From: Prathima Lk <Prathima.Lk@amd.com>

The SB-RMI mailbox also reports the temperature of the TS0/TS1 thermal
sensors on each DIMM (command 0x48, Mode 1 DIMM_ADDRESS). Boards differ
in how many DIMMs are fitted per memory channel and which sensors are
populated, so describe both in the binding.

Add two optional properties:

 - amd,dpc: uint8, DIMMs per channel, 1 or 2 (default 1).

 - amd,dimm-ids: uint8 array of 1 to 32 unique Mode 1 DIMM_ADDRESS
   values, one per sensor to report. Encoding: bit[7]=1 (Mode 1),
   bit[6] sensor (0=TS0, 1=TS1), bit[5] reserved, bit[4] DIMM slot,
   bit[3:0] memory channel. When absent, the TS0 and TS1 sensors of
   all 16 DIMMs are reported.

The allowed amd,dimm-ids values depend on amd,dpc: with one DIMM per
channel 0x80-0x8f and 0xc0-0xcf; with two, 0x80-0x87, 0x90-0x97,
0xc0-0xc7 and 0xd0-0xd7. This rejects the reserved bit, a slot bit
without a second DIMM, and channels above 7 with two DIMMs per channel.

Also mention the DIMM sensors in the title and description and extend
the example.

Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 .../devicetree/bindings/hwmon/amd,sbrmi.yaml  | 59 +++++++++++++++++--
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
index 353d81d89bf5..f08b62133996 100644
--- a/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
+++ b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
@@ -4,9 +4,7 @@
 $id: http://devicetree.org/schemas/hwmon/amd,sbrmi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: >
-  Sideband Remote Management Interface (SB-RMI) compliant
-  AMD SoC power device.
+title: AMD SoC SB-RMI power and DIMM thermal sensor
 
 maintainers:
   - Akshay Gupta <Akshay.Gupta@amd.com>
@@ -16,7 +14,8 @@ description: |
   interface that reports AMD SoC's Power (normalized Power) using,
   Mailbox Service Request and resembles a typical 8-pin remote power
   sensor's I2C interface to BMC. The power attributes in hwmon
-  reports power in microwatts.
+  reports power in microwatts. The same mailbox also reports the
+  temperature of the TS0/TS1 thermal sensors on each populated DIMM.
 
 properties:
   compatible:
@@ -33,10 +32,60 @@ properties:
       \[open source SoC register reference\]
         https://www.amd.com/en/support/tech-docs?keyword=55898
 
+  amd,dpc:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [1, 2]
+    default: 1
+    description:
+      DIMMs per channel (dimms-per-channel), the number of DIMM slots per
+      memory channel.
+
+  amd,dimm-ids:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 32
+    uniqueItems: true
+    description: |
+      Mode 1 SB-RMI DIMM_ADDRESS of each DIMM thermal sensor to report.
+      Encoding: bit[7]=1 (Mode 1), bit[6] sensor (0=TS0, 1=TS1), bit[5]
+      reserved, bit[4] DIMM slot, bit[3:0] memory channel ID. With one DIMM
+      per channel bit[4] is 0; with two, the memory channel ID is 0-7.
+      When absent, the TS0 and TS1 sensors of all 16 DIMMs are reported.
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      required:
+        - amd,dpc
+      properties:
+        amd,dpc:
+          const: 2
+    then:
+      properties:
+        amd,dimm-ids:
+          items:
+            anyOf:
+              - minimum: 0x80
+                maximum: 0x87
+              - minimum: 0x90
+                maximum: 0x97
+              - minimum: 0xc0
+                maximum: 0xc7
+              - minimum: 0xd0
+                maximum: 0xd7
+    else:
+      properties:
+        amd,dimm-ids:
+          items:
+            anyOf:
+              - minimum: 0x80
+                maximum: 0x8f
+              - minimum: 0xc0
+                maximum: 0xcf
+
 additionalProperties: false
 
 examples:
@@ -48,6 +97,8 @@ examples:
         sbrmi@3c {
             compatible = "amd,sbrmi";
             reg = <0x3c>;
+            /* TS0 sensors of the DIMMs on memory channels 0-7 */
+            amd,dimm-ids = /bits/ 8 <0x80 0x81 0x82 0x83 0x84 0x85 0x86 0x87>;
         };
     };
 ...
-- 
2.34.1

