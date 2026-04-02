Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B43C1981;
	Thu,  2 Apr 2026 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131796; cv=fail; b=c/1neCEnuOm1bNvujgi44slptzkbAbwMqSq4KFhXLn7M+0HnNWSHlWUiBY5F8sjJ03jtk9xqP22qNbIsPTV1OrKDdqqPd5OG5tYedGXyrmhObE9OsOscaQNVYZFMmBxwJ6JoQWoxPi8PTiBlgqcWFtOd6cE0KrGugogBTVBFg38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131796; c=relaxed/simple;
	bh=c298gDNNH7MRt7u+HsqdFLBJ+se1yjINCp5iGms8roc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HQ5cm+uXJ4JQ4A94HD6S8VUJUH+80q716ory3B2ATVSafU8WMgYlVeVx/dnfOreVT/ElRZ1rr6GpyYFf+TzsAl9wpaIc3zqstHhfvnvr3HPtAUo9iQCc23Bu4XvUtu+/d5NUIf/TH+4Gnw2emmpbAiXDPSgMQdw7Kow7LEvLd7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PZ9Elgoz; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PZ9Elgoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPqzt+7cAMFbtWCfeG1zHPBfj1rZYUXMX6LrCCTLlcDdvqHwF+uvzr3Tt3vgoeEw3lmdHanmV2Q2QlFeYjivNvJQhuDevCJiU1DeOqL7a7jwW+Qgiu0UcOc5CYD7NwBf9veWnlv7y+u7fjfLMzHab+iVbNtjRUes6MXcHTAyc88krB4MCHsrwLGVYgBTC7sDvvjDboBcA/N9ijyRO2z9ds9MsT01lIiOJr+QYJrSZ/wl8GmO5J1VgiZVSq467PkMmUMtR3365b9nZxwLBAYdomc/rNdTtGO6dLL4ZlyFspqGGB6jnyMcmZJt89/wIxRRPl3UwfVKnIb949aZBbbt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2YXifkFC+3/4Y22+2TCCF8YroMJKfrI7mLTpHW6hYM=;
 b=d0w8xOWdj9NIUlG4U7fVMopipbOOn4/cctmpk5tKLC87O7CZJZY+11vISkVGvTWZeyED/UO9Sue4MlTPrpde7qV52spOxleYRTpnMJ+8IGKJN+NrEZt8uUriOU6HZPcIwQOFGQ6xO8wQiA9vkDvIDDxZOrBxv8mElHFClDFmU4IgFuxohfqxpIRZzxvJIZGG0zb+CnA5jw00AyOEweHWcdY2+I7b7ahKgYcVVGWjmZ6PI9GG8Ys6G8GT/O6XF57lKhMrrPmNQPGEneJ+6c7d8xBISmmBSurYBzm3kbtTXDfoBvCN3KlRW022hU3HDoRAfYNcMrLyFY5TFfdY5mYAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2YXifkFC+3/4Y22+2TCCF8YroMJKfrI7mLTpHW6hYM=;
 b=PZ9ElgozJqnIvMdaY0rFM6GP11nZkkOsrfau78e9mdjGwLW0069AJaZS053RGtBaZeb/OGi/fxP/gg/+3DRwc8D9Y+VuYCtvTHvbwKh7hqCQZvvmw33Vbs8O8hSFwmo1f3p31I+bfJ736ZOuMp2BCBWx2TvEgg1yEuMjCxmqektc2DhL0vew6tctelPrUaNwD7PbQCME8nWk9zsJ7PRTcXeCcEDmcPQdviRUWlqrZWBa4KlZmvc/sg4FqbSEUiTjnBs2oH9bYkIoeimt0LZAslxUdC4oOyzgSabYcU02GyzHQj/x3eDlgAK+Lpc1rP9R5c2ldyMW4175c60PRo6/Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 12:09:49 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 12:09:49 +0000
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
Subject: [PATCH v6 0/3]  hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Thu,  2 Apr 2026 15:25:11 +0300
Message-Id: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0310.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::15) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ad7846-1a34-4cfb-a47c-08de90b0bcc5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0RI/9Fw9v3mHVd4nx/xAyV1s1Kp2r2VxDICRZBx4IydeBZkTdCx/e3mep37OfFtF7Zci0wtxrKpR6V/W47WuBzV8wXDMlzA+W+SDL+fVM6+Lj45NiJAW+iiP9aK123XTvCsXmh/Fq5eEnK46qUqDAmnm7mU9kVW502edhtZnim7IvEvI0NwQ4BK6maq0lQSCLSv5Nk6/T17nDr0YFMKRfx38rLNiYBx0KE5RXN3Ykd52EXGxQceKdYPuHfVqKR43CXtnte272il2acTyFL90ugqd4ea00NmhvHBS7Em31Ly458RRnhCDMHC9JD2sbi2TcZ7lWMCQZJNnm5ADdQTGS78SuabEsKFubqxPyNEzkiyDAk7XElz399/OvWZ5qHalt+aH6wYfPk8eZ5a7hgWsBmoivg2gZO7suu7qTk35cES9R/7NnsGYsyb5LYlNWFOP1h7q59SpjXLDbBWE1DHhw0x/YzwnyTJUUV0UkT0G2LTv57mp0nXE2YK73lJQcB+ntz9nLy78NEblox7jP0YAQd/H7Xu0QW4JysBjRtmWB7AS1wwvEQPoPsQaby1MWaOUwTxUoe83adTaGTXO/VRT4XJjf1knBOZmLRovuImmP1PA3DkyOL2fPj36Y3NUKcMQql773n1dOFbjsGbZcntmDKPfZ+8Y5Fq3PwHvLMnQHQskmzqm6wDmAWUC7lQ1NwosvzKjNA9xdZ+zYz3STQ70MZY/XPmq8+GBeh5rBhMfjZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?MxCycyQvkvw/JCGF9BkhY36ySKNkeHn4MsCbakzkDQ+29rDFWVHgTh32cH?=
 =?iso-8859-1?Q?B7AKNEbQkFCLR8KoVpDWEEQmnWpc2HGxrQ+udGwiOA4OeZWSnMmbBzbvK+?=
 =?iso-8859-1?Q?AVccCNC0J3ERjRzWWSrBAdcFFQWq/h7Cg45zgryOrjS56Ub93nCaveeuH+?=
 =?iso-8859-1?Q?uhuOoPgbvxlD0lspAaDA8LoYrkAIK3HUov70MwhMZiRIg2fg0C7ptv623M?=
 =?iso-8859-1?Q?gkZOpXGAa9gRTbebu4tLFvLoAES9x8WD1RzQ3ozGNYzqMCsiEW83/ZKAOd?=
 =?iso-8859-1?Q?rcMrl7C+Iz4ILsv39iYILgZCi6TLamom8j9NKmTL8PmA4tKF2OAhcYVev+?=
 =?iso-8859-1?Q?zANbwFoy5n+wsyuodhME41N7TwCZVQS8ZRnfmSJ36GB3qmADx49EneGIgl?=
 =?iso-8859-1?Q?tjq43nKpvH9nDa0WEXv8nghIrxVTECRiSxKKB5WUr66Auk1KKwCIU9tOVu?=
 =?iso-8859-1?Q?utzT2AVESM7IMg658cDi2lRe+GfNN5tj9KF8VimzGrr0PgoreVt2GPN6fT?=
 =?iso-8859-1?Q?DEaE0H5iNjIgIpHgS3Vzv8fyDyHNiKxEEhkFGMGAuu31iNHMIYrdnlJ9SQ?=
 =?iso-8859-1?Q?qci9a0t12t++8Hv+dVNQcXxSs3M5hQ3CZHLozuL0CFKPKpOg/WEUHE/6+d?=
 =?iso-8859-1?Q?/inscRqR/GuPRRcKkB+qye0D1OeHyUu5D9UojQe+FveGDRIB11tHhI8kUT?=
 =?iso-8859-1?Q?BtN6ICo4AyJ/ohRzyl0w51tgj2YBpaIF53QqT+W6W/UED5C+3wFc1Vzfeq?=
 =?iso-8859-1?Q?u/qeQqvMxo/rJZ4ZiJKqy6S2+vKpLzlbqAp2eVJUfGWnmsH5Vjwq6CwhdY?=
 =?iso-8859-1?Q?lGZEZr2OzR8XqNGNFXyiZsBy/ok9si4/2RyE3pNESw+aMmzaTR8CvjxpAr?=
 =?iso-8859-1?Q?a3k+N2ECgvTUxa7A/W3dDck173sXPwWAKzMe5JSI680AOMJTYMKDjd404Q?=
 =?iso-8859-1?Q?LD90bG2nGU2rW0+qtsQSjvNB63uN6qJwchQfyW5ngAeN8RE08bjff+YyhT?=
 =?iso-8859-1?Q?VAVR53YxMpbg/gh6zdTsFD+Fa5y2+XZv3yupU77dk84qhCpwJn47NV1haL?=
 =?iso-8859-1?Q?sS56lM+fA9AI/tMaWS09DZoZlXJZY5Dhdn/uXOO3AEMr/fk95TiXQoFzLD?=
 =?iso-8859-1?Q?x3C0xizgY9TCYEvaihllw/oWJaAY2NDmzqexiMewTwunFCc+w/Ug73Y3JB?=
 =?iso-8859-1?Q?xH+T6GI/fYOKBgZ44qk6OiwCJwzaAfH+bIm6yUPaxeORjMB23yTdJ2hU86?=
 =?iso-8859-1?Q?cBs9wY2Dr/Njxkz/A6MCtL9y4Dl72xGMFBG25OG8xnp+xRqD6Tq9YbVw+L?=
 =?iso-8859-1?Q?ILg8rnlemIcytwI9r2vpRpZokgO5NbxP3FRB/6uQsRZq8UL/it6am+dWb6?=
 =?iso-8859-1?Q?VbXttRDS1wuD6GwIk9/yhNBlkbrvRoPP8TWlnWM5nm5doIeyODIc0JQddo?=
 =?iso-8859-1?Q?ATUKwJTgBlkjINgG/kJiJj8HagkFaCbRjPoQvPm/sNoMt4FX+isxDcIrDQ?=
 =?iso-8859-1?Q?424+fLlJiPZ2vOw8O3Ac6+ttoztv83S/A9Pw/24vogNLNgUaG7gSzDOmqo?=
 =?iso-8859-1?Q?vYQX7ShN9qTn4/qS+o7Hcd5maCdZl+LT1KGFBh0W9E0Eg0YZuyEfQzJ9ym?=
 =?iso-8859-1?Q?Me5cqeyz4N8euAXzDFNsVochuytbjaJx9IRl5gIM9Pu9G7TFlVULkzL8aD?=
 =?iso-8859-1?Q?ixIODn2NDw9pF2R8PkKDc2mlpzB8R+j51DBjhIIvtbcFbEVn4kKCc9Eti0?=
 =?iso-8859-1?Q?CZMdzkbAGk8H7NPE7LBcFTkhZKUMUypMwx9Dj0IaEeKO7C4iT4uTpBjtgg?=
 =?iso-8859-1?Q?rwVZXpp0IA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ad7846-1a34-4cfb-a47c-08de90b0bcc5
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:09:49.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPfN7JqP3k/BI2kftDUnxl15ndr7EgP3rENfeSrPsWK85UIvw3U5+KiBQ9cg27sy5UvsrOTWPOx8x0uejfKKmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457

