Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2126.outbound.protection.partner.outlook.cn [139.219.146.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A134E50C0;
	Mon, 19 Oct 2026 11:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410330; cv=fail; b=BYsUiZXc1TaBKoBeVOs7/eBQuDp+65/p1iVNysFirvKSHzU7cHSmGzd3gGJBB5DkE8KfvZXNlDh9bRsBWiqwc5xqLptqboY0woSoX5XPCo3z74EFIvUIjknQgBvOpj+YCdd3Qk0haWAa6dJlhHBXdt5170O1LP5nCIDnQoojEHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410330; c=relaxed/simple;
	bh=DGjVZc8tjmiawLbLPfHxc9GwH3A+z52QzhgrCd9D080=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NbY2zYuo5+H3NGaVteW+DMp2pkfw2WoKCv0wdp0tuuhv52pdklNzEz6QLX1KBRYzqi7efVpftYfCTpYboqI8Nrbw0BIsYncUmpPc/B1z5vDvDuM4DzJ7dJrAu4xGWPxTLe3dlaSnhPbkoysh1CmzowcB29QA10JMbfXwN5SW3SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNLlaNXHSYH4+T9073mwATU1mEd1ynUFXK7p+0hmsFIkZ3wBsCVX03U9EYIPMYuDOH6acnP7LM55P76teyGuG8qqH3ijSnVn4e11V62WS29XHZ2xkPQC0nW/8BHnDAqgD9XglYm6PeQv63F8kZnF7EJw0JQ9tFILTctZF2uo+iz3ytZTVTqqX7OAMqFbudk6d3pOmt58XmnVeTSuvOBpY5zuGBSTNP/P825kwk301QDipNXxKmOWvMdzwgDUEhXTOgOcpf5CuncoJuojRe0NWox2eMX5Yef/qWivO6okfXh9XMde0OPWxC2VqAqPtKJkHyH1LiePoaHmUHY5Opv3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIlwZZ1JgshcQ496CCxIp/KzrOWA2ylNEsnrYz4slYo=;
 b=aprEAKUM4oq6rhqtmt+ykSu1bMpxNAF6AAZbksBFCRGKeJQC3H3HUokOAN4kyp/Z/WqDH8c1U9f22S0dx5gRHXYH6zbOKkaKZoVNMXgYwgx0myqD+3ZyC4nj5Yy/c2ZPOgsMWp/AvlotPcemcs/v6W1hbGdAMZJzL0VeezFxL6kFFIK0jZNZFumICqh4wtvPM0lCFSnZdUp6dYcrZ1D65kYYJgsnNnU1NS/eAQTWlT27CS4WtiIdLU1hzVVp5Ae5VYHENCuaHI1V0j1HkopiEHqxrquzKi1kXW6siZpSCB/Jw5LfgS9xexeG5J2sovANQpAmn4MjOC5WTKxCxFgdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:45:12 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.017; Mon, 19 Oct 2026 11:45:12 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 0/6] Add StarFive JHB100 PECI support
