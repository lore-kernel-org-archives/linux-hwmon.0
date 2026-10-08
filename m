Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2100.outbound.protection.partner.outlook.cn [139.219.146.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E88414A3E;
	Thu,  8 Oct 2026 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444928; cv=fail; b=TVZCDziHZsE3+aKRMZe0IG9VFt8q2NYGL9D4t/vLwLVJphs3ZdtBU7XpUAeNgsaTqTvt3SUR+C48N9+x0ljO6uHzH8qcLnuxC/Ouzl7mNJt04b6U9cHsRrwcXANSzvuGySSGH8VoaQjbYDkhmjlBtU8UbRNYpO2hjWF0wgg1xC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444928; c=relaxed/simple;
	bh=ZPGcklLEdReNIbO8epmhYiWmzvc162C9uK+9huTxmhw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Gbwvt9L10al3JWidEK8NMg+qKBXSAlDtkWX6h+ztNPsb7z3bUanK4s4iqadAujYbCxw2JzeDu+bVLFDJLBeIXBmANFj33WqYWfznFRiMN0nQZHrhiofJBzH8Moxh0ShhM3BPMI7JGNTIOSlYb2Ov3I5cNhcFu3dCMbC8l9nJXBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPjbU1HLpcphuuziyBnShK6MJXzCavwc+/NWb+fo03VJ8B8MgDEtayq1ovSrOzIsPo3+RR2aze3kI1brLdweKGe5pkYOeRrVSL2fb0lYFSt4GDsj7J3nxlIFQ167j+M9GiSCnTv3DGgrdBfHA1dUmkTtoD3MBZfK+a71il3VyIuJ209PwxKePjDl4I4MNC6dgXJCgnGyVvoDETun39uzH9ETBucfJFfU7k1laIvn/Fk1vhNlGvGAyFkBWdKMnlOHlWkiFA9ZvinTaMn2lynP9lQu1JuTAleHdSVYY/t5FHNMpwzOpZH2/9AJc5jOkrUq58lbnc12bO/xI4hpJ9SC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soMQzoI1wW/Ow04cqw/aqWQG/H80/sVWRAwfisG/540=;
 b=lO2EtFgTNY+PtlG9B8FB/cOyyTtsatcDuSGkEhE6OyxWW9ySv4kHNn3pLqrpp9r9L7u53cfv+0rE22gmeCrAugSbWntDQxXumf5+GYHum1WLS1gsQlhyroyuCyS0TlLDURSXrVbY7VsmN9+A/2g0/SGchTu5Bn0jcWev4jluXEue3nQZ5JCbmpJ8nsV//LEeBUlYuDNdwfJe6t76Hkrh3WmR43GTRADJjNF+vSZDKme6DmojUB9XiMdtpFF+KBYm9u8BMLE/ckq9Eu5Nj32/gk9L4BhE3OTHXMqo7nbhsFX73E5BUlVC6tmdfgCv1+tm4caLepchSkYT+KBH4dbaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 07:20:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 07:20:10 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 0/2] Add JHB100 Fan-Tach support
Date: Thu,  8 Oct 2026 00:19:48 -0700
Message-Id: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::30) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e63b2f-d5ad-4ba1-2abb-08df250c9644
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QJvkhweiPaMvc3U71X6jxdR5JmifQwKc2KC4zuBJqmvriCL8JIhm4a/Gu44waWpl/Ywr6yHg8eCKpT7o0oesenzzF7EQBuwWbk5ANxFdMflEEkfwcvcoipi5/wln1LI7A//DwHRAp66cLXzLmxZIPEt76gqF0wf+o6qNkVScNeavkwECOf9WgyiQBxjT7Bzl6s8/7kIUpc6SxPFzA7vKc9+fuT4K0w+fQYBUsn1ZgA+TUpJTVKthJYd3HIpKiNiC1GHYn2W1eQ7huHESW38JgQGSrI1Xe+XlLjOV2E6QvkI2fl+tjMDxYIGr0zdRGv6yf7Ymad0dGi5hRckMIel66lGDqx/2jDdM/iT1fyTkm6mbVs7TctOgFk3gqMTPPNEsqyhuYrVbxe/1fpt8JYOpFyP3N8NyvfgqRis2clm29ibMEWqMPzCBUXBcD+06D3lhS3kH95tupXqc0InOU0wH/SOL7tN5p5elJchRYP1T8HuzZtkA4I2+Tidc9hU0L/kQoxaXy3jGFuXmyq2xhwPehLFfEeWm6x7q7AMJO57+jIaT3LXqSTidsZVSHE7uoL5w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s0FjuQVLyPzZohcBd3XIBp8C0apG0tcIe4EncXBb2/8E8mTT+0pjZXj2SBoS?=
 =?us-ascii?Q?6JCeUWoxqS6g5W6ogbqB7eNRkI7D7qTsVcGx5iC+haITb5ae133ZO0RLdgdp?=
 =?us-ascii?Q?eMQx+evrByc5+/ATFpddtJGdlqSV5tQ9AP2GIqUjrC5U/K+sprsqxomKE9D3?=
 =?us-ascii?Q?vCylWI1yxjbR5CnWnM5PViYl+ZDSp6blfQWvkHitdOc9/Dwhoq0vFT+UkhYW?=
 =?us-ascii?Q?lPDXJO6JV5q0Ffutt7SrR5opNpdeMi7D5dheADDOIrfAiQdjQK1HF9HfDrEo?=
 =?us-ascii?Q?BpvDqf41tellmOYqem6+nMEsPPBA6jRQlBbN/4kQD46bc/Nrif3lLooxIvdc?=
 =?us-ascii?Q?I50FN0hfDIYk2g3v5rVBrsL48Hb/lw4QbOdirP5Cts/VYgyrSXh/R37KF9wq?=
 =?us-ascii?Q?25yVX7ttYDwH6wISErLrr8Bd4+V2oJI3AvxVAhVYC509jMV+ImNJ7zhK47hO?=
 =?us-ascii?Q?cc7MdXzWTIckOdVLx0vau9a+LkzSxd5VnPUk8YumAIQ99wIEvkr7pjhBuE8l?=
 =?us-ascii?Q?8cFAQjjDXWmKR9RIQmpsSrBkniYsDV1RPsIf63EXJAFySP4VsQT2myZO38L4?=
 =?us-ascii?Q?jBSQb84D5hYJETq34xGb/wzu4TAJ9zuLVotYiaUJJMlxMmcaBCKIGxRczztF?=
 =?us-ascii?Q?DXrvzC8fHalxrvMv93H9qggGngF77reliW1Bpgv/7xewYvIVDkgdN46xrHk+?=
 =?us-ascii?Q?2OIT4N+Euue0yy6krHhYRRx19JPCsqr8pY/9ELWMUiU99KYZHt/0QwvO7R8t?=
 =?us-ascii?Q?y2WjCu0PCE0RHk9wUbhJozA1b4kutfupI4yFo8L5mo2y7nIVehijDbiyMl9t?=
 =?us-ascii?Q?nhC7EmU8GdVXuYY7AilSNbNd9gCR1wvhSmt6WKQWOYNY7BVnl6m7y9EG9IWN?=
 =?us-ascii?Q?He1viX/TQwg3XgAZUPKfzVE8OCaUML99Pf6x2g+7pWqD4XScCvKsyMSddOTq?=
 =?us-ascii?Q?R4g7g6ier3TnWhlsK3vME5IaDGBWdhgSLqmWafbYKBETPRJHY9BKkAVQMFI7?=
 =?us-ascii?Q?6GDc6FR9bRxOLz0uZHHOierwceZcLIry13FHoEjzFoDXOosSlBGRuEY0f5/o?=
 =?us-ascii?Q?LI3uHiHq4S/c8eif6doZAMtb/WWxmBTg5an52UDDwJNH36SUnkaOE07Y3GiU?=
 =?us-ascii?Q?Ws9VHNH387YPKe4AfYFBOXNuZ17wEM5k7r1zkLWmkJKOe7567xFxx8sGbXl6?=
 =?us-ascii?Q?esMgDE4mjXAxUmWn0EOa9XiDZXbsDWBBhXrd/01wu/+/8UyQoJSvdBtudhUZ?=
 =?us-ascii?Q?7WTVEarZxFZrkJvP7QChQy5gYOYAzUlKckAYngG+dtT79uJJRnTrohm5uD+s?=
 =?us-ascii?Q?TaTLngqgAVZoph9kq19GHeXXbCH62N4E3a2t6+4RUx+icXvL7812ybP33tZ1?=
 =?us-ascii?Q?TM905eS2I1E8gGSOnd2ThSKsdbmavZbs5Shoc1ptCSZkHJHTxbrxk6bbraUz?=
 =?us-ascii?Q?GcRn9nJpGJzavXH7ywpTxuegiRTabndZJdF2cTsY/EDYspJLleNPDLgmHl0M?=
 =?us-ascii?Q?1U5dqFm4cyajbFvKB2AuPcmrbIxLk816ayj9yrdIgFBrDfiFdVT8TrFj0+R/?=
 =?us-ascii?Q?QCwG2t0cgOu9djo+QPe2KiuyvZ48bJFLGoq5BsW/3g8+P5l+ux3WGbjSJzYK?=
 =?us-ascii?Q?ezxB7630BhlZGrRCmFjdpItLHFU3t/NLX0h934SJvPw12+ScdHJG6CpGlffU?=
 =?us-ascii?Q?RIVU1h++bk31FGGl04dzgl0dbUWqopOOCo4M/qJZGDMOCtsejH357EDlmMnm?=
 =?us-ascii?Q?Gi+hokAjhfxHu8bz127I6vj33UtiXi42P6K5jONUmXPHK2piZ9AH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e63b2f-d5ad-4ba1-2abb-08df250c9644
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:20:10.2122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffCArdFIlnGdLpQcqSCFDVSyBDxillz3YK/HEWyn2e3F8ft6zwkeWc98l1u58hqv8EHxG65qAqmNtg4FtNq7UXC27ZMqX9N14h+dLQO4npzgxoCtVuibYn23qczTVmfi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

