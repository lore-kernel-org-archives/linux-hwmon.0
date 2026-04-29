Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5669A390212;
	Wed, 29 Apr 2026 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445121; cv=fail; b=awbqAwk0cR0Zb3ANUO5XJmTXXv8tUpzY6A7Z/R8fZrNZoSzGPTDOaxc3kRuThxQO8E7bXA1vfcmJF+uo3lfawfQ3AI66PLpXCu8A0R2tZkEPrrs1lZUvB3E4JztadcP2qbKhYgbtiQ/J2MoiR3nk2UwGtT8KpgKEXUXTitFR76c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445121; c=relaxed/simple;
	bh=9iFyenEtpOw3Fnh2yPQlQXb+QXfLXWpNkhghvpo6SDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ujp8bdXvzQftIgpW9syF7sFT13cPcP/6Jh6jZdyZN5StF/Ep4dMMdt7lIMhClLlMKLD4ou/T8lhwbtgelCENPPa7FIXRpiFgQHJZ8SqxedHyPp3vPDeqiE/NnMBJ6YFesmlWsZRPgUbrwsRVeWZLb0nqrDUMH+RX+ACkcfsbaos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CaLpPp/x; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CaLpPp/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EibWH7p/9cVtSx/cCQjPxLS/73aBQTs42T+rMUMhJNiDWwX+/r1k2qQiF3PSYwDMAQ4Y/Yg4Z3PG2cjt67gSSyw4khSNGbyn2wS0ooV6/jNUZInwEUEQHTK3due6HBaVssPpFeftURdzzyBMzPPnXkHwh5DLrXruam8h+pSUW9vi7ok81EZMDgxyObSHs2cTi+wjjFI4HzOR68LYEW0QA+rKtYzmfg5NSL+awS42hKYw5IOgbiHMFOB9ZuC+6Wm3eQrd8jXrWlUTFP0eW1cf+cx0KB1C5Q/y8RqBZldlEGafUV8h7/Rg24nD8Cz6oRVW2E4ncGzxKB6cyN+xiDoqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iN4ghA/j2Q0LVDr/jaJG1fnxy28CZRsg28y1YR0EMs=;
 b=OnETsSaQ4fdvKXL/DQvHUNgfQxltGtly/Dzc+wT7f1YWKqa4IeKP5yvk93v1eMy1I5MqEIBDOymw7ypoPZafYjNCbBuVI9FVbiF3YD6xFcyjrrmmPzdPV0heW2B9kE3wMGcOCh6cVpvJ7esAouh4b+/iPPfha7879VUoW5Cu9tk7rryDeNyKI7fz/E2skleftl4+e5YSTJ3QX/tWhyefhCJ9MoKAofQtUBSQ5qbNlmCqFZcc4kYIQV2iWRbNB0xOjYf0vVyfDnt2yE8bg3+NvsOpVVC7E9arvdMtpNJ0Suejk+BwiApasf5cWjfoMGcycsxOIOpfl41jLPyFGv5GFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iN4ghA/j2Q0LVDr/jaJG1fnxy28CZRsg28y1YR0EMs=;
 b=CaLpPp/xrMktH82kltylQpQqNqy0vmff7C6hwVC1vz4wjdhutNzOhUviy6tfvpyvBNxcx9gXx9StQDUiP+Ix7NGavMdc0RjOwMTYgPZsO3hKrNh0c6aBnYuixc0EO99kHpOP6IUvS0TspCXB9DkpMIFi8N56f/GvG5R07Hu3CXw1gF5FdsZtLlKP5AmR0iiiyCkFzXgsRCx7dGGcasmh/lMKFZE1AUowAeKh4TRJhXYlv9DL2jJRPLPZqpiuvas1eE6mo4YWwsVujxaDNX/2ivCz/2Lh93qHABs34gpktmA2oAofq6PzczwBq3Nmhyz7y7Yl8rmJtsoA/b6fuYfdbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 06:45:16 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 06:45:16 +0000
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
Subject: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
Date: Wed, 29 Apr 2026 09:59:54 +0300
Message-Id: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM9PR04MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 1378fb0c-e512-4901-47c1-08dea5badf27
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	12Y5zFzHF9/OY0rh9DgBp/oy7FRvYnCuiujo+ZcvwJw+xsKgmy7erWTP6YSPfEOC34OiDVPyqzztPeYxvpMPEyBxh3yUYcKJeGvj+KgvTY3N2FnNyqRYKdHsyXCOtsfE76bFcpcP8r31ds7VoIT0XcGrL/Ji7r4TIHN/G+3JSKaHPZXx4xe6JCg1Cr96AtYd14x3TZQRQk8uUvly1SaxLmuJXRCrW01oke7rQOadzBx5W9Kl6qXbjzCv04XkSvVLnKB5eURHuIcxiY8p9UXM283ZfdWuwk2lXkmrw5r5QUvvMevguOLHCXytYAsQyKAZtMG3KngYXtVocXi9dMsu2u+Dns1H/2116dWIQoxyph06jfG5G+YV5oJIoFDCm/NTzSZugR5t+V4SsETAfXnch2rh8WeDpUNRNoxDWtYbx82bzD+fGQf7GHnHxXsIF99R+GdgavtKNiM1SONC1kF8cr7fqdbzwCjhTn6ZnVoK/yiuNzjif94bYdhZJiGwTQv+HQsxaeRvZnf8EcEsRTxUBtP9IQKvmB0QrnwM2K9DlqJ1PynXFEqVDisVI5ZK5NgzcnY/8tfyLjk19yVbDstmMXB4Fwrl+bnLZRljkeVNwp4wRM7bSp0b6A3VCx7QWpqM+7nhq3hura3sqqaJqlAP1Iz9iMSdqMn7c8pmuRE+NiRXKzNg9G3n5rMN0FDm8OBxW+lThv+GGtq8RbDnlccmjy/+YmczEG+nVkD6vU8ivWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?yNV+YyxVndNXZij+YquaX1nAjTqucOxula29CjA0onUP5rzQXRUUbmiH/U?=
 =?iso-8859-1?Q?VMWAIJzF7Z8Vb1G4sYEl3AAbBxWjdPSTXj2kIjTG649CnhRM1MZK6kiCpT?=
 =?iso-8859-1?Q?4xrw0NMHAX4ZCHS8sDEvAQrAYCh1JLLtHQASz2t9cfwAdx3ncKoXPpOZDx?=
 =?iso-8859-1?Q?cWd7PxffrfwYkasmLO/toBl+Yw9FNkjtmnShun7VuRPQibohuCQAQGbnO4?=
 =?iso-8859-1?Q?87J5pAGZwWToP36001e39SFxUnvSKU+k+NsWbizFaRbSukTBYCgZPeMFTf?=
 =?iso-8859-1?Q?B8yVHFy4ZjB/NKGRzCUwphe5JNPoQSGew/AuEmVg6z51zi1LfOJ1vVVz91?=
 =?iso-8859-1?Q?c0EjYZ7MsRyKxM1Tfth8bOoiuIeq0mpkxwLcOSMnX6wznfKF9hWDzBVvF+?=
 =?iso-8859-1?Q?Mw1FZyCwwta7Ozpccmym/HNNZgrrMcaHtfdbIkv76et8N5QSNQuVNpTzQF?=
 =?iso-8859-1?Q?PUNkBrvkBRb/B50YuAv76U+B7g6kkRiadiDsLmrKPnguPoF6pdgaxDaV8k?=
 =?iso-8859-1?Q?zOXWxY7mjXHHuHC2rybQj/l8VKyS2JxVfrsK6b7zHdFXelBm5sWQ047zET?=
 =?iso-8859-1?Q?JfP8L39jhztwL23iw6KczVezd2zWhqWi/GdRR6+s2QPv6UfAQchIJ9kNCZ?=
 =?iso-8859-1?Q?B31fcIB9hXTXiiwuV2RV1f7Xc0VgM8LUjQnn2RrhBFf7D9QI7/L/HCuvDw?=
 =?iso-8859-1?Q?rcTWfY03dN0CXjfUv4xWyIzNrhQFp2PpCm5SFt1C3Wu2UQOUTtA+Fxxx/u?=
 =?iso-8859-1?Q?swbUZ4VRC0n2E6NztCOwnAaBFkPWgq0/oAiC8qDXDBVMzadrWCg0JK0HbJ?=
 =?iso-8859-1?Q?CQB05bBW5hrZVIzwCYr/RvqOKuJSLTItz5uIPiPKX88h6tULbEems6OGyk?=
 =?iso-8859-1?Q?hcWiGP31wkXc/9NXinXxE0HXnFxGldBB9Run6LhLuLyuWxv8yQEUitgh5T?=
 =?iso-8859-1?Q?pMsq7TQ3wOoblxUz5mVhy4zw2XEj/26MLOZSCkQ/k06k7S2Dw6qoNNQdJj?=
 =?iso-8859-1?Q?akZKwqe/Btl8hoEhQM/PocNTAayq9sNezoj2/M2QFORX2jXoAuaEACFrFG?=
 =?iso-8859-1?Q?cc/9hs72SvFP2QP5MllMFvxVO4/0YsCZtopoaCypB4Y7gkHZDjM2Y8Duak?=
 =?iso-8859-1?Q?ypMBNfXEwOnFn3gL8Sv0OVDj+diWJ92Vg2fyynuYokfVvWARaHppwFhXyL?=
 =?iso-8859-1?Q?WaLRUNn//MsplK7RDQXZ/1gygzMDkIp7EXsXu/pXjiOzRb0gAAl8vlCTnD?=
 =?iso-8859-1?Q?a/5UzeMz1HMd+RmvUjOHbT1XUKm8FGWV1w1YSHqzV4DyJEugXMV5K+P5RX?=
 =?iso-8859-1?Q?MWxQUBb73paD7+B12m5uNIzGHxVrz6A59HKdsdCE7JF4dfKLgKi3cQUtDA?=
 =?iso-8859-1?Q?Fr1X/RApv8ZVkaYXLhs92U0hYg9GXAzWowMseDXkx6VUT3DB6CfY8eU2uB?=
 =?iso-8859-1?Q?qV/2CAOVi4fvM07q44hckiQR4DwwSQx+We6MCMNTv2bQV08+cxqQPPMpeS?=
 =?iso-8859-1?Q?QiR5552NJJNmjvtBofXOnVwqV8hOZntZvtsH0cJ5YHdcwCHuHs/uOvXhXB?=
 =?iso-8859-1?Q?E31C6bSXB2FXwyIE4UC/LxIAtor+AafcyWU20IRzWhKr0hPAPlOyfXcu1E?=
 =?iso-8859-1?Q?4JRMvgZl4NEMszMDYacatsod83DAshaD2oetdlMA5nxoQsyIrWXBG+zr3v?=
 =?iso-8859-1?Q?2blduhlo1sHK3k3+R8D4XJm6XG6VUQWSTN2pWMazxdPjd2V25Sf2dFl471?=
 =?iso-8859-1?Q?miEk297FOPNyanldSmqLKkrs7NCsxOP5+sJH2frlJWjMpMacjIubICWo3+?=
 =?iso-8859-1?Q?na3rfkJr7g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1378fb0c-e512-4901-47c1-08dea5badf27
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:45:16.2152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+3V1m+oQ1oDpo/CkxZoSVBDwQtbyLCWESAlvbxqBPEngoej3N6upC5EedNemnaCodVKa2dg3PZpwolz3nlxvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8652

From: Florin Leotescu <florin.leotescu@nxp.com>

The EMC2305 fan controller supports multiple independent PWM fan
outputs. Some systems require fans to enter a defined safe state
during system shutdown or reboot handoff, until firmware or the next
boot stage reconfigures the controller.

Add an optional "fan-shutdown-percent" property to fan child nodes
allowing the PWM duty cycle applied during shutdown to be configured
per fan output.

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

