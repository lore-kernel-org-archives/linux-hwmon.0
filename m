Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3C3DA7EB;
	Wed, 25 Mar 2026 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453755; cv=fail; b=AHWUNJ0oZYvJxiZh0hnJFP/tnHnLoCJ0ufc0CfQDqa1X/MTPmYf2W4A+09+iHWZ84JLQ2utLfWXWvQuXL4iBhN0Q7AI+EtgSJ3omTLVmmeYzoWzvkvArX14lQNYEbr8fAjZSd33VeNZ6B3JDT8ax1bnAPP6CJz56U+OoieY4IfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453755; c=relaxed/simple;
	bh=wXdt6DxI7WvNla30UtXkoMqw6b8dAEDXWVKbmQ+jIsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CR5KGZF/0d+CPfSVGt/5WOavKaHm3kxQRGX4DW+0Fh0GhoUJn3e7/VIJnwv7Qq7bx2Plu4gUANpQhWb4nJrwoWYak2YebIZESU4FiH/46vdF9DKdfU/THuGs4Shz132pWQVxxKYVcew5ocrchkliDhEbK+EFqStlulgwx8/tScU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=joT4lcfo; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="joT4lcfo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMl6Oj8U35lkCAp6JlN9Uagv3YdK92Fw0FUGgA+7MR3a6crZYC+/B59SpGJONHCWqu8L6rQymSGeMzPu+WdtrguXOtXS42gEAlfYaFR7aqRHSXMuxS9WVSeDbj3F8Gzj3gbALdARPVEzUdaQcwL2a26ytuLnLGJREgT5tt4BjYMbYzIKGuF0oG9aYP/Puq/pC6yphFjqTV3eJw9M0ofwUT1KYWqdrGq/tRabBmQKAPjS9+eRzlq8nATNN2odD95etgMwADcBQBysLLDFEV3VDKKx9vkysbxPzr9lm4d/+2qL6q4Y7Bmpg8qO4W8/V84yjvX14zcYX23ICMx1XUe+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDp36s9bVY9LPrylCh65rrBFm8YcxQkActkNQIzksG8=;
 b=AP3rtvCkUaJol7drAza4OlsDV2AU7Z0obS9pbCSj45g6GwDkEvtpkMrFnpTLMApEDQiGIQf9nLIjk2oU/jLhP8uwFSvB4Fk2sRExYU5Ozdam3esYsPyJ6+qk50/KP5iIHh5qQaQTUSy9e0GJSxA35z8d6JMu26+XrT9bM1Z4L46jPPdr6Y0C2h7K+YJUowt2h5o6R3UybKPAh2z3bGWPUBNy/XE6Mlp24k3XSsSwUrdyvi0fxl+G3lXyGnrVoZeHUhTCz6MjGH1lvFqWBJpEyFeuStY6yDdx0MUKbAPOqX44yUZgOs4kc10ddeHy6IWu1EUiJi2SNho1FrfbGct1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDp36s9bVY9LPrylCh65rrBFm8YcxQkActkNQIzksG8=;
 b=joT4lcfo10hZ0sybE3xfdSoCODj4/HmhhpE36f2rJKT+aepIE+g9Fibwn5rScB2MVyDtU9inML6k/tiVZJgpOVugSD+yTOgBlP3nmyvAs+VXMGpNFtMqwuRcRsnbNHHQwY9//5bqf4ibMgTATRG3XDTUyKE+URl+9gg3PMVsk11caDoPgWjuJi6OXGwkDBxbhQoABfsXqWKlnxosAIB7AwbOVxnH6sX+j/GCbOAj8ZT+yYLInlgFQQ16heCw69DdNuEarzFDG1Sd80n/UNX2+sNfVWWQkGVSWzYB8aWxRbA4z6B+sqhhWPg8I8Ho+07TwwRON5TwaOVEuchokQQMqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:49:11 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:49:11 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