From: Florin Leotescu <florin.leotescu@nxp.com>

This series adds support for configuring the fan PWM duty cycle applied
during system shutdown for the EMC2305 fan controller.

Some platforms require fans to transition to a predefined safe state
during shutdown or reboot handoff until firmware or the next boot stage
reconfigures the controller.

The new optional Device Tree property "fan-shutdown-percent" allows the
shutdown PWM duty cycle to be configured per fan output.

Changes in v6:
- Split fan channel index validation into a separate patch.
  Validate fan channel index agains the number of available channels.
- Refine dt-binding commit message to refer to PWM duty cycle
  instead of fan speed.
Changes in v5:
- Add fan channel index bound check after reg property read 
  to prevent out-of-bounds access.
- Refine fan-shutdown-percent description.
Changes in v4:
- Initialize pwm_shudown array to EMC2305_PWM_SHUTDOWN_UNSET in probe,
  to avoid treating unconfigured channels as valid and written 0
  during shutdown
Changes in v3:
- Rebased on current upstream
- Dropped already upstreamed of_node_put(child) fix
Changes in v2:
- Address feedback from Guenter Roeck
- Make shutdown behavior configurable via Device Tree
- Add optional fan-shutdown-percent property
- Apply shutdown PWM only for channels defining the property

Florin Leotescu (3):
  hwmon: emc2305: Validate fan channel index
  dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
  hwmon: emc2305: Support configurable fan PWM at shutdown

 .../bindings/hwmon/microchip,emc2305.yaml     |  8 ++++
 drivers/hwmon/emc2305.c                       | 41 +++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
2.34.1

