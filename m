Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86683225413;
	Thu, 12 Mar 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325657; cv=fail; b=Otcdd5lI+mBSLqjpgJp7fZ48qL3DckRBBjgLWDz8f4fxrTuG049elw7iKnGcSZj11A+mp+ZTRMKYHjK6fj3YCRajFr6XYccglt8gu3LbF4ilZZ72C4SKpGwIpj2EznVd9v4gmKqtL9gHym2AHXjSUG41FkDxGIAuXDKshQu9XnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325657; c=relaxed/simple;
	bh=xsUrnCC7tlS6yZUh12xSG3yfAGEmIp1Xr4S02ottibs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZlJuPLUumpLpUvpHOhJV3uDkIcA+y2ZQNuXke/IXY2MXKnCoZUq1ubSKWXt/38ffvXWIHoygB1mE+fYdZZ6Jl2KYiSRRHhDoGYA1yTHe7r/xwU8XZ/PFd+4MsjAXDTkNQ6FhJcSbRoQMC48CrmGSplI5s3N9Aw6qYEItyefeI2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tmCqMW06; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tmCqMW06"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y56zMPNsO2rcViyhwdSCTiSC2VX5gmiArtebJ8+dOHy1dEfVE1UKxWEK9PRCwNRunXIhX2ivPKlzXWLOANRr6KMopzXPkD12PJf+lV0xv3MeFBZCtblBeDQLrV2FrmMFMoxJtYVmDsdtMLMXERxZ56T861mSpRx/+96RPGcuc/hlSyRWmHPef4fKYhcEyKpbUhMmMy3k6r3dmgsCMy7xGkHppDlpHZSeDpdccVgzrMx41Im8dtEJBxaccwkeyTkoW6hcjpRz9+0NNRQ81ut6aWTNq0V9vqv0gThdOzdkjrvMcXa1QnwkJ4bKrZk3b0yFu99LdYdnIyubKK3AIZzXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TncSGhYh6Cgobjc2jqCVR8ntXXvRgea6FHrn+YTXRpc=;
 b=A/aBI90p02NWVh5eumLchvQjy1sYtj8yYe3zctYdtXTsgk3b6PJS7sLk+e5/IRVp05Lwaoni2O4bACtG90/V/GccR4mmxLmkkERD913SWP7ZRbyj9pIso589NzUMZisALuepqA3DtNFR39eEcoY6jFpY3yZFAeImFrmay1oiZPQtAS8lWqKlocTn+2KSEhs74Vml+Ta5zmEbQ4rO6hVnNgk7Nm0LojYEdcIai+BKNtIXWg7LHE6VhLMTxlF4m7wh9qLIMoMNXg6a38NC6XgdxoMeYHfRZYRyxxK5j5LT9LClagDqUnLVhKG8JHvDPxDbz4WSxWseje4iuANNLCifXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TncSGhYh6Cgobjc2jqCVR8ntXXvRgea6FHrn+YTXRpc=;
 b=tmCqMW06l7gAv8IfUqOYwEGDSGeU300FDElMXVfMZAj3ufoqKT186yXhdN+Natv5StfHYYOQTk3LqtRqwoDmdR4taUEC3BXFj9mC9uRRmoI+rCLpxTF6hnw+adgdAJr6iEzH+QhVK+LdK7j04nC2RAb4/tirkGojGVN1cXgVJpbgoipBHsVUcSk4AjRU9NTbmnO2hxJepQOzRRyQwGl/eju9Zeaoyqy6mQxfsdwvSE05NqfjM6D3JKQpHH3HOGk2HLVY2odqautydjD3h0nZpzIG5mOa0HfJRn5f8YUp6VwwTsfWJ8DWqoFPCGKwb4ypv5pbWHCi/Rq9gwdJMDdJaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 14:27:30 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 14:27:25 +0000
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
Subject: [RFC PATCH v3 0/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Thu, 12 Mar 2026 16:43:23 +0200
Message-Id: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: f12fba84-4118-4986-457a-08de80437ae9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IjvbPHLzrUpLOEGDlK49pyy8lSHC2kQUHVaDol61tN2aT8dwGVoSy+4ac+QgmRKqMjni442RrjdmQNEzIxQx/6NMs3uiKjo6x7FTLgYG2CT5XVQIgAF3R8aKHduYWb21fejvpSgPQWuJbgi5VAdoyloZurAOgeg6GchTTjTtGBTG22OhBWv0FLDVqOxFxTW07XlMqQ/N88/oxT0FK9bUY1vVPWWv/KkVnKvDSkkHD9NkUQFbaSuSQPKkVCIPJ31zNOdNFag+Pqp4qJZv0ZzWPObXalXM2OgWsccuU2rJBRAg9ySy9UTXbVRHNn8Qtn9bqWQ9bRcyTC606Q07M/I2E7+CDe6cIxsM8OZyrAhLtUnNqEu++E8mVOmia4N9tYqzFrTTQFZIZPX9b+HxcmtbhO4/DLIQzz8+JpQVyHm2SADbvtSFqVGvOP1/rlz3rc9fXyfaqtgNU4Pul8znZgfDihNJR9WdeccSJ6Ko0QiOWCXjz+uqqgeIyBAKNCZSs8wL6tUxPPwbu7+ck/++NGf8okOmZHScezNDVVvx/n3ct5S3SBJIEF4PP9qAk8FTbwJM5uLJHOUi7cS9RDTqfQvXxCLRmqlLxJMyTi+K32Y7iCqfp0yS6yO6Uv8UWggQfwMtq7e6yJIjD/yxv1R8mrgxEE9YRKSUOfu4NuPf9hOEN9KRMAQ+zNYPqXWPPLof1uW4e19RFSue703CDTXEGBSf8EPE4EX7ln55hWJulEQ8VWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Q+dqEZgUen8T/ofnmB4t2Jjv4uNiow+C8t2ZCnmUmkuP+aeRwJfSp2F1k9?=
 =?iso-8859-1?Q?HnDZK84y0IMiUXQkUBRQkzJecyhiXgVow6Kc4DABkYa3wz9qHKHizN2mG6?=
 =?iso-8859-1?Q?Wi0Vm2WPLrTCQcpxpMibn/fUeWtKC7EzrVbj9s0xtThSmJ5lEvMucXpmop?=
 =?iso-8859-1?Q?RC8FUMVe8DkV9jlX2leT0NGl/jLXorZzETMI13hGqkFBa9tPzYea5o9IRN?=
 =?iso-8859-1?Q?BS+Ll875ybmNyngLbSjJSr/7qYNRae/XvwlvAOy1ooimI39AAU9ZpWWmNs?=
 =?iso-8859-1?Q?eS6izcWejMN/MFFUXKvLG/IHGfby0xCwE4g9h2asI++APjG7NzKyDi1dCY?=
 =?iso-8859-1?Q?PYwRt2RnPcPQUXBSUpJlUDsN4WdG+Wr2wAYsQIcDxNvH6R6Vxjfh5AU24/?=
 =?iso-8859-1?Q?2mcNJgo9KM6ESOYIQSBlgFeUGEn1RphcIkzYdAbDTdvK3uvV4EVZehFzul?=
 =?iso-8859-1?Q?sYjHwGebKNu0KqcT+tzelx5RzLOd0lIRYxhFwOMrC9pzVyRxgeHqkg1d26?=
 =?iso-8859-1?Q?lCWrBtSEXoIZIAmijrlDatd/prO7gLH5r2t1FbP/ZAW0zofAxTDqXtomv7?=
 =?iso-8859-1?Q?OqjenoriBg8JZ+MeRfw9t1uZY0QhfQy0r8zVTIBmLT1xayZ57sUVisuNc3?=
 =?iso-8859-1?Q?ggkItAdCbLEkdbrBLWIyizpF8JMdqwb40bKYSwArjlVcHNzDelarqt/HFi?=
 =?iso-8859-1?Q?gJf5B/gSe1L7RiCLw0KXzfOemXyWRp8N7e8rER8JfshC4frc9NcUWKZMAb?=
 =?iso-8859-1?Q?piljFBszJoAE3RHLbXCo/Bx5dPYPFMULRI4+NtiTRN4JH6ZJ2SJL2/ZXNP?=
 =?iso-8859-1?Q?oiqCRzP1MI4VJaPKlXTo/n0McHGH3uIPB4PDdaTMBJ3DNDMr9IwRr1fyXp?=
 =?iso-8859-1?Q?6k5aanYIK4K7h0dV6wUAVe+HUzCxSjDUGYAJD2UTr8JoyO/yJ7I+VDDgD6?=
 =?iso-8859-1?Q?FIL1A4zcZ7ZCcmwP+eKymnDYO+Tbt/+JU92Pbs6rE9Slx7pHg5B6xvT8By?=
 =?iso-8859-1?Q?TYekbZEUdbF8f0BOCgTUkzAvHO3DEfxku636eoaYt8JNl7xkQVcuiB3qIJ?=
 =?iso-8859-1?Q?EQwI8Owv3hyJWpTCXSSRy0z4RYSTYAwbRdbwtKqNLwEvvaNtv0L7rKK5we?=
 =?iso-8859-1?Q?r7H0lKui8INYL75ULIzQikULkYAEv10MgR3HYaFHtCbYqPwcCIlRUHTzKd?=
 =?iso-8859-1?Q?z8GkYD2DZQXKQM0nRnILjj9nSpYOQl209Qw+y0dBQ6sYwoBaiJuDZy6NZE?=
 =?iso-8859-1?Q?O27bP1pHdp91Us/6nOhZY+v/a0u7xgTGWK9QRSTrB3zTWxxWcViv2swIkC?=
 =?iso-8859-1?Q?kYfey0hnGkjLHjzh+mZqMIPs+/Btqp4JyRBrAx4KsyZBu1IQ9Sr7+gT7uD?=
 =?iso-8859-1?Q?6XYlFGwX8HlkpJn5ocnl4bgBCx6F76EN74i6LpyCwg0o+MWUg3Dho846kd?=
 =?iso-8859-1?Q?/fSWK51RaVPJrewLij9bxCtHDwsUDyXLTpQytC51KyIISJ0vfm2zY89yaQ?=
 =?iso-8859-1?Q?7kl2yiIWRFE2zKenMyzcuR1x9y0qib4sI2Co1WJbhhubRzVwyljvY9hdgQ?=
 =?iso-8859-1?Q?EhH7NX3f03wsCUa3De66jassEHB8ihoMdXUdW0fQ9BIxQZygRQGj0yWdby?=
 =?iso-8859-1?Q?b6ZqfX/u+R3R7Ta2X9uyEUDh5koYJAQH5511ygOdyaPcid5gm2OyVX1LPn?=
 =?iso-8859-1?Q?l32XUrxBS+Efxbw1U8RAcZB+wiruaSWUL6qCJ8HxLyxfd1Gcx5jqK96J14?=
 =?iso-8859-1?Q?QOrQZOVHPRDQUuXVXT1wRA5hl7l63yrsWVIXziaVOfzqWeO/uVFFc6rxy+?=
 =?iso-8859-1?Q?LCA+fEs1Ow=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12fba84-4118-4986-457a-08de80437ae9
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:27:24.9098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k/BnhTnpYU8wGssv7BlWrZ/0AF8I2d5Giow+kJ+GloAVwUwexVwpZxe2yTp/cF+JsgbspIss9Gv0/reDAabqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196

From: Florin Leotescu <florin.leotescu@nxp.com>

This series adds support for configuring the fan PWM duty cycle applied
during system shutdown for the EMC2305 fan controller.

Some platforms require fans to transition to a predefined safe state
during shutdown or reboot handoff until firmware or the next boot stage
reconfigures the controller.

The new optional Device Tree property "fan-shutdown-percent" allows the
shutdown PWM duty cycle to be configured per fan output.

Changes in v3:
- Rebased on current upstream
- Dropped already upstreamed of_node_put(child) fix
Changes in v2:
- Address feedback from Guenter Roeck
- Make shutdown behavior configurable via Device Tree
- Add optional fan-shutdown-percent property
- Apply shutdown PWM only for channels defining the property

Florin Leotescu (2):
  dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
  hwmon: emc2305: Support configurable fan PWM at shutdown

 .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
 drivers/hwmon/emc2305.c                       | 34 +++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.34.1

