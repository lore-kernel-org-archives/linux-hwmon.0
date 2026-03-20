Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D553C1960;
	Fri, 20 Mar 2026 15:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019671; cv=fail; b=IevELfvKLm+d9xYlBd78MGw/lMOW/7VFdjh5GN3ua2PfhkFGrfjiZNB4thjV3zSG5pv8zEwqycdnesDdwcGKo0gwjU/YRhuipsy4IOF2S4HNg69DSkWZRDPVMOOF3qlZTsDyZh07fXq2NPuMCyzm66M/OmO1cT1266RkkiYSZZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019671; c=relaxed/simple;
	bh=YOzWf3PXR0xvLiEN7GDxKJjoJu+Us1Xf6pJhCECx+OI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLDglNDJuyoqTTRL2JCbOVcDyPu/Kqv2zqeVJKi9oqbCRuOjtOxlEcuGBJUTi7XUqOaF1HNhJ4vRk6Iai/jAX87mAyJmpggoPWyi+gUIZ59SebI3FqcyKluDCNnWW5L1l3/Ilv816LIHC5vx99fXVr9Rx2J+0CMZ+uxFhHLFbr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z2XSTOUF; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z2XSTOUF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6S3XsFxzuNTTmjbCdQaYZfE8DJBtKFtrLlEvUtfmebrntGqNVVPYWIiFvoFFy7LJXKwrhOZyHbr5gEHsUVW80sHZXStf1ZvTcHNCEBj3W687S4/U9ekcPGMX6bsf7btslSMrBXWzjOaB47kKt58TnHuHzmx5WReHJ6NaY6GM+BqRHE9MswiktVxSSgH3r6MubwUyd1PkB+7S/LagZkkVmKoqij5sUL6CVMMkzHGw4m0/mkgP6b+2kzs4g7rIrpl5pR+jbdrLtEZHz+cp0BlsOyhfXIB7f1oN2WhSq9oZ/2KNum+JXtO1n9MW5sY2PcGXzhN+DqzRaHWsn4vzNX6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWSdgW+wnKlyKMAhPxD8SdOyOpwC4w5O3NUQJUIZBSw=;
 b=EaEDecygpHl+WcydpO571JZsyt61MvwL3ZvTa2l9en2k43FrsB+/QsuZ7yMoy/+XkY6BcxZDYog3lttMVUpnvlQxsNQ66d1jgp4I6olstV5mNKD4UgQ6p3/LbqmkTvd/KcgTAFPiHa0G8KZ4BlPfWOq/e4Vzt6UHrBO6E01BxT9bW2nQMcA4c6nN94s7R9qRSy7Vs/WaF+IInT2wQqcUsaMIVEyJLOYhxa4naIlE4zRKIdXuOko1kERFOQl2rOgH5eW1qxbid9tojLnUb81dWA0mAeBGhL/2YyPV/6i9oT3mQDbGZ9vYlmRjy2mIhEW6KjOZexELmfUPjgI7AbAr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWSdgW+wnKlyKMAhPxD8SdOyOpwC4w5O3NUQJUIZBSw=;
 b=Z2XSTOUFW5JXI9EzDXVlScZ9mP6qLiDTsjBUFaMn0FILxxQUVeJ0V/trp0lOG3zvBCyZR1xwCkF47KfoRxWMvGBq2rcAH1n9mPFzwuE9z36JMzgZKeoJRADXrsedBnHHf7AmJMFI0tGQVWoR89BLOtHUJqt+2vMUr57tmxXjRW1ByzWG36fj2V8KW0UhXBy8bpoZ0gyONyVqsV0B3HsupEBNYJyMB4k8Qq77urppH9VKeyg681TsH+YZmjfxYyot6V86geoDz/21c8zzdAVRiSlv45Sxb6/BU1LGXPtfbbrYeTc3s+0Z9hi0FhUKziFwTnMsOFY7d9rtoShUoWOJEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB10630.eurprd04.prod.outlook.com (2603:10a6:150:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 15:14:16 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 15:14:15 +0000
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
Subject: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
Date: Fri, 20 Mar 2026 17:29:58 +0200
Message-Id: <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::10) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|GV1PR04MB10630:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f304004-3207-4109-ec33-08de86935996
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	n10qsh5Wt34cRWai1GQEw2KcC+ZK5Rj8hUIZE9v7rt3aYo1FpPwUTFpsZ56mbDbaWCef1SrU6IQnVEiYmegGhU1f34mF970bGz0UBsByV0x+jywu086wfcehuUmo3Q+nqI2nMhCuFsYsbhT2HW2caxxoLQMfiBhkC4r7MG752OTxZ7sMAkwq6eIHR+1fyW5bktUf4I0uduXxIQVudKS0ea04yEISTuw9hTwjytFVBsMBAAF2V7/oWx7i/G53nUrjNG31LdhfRpkNhUwSBynI3FaBt+6SZYoiwjjGnOb6GvwcmQ/vjMB8MuumlgQ7ZVJuo927PjMgvau/MnCsIKT28XT1Oi/jr5sQlWyKq559g0+feSTf4Kto59W9Xwy0OINBzeHnU7VqInjgqBlpH3cKAgB2NC16lPM4PsM3bhTjTH8mmvQHbZ5Zq6BOR2U8cKLx7ckqULZ5m/Y2iSQjaSG+Y5tTXJdeHKdI3OxkIDlSa6LEP14bNoZOG1b1OX0O2xk63U7GTm5EUwB/Ievu5hdGSSz6xRlgFbHrdhMMjvmRvbe8WBtBBEBuxzVuJ+Xse5osofMHa7gAlhhjIjVcthdzzoBh3WaotVuntY0aG1k8nLBN+cQNvlmxHOCBoVSFBmM4yFL1D6KFFX9+tZe0ZaNFD0eIogoHvg5XCJcpsa5RsmovDkFrq1w1VarH9h5WvpzJZGRq2O9ZHI3LvbTizO5mnOe4hvMy9iW0IsfhyE3/HFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Hxfc4Jo1mH+sFair/NibICmFkvvoJbllCYenBp049W4V2yC42GCb9WCen6?=
 =?iso-8859-1?Q?Iyz2x5xDm651UesD6ssn4KfTwEflVDnKg23EqGcD0ViywnF++8OmrvbluJ?=
 =?iso-8859-1?Q?jr3ToxtAuHmWn+i8ypBIyPU0BwRmqbx7YwkYbeItDLIxelfAEzxhKgAk6D?=
 =?iso-8859-1?Q?Tu1EdS3+VzpUmFxWEQUAQFGzO9DlsLHd4H0Ty2vr1K1IUh/RwW/VXvOAxz?=
 =?iso-8859-1?Q?Sfk7jnQeBxe+vRz/Kmjt94n5vM/Aj8CelJiHz2OgNKMVf9y3fbbMVRBaxy?=
 =?iso-8859-1?Q?lPk5NbQLrBo+kjHZeoUoqIUBD+0Ppz1pikO1OYsUkKwfy98zVxB5qIT4cy?=
 =?iso-8859-1?Q?eGGjFm0m12sR2dy+9mVTraEGtvJGSOIhrRcBW2jBJ7dKRWJGnvZQZAv4g7?=
 =?iso-8859-1?Q?X58NN7wPHxNg2Wlia+mYD/z261nRZ5DJwMay/qsrJc5cM17zjILuO4aHhY?=
 =?iso-8859-1?Q?/7bsQ694COkhz4Aj88orK6G4Pfl8lAMd+jLwE63FmfdX4nN3shMRim3nsy?=
 =?iso-8859-1?Q?10bcSrYu95jfi+jsiMwkg1n7Lf7xvlPBRUIiXfqtZQFByIaaaWrAwxHumx?=
 =?iso-8859-1?Q?n43uzC4/vxVlPUvMU/8q75PzYAgcGwqAO6U/npY/N2p8alBT5XJnipVg0a?=
 =?iso-8859-1?Q?lysba5FpgVP1MmpCknz+4Dhg1fFopL2rIsGZBIB9mfnIZdUb4+3St7qJ9K?=
 =?iso-8859-1?Q?D5XNSEH0eB8512562nlkzZpkGQP7YYvUsvJUuIEfSfK3UUHADuJNc9opGn?=
 =?iso-8859-1?Q?Vf21fpJ7R9dWsvtq1gQM+pu7xl0uZ/7vsclVw1srnO8k6aWsyfXVluM4bd?=
 =?iso-8859-1?Q?/oZZ7OOb4tsQSSErvZNT6Kb0iNirZVozhapi6fs6YERyFJM/NDFRegvL+T?=
 =?iso-8859-1?Q?Sp8Ks7bNpT6yuwZFcz6ITMz+EaeMypq26o+USMlUB4iX7duFF+/w7w7D8K?=
 =?iso-8859-1?Q?Feojo2sYeHQfgxo74tJMW0wKZvnnSAAYR3UZSEH2nUfmzwiyUIzB8jHZeD?=
 =?iso-8859-1?Q?ss0t+T+Pg6HGoryu7QnsdqDiAtCXv9fR9fkwcWE37JSr1LGScm1wu9cKTo?=
 =?iso-8859-1?Q?0P3SGjer4fT05vc+Kg8siINlTQTeAFlYS0zi/K97htzeW3KWJQvOeSNQKA?=
 =?iso-8859-1?Q?psPKCCwUlNQRkwuYz6QwxOQ4XjIaSWquMOnpOWXnCp7ULpTvzJlNNEcJ+E?=
 =?iso-8859-1?Q?sNr4c6UL1x3G3LcU3YtRzOOimtgfKNV0q/3dPcUkgRRCZt4kI45tIofmNM?=
 =?iso-8859-1?Q?Z8Cv4EgYzP4wePjutnAO+SlwPu9IgpYlxVEW/1aAK8gfAe4sl4x+o1ia6C?=
 =?iso-8859-1?Q?nJtZsDnxDTyvRo/0uKSJOW2fycgcYHmzYCwdjhhZLFI5sMkplgd4bs4Sni?=
 =?iso-8859-1?Q?yhjzT36mfMAPCXJVDzGf2tNjPfjPW4Ed2SyTy3XtIHFnTFtKFXseHOWEPC?=
 =?iso-8859-1?Q?ssh95ifLxRHjQ7KlUh2jSgNLCrT/3rzq0GQfdslnOOPgxLuwiwoBaUptLR?=
 =?iso-8859-1?Q?FOM56nqeU5x4NB5D9D0uUoIcBTp3mjUQrtoAgIf2Z4a8MujAWMZai+RBHs?=
 =?iso-8859-1?Q?BA3dMILPullfMtT+pW8WEvWCLpQu9k0yFeJbLWGT9KMyzBTWEoayOssDtZ?=
 =?iso-8859-1?Q?AwsKFi0J8GOWh6oHjc7L4JRYup7cuNYJBKPHAeadnB8y4f2D9L4OPYtElw?=
 =?iso-8859-1?Q?X/P38LyPknWA0EYYv+QvmUebeePNyxhCBvEy4M26ueWNm11JgY+9O0nBnA?=
 =?iso-8859-1?Q?+KcXPGGOwkDJm2TO9KAEdA2cmZA3VEQiCioghyxOuykAnX1ehKewJMoUqf?=
 =?iso-8859-1?Q?5c5/BlEL2Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f304004-3207-4109-ec33-08de86935996
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 15:14:15.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nX7kMgGM5nkLyvVlV8+CW2w9Y6z7sJd43YC3n+95+02/MbUV7FnktrBolH70cULts+qnGdeHJvHmQ8cd3o+Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10630

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
index d3f06ebc19fa..7bcadfab9fc4 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -54,6 +54,12 @@ patternProperties:
           The fan number used to determine the associated PWM channel.
         maxItems: 1
 
+      fan-shutdown-percent:
+        description:
+          Fan RPM in percent set during shutdown.
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

