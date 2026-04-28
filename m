Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226463D6CAD;
	Tue, 28 Apr 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366639; cv=fail; b=Q92bcImozwJQV1efo2GeXtQ0xMjaVOT9OFvJQkeAScXAF9W318HVsUfbrfuQWUTKsEyJNgdCX+wWVVOPvIN6IeA2J3rKfqNPM5Yg7hKV0ka0gY9sMTaBYpuKVdG5vI4m/G1GlxAUkkRrvI92ELTzfzUR5jXMaSJXF13divy6qkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366639; c=relaxed/simple;
	bh=07a/TeBfOd2fbWgAqoyA8XkgPawdx2FsAcTA070WXE4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=b5d0+jbnx0hSC0LhPkjAm75LYmpyK7xdSXFlU9arKpl5mqBuxNt9Rq0nvDq6Lq4F6KfB95ljqulbELghqwqjeyGt9TtY5FqQRUOIz9TKzk303M+4TRhh3Y0miZNbTP/VZvf5CDIYLTwbGVqJPcsjbnDiCZR9Kf4VoE9SRNt3tHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw9o2mVLj2hQGK0HhUZiECWCqVg8PgwApM2fGyE6FdZXAEuSez9nUsBE+6SzvLL7soFg7wtE/BjxaB6rv3Eqg6eCaxBfTVkFpp8AsKnGl82SAc4KYnIIykMTh6woThEJizFu3v6BxSwfSoR2bbfgza+7xG0jSU7EUJLKaRKp4BK1E1M87MKeRBG92lJcmW+S0E7bD+M8dH8hRVSL28TYdjyBkkWaHoRInXmFIzxsJUFOATf1by8rujKe7QuuiASLfvxM1oJhmeHRc7+Ylb0mrzJ1Cidbzdhv6yDqgiHqZOvNGFLCGNx/dTGMnoRuSZSvdNptwscTlIR2Rdn3cOn8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf+joTd5/4MRQ6WB0tIpeclRrdbdH6+mCMKwOzRUZLA=;
 b=AW3vqSyKo9QTso+3jq+/O2snS3gBDbw2TPNcQv3UKYNt78wTqq1GUOf0wMAOZ6/tCTZ1u730lHqeuApJL1odIMMgs/wH8ZOeSxTV/hyoWrZBIrHn4NwVwgGSKay7lSut2Pg5rZj6Pav8KL6B4wlyC4NJEFnWG22zbBS5J9cNUgQAPAfC0HHZkzNi5+PFyB5w5vpX/Kx9/TTJtlCaEr3ATYkGGUDypVcASLoY64wyhCLJqKY+pyrKCK0KXXzI9mdg4CETKYbk3JyML/EZ/w9dcC0U7KLgTCErxx0SyflZa84bJrJXwg7KUbfBF0O8pFR/gRfSvHVKdpEWIsIKnx1Yeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:23:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.025; Tue, 28 Apr 2026 08:23:45 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 0/2] Add JHB100 Fan-Tach support
