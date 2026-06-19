Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7638A34EEFD;
	Fri, 19 Jun 2026 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861945; cv=fail; b=I9taFtOSwRqL3NniafGJvBuvMFHsEd+z/3tBjvQa749G0nrIHWajokCoTG8DCo98+Ae7uB5Y42AT8BIVE7uD2PfhVDJMd6okn5ky8NQMCnYDBiuLSFzsi1+U3OvKAbtsBfOBBVyyraagg80L+czUaIuMnC5es1hQVW8u2+G7+dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861945; c=relaxed/simple;
	bh=jUqZJdfk60NkSMrBYmpQ1BVZQT8N1IwGWdmxhaI0MdY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JkbGYLdwiD9tbWPGe28kTE6vEzPH77QHYD4ElpDTZzOmYimz2fUBsSkkJYRn9CctQljAtFUcCyrPXZbpYKflS8IL4F55UAp+fGP4v2N8qJclXn3QY9L4g76ayyM8E3y8VBk774Bx6P/v/zYVc0YsgahlZjehN9lMBnHT+0fkUhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=q/0Ao427; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="q/0Ao427"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy/mqsGAHXa79ZeMxvqAXmjJibq5H8h8dt3kFtHz4anoe9YOYEqt49S4ocrJ2AVr1o20Ez3hF9HYbhDeObNkTdRPdqVEJooZBkYHuEcTZoXx0t1aWQYcPz5PSkttFPLCFaLDbbHv92WlR4QtXp2qB5aULaYGC3abyAIeQttK4zaaw/dir5wapzrdvMe5TvhlmQHyr4kEFSBTW7bwALq0HLCXicF/0Wi7eiVx1rBrGBh7NhDibPCB7OqAa1HxcGCtMoI/UB+0Jqw1aoQhLuB7E0AGTZLbypI6YigAJPoUnvqGf93fUtKIltZZXjEF+TsO+KEJPq0m5xx4KQe1Y7vUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzKnT7+WT0wq6lMfdJwMzuXFur20LBRpX9FLHiN9B/I=;
 b=VOT3EbOGL0nHq6xXy6/LTv27uKiGPF7H2zf+P8BJJJFg/e/5ehD4Vlt8mfDFa5swsD4U7+gQZp33nHdx09BhIPlVZ3lMVZLGgKs0hZ+ekx0aRO7p8n34sHGPm40bABLFR0f0iyncYfYS/FZf2G6MhFj80q2CuSNdgOES2sjmGK3ZcDwGxlQB8F7mgJHBd13ifSpTJh5NtKDUCkMWg0tZvfuuWCJVWwuv6KkmPbzbcg7MHbwfrAoTUfDZrILHXFsgWlJbP+yGJV3CHHZDatCNBp+zcjHuihfuEbvoyZ4gY6HMdijO5t8C+A1GzursUq4DI8KistTWmIFW1FqFU+QxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzKnT7+WT0wq6lMfdJwMzuXFur20LBRpX9FLHiN9B/I=;
 b=q/0Ao42777Rp2K9zaDvjoyG8Mr54QT4KH8GxW7DiXwAQ0lREnXnqO2An0vhNZtPmJ9Pm1kvc+iwvp6pEss24htEiGZ7bmqR7ut0ZyqU5IbtEIsaEhB3c8T6YW+wcjHc6y3FvT2WJexwlmPvWP8pmUznsxrgcJNOLSSxBXZjnKUg8GJW7xXAT81xh/lDr/T9AjBQopLcMIbfdTS1p92yuMK++RG7nym9XnSHMguhH43K4b1nMWbuQpj2zzkvVUHGOVTCu8JirPzggMEHOXQ60JhIZfI/zJRRYoLJEK0cAb4baGqo01qcEwBbBxPCZ9xtU7TxvoJkFOwVmO8K0RgxYRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7562.namprd03.prod.outlook.com (2603:10b6:408:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 19 Jun
 2026 09:39:00 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:39:00 +0000
From: tze.yee.ng@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: hwmon: add Altera Stratix 10 hardware monitor binding
Date: Fri, 19 Jun 2026 02:38:52 -0700
Message-ID: <ac5a118394e96f707823463fedd32b6a484c1ceb.1781861409.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 4083eaef-7fda-45df-4829-08decde69767
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|55112099003|3023799007|11063799006|22082099003|6133799003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	GJed9Aau2/Du6FG2h4lC3LDehnNnEl7mEWZEByIAVUSmHq/g43VrCLjF4x7YERkpMWZo0x4XOajFeDDiTCqRjO7uvsAqt4gA/Mfo1sR5yl9SttvPDZRyTR+hMnY0ziFkFQZw0/3IlmCXqqelXpGbzuF6RVaLjFlOUh8T6NA3LR8jywhO7+9EGzXDQ+io1XtcJtAfieBMGit/4A5Gx3FfuQHI4mf3P3f1BNHXMdJBkj0CjPnjBS9Tu2R1ucjBWBdnFYrmay+i0OM76EtlI3EfpSG8q4G6X4vcfRlqrKRPbmEmMuLxu8XoBDUmG7VmTv8eBPOCEvCoqERYAVtBlailpUHKmXR+6mhX9WXL8LuyYmZ9zXpvd1fqBCZRNENLvITas0hg11llA5VIXIyYOOobqtZg+y3P6iRHkocRzcX/q5af/NP0J9kUgiD3zJJjOKN2NPvM+79Ys+idFkuWKGx9soo8pqUGcOJRb5U8bDwqTpQEU6dFpDmH4PW62JRi1lozyzBqE7OhVrCLFFLrAE5aYKjTfk0axY7RxKGiWm6TsEoyNLA5gIrYYrh5tDuVF8/sr+gFFVFK7GU4bilcpGgi3x0AS0IX0hpBis1E0iPxxB/dgRZD4p6X7BqsM7KAmauGGohmTkz2k1KQmjs9P0wWTuL7InwIAcbRBEkDoXOCw00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(55112099003)(3023799007)(11063799006)(22082099003)(6133799003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGorZXZjSUpiNEEveWttUUF1TTFlYjZEYnU4Ym9oRmNrL2o0NjBBaEVtUVV0?=
 =?utf-8?B?ekhQZUZnOE1xNFZtNmRPS2hydUc0UjZ4dDBjckk4UThOdlVCZUwydzNFZEpa?=
 =?utf-8?B?ckxQUFd2Y2c3ZU1rWmQya1ZtYVJGT0FSUi9acHd0TWJ1YTFPNzhUdE5zRzZC?=
 =?utf-8?B?Z1RyV2Y3ZjE0bGpremtxNmVIU1ZTMFZtTVk2UDFadC80dzlGYzVRdFVER0tH?=
 =?utf-8?B?MmhBZEVVUWE2ckcxSno0QldCNEp2S3JObFR6aW5pQVFvTkJUM1gvcFRjSGRD?=
 =?utf-8?B?SXZZUDNxTDhpbHI1cEU0ZVBsMkk5YmVFSXkrdWxJeVV1UC9peHhCQWNoaEV2?=
 =?utf-8?B?dXJKZWpacEhWZDVRS2NkTlhvaUs3U3ZheDVFaUJvQXFwUnNDdEpXSnRqc0ZS?=
 =?utf-8?B?c3U3S1ZnWGNhci9TWnhMV2F1REFCZXRBWGdoSVh1WWtPMkFnd3piTEl2UmdJ?=
 =?utf-8?B?TytiWHNRSEpxc1FueFp3aWd2U2wwWXd6RTRVS1ZGVVB4dElnY0ZPR250bFgy?=
 =?utf-8?B?MHRyWThvRzVoUk1rVnZ1K3hYNGRQMzhNMHczMUdkVXAyVEQvNm12dFQxT1BH?=
 =?utf-8?B?YjhiUzZaSmZCZVZkWVE5NitQNnJzN2JJQURobElhaHBudW9QNTNnTGg5cXlv?=
 =?utf-8?B?VlVzcU91T2xGcmFYTElVMThPVXJDK0tQeTFBSTJ5dUJKa2ZFMnBOVTFDeXR0?=
 =?utf-8?B?REFwTGVxaDVGWnZIcWQ1ME5ha1BscmQvUUxsajJ5VW42NGJBK3BTRDY3Y0FM?=
 =?utf-8?B?bU9UMFpPbm16bTlLVlQvcVNpemRLWEZjblhzMWVVZHFHbzJTTStzaGFNNmtB?=
 =?utf-8?B?STBTa0t2a0p2MmpQejMwbWo5WGlHWDRnc21jdWRBUnJtVWpyQ1B5OTZrb0JP?=
 =?utf-8?B?RExKemdmVlRpclRLTFBFaTlsOWgrbUpGTDRZSHRYMXc2NlJrelpRUjVSZm1a?=
 =?utf-8?B?R2R6ZTZjei9Hb21EeXg2R05XOUdhUXpFcUdyZjVZNnl2VFcxZmw2OUFMNG1Y?=
 =?utf-8?B?cG1FTXZBOHV6amU1SkZsNnhqdjhKOE1TTjRCUTJRV2RxbnlxN0psaEw5eHoy?=
 =?utf-8?B?TjhKY003Ymg5NWNOZURNNVA4QXB0OHJvdXljZTVJMWVFbjlCZk1NaFhnNmdL?=
 =?utf-8?B?bWhzUHN1MkltWGVjRW5Jd3B6ZzFTNGVaUWM5UEdyWWRqUHlSOElYY0M2aVJO?=
 =?utf-8?B?bkw4eFo3NHhkQURGQ3FLaVVVbFg1Sk1XQTBQQ2tXUGczQzFwSE5BNGVLYzZa?=
 =?utf-8?B?SzAvclZoR3I0V2FuZnhLcjA1cFpHVVEzbjZ2dGhQa2R1bTdJTlI1VWpwZzBB?=
 =?utf-8?B?NzhPVWhBL3N4alQ3cFVCeW5qdnlkZCtxMmdTaS9YNUoxOEQxVkN0NE1jc3Fu?=
 =?utf-8?B?UVdEaXh6RmFRTmF0Y0owZ2JNTzlTK2xKRHJWdHBFV2NqNWZ3YW84dkNid2dN?=
 =?utf-8?B?dDMybVhhL0tocjlpR3lVSzlsemp4NGxsUnlHQkwwVmhqNTRUSjcxSTg4WmxT?=
 =?utf-8?B?OXc1SkpGenFKb05ZK2F1ZGZqK0hzbnM0SW5pT1JiR1JaaElkOTZaRitMSGg0?=
 =?utf-8?B?eUdkcWwvc1F4L0wrNkd3NjBuN1czTmQveFJIWm9WZUFYVkR5M2E1WVNqYTJu?=
 =?utf-8?B?RGJaL0xONGpVVkN0V2xWSEY4VUhZWkl6Q25rSkh1MEJQcjhBNjJheWlSbkZv?=
 =?utf-8?B?akkxTkgxclJYNHFhZEdEK0VGT2sreXNqTVRiQncyVnI3VDdTL0ZnL1lJTElX?=
 =?utf-8?B?cnh4QlQ0WTdvWWhIQi9GbkdJMnljNENONmdha1N4Ty9IQ1djcTVNeXpnQjJl?=
 =?utf-8?B?WnFEOEpuS0FZQm9aWmxUckg1dzlHa1J6aXMxOUMvamtkWUlxZ3FMbElNcklw?=
 =?utf-8?B?TUEvNVlESzlqTFhIZ3h4SnA3bFhWN0gvT1hkRGNmdzQwM0oxckxtaWYwY0Za?=
 =?utf-8?B?bVdKclRwZFd4cnYreDJYeE5FdGpyR2QwVGVtV3kyNEFvREtiTmxsSGVBQWZN?=
 =?utf-8?B?a1AwZTQ1aWhFMmphSzdBWU8zdHdoblpBb2N6WjdIb1kvREVBcG5YY2xJSUNE?=
 =?utf-8?B?RThzNDd3NDJ0Vy9aRzJjRWM0dVN5TFcxeWtkM29mZmJweU1uVnFLWkZsaHhT?=
 =?utf-8?B?OU51L1cxR3RMY0sxeERUK21TYno3eE5JaTZkbE84KzVuUFAwMW1qVHk3L1Vo?=
 =?utf-8?B?ZFNSM2owQW53MzNrMm9MV2VCS1lLWEpSUzBKd1ZlSmdIYm9pNWg5UHhXdkhm?=
 =?utf-8?B?OWxENVhyVmE3T0JWSVlOUEdGeWpvWE1yZVczMGNmZXhyMS91VEtTNzRVWDVT?=
 =?utf-8?B?Tk1rOGFRTHRsZjhHbk5pODlwZG1RTFB3UFFDMUFaVFQ0TVhaVFhadz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4083eaef-7fda-45df-4829-08decde69767
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:39:00.1626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ig1OldT+7oGUxDBVeFBtomAm2VfxHIkcyimgTxEsEoZFmyjARiqX93sDm9Vk8npqiZmWZEqbR2L0icv2w+WZEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7562

From: Tze Yee Ng <tze.yee.ng@altera.com>

Document the device tree binding for the Altera Stratix 10 SoC FPGA
hardware monitor, including temperature and voltage sensor nodes.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../bindings/hwmon/altr,stratix10-hwmon.yaml  | 164 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
new file mode 100644
index 000000000000..5bd98660ee7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/altr,stratix10-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Hardware Monitor for Stratix 10 SoC FPGA
+
+maintainers:
+  - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+  - Tze Yee Ng <tze.yee.ng@altera.com>
+
+description: |
+  The Altera Stratix 10 SoC FPGA hardware monitor unit provides on-chip
+  voltage and temperature sensors. These sensors can be used to monitor
+  external voltages and on-chip operating conditions such as internal
+  power rails and on-chip junction temperatures.
+
+  The specific sensor configuration varies by device. Check the device
+  documentation to verify which sensors are available.
+
+  Stratix 10 voltage sensors:
+
+    page 0, channel 2 = 0.8V VCC
+    page 0, channel 3 = 1.8V VCCIO_SDM
+    page 0, channel 6 = 0.9V VCCERAM
+
+  Stratix 10 temperature sensors:
+
+    page 0, channel 0 = main die
+    page 0, channel 1 = tile bottom left
+    page 0, channel 2 = tile middle left
+    page 0, channel 3 = tile top left
+    page 0, channel 4 = tile bottom right
+    page 0, channel 5 = tile middle right
+    page 0, channel 6 = tile top right
+    page 0, channel 7 = hbm2 bottom
+    page 0, channel 8 = hbm2 top
+
+properties:
+  compatible:
+    const: altr,stratix10-hwmon
+
+  temperature:
+    description:
+      The temperature node specifies mappings of temperature sensor diodes on
+      the Stratix 10 SoC FPGA main die and tile die.
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+    patternProperties:
+      "^input(@[0-9a-f]+)?$":
+        description:
+          The input node specifies each individual temperature sensor.
+        type: object
+        properties:
+          reg:
+            description:
+              Sensor channel index in the lower 16-bits (0-15). For temperature
+              sensors, the page number is encoded in the upper 16-bits.
+              The driver encodes the SMC request argument as a channel
+              bitmask (1 << channel) in bits 0..15, with the page number
+              placed in bits 16..31. Channel values >= 16 are rejected to
+              avoid overlap with the page field. For example, reg = <2>
+              selects channel 2 and the driver passes 0x4 to the service layer.
+          label:
+            description:
+              A descriptive name for this channel (e.g. "Main Die" or
+              "Tile Bottom Left").
+        required:
+          - reg
+        additionalProperties: false
+    required:
+      - '#address-cells'
+      - '#size-cells'
+    additionalProperties: false
+
+  voltage:
+    description:
+      The voltage node specifies mappings of voltage sensors on the Stratix 10
+      SoC FPGA analog to digital converter of the Secure Device Manager (SDM).
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+    patternProperties:
+      "^input(@[0-9a-f]+)?$":
+        description:
+          The input node specifies each individual voltage sensor.
+        type: object
+        properties:
+          reg:
+            description:
+              Sensor channel index in the lower 16-bits (0-15). The driver
+              encodes the SMC request argument as a channel bitmask
+              (1 << channel). For example, reg = <2> selects channel 2 and
+              the driver passes 0x4 to the service layer.
+          label:
+            description:
+              A descriptive name for this channel (e.g. "0.8V VCC" or
+              "1.8V VCCIO_SDM").
+        required:
+          - reg
+        additionalProperties: false
+    required:
+      - '#address-cells'
+      - '#size-cells'
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    hwmon {
+      compatible = "altr,stratix10-hwmon";
+
+      voltage {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        input@2 {
+          label = "0.8V VCC";
+          reg = <2>;
+        };
+
+        input@3 {
+          label = "1.8V VCCIO_SDM";
+          reg = <3>;
+        };
+
+        input@6 {
+          label = "0.9V VCCERAM";
+          reg = <6>;
+        };
+      };
+
+      temperature {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        input@0 {
+          label = "Main Die";
+          reg = <0>;
+        };
+
+        input@1 {
+          label = "Tile Bottom Left";
+          reg = <1>;
+        };
+
+        input@2 {
+          label = "Tile Middle Left";
+          reg = <2>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 6aa3fe2ee1bb..678f6c429627 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -937,6 +937,13 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA STRATIX 10 SoC FPGA HWMON DRIVER
+M:	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+M:	Tze Yee Ng <tze.yee.ng@altera.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/altr,stratix10-hwmon.yaml
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
-- 
2.43.7

