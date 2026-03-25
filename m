Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B083DFC84;
	Wed, 25 Mar 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453753; cv=fail; b=bNWk+BhHLy1WwlsPhn+gxLLetowvsOdYImoUnTSalRtwN3NgajtSJrGOyDIkouPzVFop9/bsZjTHmpRfYxdxU67onpIJe/4SJUZoQfuGG8y4Jn/cFqOse5ilZJUrdmIodQe9cAy3p83hJYIS8rJeRu8dIAVKeBUdO9zR/oz7+I8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453753; c=relaxed/simple;
	bh=YhIJmB14yMkiTYCUGtyXzfqU+jIAAA3HvaZs+udyWFw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rv7FY9sLB11LpTriKYVukEkP7BFXABDVXNsvNqshyKZDqtZ52Q/d1kEAdxxQvEx75nH24cOvCwNUm+PbotRaRMMrxgYPsGGvGG6HKTh4+5HqSnODncRE32NJs7nEstw90sqWtfYB2sYB84oACedbPxu8PrArA4m8am45cVlQl5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QHlsqxc8; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QHlsqxc8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhAAfqH9EIqO/EuhqB6jtydXb4oHZuxALW9irvl6WB3pxXv/bTw8dddCkD17pKeL7Akt5jzuGX8YNMLo1I8n9hloqPlSobppHA0mVt3anSde8xFE+R0KFM2AADBzzh3oFTQ/Rlb0SCuPPwphlVhPsItaV0T47nmfje2fl3ZgUK3TRRdPiX3m8kQpsWIUp5vqtqUls4JsPa6IlRsrsuO1mJdHIlKj1j/Pj8CN8/fA0pJBlAfKOxSlhL/q2F9N3hoWhB8Lv6IxpmQqEeKxXzPtwvwov15pFvp1rIM4o2ocxK2Lb3AtsI9KkMITJOLAKIPQi1V3Awn1zF4ZCk3K0kWX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYdUOXdqZ9dU0xIZEGtxYqtqBVZlHMpk0VZL/d/aG6M=;
 b=x+T6/JrM/P1GcTmv0DU3iBDcilaeJTy9M8uupv2UbVzb1JZ+P1b3Z1iv6oVqp0359mSV0XjHk7MjYG1mKd9NAO8qg09QMxgNZZo9Choijaucsh+8XKmGZj1iaXkI0w6llE3H/JVq5k83lnsKe0RF2dZ1S2eiuO/+cBvEWS+01kbDRwd6AD32omHNpLoHFGkvjknivDkFJaCojovwmt1tv7C3IDx2KN7qNQ9cnsSMeRHO7vzeAbvSRnvQwFB41oEHLoDuEpAafbYQk7E5J3moSmCjiF4cRCBAh75p2glqqQqOhOAnalMmVcpnHEXDtpOO/kr77hEHmAjDA+2YLOxcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYdUOXdqZ9dU0xIZEGtxYqtqBVZlHMpk0VZL/d/aG6M=;
 b=QHlsqxc8WWJv2S4bSrw3CzMlX2/dwS+qlJ7hkUmm9ZKN3oMDGFkKuB3aKLFT4xpEhgK3MgGzxzWRH5Uh3Kgzxib86XFLtwhRTcYIR6JnOsa39L0P0vwiWi3eGClhyI1atV3pk1HnZLLp2loYd29AZC8Tka6/evVLKFrY3XBi2c487+bBpAgzc6LT9b5fODtN3ivRcY4HxHyBVmUY9kp1b36kTEy6INT06ef2eh1VEcKZ0ZfmBgFdAVNKtAPEP+3DwACg7MTzY3CANUYR0AloLuW20BMsMEdPdBDbPocGfo8rVEm34VNC1sJOcg3QAxy6Wjoo2ZP/kUugHSMfjjOQpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:49:08 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:49:08 +0000
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
Subject: [PATCH v5 0/2] hwmon: emc2305: Support configurable fan PWM at shutdown
Date: Wed, 25 Mar 2026 18:04:42 +0200
Message-Id: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::7) To DU7PR04MB11163.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f1b54128-c4a7-4173-1b05-08de8a860cde
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|19092799006|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	iOI15vqXFzVvpI4iQYQhOHBsnVihmYYNG0/kSg635G9tiK5QLlSyYfxkrBn0haPhFIC1ZTsnSyBIIdSnSzEsfdLEho6d/3LI0sTUC2Feli/szHBBYhp2RUJzLPNIMFG+cz2I3EdwqMi4YiUDyjPnYzMFPjQTPJvAXqSb4QgHjHZ0FiSuRnczXlA8rbhw8bD+oSd7zjFpvHhZtZbhRSZro3OdbEzlIW8xXHAmVrhReFGHJ85r4fZtc1EBp4FdN3g0BQWBOl2WMzSQSe5bybe5I83erv3li0NToIlZRvz8PkO+masEOB6S3Z350c8QXq1/yD12adibjDtrc/aNITwjE71Hqyw0ZFG7o31O4LhLDbZZPd7nb0uGFtDM9bEoorIZbriAoq7ZaMX2s979zaJ9oDWLIjoBfO7bOgV34F2y8RmSJ/mhKaJB/mEb4xTR06R0YLTPrUSbkqvDsRiriF4AZuQNtD4MDnE0tovVc3cviEwY2vPdhBHhYLDWNzAIgsetQngoOqOqZSZoVhYM/9fMzqQmfxNYNd9GUIHqt1ZzGxgVuDKhH7X7ngGZtc8DdW6d2SoeibL3xtw1PmhJ1dnRLT5FD+Za7/rabNOViG40te1IZI3Vuis16cr8hxAK2l23Sj1JDD3aiUhNBNr8cItM8ydpfwspX4PknuGv12VXa+dy1P5CxsHB2gBGohi1h/8/IbO3ORxnWkxapA6YRdsG8ElAjE6tlapqJxTtsWGai/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?YYcNW2ZddIwAyLVtwRpV7jwavuPlTZv+9VADpbGGBOiva+nfj1V5+17m9A?=
 =?iso-8859-1?Q?6DC9jkzOjz9OILWg0LI9LhbKmKugV4de/U23YdFQ26MK/qfIK7EgBNjNvC?=
 =?iso-8859-1?Q?7ST+0wbDKpXDIJut0HHMQlxudiGeBbHtZk+ey67+LZIrXnDglBcp6zFlj6?=
 =?iso-8859-1?Q?gaPLFgQynlrIxSb0imaxkgGFdsIBNeNE+fPAjC3D2igvQe5a/0+SVUkQ4H?=
 =?iso-8859-1?Q?U2w98Fm5ZyDwB+SGG/uMNjBynq4z0NY9pz0l9EYexIda3ovndJRUNW+l4U?=
 =?iso-8859-1?Q?YWTrfuma/uhFUnrlQiKp+F82eUkYOr1H6hd9C9YwEuPNkQAiJNj1PP3BvT?=
 =?iso-8859-1?Q?ro9OEYuB/Ai1vP7pFlvppFFrkW6wbziDCs5lipPWtF1/2ts6jq9LH95DHk?=
 =?iso-8859-1?Q?vfG8wO0POgWYrbl9qCVkfuOgypxQ25qGKF/T0OM7vkPF4GloLgXXJfQVwI?=
 =?iso-8859-1?Q?4L1oVVO1kYrIVeFZhrhCLe/yEwgXMrc8HHgLjG2oznxamKguYPkE1jbVvi?=
 =?iso-8859-1?Q?FFROVWctEZaHZ4pl2BABSkdlKfimdUioiz/ZM4XPNa4qdx02DlyhJDjLMH?=
 =?iso-8859-1?Q?RWWAYeJ41oZS37E0Qt4qTgLvfafNIHuHFPdghyq+bPftp8pZZw8b7DXoId?=
 =?iso-8859-1?Q?Bf87CntbfmR6y/CCrWhex0eFXmea1uh50osk2Qx5irpod/38eF0Yjar03M?=
 =?iso-8859-1?Q?927Tmcd55fY+awWZ8kkiWi/Qz6X3R6T2vPIcPg5H6JfRNGLzAxP93v6quz?=
 =?iso-8859-1?Q?y1RV8dl/GCPDCIc4GAcjrQbKsWQDkHWiDW0Ohz1EzBAI9YYaTqkgBZqULh?=
 =?iso-8859-1?Q?NECwxm2iNGHAFwoyqyIPkSZ7a6kZD6zRb9/tUykQEDlw6SJcBlueFwWb2A?=
 =?iso-8859-1?Q?Sz/ilMRnFtWCFUPSprYqLaNQ+T05nVaGOvBrJ+/j32gbJY5xK/T3Bj/CGg?=
 =?iso-8859-1?Q?vHc4q0WD6lcLeQPxPdJegIEeybtHV68ykp1utMKx8fqRJ3n25plchDLjzO?=
 =?iso-8859-1?Q?Q+t0EA7b9fDcOTcSWouWMdqf3oieLk5wbAjRPWIcb+XxSR626Dui/vf0xY?=
 =?iso-8859-1?Q?m4KtR0FVpg02i0n/WA4xsJxU6IhuHOJ8XZ8kOqQh72gaLk5nNb73LeBAmT?=
 =?iso-8859-1?Q?QIgD3TQraVXHh8zxbuhOwtFm8PyCbQMRW8hoigQ1XZ/s2yokJjQMyCRuNl?=
 =?iso-8859-1?Q?gd+mrJ9yDbupM1rABjPbdclWJO36bK2I9r1NHVRGyHTL5adhMwcQqzRd0C?=
 =?iso-8859-1?Q?hCVCrQK/FpaNH8qgCQ1BH97pLp/NQU5VYkB12+j4068hdiE6v+qSU1dAEr?=
 =?iso-8859-1?Q?NHLoZx5a6eLSos/NjJnDACM8lqYvdNxObG/Z+aFpbv48RBWS4281vhwv/8?=
 =?iso-8859-1?Q?SlXXwZSpiP8xilQlyzI1yM1c9/Df+Ns797j+Sxf7x47lyVkXfMOV7HhSbg?=
 =?iso-8859-1?Q?5E0WeR87X50FVw2cxl4DBbsJAjJWBGY/klToPJVSq0zz7Y8BuMrA7SXOwD?=
 =?iso-8859-1?Q?ha4WxLnXFXoAwElY85UzbDitmsBbPl+WvMN1UuqH5JdtIL+AzJK+6VVH2c?=
 =?iso-8859-1?Q?5HgpQASM4NOI857b5LpIiPK/USNTHTAzUTfUl2scVgnEt2TYM35lpd6m00?=
 =?iso-8859-1?Q?gBlnrGiGCnKqnN2c1ktKwN/dXW3tMwW61d7PTrKH3BoOxobk/foD1BwuJo?=
 =?iso-8859-1?Q?PYhC7PkI6WpOEyYFhDg4vcFr2WZ4VHb8gMTRqJS9FLojckEVRjroIzY4qX?=
 =?iso-8859-1?Q?c6iLOlxrMQ+nwfSJz/KuXg+XNV1JJNXXVaFJgVO3UjEyToaSBzJ5jBQ45J?=
 =?iso-8859-1?Q?3BCQZ+/dww=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b54128-c4a7-4173-1b05-08de8a860cde
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:49:08.3220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJLE9lffT7wgLGRiI8avy0HilekhkZ/ykjTVUopE7BROcoHXZSpbmakjqNVAcTvQLARonLxZRDwc036LFdls5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

From: Florin Leotescu <florin.leotescu@nxp.com>

This series adds support for configuring the fan PWM duty cycle applied
during system shutdown for the EMC2305 fan controller.

Some platforms require fans to transition to a predefined safe state
during shutdown or reboot handoff until firmware or the next boot stage
reconfigures the controller.

The new optional Device Tree property "fan-shutdown-percent" allows the
shutdown PWM duty cycle to be configured per fan output.

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

Florin Leotescu (2):
  dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
  hwmon: emc2305: Support configurable fan PWM at shutdown

 .../bindings/hwmon/microchip,emc2305.yaml     |  8 ++++
 drivers/hwmon/emc2305.c                       | 41 +++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
2.34.1

