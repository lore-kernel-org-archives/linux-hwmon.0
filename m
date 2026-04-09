Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766ED3BED1E;
	Thu,  9 Apr 2026 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732326; cv=fail; b=ZdefF06USEMsc2Nyt56gfsldkwLoFLkZMUm0HuiNU5XPiDKiLhlJMj7MZrhAsvmoizvOiElJ8wO+rPr8mZ589mmGo3XB2KeMdvlZqs1GUVyH/0Xc9JDKzVG0bt3TY/qgY7uLA5NoJQY+JFf6xEff7Hk0r/CQbSzxsYZojZXc53o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732326; c=relaxed/simple;
	bh=vi8p90iMPBQ+D6S0eYv9tgOU/5z/IzlBQtr+fuuxreY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eyQLSOpSKP9XfqWTlitTJtph9hq2bCZEgx+ZGj9jqT1aY7eaBUcBY4PzFgcku9doDIGTxDKL6+WnLwXr2wvG0cuVPHb7aOwmAU4VFe3WCBfEaJV+GgYnyaXPKHxRFoaD2ryrsr85VvN3AyCCClJMRON/RKOQMBftnTbCmjSPreg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GhlWPHeW; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GhlWPHeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdWMK9xMx8pwy7kc0N/bKHvAwkcpXbVKQ40yqyJnNk8Gvo3EI4dJ/sVAWnD9IybyJNriGuakcoATblbq97FbgMeNSP5WfH3QX9+vOWKI4W5y060FmSHEi3hs9LonvievO8u7RKT9GKEdHmyYgXXAr9cyxu9VYAi0PFkn1jI15jIf/neecwPzJgOToCKvfIrn8tCa+ehumbpkTiAfWuRNv3tDpIjin1YgkjiHqBM3GDhxwWONSgwWhbj9WFJtD+p2PLrHEnIO2x1XSku6tUQwAkaWBcSi0qGz8RarlNIEfRu0/0fQTPUTuYAsaknWbMp051BZF8GEm62jvpyxWnvynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peaFAuuxo3FNvw+ABu6kKkX5XlQzOFY+cBT3nGRa574=;
 b=Rp80oZAiZtMDNwT26FnImZel6OPCmbQ+orczj8zimyZ+r8PUdQorzpSY2OqYVO+AuJW2zZAWDK9UwXciMhLxPcgtf+gEwLpsEQz1use5YsE60wgUlQ+H0K3hwjBTnYhwDxAXnvnNkU5tIMUcBGmQPsD8nt3ap3mHFdGI5K0W+eggSKWkMM6AZuUB99LWmcq4TU/ZsIQtjqL0TO1r+jY8v2C5LTIHNx4j0XveG4KDt/AHrgs/tMftaoh4hIR4xQyKF4OJngD0FmQwqS4/OvFBnh7Cq+xl0nye+fUEfYzkxmJIe+DlxtDgiy/znsAAis34tOo1bTvpeCSGPFZit/XCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peaFAuuxo3FNvw+ABu6kKkX5XlQzOFY+cBT3nGRa574=;
 b=GhlWPHeWquR9O74WoZXkKth7Gfi2fI93aEw5UJ5n/BvYDA+ssdWq1bv6AnRORE4ZoT1GMJk5hgmRHt6DUw8ldzc+ZT318OK4EixeX9WFME3k9zReKr1pofOJ5ELKUPJJbKXJFZfxpzGQdCq/V5YIf5FrE4191R8xbpBKe4e0TyGQXYBNHa+JWNDX9oqs+0cuibRSj3SH8Q+CSFk7UofgA6EpH1xyQ+qJOSoQTa33DpsC8+fdI+ChozKYfBzfC4FYBtLdsM8S8EbLhcqhn2vJSRWsjQnygt2A2zEah4p5TbAaH8AuW5ikeWJ8hOl9w6277I884UFnOT1i2DZcN4Q5SA==