Date: Mon, 19 Oct 2026 04:44:56 -0700
Message-Id: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::17) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: dae6c267-f665-4705-ee54-08df2dd66f31
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|52116014|18002099003|10067099003|3023799007|38350700014|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uw2EjVeml04Ykpi3bCdUhgR1uwNECG+HPNE1A7ejxT7UeDoGGKiE5PuoTO94EnlGNjUuSBzO67+m7PBeLd5boyDXn0coHA0T1t8dUhn+z7RSg4d5czlZNbQSgoXd+jTav40t4ctkz41EuiSwTFSE4NlpiatNaIL7LdEzEh2DAXK+SGiEwrbk7nI+iXVRqrvEOwD+jxm3j06w9R4ouQ6B72+Gvm2tkpq9HWbLwOtMx97Lgb+ouwbpMd947buIDpHNR7VLRxhYBtJtsFFZp/tsTc9YLtzNfKE99p4sN5lcfcj7xbAWoVbp7cX1T640E2XPwQXBAPcHkJTYAV5nYREKtmUNsTrdRvXtZkSYuw8T0VIqY7dgdhpT5Qheqf1CVo8EbZC5JD7r0a6CiCUjwWS/SkPdqQ4mu9pui7lO80+URtOzmZAuLddYKhXXxyQxL2jM4K9RhO8CMDYXOTBEuZjxfib6xdpkbZ2XXpENxJB6ovXIX9ZXIPnf87nuoyoQnHxBLEprGvUsg8UqLKVLt4MRk/7AZ0kecjInR8HthmwVTkpupEwg/sPImwEvKh+vZnsw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(52116014)(18002099003)(10067099003)(3023799007)(38350700014)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g7Ld9omxNGOIbe4zdjCMJjPkSe5Z8FthslvNNQ6FH1W+xkf9MEiV/9noyu+e?=
 =?us-ascii?Q?5lwzi7EcLtNfxXoJf9NsAHjx+VJjx6C3tHBriSG9MLtrApv631tbfNJiB/Oo?=
 =?us-ascii?Q?JSYM20IS7EpOHk/WyZhl1XwRy4ShGRsC2Wqmqgy7PNCrpCyGTow1EK1egT1Q?=
 =?us-ascii?Q?zp4UcSN+QKbod8E4rMTecjt60PKwYdfQI8Xphyw7E8QqagMDSmzjzDX2jjRV?=
 =?us-ascii?Q?b/eDDuowzfUc5CmjPP5OZjr1X4kK+FvbPg1zVA7/TIzCyKCBDsGW32LISbDH?=
 =?us-ascii?Q?1Y+wEjZvEqpuR1WZJfHj1Ogkpujiw6zM0m9gm216Okms5HZ5P7z39LJilUgZ?=
 =?us-ascii?Q?D1U+wS5x2QAo1N1VZs0kD9HPcHOBOp4Hpys50g4TuW8C2dU9l/9Bu7YangPd?=
 =?us-ascii?Q?rBinrX1rGfti/2N1bntxj23c2tLH/xE+JKpZO8jCSIuiKFojKC9/t3kHa7e7?=
 =?us-ascii?Q?Sj4gv6yc6YHL4nB211IFxf5a5lYoLwnN9hKR/UAREEMyYX9jdIQ0dXllnOxs?=
 =?us-ascii?Q?qdSu1JHEuYnCLWhPBm/ZZRm8BGOoefICSQJPnXfTWjQvttejVDQD5peDmH0L?=
 =?us-ascii?Q?ybnXO47XuFYpMn7NpFqIBzmSnnYF/4eOOXb81eldspHs/y52nZtvMjfkhiIq?=
 =?us-ascii?Q?nvgtnmzcrpdIk7PBg3TMEicvHrPb3IdRXlPM0O00NDcDc4GtolhmuIg7fHJN?=
 =?us-ascii?Q?RGkpZiv7CV5MAdUeuCbbdG2wGIu7gIyLUAnRqM6rj64cSAJrjbemYZ1lpRqh?=
 =?us-ascii?Q?8KDXwx0QuAVbF1sMIpRxt9jl5z82yhdkGJBMOAjQVUTl5iSFJFOr/J5ziL2W?=
 =?us-ascii?Q?Tbnr1AJH+bSskoPrS/MwFTa4xV9nphop2QUwVRQFlha6ogKzjJDfGG+qapnv?=
 =?us-ascii?Q?C6FD4vDlbtfV59YYrIYMSjTCkViyoMje0m6W6Z8EaCbFWjV4BCXB/UrAOSTr?=
 =?us-ascii?Q?UV/zAIDkOtW2duDnwlryPZzST2Dz7eFMzP2BEZ9cWA4VPsNdI9F/9rTcOUtI?=
 =?us-ascii?Q?W5Rk6mirEPk1UGbL+/mJdTqco6YO0k5gaA7HhfxxgJt4kHI7UxDNAWnQ5NLa?=
 =?us-ascii?Q?torz4Snn5ZFvPvy/vYrd9Hv4MZGRLN5PI/7VFO5esU+uhxV1VJ4FY3nfxVxE?=
 =?us-ascii?Q?CNKoG4Fb4FG6Cl/QQ9OuYFtuvzPiVxIqTBBr9HHnTLkmwJ65DJNs/1pjGj/x?=
 =?us-ascii?Q?DN/SBrkB7slJVX/qFemYirnZHw8Y8FBwgKDy/8bFHqB/NNpTi4rSCyoa3Y65?=
 =?us-ascii?Q?8pgiU3NYVBfjFsj2NYR145RBu1bI+vqoHRglgdZbnLPf05nYeldCAHXE3l6w?=
 =?us-ascii?Q?UO5NrDGqQ1yHg0haP1OF6i+dQviuF6+54hLiGNXEypaHVCOirf/F/UOvGYRw?=
 =?us-ascii?Q?GaLgQEui0wAOve/YulVpKQ1buw4r7gM5Yjyr/CA+D/A8sRRduHGzDjqExFEx?=
 =?us-ascii?Q?SlMkVHeHINz4W6Luc19+lHQJEZJBTcWjvxBbuatDlXP/SX06SkODRXZAATlK?=
 =?us-ascii?Q?GS13KhzuEPO5GI5FsYIqIjrQB55FI13W/uGXU+sSyHcOgX2WrnknugOgn4Wn?=
 =?us-ascii?Q?llb5Z/1v/GtgZXYcthfP7rV/oK4dqy96jlBSN0Ne0M6LtPdiT/ixHoI1m8UO?=
 =?us-ascii?Q?YIYE2czKcNGiGtSFq8kr4gwA9KSAny5aWJ8j0GFFsMKLsWN2silDqH1LFfFo?=
 =?us-ascii?Q?QmvKsBwSDwvfgBycpzdw+nSPkxiUtLz6tfSn3wERa5HUjsgcYtQifb4n0FeU?=
 =?us-ascii?Q?HvC/xC2dnNiEn39yVXlfe5cgCh/7s+F2z5MwR6L7q6co+tCRQWgq?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae6c267-f665-4705-ee54-08df2dd66f31
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:45:12.3299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tL++oGO1pAaUGNkjLPlVEpBsuOxFU2o+j1U6EhaU+F7zug4lJQMQJJXjPOOoq/henENH3x7k6r+zMC4FSIecmBdZZonm4yYdzHL+M0HC9QU4ONTVsIO6y2lhDSF3U9A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316