Date: Tue, 28 Apr 2026 01:23:35 -0700
Message-Id: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0051.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: 3382bcc5-e4fc-4930-049a-08dea4ff76db
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oC5c8HXArMX0yuh14a4TkUpRVK+cjw90cNwbcflkFWYtgd/v2zHn6nMiTfXFc/RIFE05jCqFlrbK0dz/UH3RhEDI+jSGaUoQUBMKFN5AZ5gyFYcehiqFnPpMJteMWKMp+/rucrKiVGmnwPjQXTZPfMdNFvU0nD1SPM2dz8RabEaL0vw+1lN+AcF3Gzc2uiuw0H5tdPd2aEUTRTWBMDrexen9npud0H+VrQJdzCjjrcRJKQ8FDHavHRK8R19RrqP6fNW1g1WmjAifFzBSFSsq0dOaIS4Blqm3/34pNDGSQFg4vT1Q7gteUaUcmJ0Vm2dd/AIWB/T3wauiq/p5aXJFNlDIuJ/hrHVOewW7aFgxCxXkd2Usi+P1sb5c+p8SIoz786CN1l6asVU4KwODZEbwX2OxDrt2HvwyemKurqWNWWOUwB4Ytk5PoD0NEFsFF9FH/wab7M3VZPhZYFZKDxT5mo+PhavkZs+/9C4mtSCdMz1uW+avWJDRq6QVFvUzzjpsyP8O9v4tGR5BpXY+B/tm2B7ABmghTSoKhPDIeDvB3bYjPAX7xZ4X0e2j8vaDBDE+WQ5b3zs84fQyaulNnXlkhi5Q8D3Cg3W/nET791SjABY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UpFkwWWVxyMEybkkbSNf7rEDIPSKMFQXDkaJsT/cJNeMMppXrgP5lXjfT7Vu?=
 =?us-ascii?Q?NtOYJbMIC3ZYV9O7saJQ8LXCV8c28sap5IvH6lY+CQ8blNGsKbSFYZnNz+5A?=
 =?us-ascii?Q?9jqa2Is3D00/C2jg5rQo4AlA83k4SfNZCztgX/0raEt+BIW3KbZAdr1nsfbx?=
 =?us-ascii?Q?KjIdbaEmwRtqyGtw6/T9CjYwNz+xI4oJ8ZTOvJlrxsCzpoeghWxeSncMfnQS?=
 =?us-ascii?Q?BgAeWt8Q5gcZDTSlpWuFVswGio+aAb4DAvgVPxOBGC2Mf4qWs8u/Lw8YmURv?=
 =?us-ascii?Q?H4zgwGhfV2fjQV4OgWJpL0RWD91Re4tILej4kGb5vT+j+IhR+5ICZYlowAp0?=
 =?us-ascii?Q?h/4e42b2ItYKe+lNVq+rUOowBipYsKr3EO13gaFixe+8YvhbV9XqT2ejt303?=
 =?us-ascii?Q?08RknpSAhAWWksR/Ryezi6ZinjZKnoJbXAR8GqOwZQ+LX9y7ezu6HF7wucvv?=
 =?us-ascii?Q?w2+tMAfppazJ5tv1YI0rT/JJBp8BQi/k4LZrB2DN6wBvMG2as9VNyVlNd35o?=
 =?us-ascii?Q?CX+9eHq6wJVdZgzrCs0vG/ZMxIOSkvI7BM7C23XgPJ6Q+19O2mtstAoM3pen?=
 =?us-ascii?Q?Zz7PEu2+Cgbssh5NO30lHXggEdSZyvbXRZkT9kUzPpWfxPdW21T+SWV4tEm8?=
 =?us-ascii?Q?f91G4sboYlLZyQVWFW72ZROGzAaFnZGLLkNTAYvZARoQ/APeDEbGKBuK+LjN?=
 =?us-ascii?Q?4+Bw4Rj4FkDkL/K3U3s/MsQr1TClT6eO/WvsJHLy/OHzJITdGWvpUwpMSp7l?=
 =?us-ascii?Q?T6u5LnRo4Nyh0Za3e3JJHktKTmxfK8w8n4VrgmMTU2qwkToRCF2erR8by656?=
 =?us-ascii?Q?TUb8Al7MTSEHUBZo2msLRUbkPnmvfszaQF9JWh21O+Lj/55TRbcxlN1tGf3U?=
 =?us-ascii?Q?tIG/3YcZYioGErpYlsNdOTNee9cbFTH1lEyfdp1RL3oUJHYTjeJm1gWNs37K?=
 =?us-ascii?Q?HUxaJ0M0T2HQ5iFgRWwtc2ONDVhqk+8tSCPhq3M1ROuLxwKAhev6CdqgDVlY?=
 =?us-ascii?Q?pUvHCAe8mga0PQ8KiERGKsjtE4p0lNcwOYQTpiPOpjq9URnKOLSX2d0Bc0+N?=
 =?us-ascii?Q?u31zOBuArk+oUE8U0WoHz+zxEH+fnQZxnvYSj8f6LNWu56ltkL9PbsRZqJsx?=
 =?us-ascii?Q?fSvefMzmHiPYt656Bt+rKeXF38LsZjiTI0QRPAzHRZp0MaI3g/rUStfybKCx?=
 =?us-ascii?Q?xpMChrB3eB2HjTb4vHYMNFPmJtTenBM5tvieTNNr8un1r3rRP3VANxaPZL7g?=
 =?us-ascii?Q?6O4uk6m/LtvU9whQ6/nsiVC7if6h9U3PTnVmyWgnd1NTCVD7k71Tyk/tIwzC?=
 =?us-ascii?Q?FeZxZk1GamtFyff6fTX6qJq3cMrQrLU+i46KWXc0j5C3mPLz/eJ9viJtgRr3?=
 =?us-ascii?Q?StmSO8y4tY9f5+mZ6TB3SnEMGxPKVj2jJx1K6z+oEDupJwwOd53Cu9Ihe+rB?=
 =?us-ascii?Q?9gjSh+Y1zXwWSk+w5LzdlW4foWfVSV06xGsVgCbcp8HNBYjQX6CZrsUXVoYM?=
 =?us-ascii?Q?cMhfgxJvYoZ469HBLL++fyVVdsOVG/rzz1Ul7ZW028ek0qm9eUL7Jhtl6KQA?=
 =?us-ascii?Q?HTmyv2JzAkqB2CTOAGVty4yOWneUPpK4QZoKmjcRBYQlWcbebVK4uaxLTlvv?=
 =?us-ascii?Q?2zIT60cWmdgMFVR0bNLGgvbvBJe1RDoAwPOQVut8e6jVTp+RTJPEWQfilWiZ?=
 =?us-ascii?Q?L1Y4xAOunb54IZO5PYsRLyuR0Ee/nqLKPrLnolM2qq2EPxyJHi/CuDMsTkhP?=
 =?us-ascii?Q?fwxMMXrFxCNfVYh5rX8sJvjEklDlGhAhDG7IuLLoXnFIosQ769sw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3382bcc5-e4fc-4930-049a-08dea4ff76db
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:23:45.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9F5iTfSwNGr7Sz7W/6CnwZLFnWk0oQBQrB7kQlGhmg4reyLYQ5NcpR8cFsGFhATL9o3Cc77kCoBwnQKks30WqYo+0/el0JVp0+G5O/YXJuitHDm5/j/eimbnAwe5aufr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

StarFive Fan-Tach controller can support up to 16 fan tach input.
The series has been tested on the EVB1 board.

Changhuang Liang (2):
  dt-bindings: hwmon: Add starfive,jhb100-fan-tach
  hwmon: Add fan tach driver for StarFive

 .../hwmon/starfive,jhb100-fan-tach.yaml       |  98 ++++
 MAINTAINERS                                   |   6 +
 drivers/hwmon/Kconfig                         |   9 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/starfive-fan-tach.c             | 467 ++++++++++++++++++
 5 files changed, 581 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
 create mode 100644 drivers/hwmon/starfive-fan-tach.c

--
2.25.1