Date: Wed, 25 Mar 2026 18:04:43 +0200
Message-Id: <20260325160444.1736866-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
References: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::6) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|DBBPR04MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b4d7f0-2ed0-4118-3067-08de8a860e8f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|19092799006|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	TXDAi1ekScQrVeUK9ZnvfhTdyJhgNS0YPms6HnyCfFV1RxyZVWOlm7Xt3Xs7jrmrL+S1hriwes/psWXmHeNLwWfxmZpCsmvEXhfYO8+2S+sPbc0seXATDJTpQILUenQolLIl25zIZpDZjBp3OSu+qnpkPwArT9LjPlFO6oBYtSE9RIPaIqQgufsImcwqGTn7YyiosHydUlIgA0A5I3+p7yMHHHkWZu3RF3IZ2/F30m4qz2v0Ze9+3FkMFlqnFth8zC5BSarNXjSbdPKtKuSnS/vWCZeXX8ioaUEK6ZS3sA/NgRZkaZkxLpHXXDszKlBNOoottk//rAjSDwaUh+j92WXb2f/uqFqCM0F2IOocDMYFkNgvadQDk5vGah1PAC5owBvjENuM5riynB4ko90SOZ7l9Aih1o43oh3muMykG1YdMyNlapFdcjumftBZQ2avMzzHwldx1MxiKXu49x4ZB6wBpEHzmgCDjParxPFngDQtj0aL2rOs7KjMVjsll1CUuF5Gn/RxbQgV8ccPjZJAKJyK049i/36OfvNAK4tN3x7DN7I+NAAb4363eos0VjB/iIp4gdya4+INVbRiwE8Czg5XqrC4vg46hOh4w4ADWaGOPBMs6ONtnD2cjabvieAldferX2f3KH9k1qW5N4nz70tj/eUFxmgDsVXITNrwo5E9OgWrjQPVr8DaNpN5+HuGBZ7+qGSAMVyX2aHKmwJc+pTJTfP6oNoXBkQNHOcDJfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?hdKcaVagvfCVLbZdwpbtOFfX5tr8lwgLEBde2oyyh93spwqQIBuXIb30k+?=
 =?iso-8859-1?Q?6LcPwCN58SU0Pc2K6n3ajXr/rwcY0k3KQ+O8za+YCKDIihGAwh6cb7qLbf?=
 =?iso-8859-1?Q?1JsHRiHLn4RTJqigep7Xl0mAV3yffkr3fRjyIOqDeMuUC1p7FIymMPsV5b?=
 =?iso-8859-1?Q?gIg1iscx9g8wGPKUum8L0Z8io10xVGhURNqsKIarbUXlcF+pmfzY7O44JB?=
 =?iso-8859-1?Q?a4wUSWrAh4T8d4WKQxOeXc+MgwAM5caKOOZkUJMmAnFC7noMazFIahmzWu?=
 =?iso-8859-1?Q?aJUytTuVjN1O46aVNvsw6sZdQBdsTcNibHlaRiJGDyC8BrvxeSB6kRQzTM?=
 =?iso-8859-1?Q?395W0aoeAE0HyfF9keEZM86/iRXmkOjFsrfrA7vR5Ezssk0tb7h1gR5I4+?=
 =?iso-8859-1?Q?aGJp6tyKtHaBdP2Ud6GtEgXLc/bpNtvTvTrPIacJNQ00CGGdeLOY6YMadd?=
 =?iso-8859-1?Q?x7XMUxDsvYOffCMLxnylC1r3NFBXJYbGEt6OWmskzFiLQm77w5thCbjC2g?=
 =?iso-8859-1?Q?/SVJcAH/t4eccRbMcLHD7AVkICmCD9egYaX283F6p9ShWRG2PwcFCq9Dwr?=
 =?iso-8859-1?Q?ED8KRFUH2X1/60baUrIK1nWJYEWRpKbr/Pg0K+A5ZRXMxOZbvuOp3QqZWf?=
 =?iso-8859-1?Q?Z66mscJXf+qHulvw4hW2BfA/NkUbFYLij6v9OegivXeZf/3tZTOX9Ao6WQ?=
 =?iso-8859-1?Q?20Tp7neIUn7EQEEgPDe++A77/4KFuAJ2z4TlGgaCYUOnAXff+qM2ZQbQ5B?=
 =?iso-8859-1?Q?M05stuw07MFr5jed1g4jv0eHIka07WJmRi7d6dt4fiXUAipOknP30cHJxO?=
 =?iso-8859-1?Q?PhfNv/j4cu4Qf+QIZ7lgBDaJgUrwHIKx9AZJUb/diFoGBBFpa6BzOP7eHo?=
 =?iso-8859-1?Q?k2zCMZJKlJ8MV5X0U9FKk3+IIStRmHEbIMPfHcfd8JEHoG/2dI7lhIZEJw?=
 =?iso-8859-1?Q?EgMEjgfZmssA3k9oX+iAVzLu2+epLPLbLHlT1hnF90X3nVFxc5omDH0NNS?=
 =?iso-8859-1?Q?Tgt835MVWgW3bShGWRIddx3sfwoy5CXy+i9NgAx3nxWYRRpbPWYvRglwXm?=
 =?iso-8859-1?Q?tAW03jOnvhJaNTj79nuB3KjWuBoSXVCE79zFGDV7KLGCezHb7FxleVx3Sz?=
 =?iso-8859-1?Q?Bu3VZet3WeXUTrZUEUPELyV74sfQ504nYVRmG2rok3w/cQr6rsHH75n2GG?=
 =?iso-8859-1?Q?hpvOOvlhkev2se4KzP5EFHBvSIB2Li8YEPIP8YU7PCsGpN5PLbOrAvoHJd?=
 =?iso-8859-1?Q?ZoxL+ftSytN8v8o2nQ+I3UU/cAv2ev7litKcItBFX0dr9pMgVCDRY7SuNf?=
 =?iso-8859-1?Q?rekZwpThNFsTUuDTCwWaXuci+/c+tZ4XbuMLTd9UZ7jbnwca3UCh/nSfNW?=
 =?iso-8859-1?Q?BggzpzrMj5Jdk3W0VPYUbFgeP4IpNbpk1yWWdCf8usEDgtoUYS5wMAAJI9?=
 =?iso-8859-1?Q?DGG9mBamexcOPrZlo5pOYuOQoE/UrOhXcPQqXSGb1kE8F3Pb0w9CHDjVn2?=
 =?iso-8859-1?Q?5iJJ/5JUL988asbJ5icIwGp3UqE02/2Etz73uWI58g4gzCVjMSMDvZGQTS?=
 =?iso-8859-1?Q?L0iZcOT+v+g3gsNWwTsqLGUpdXcLgT84kO/Ciapk23XqE9vCn4D4m7zLmK?=
 =?iso-8859-1?Q?zflb4Cf3soJ3tJhVAOMovpmP1Z/h/QBI1lUwuhiME3R1KsjdA67goEeulA?=
 =?iso-8859-1?Q?a5qryr1eqsDp1mgf82EdPWj7oA0LoBObeplsmfoQC/kFVK7/NnC4Yc4/mR?=
 =?iso-8859-1?Q?0vTHd20X7XTrdM239ROqVfEi+2NqLrpwt5eZBD/aswu+PVTok1jBlh+Y0x?=
 =?iso-8859-1?Q?Y+9C58jKxA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b4d7f0-2ed0-4118-3067-08de8a860e8f
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:49:11.0707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 586eH4GXBhkBFoYw68xUFzUI081RNeuC+p/5KuUlZj7Kw9h/fepXr68hYbQnydyzkJsuUL39gspMAgkxkJrvxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

From: Florin Leotescu <florin.leotescu@nxp.com>

The EMC2305 fan controller supports multiple independent PWM fan
outputs. Some systems require fans to enter a defined safe state
during system shutdown or reboot handoff, until firmware or the next
boot stage reconfigures the controller.

Add an optional "fan-shutdown-percent" property to fan child nodes
allowing the shutdown fan speed to be configured per fan output.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
index d3f06ebc19fa..8c2548539d7f 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -54,6 +54,12 @@ patternProperties:
           The fan number used to determine the associated PWM channel.
         maxItems: 1
 
+      fan-shutdown-percent:
+        description:
+          PWM duty cycle in percent applied to the fan during shutdown.
+        minimum: 0
+        maximum: 100
+
     required:
       - reg
 
@@ -80,12 +86,14 @@ examples:
             fan@0 {
                 reg = <0x0>;
                 pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+                fan-shutdown-percent = <100>;
                 #cooling-cells = <2>;
             };
 
             fan@1 {
                 reg = <0x1>;
                 pwms = <&fan_controller 26000 0 1>;
+                fan-shutdown-percent = <50>;
                 #cooling-cells = <2>;
             };
 
-- 
2.34.1

