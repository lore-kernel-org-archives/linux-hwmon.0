Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941E1A6829;
	Wed, 23 Sep 2026 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168884; cv=fail; b=gfXdor8vI3ZZe26ctfKM5tEI3I8dzYzbGiaGdQAx9sxfWwNMqqf1Cd34PfdytPqfXxfNLZh5gr7vi1FlPdXXHPRQP//3N65F2Xi9PHrhDjQt0jSBJ0nZGSJaxNmz4IFe2HrrMTl3AUMxXE89AJFNOPD7pwr0pQMDlKIM4+h5kgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168884; c=relaxed/simple;
	bh=hvm0A+6Cj/banIn7Z4BNBP4YFpjq1gfw8S7+USwmm2A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DYoaeYQkFgb4zU7nJJkbeH9hHmvi/sEXVqMeBGPd4auaRPb6+uUn7gbWbVzBTM0S0Optup+ufGWADknc+cLx5SX7PMxU/5Z5Rq96JDiXdQmCCo5iwAEqHX+OeiiKIHqkhaCUDa9KlL59aUFVYs7qjj3gwofGwqeE20m9vyq5+EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4KpuWlIPhfB7ZaCMKeiudcHBTImUcOwODe+4vyluwmTrtNpAYgrum46Yh9USAchbTH52c+iVkce4CZhMbA8YRwbopeKIlT2x3h5M9VcWtmHBf729ZHwqgKrCzdG8gaKW0bp+hbVQF6L0xRL8AVKAbSgO8lsUeoythOpAuoK0oHkoqpHE/+egPV3Zl5iN2xVv/Bpclr2/z+I14OvVY3orSI6rSHV2nT67dNSQNl6iMFQA7RU+8fYdTz7Yv79Rnkwj/XjIm2krliGipQlfDMUpmszY/uKI7QvbWiHawZXOOllLSsLKtYPxV6kbtc4MEPNxSDiI7KnTw6qoE/os7Xo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKuvElSuV+RdF5YHLOpmLM+46e3SR0HSACiBAdYtlJI=;
 b=eHjMKOhSxdO4XijZnPvqt631Iwkaf7cr55UXFx163P4oloQs7L9VVz6ayn2MeMEHbKp08EhNLya5gea8Asntogm5xCYImnL4CCzbYQb8c4XyfxY/LgYgSoqDBnquiDPtUGHfA1rjzkBjGGc9MM8Orifb3Sds7wZAfDjCuNVHqZlZxcJoQRXcH0mC6eEhkmpXcx07Q2sMjezY181/UJHN0RnCp3hknTBgViogXIEZPVprXxcX/pzFEMLFKw+xOIFz4oiyWHDPvXaszFWErSNUd3BhGSeGxh6X/lK7PhPy+2OHPBWAkDb4jSlBxGVlnpt0rnsSod0bR3RXoU6QCDVTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 13:07:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 13:07:49 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v5 0/2] Add JHB100 Fan-Tach support