Received: from CH0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:610:e7::24)
 by CH1PPFA0A5C3BCA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 10:58:36 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::a3) by CH0PR03CA0229.outlook.office365.com
 (2603:10b6:610:e7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 10:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 10:58:35 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:23 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:58:18 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Thu, 9 Apr 2026 16:27:31 +0530
Message-ID: <20260409105747.48158-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260409105747.48158-1-akhilrajeev@nvidia.com>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|CH1PPFA0A5C3BCA:EE_
X-MS-Office365-Filtering-Correlation-Id: 013313df-5a10-4de7-63f7-08de9626f2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HnptqnNSufwIm7+HaKJGKxtTQQiAeerJBc28xJ9VoxI0DkaBYVT9wHY/yXR6EAsPn7+6aoWAOiHC1dkg14YbSV91ZyyTalMLF5I7icg2XKPzTfP4nDEPyBLOemFSE+gor2pehEcP7yXXAQhZdSo9QrqdrCvWA6ib3wlN5baNQxf9L3o/ys5R7zR1CQeo959MqItQalAc6uK8FwNM3Zz9qwKpwXLp6OLKXzs2EHOakFp/Y2VGckwZc7Y2kDGvlsgVTQcbTD5pbsimUKdaeA8RzzKIPpdfjKuzUDLXTZX0D0r7Da7utPZ6cQiyc3gFr58wgmQOwr/8R25ijAeXW3eiavy3ixpsHrOYXjzO0JnpZ4r+Y6FyH0unTtIgG4eA5wPimYktT3gDob8slJttpFo74lAllHdSrGcmKrwJzhFnjSjCQ3n77TpZGlaTvESDEcNx22+gUmyJaDAbmX/TGbL0ey/1yvYoNzGll1LEujF1+LB9Yma7Zpsy3IYza6J/gWbcuX4JD10UoNZL3wzfYABPNMtuBXkIyr46zlL2DrC4cMNaSB9SzPi9aok8oluC9h1oGz6KFGHZciigSJBHopjILlk6GbAwRGQbIvfbTe/VXpDR8wdqU2AaR2uJ23J0e2zyXhBFtHoBExRdQ53k2eYzdlaa04ACDaor6X2GAWGeXc3DkScqiwot+AevZI4bnoOta/cs4Q5ndLI7O4FkDHfPHAp3FPyqXlovnn+3UG8eCzx6FO1RD7myiVE8Kd5PAdUwzxvrEUeUgzVa/JZ8tCyf3giF3qvYFolKmuLU2jDhbrtLCBJgLoq57uCT1fDslnUN
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	36ayis8rnTxLdcabJVUUoqirlVFr8YMgBTkpGQ7ZpWlWQpJbFOdd9pQV4weydH98W6SWKthsUU42aLRgNQW2PgPmnwGmrZBoPnmlpFfapKFAk17vkI5Sg/HbqPhyJA9G9I5GhOOmTPfM2A95GKJJtI8CbDyZ0/b7N4M5M12aZx5+COB3+NBsS8I6Lxz/nVW1XXlQqgcy8B1RiJwmi3+wSMzvzlUlF/86ZHd1LBJ6waa061Moui7N0VCxrxlE1mG7oamL0Ty9I2MKXt0/I2C+0F1v9uxBggYlqzDAlR2+OW12IjAgoj+xZYnOijsNgPU/fucjodhGtKXjhzuKPmkqwgQj4jt2MMxb4uqXjZWfFXRtnrWuvUBaE/TFzYibaCc20gK20myMARsD7MPoug3MnpYjGewrtPRxrm7FOZtoTG3Uv/35RdT3FdNTqFurCnqQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:58:35.6145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 013313df-5a10-4de7-63f7-08de9626f2b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFA0A5C3BCA

Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
Discovery and Configuration Specification [1] to specify which discovery
method an I3C device supports during bus initialization. The property is
a bitmap, where a bit value of 1 indicates support for that method, and 0
indicates lack of support.
Bit 0: SETDASA CCC (Direct)
Bit 1: SETAASA CCC (Broadcast)
Bit 2: Other CCC (vendor / standards extension)
All other bits are reserved.

It is specifically needed when an I3C device requires SETAASA for the
address assignment. SETDASA will be supported by default if this property
is absent, which means for now the property just serves as a flag to
enable SETAASA, but keep the property as a bitmap to align with the
specifications.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index e25fa72fd785..1705d90d4d79 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -31,10 +31,12 @@ properties:
       described in the device tree, which in turn means we have to describe
       I3C devices.
 
-      Another use case for describing an I3C device in the device tree is when
-      this I3C device has a static I2C address and we want to assign it a
-      specific I3C dynamic address before the DAA takes place (so that other
-      devices on the bus can't take this dynamic address).
+      Other use-cases for describing an I3C device in the device tree are:
+      - When the I3C device has a static I2C address and we want to assign
+        it a specific I3C dynamic address before the DAA takes place (so
+        that other devices on the bus can't take this dynamic address).
+      - When the I3C device requires SETAASA for its discovery and uses a
+        pre-defined static address.
 
   "#size-cells":
     const: 0
@@ -147,6 +149,26 @@ patternProperties:
           through SETDASA. If static address is not present, this address is assigned
           through SETNEWDA after assigning a temporary address via ENTDAA.
 
+      mipi-i3c-static-method:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0x1
+        maximum: 0xff
+        default: 1
+        description: |
+          Bitmap describing which methods of Dynamic Address Assignment from a
+          static address are supported by this I3C Target. A bit value of 1
+          indicates support for that method, and 0 indicates lack of support.
+          Bit 0: SETDASA CCC (Direct)
+          Bit 1: SETAASA CCC (Broadcast)
+          Bit 2: Other CCC (vendor / standards extension)
+          All other bits are reserved.
+
+          This property follows the MIPI I3C specification. The primary use
+          of this property is to indicate support for SETAASA, i.e Bit 1, but
+          will allow all values so that it is aligned with the specifications.
+          SETDASA will remain as the default method even if this property is
+          not present.
+
     required:
       - reg
 
-- 
2.50.1