Add PECI controller driver for StarFive JHB100 SoC. The driver
supports PECI protocol communication for CPU thermal management.

This series has been tested on the JHB100 EVB1 board.

Changes since v3:
PATCH 1/3/4/5/6:
- Add Iwona's "Reviewed-by" tag.

PATCH 2:
- Reorder the linux/unaligned.h include.
- Clear pending interrupts before starting a transfer.
- Narrow the spinlock critical section.

v3: https://lore.kernel.org/all/20261008100623.7085-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260928075956.62298-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260903133408.110847-1-changhuang.liang@starfivetech.com/

Changhuang Liang (6):
  dt-bindings: peci: Add StarFive JHB100 PECI controller
  peci: controller: Add StarFive JHB100 PECI driver
  peci: Add support for PECI CC 0x83 retry condition
  peci: cpu: Add Intel Granite Rapids support
  hwmon: (peci/cputemp) Add support for Granite Rapids (GNR)
  hwmon: (peci/dimmtemp) Add support for Granite Rapids (GNR)

 .../bindings/peci/starfive,jhb100-peci.yaml   |  57 +++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/peci/cputemp.c                  |  21 +
 drivers/hwmon/peci/dimmtemp.c                 |  33 +-
 drivers/peci/controller/Kconfig               |  17 +
 drivers/peci/controller/Makefile              |   1 +
 drivers/peci/controller/peci-starfive.c       | 367 ++++++++++++++++++
 drivers/peci/cpu.c                            |   4 +
 drivers/peci/request.c                        |   2 +
 9 files changed, 506 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml
 create mode 100644 drivers/peci/controller/peci-starfive.c

--
2.25.1