StarFive Fan-Tach controller can support up to 16 fan tach input.
The series has been tested on the EVB1 board.

Change since v5:
PATCH 1:
- Add Conor's "Reviewed-by" tag.

PATCH 2:
- Do not stop at the first failing channel in
  starfive_pwm_fan_pwm_disable_all(). A PWM channel that fails to be
  disabled no longer leaves the remaining, independent channels running
  on driver removal or system suspend. The error is logged and the
  first error code is returned once all channels have been handled.
- Save the tachometer registers (channel enable, measure time and the
  per-channel thresholds) in ->suspend() and restore them in ->resume()
- Add a struct device pointer to struct starfive_pwm_fan_data for the
  error messages.

v5: https://lore.kernel.org/all/20260923130624.239499-1-changhuang.liang@starfivetech.com/
v4: https://lore.kernel.org/all/20260830011941.40199-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260824030234.9321-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260819091601.41077-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260428082337.743546-1-changhuang.liang@starfivetech.com/

Changhuang Liang (2):
  dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
  hwmon: (starfive-pwm-fan) Add PWM fan driver for StarFive JHB100

 .../hwmon/starfive,jhb100-pwm-fan.yaml        |  87 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/starfive-pwm-fan.rst      |  45 +
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  15 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/starfive-pwm-fan.c              | 834 ++++++++++++++++++
 7 files changed, 991 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml
 create mode 100644 Documentation/hwmon/starfive-pwm-fan.rst
 create mode 100644 drivers/hwmon/starfive-pwm-fan.c

--
2.25.1