Date: Wed, 23 Sep 2026 06:06:22 -0700
Message-Id: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0008.CHNPR01.prod.partner.outlook.cn
 (10.43.110.209) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 672af936-3ee7-449b-6867-08df1973ab06
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|6133799003|3023799007|10067099003|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	pyhE9RdVxdPmevEp/1W7hwhuyGdPgriy2eI42twKB8kixXAbJREFITmbvB3Vojg28sLG+6BEQEQGWXzWvjlgTsGHuBc351dx3EZq26QWy/31cQ98F6/ci2A9OgGvQyfbsQFWye2FbECnV0+Z+NfCznAVFZzukmxyYUEoLGUJOtCHJ1LpOk0mAlOGt/r0eaNSoONlSxKAnmG2MTYVKHtc2z7Ep5vF+t3CLVmEZ8Yep0ZYsICT6FfecGtcv39PnfaM55CiFTBu6eZqZjONu5mgpKwwLxiyIZ/BnEnaqS8jvOTSc9mqsuQp7OXRlqObLf3QkkQ+oxiTmxLpHUM3lgz7h6tSKw0chEQzYYsq8xaLZi7IWvh3uhQrR+yVFuRr1EZUbBRbjp+xzE47/xRGlXh2b2Ao/KYKPGA26mQMY3NoWEBdzfem3CWViIeQI8BWfLzy6eoOBkNuXdjXC/qMS3hiO6MPF2KYdGEuRPAFT2Xrk+C3W7qZFKKFubJXY7Pwr6vRrWOwrBmjOYLEBNYXRg9qGGzXpcAM5qkNRJyZ1ZlDhgOyYCdIwvpWuNO/1XdTnO/j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cAfUked4Im+XCIrLqlufXIdRbh7F+dD30k8f1jHp6eRT23AgbsaC6g881s0Y?=
 =?us-ascii?Q?zI2Q/Rzvk+eMUPJByPs4XZ30S+4furChvaldRPydLV/+e1WxkSidba/cQ1Zk?=
 =?us-ascii?Q?htqrTO5KU2YsGT6ozcNOazAj/LxQEPC5eq+1go/Xk1bbXD+hm3UAJWwyvfA4?=
 =?us-ascii?Q?guCnBBRsykTOnkfnhMmkoplzC9oqvA5Rc0pjLMuYoZYOWGZvgAfZbm/qiArK?=
 =?us-ascii?Q?GjolpcnSetIODl/AxTlybxsGfaB3Cdo2TNGI6JNg0BlQxhHjkhJW25NIPDhc?=
 =?us-ascii?Q?7DMlXPtIqQbYH3qgAnOvVUZ3en+sEhzuVZlqNm9l9GgqcnGZEjCTmqt3Z5Fi?=
 =?us-ascii?Q?tIt7/C2ko3BHn5ZBXm1SXjxoLuivbzRuUfZRf+tOyw3kX5sLFaY3MBDPYYrE?=
 =?us-ascii?Q?OWyYg9in9AWg4XbewOvAjJIOvGgbq6vBNzvDoKeu9bbpQoS8BzjEc9tlv96i?=
 =?us-ascii?Q?yv1ZLGE48i3mEzXxFh8PHtlH46KolL0HIduFf503/y/zMNeFUocVC3G+e5da?=
 =?us-ascii?Q?32kkLVMDxm5kTHtbKZKtzatxbcUqK5O8sIqewprkuH1Z1Klg5/1T9euwA3Cp?=
 =?us-ascii?Q?Odve15mPO3xFk1SWnR55v50wrR00Lgg+WNXuoKMC8zISrLxDNKOTfU2BbveG?=
 =?us-ascii?Q?NLuY56G1cnBJW0/9OxWTl+P9e4xiGBKQW39lskBY9OCXJ4uHvTJ2oeRe7MJT?=
 =?us-ascii?Q?x0U5Jzsq09KhJ4HRRoUnkTfP7bswlgZ46phsTgjNA1KsiH+JD1Z2GhT05Av+?=
 =?us-ascii?Q?2efLpChWucNEBJ1drV5VCbJjD5R3RQkfI1UwUVCQrRL6e0UcQ6i4oApGsvqG?=
 =?us-ascii?Q?c72KPUnjUCxG2RmUPWo2JoLGU8vxGqpbdRqwr320oTHCE7lr/y4B1jOrq9eo?=
 =?us-ascii?Q?suJUDxCL5kUawJcDbmaDdIKHS0k6m+K8tuQ62soZHsPMIU4zStIU3AWF8zOs?=
 =?us-ascii?Q?m6DuiDNeDcRK96wf4zmXM0DJawac2GQNzvKoXqhPXJdpdQYKG4lv6wSLeLqZ?=
 =?us-ascii?Q?K7H+0ajoaEW0Ko1GrPz/cV/2S5cZQa8jsTjL/BJtnCRH1NXVDCoeLK/mH1HY?=
 =?us-ascii?Q?ZRLtJkiCjFnNFS31jOVEid9Kltmm9qmJiB8XwfWkp70Sr4DqdRwlBwTGgRi7?=
 =?us-ascii?Q?zr2JBruX2uaccJEOMBe/hMqYtXu1zi1fuHRS0aU15xIXLrUlomsi3rNiGsso?=
 =?us-ascii?Q?wUNs8snzEoILEY1ZEQXYHJbeCgjtcwzfOO3jb0aQfqQ5eOebXQXPO2oTsDgk?=
 =?us-ascii?Q?zhbaUD8dkZvgLA7gBOLU7hUvtsP/4v0Dx3P0YKMVvbtlu2mmHpVqtObYYok8?=
 =?us-ascii?Q?cAiiOdNIA1f9F2iOdjqvS6L2Ak7CGeT9+/XiB7oenjnD4AHPYy5t/KCFoGdB?=
 =?us-ascii?Q?+FhG91TwFDTvxdsw+RcmcV5kFneOZP0kbecLg9zmP1g2Jymayz3bxNPM5QJx?=
 =?us-ascii?Q?/V3X9yp7YvSbrJojT9qCxOpUbmVSdf51iLzOCAgARO3LxS/dlLsKq0KqdDxG?=
 =?us-ascii?Q?69O3kxRxlv0RHUrSMFH8ASwHIOPCNM1Q24Gmq4XAiGwWMtrA3f7yUx8Txc+1?=
 =?us-ascii?Q?H99GRNmykBWujdmnTXHfncIaHMLIyeiE9UmQdNiM6a5wAg61iCh+knwtGLAW?=
 =?us-ascii?Q?28uKYHbGflt9QLs29iKDVlABbfalDtJqFyRoqL61mcQPWCmi+XkCq1gps2jp?=
 =?us-ascii?Q?TBa+t8D7ixx8N8XHMwqcu3qFeF3d7/KZdxAoh+2t4VVXoj6y+PEJYFaSrSg3?=
 =?us-ascii?Q?mQ6PEjtGx11/c2vvRxGkOYpFniApP37LlXHpR9TY21RqwTgmDhwx?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672af936-3ee7-449b-6867-08df1973ab06
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:07:49.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZBUv6aU4SWs5aj/OYhLU0oqHPlSFjfOmwoieDdTnZ2611Q73yljOgPFQBRp7f6IQW/w0N0EKtrXnEWFhe/B9d1JnEHEMSu5LCeCVy8HOZvJN9KmfvtO/BTFYRhQTrsL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

