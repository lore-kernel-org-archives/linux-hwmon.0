Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBAF324B16;
	Thu, 12 Mar 2026 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317226; cv=fail; b=Eg99OZxGOZVSpBy5H3VY36gA7EKoj2xKXqsuPphoVTqmZQOsk7Fbur2y4Z+cqmwnLmCz+WIxkiqRkFHRBt2Tf8HZ9MiXMc4dE3LlQzxXThbYyYHrGkJbsUd9kIKlehpn1VOxDy33tHdjraJk80InCX91dmrzTTx20tkWNjm44s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317226; c=relaxed/simple;
	bh=6p/Dja7SkWNmgP1DO1wQrKTIt9uTGWkYkfkcilROhGI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cqkZ3zFQ6L73V99sMiyd9/rbAWxzumqNvXukAAtLyGFfe9WetEr8043fv6CrfD6WiTUO+nrBaKAWph7MtWvNcspmY2/J4FtUNyVRqwFE7vhy/MrHwntiHvfAzLi0oCF8g31mtTFu+MNpCAsTWY4JR26A/1G1Q27q5hbnFZAkdBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QllKDtEt; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QllKDtEt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSiPOi6ZSt6r5z5dgULBgHcv1C4cTUH+m1z1kzOjfDYdK43irYc3peNVpGH1XwYbVIxFbxHdl06EbQVIJNkF4e6k4o8+r+FnqeBWNjAO+wiZSHQYay1tOeJOABGqdvmao+m2nDIzlXTIJ3t4pFSXe1La+uamciYiX/VFdfkeQ4AS+1RFfdnpZ5v0b5cybN9i6h3nUNSIbtyPPCyvi47Q1FNOtinfmDAbTGQEzsVcBqcap+BSmkIvBY2gB/K80LsVDvvMNk4hEFkxA/UT7QMsXTl847kk6HvUItDgvLIf94bFShSwD+0rgNOw0CReGZHGURVXRWodR+F4HuoGeC83JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsQiV8IWB6X+JYgUdtgMWsYEbX6LvPiZUXUEOtWcnEo=;
 b=HrqAs8NUiIjHg2cQU9zsyJrAU0qqyEK9m0p2t7Ngpw2xe2ij2KKgrD1CB4P9H9sy7w2ThKxcmbaPpC4WHcSTSON4Qq43oL0pFMpGNfpjnpZ8CHjRDnp3mydo0Zj3Yw/xIe6nquinJEGbctpNFmH6ECBi2LY3bENHCptwOa9+T/JgwZfSpzmL8gv4AkR6ZT+1WAZjacbnHLXAg34X/2gLDU2b1d9FYnMdZCCxOYE3krWQ59yLEKAPH5JFdsdmbWG7U4LGu7vCdnPNQMV6GIIIcqNM9QuBqgU+D7SSNLiZ/3yWGFp6H1PN7IdeSEXsdXwK6dR0VTiG6xxEcFxyCicH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsQiV8IWB6X+JYgUdtgMWsYEbX6LvPiZUXUEOtWcnEo=;
 b=QllKDtEtaCCsXpCkGg9koBKF84jreZfpK653JckfHdntDYJ2H5/ejnnxsRY9CEGkcvWroHoIWayQxy9SGv5+PUMLFsRsXFyllMVNm0dsTDaq5wswdWlpKXW6Bcggeh8gQ4oKA5tDjvSuKzesEmBcWP5K+ZMUWlTWj9TOgBAGGlRGz/RBmAyvE2+s1gitkUZ5/rOn4Hb2J+swH0eEzY6qWrdhhOfwcFeXYzNRueedqFX20RPvQwYvh+aRfOPHDq3GTPDuSVLso27eu+P5PXCUF6VbVF/1wKKvHZsNi6mE+HDWXupg5UXhQDhuKiMahNSDPABhcuLMvOmMWHZPp104nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:06:54 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 12:06:56 +0000
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
Subject: [RFC PATCH v2 0/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Thu, 12 Mar 2026 14:22:46 +0200
Message-Id: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::9) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1acd57-8fde-4445-34ec-08de802fdad3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wDW2cbieA2URVqttnQty3xX9suibf3mwVOKIWAKBkQsSH/RTOEOWchMlZReHcJaaTQp8pTQb+60HgcnEojBQPIG+LeSU8kZ0ik/w8o5tsxG0ktz1I/1PJ2G35JnH4fNbI93RMGreKoCNmWMmS46vjAzFA/d8/AyjrwB6864225yohj78A9UJo6eN9lP6NN8nY/JCml1OIVKbjBVPs/tt3oscSI41n0yAsXF+SPAEKuEB6UoD9ZYcvIBJHJamN85jDmf6Lo4FRrxosjyLYs+dlefoZ7VHSuXcggcbDwaXg1U8I17DJa5+9NfFhtVVMmxWZM6iYEROsygtbeMc3iKxPPBIXr0lVuLAn/sRjeGXZq11UNaj3norI2iMC3q3lVf3kL8xtR0z/1ZdT+8x1z6UVH4kyeTjKUfA0ojnasmJal+ggX5qZ4sTovl3q/8MGM1ibYjl4+rdfvMW1ib9n7a1SExGtpmNa4dD0Ob2iKuh6ca9XbF2TXPT4tMw4lyA6BJDgiSOwZS9mXLRb43xL5dM27pBCjJaydwOjAX5kOdQ33ZcLKBn8umDjzalAiWiUBJlvGjz0aQSh8TNduPZ6W7Ra6/DEyqUdrFB4VGHLXdGYFNnn85kDMeaV0bbvVnbF0ZwXlMtJFqyRzIsUkrfu33pvpXBlZ0yd7v9n9q6QcLCad8dSX0fVNTAgQP7OYxjMbYpzHOyVWxfTYv4EpJWVepdypiAx+8y/KKxkLDKqMZfVAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?tCCs9wN8Vhj/wWbjxI9+uJG5Q2rvNMgynkQ5qaK/P2kiU8MEfrqMQLpTFE?=
 =?iso-8859-1?Q?fga2NJM0xgDt40OYJfBBINLeF1YwzzSBOprByQR79h3QdDXzMBb4bmgREf?=
 =?iso-8859-1?Q?W5S4d3H+6JjdmAtB/VRNmf/lx9LhttMTOn7yWzCEM/ZRhdNWf8Whv3re1M?=
 =?iso-8859-1?Q?xg7O8/iFoNc637Rdf1nzUUpuBfbiXXGtdx8e1OR8f5isf8OhInoVFha275?=
 =?iso-8859-1?Q?YARims7mTG/L+yqTkQ8GyKBvFIRX+3bLWY9D/zxWmuyU3Yxrm1kQjnglsu?=
 =?iso-8859-1?Q?J8MezLtk0zmduX86B+th9NaYH7/70rDpLPm+spYGYyOpYCFba/r1RwGAlo?=
 =?iso-8859-1?Q?JvxCzZnBMQkmzxICAtntOV/Kbh3DF6PUXDsAHJLQGaCXDBKh04GtoF7y9V?=
 =?iso-8859-1?Q?MxaId9bugX2Du1uESMHRfYhNXNMcH/oaUwBI4W2+CWBOHNUL4+6GIEowz8?=
 =?iso-8859-1?Q?oQ2D3vDTioGx3ZpYsIIijwOOkKUUaDvUGsRZqHT1FwCDUs2XI1LFnwvt9u?=
 =?iso-8859-1?Q?i64yBRpqrVPpJAvZH7lC1xKttE7/KVWYk7nRIlnQXF1HN+uBoZ7rlAZ1hE?=
 =?iso-8859-1?Q?BjzwhYwX6piHvv7qdrOJ/QDdG+6p5A6Z7QZExr7Dt7YPRgrbDWHUzI1cnv?=
 =?iso-8859-1?Q?vwnhximcrjtiQrP18EGTWdtS02V8SFXS/iz8Njia0W5jvzB9Uk+OXZ/giU?=
 =?iso-8859-1?Q?YwED0PRGCezyh6aY4U+YV6DWKo7s3ceNRMjC8XiUhjbCLXFtQrI1eiGxfX?=
 =?iso-8859-1?Q?Q+Br/Q9Ld0pk1tQZb5x0KnY7YnKg1oK8ST16RtqR43PU6QRxorDn1skpgJ?=
 =?iso-8859-1?Q?b4IemtEuB5jPfuurBQMz9c1yQDQtt8JF3GGZLwZSsgOQ+yGdaOVVXYlGYb?=
 =?iso-8859-1?Q?+tvfreLCyPPH9oCjPu8ds1YBTFOGhxfpwET7zCFmAEEX6vDI2ud75Ov0fH?=
 =?iso-8859-1?Q?oJCTTgKNn4TMCOryGwI+9Ky3Y9EJpB3dGk1c1yDNaIkO5D7Ux+UjrKkRkn?=
 =?iso-8859-1?Q?RKFyEefCjEXWSgOPQTvLFVR59pXHPgi3aP+g2lCGhIu743oLb1P0v4ggJC?=
 =?iso-8859-1?Q?knHmoZiqS6hwyeg/prtGaKABKuN1GrSEexlxar6Fa5irfXixfEk0zytvT1?=
 =?iso-8859-1?Q?FFIr1WMTBRxo+mFKO8Uj7oXoE7JqJ6hD/51ZTZ4+sVWSg/lFysk27cgBHG?=
 =?iso-8859-1?Q?Nz9wT1xJYf3BG2kq8kTjPnjUix1OzV9s+urx14GMDq+KS5KjP8n4qCPu4y?=
 =?iso-8859-1?Q?b6o+m5TSPh9JbqzmI3OFxyNpjZTjBc5oD0iJwiz2/DVp4lAeqldz3gpAjV?=
 =?iso-8859-1?Q?AML6nrOLYNe6iUQbi5FgJe8dRh0RKh+j8O3vugxGQP/y3C6kziyeco2hDX?=
 =?iso-8859-1?Q?iV0XzfldA9W0xpj2Bmapf32BleWacKUv5vQ8gikbbQ3nIzEmsWpCWJxhjW?=
 =?iso-8859-1?Q?8E/Dqbz42n1DwFGofOlTmjlPko7UaSDxCjPJB+pFDPokgUuKhp98xghvqZ?=
 =?iso-8859-1?Q?8h7y8cR8XL1+Kq29HqioVAD3CUQewHDtjo0K7hH1B+BtPDLjX3kQ6F4/sr?=
 =?iso-8859-1?Q?K9VyXOcp6Qu8/QQ92Ykrs15GMhlHYExH0xhYTrjFPIQ7v2qdjHHYCSimkH?=
 =?iso-8859-1?Q?SAr1dS0HVhk7ROfYqP9MDWuFrgztBc4LxTLroVKxLS5vNID74y9yWiY44v?=
 =?iso-8859-1?Q?WafG/LihTa5rg8Jewr94ZpvVIYhQ72mSMulSNJ6GMZJ7Z593X66kD+uOdw?=
 =?iso-8859-1?Q?jrkG0DptP32FfG9Ok4n+V9e3dyqZEmQyEBX2Yig1tTHH4dwMBpQr39dfPy?=
 =?iso-8859-1?Q?+OGfBo62aA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1acd57-8fde-4445-34ec-08de802fdad3
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:06:56.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRuXE1koFl0CDf0f146EWHgwU8zKYtshkQ9mYiO1hsM0gq1gJqtwfMChkF4T6l+B4GD9kvGnvKP73ObfNsDHxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864

From: Florin Leotescu <florin.leotescu@nxp.com>

This series adds support for configuring the fan PWM duty cycle applied
during system shutdown for the EMC2305 fan controller.

Some platforms require fans to transition to a predefined safe state
during shutdown or reboot handoff until firmware or the next boot stage
reconfigures the controller.

The new optional Device Tree property "fan-shutdown-percent" allows the
shutdown PWM duty cycle to be configured per fan output.

Changes in v2:
- Address feedback from Guenter Roeck
- Make shutdown behavior configurable via Device Tree
- Add optional fan-shutdown-percent property
- Apply shutdown PWM only for channels defining the property

Florin Leotescu (2):
  dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
  hwmon: emc2305: Support configurable fan PWM at shutdown

 .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
 drivers/hwmon/emc2305.c                       | 35 +++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.34.1