StarFive Fan-Tach controller can support up to 16 fan tach input.
The series has been tested on the EVB1 board.

Change since v4:
PATCH 1:
- Convert the fan node from fan@0 to fan-0.
- Add the phandle of the PWM node.
- Remove the reg property under the fan node.
- Remove the properties "#address-cells" and "#size-cells".
- Convert the keyword "fan tach" to "pwm fan"

PATCH 2:
- Add PWM fan speed control through up to 8 PWM channels supplied by an external
  PWM controller, exposed as pwm[1-8].
- Add support for one PWM channel driving up to two fans.
- Add suspend/resume support to disable and restore PWM outputs across system sleep.
- Add pwm_lock to serialize PWM updates with PM operations.
- Convert the keyword "fan tach" to "pwm fan"

v4: https://lore.kernel.org/all/20260830011941.40199-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260824030234.9321-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260819091601.41077-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260428082337.743546-1-changhuang.liang@starfivetech.com/

Changhuang Liang (2):
  dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
  hwmon: (starfive-pwm-fan) Add PWM fan driver for StarFive JHB100

 .../hwmon/starfive,jhb100-pwm-fan.yaml        |  87 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/starfive-pwm-fan.rst      |  45 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  15 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/starfive-pwm-fan.c              | 762 ++++++++++++++++++
 7 files changed, 919 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml
 create mode 100644 Documentation/hwmon/starfive-pwm-fan.rst
 create mode 100644 drivers/hwmon/starfive-pwm-fan.c

--
2.25.1
