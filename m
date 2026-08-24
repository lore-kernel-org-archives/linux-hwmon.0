Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2093.outbound.protection.partner.outlook.cn [139.219.146.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF3219E8;
	Mon, 24 Aug 2026 04:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546210; cv=fail; b=lukjb/6SYXkk+Wtp+iSYAoH/HICZTwclqlCWacmq0T7TIar/VBkjX2mNiRnyNiL1lPFa4Y3gAihX61lq8u7Td8l2glPTfWx7baU8HBsNm9erXxM6so2TLBnz2bBMHFQOw+G9k94MTqtjaK03Ja/f6AdjcSvvMVKykOnV8V+e47A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546210; c=relaxed/simple;
	bh=/mRp6Jm3+vjVN/aRNblXgcx9mb9HPYXsk/9Uy0m+4kg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ktVzOn1j2ITwcHmfUfoV3n6Bj7IKoIkM6bfAauRPAD0M2eeVYkDJ5etsq5MD3CkDGcJravdYRvgdmT+cPrgHq/jLxk7az/PH5FqtbB4ovmj4eAaRcN5r5eXBtj++LkJhWRxExE/JFF5e/k+wsDEt2pUfpcSaV6X2MPRPA1foA9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuHbme3XtJOCABWxJvzE7yGgEokJ89uBrZMywn6lNxsm1y5xP8e8LoULpyUvluaYqp1RWehyyl/aNL0Mx6pWrgxjCUHBn28maJI0X3Ghki4iymvi+Dd7uAgdq/nykRjgspLCEaCd5ssiifmF3YHpKGBIwdlkHcS/BFY0Gz4BnTEpD3BKI8EwDm8+Cq0eJOiyuCrW7UXsNOg7v2CVzuraDjhGu+1RezgXdYTk4cKpGH9oKqrgngfX9G1/zxqWZf3Gu5VR2lovNERVPFadYw8YYU3kz94SRS/3HlVRsmyw/MWuJV3qiELuDQR6JXiZuZ1bbBudOb6aCAnwInGxzERwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9rbBiusJ+5ZZfnZ7ZkRqcWuwXUwH9jvl7P+YeAglLo=;
 b=Vtdk5XWq0Cw13Yt8dntojPD+0jQNFY5XNAQvgekYsHQRUw8ukR91J2f/31B0DrLHlEhUSYLSsv6Xa5s+pLQTFB93mR8Dus8iix/W1coiup0sC2sD1+ed+xBVUhunnlMQz/XF1XfdZty3Xgg1pY1po5Yn6hu5YJuqeB3rc7Rb1uKbRffw7EepzmhJ8QUTIcnMYH49J4gxHY4408x3fPH+8nQUEfaYsWKExbNWxtdju6XxvbkXos7cWGOG9qC3nbNlkAb7sxsT6wJDfZvhX7a4rgzpp2oKnCm6GKu9rgU9u6hk+RsG8lotDs+QpZcREtPxMzWTQqQ/VNgY1+2c4KLRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Mon, 24 Aug
 2026 03:02:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 24 Aug 2026 03:02:44 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 0/2] Add JHB100 Fan-Tach support
Date: Sun, 23 Aug 2026 20:02:32 -0700
Message-Id: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::12) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: 04815e76-f839-4acd-9759-08df018c2b4a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|56012099006|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	6Iv9whaV2k+6XM2c93QBN3JM2XExSfLf6dJPCUJEQrqKqyH1+5z3A/c7JN6CViV4Desibmh/dU6XYxWtt0loicCk4qCkhvchDic3uIQ+pbkUYlXyho5xZLW2e9jH4vNzNgPNlVYlRamjCqf/91JSPbvFyqew1VDhWezmaIhBmoNUFDjUm7oruIfcqBcBz5QrGWwIJX2sC6GXP7UpEU5d1g4zrm5B8ObzZG2ICKyDoVNqIrVW31i6HwMvAa+6zmeqLNH79PTciZRe4qv8nwW3UFEAUrjVExdQPBeY+Wbpn5kFwh7+ADQmKGTfRmcLpZrv+SllA8B6lj6eBL9KVBr8zfJ0F7mdob8lM3J1dOGAiGzSWqd8UbzYkkAs/pMJMQGyDqXEAAURC1DuAemJtW2EMffxQ7KN8tKyYZx7kxCUIXaq2MfgsG2wziPWv9IXe8yHZQ5EypCxl52vDTKMQeszcInqKRuU5WaCosP86E52hxfKovgMDyECoAAwhIh06ZQMfSRm9JeTCy3FrxgdfihLIlWRl+2MZ0CVhkejWSmFbhVTxUJSkZZ3vC1PfRAI7LEW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(56012099006)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BK9AX+xqlH8dKNKDAKUvNv3w2uy2DXHwQgtD5W89eA4EYrTsrO14Cmz9BmkE?=
 =?us-ascii?Q?CSDqrLPHi+aOzVgTgz3JOTFmFCDdWLcEZ7xkpgDZt9QC0fxgGvPSCW/2ElEr?=
 =?us-ascii?Q?MlwbpbNIqANP9YnueTU9ggSjgRxkboIacXNR7h2bzrnZrnZWGDMlbT1rYkv6?=
 =?us-ascii?Q?R36OmOWD/UBOpWTgBtwUSwf+RhkWr6Kqdr9wEjLM6dZkb0bxiS3Gh2xqn53w?=
 =?us-ascii?Q?vN2UzGmXOk3QaKTBgs7TKTzd97ThW2dE1ihkN9IgTS8d2eV5VbRzcXjihqKs?=
 =?us-ascii?Q?z86w35IAm7gfR6KtMo+QNGlVfCKzNooWMOxwEQHnROoyLxhpR+5vlhdh+fSy?=
 =?us-ascii?Q?4z7FLxKGHfMn9CnCnkQ3Yf2KFFc/AZeLU05zPSLLwC/Y5i+q6BXCYGFhxwZQ?=
 =?us-ascii?Q?bUcwi6b8L82heoHn9lXcqCygDN/KjOM7IVOK70mH21uc6PiKpxc3lJzztFNB?=
 =?us-ascii?Q?p1Q4M4rHSck5kyjVBXATNlEDtzLyNzFEo1Mt7LkTSMvWzBM4IVqdjHnljTLY?=
 =?us-ascii?Q?RdrP7VboI/jdwQ3hBN3xE2RiJtUMYSzhhK01eVcC5YNyA6aRJJjPElYOMzyi?=
 =?us-ascii?Q?fnwJZpX67k+yYQwPHc49SurptwhJURrpSD3fjcQqfuq1fijPGRR9StZ8G2fW?=
 =?us-ascii?Q?esxX+ZjixLFuT0ceAWeH6D11I9etkbcODdV140k6bl80NgSTbOU9fR6aQ/J4?=
 =?us-ascii?Q?RFz2afr5wWfNjQ3B3LIifP+xhhuRsd6U0bfaPc4vRs9i9iy23paALQlimGW8?=
 =?us-ascii?Q?3FzKZf9oDhcN5qO1SSs8vkfGcnXf6XnuZvyht6uu+qHM8BmYKdueZJzTRJey?=
 =?us-ascii?Q?MKa7KqoDK201moo9tJl631+vssFbeQ+KgeMtUxl0lwXblXF3ru/Irk6k/Y5c?=
 =?us-ascii?Q?EtxI+fppsZ+/ynjCw4iqR3olgsQcti2QSQw4SCykIxFYNQNoWYqeKM96wIQF?=
 =?us-ascii?Q?7F4pRyzzlewAKf2fzXVWS6KKw0HGx26mImINxSOZqD2GiZMudGwg/96Xno/q?=
 =?us-ascii?Q?8u/SrdusX9sxIZr9MlbRvLl0RHQJbSXiMr5FfoD7zdkvEeNln9LsgGp6oWzX?=
 =?us-ascii?Q?uPF9gFet+4A/fi7BhFAruE/YNvwR4hxM9cjxsJrPKLSc9owzvpUwfgYAXIXF?=
 =?us-ascii?Q?hlstW3AXtOPfFdFHwvD2WE+hAbRKfWeW/sdvxULs+g3WK5nBlmQVNMN2tR5K?=
 =?us-ascii?Q?Als1EQuE1FrltMHHe6yGxU0O9qiZLcgL0o/XW7z929w2dJPSzkz2IradTuZN?=
 =?us-ascii?Q?5kRZgya5TJ6wZJ8TrrIILfuODXqcTHXdEAtEmkKjHVpAMaepy8IqsEnfQYXf?=
 =?us-ascii?Q?tE7ZSzfqUTeAWHMJOLkfvb8TaUgQPiHYrefAnUwDOs2f3wGWLxpwjJy2lUFr?=
 =?us-ascii?Q?32NWhG5AarQUrN4tQeZYk1UexNvF1ha9QUHiXLtV7ZDIwEIGNJvwol1J0TYV?=
 =?us-ascii?Q?LKWcCxLQL81pwYXGUf6X3aRK0ZNG/vKJb3tZ6nCchiOQ1qhSUTMMYMdtQ6mU?=
 =?us-ascii?Q?cgsVSgrdxYYvAj0U+AG/fxT2lKZQ5RS429MiSE8iHIUY0KqjLHb3VoalmMma?=
 =?us-ascii?Q?fuobloBIjT7ZdIzRrI90sHkE96H6eBGMYwTQ3c9Tr+Dw131hqGsE3R0P93i5?=
 =?us-ascii?Q?q4GJ9HGiX9f2Hc5qZlu1ixkzYDYapeHiyJgd45G6Esf15KnNRdPzq82q3nqI?=
 =?us-ascii?Q?wLt8uNBXlNu/dgRJT+nSybZSluw5nRD1aa9uwSet2MglpvYnhj4yIYYZjc5d?=
 =?us-ascii?Q?jZuLHCX409+e7lgpG7en0WcoMDalJh3hKyXWAVmtC78YQdLELe+T?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04815e76-f839-4acd-9759-08df018c2b4a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 03:02:44.5207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAp02fSVm6fO6ERcoJeX1w/6RcnBkZQfZ7DvMf/iGSNRJL0Svs+IkCRRRXO01yin94hlC3qlVEkUttv7qKywdGDAi/EYIYxxkAGYEi0nfhNY+ZdAw5W8ymspNoZj6O8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

StarFive Fan-Tach controller can support up to 16 fan tach input.
The series has been tested on the EVB1 board.

Change since v2:

PATCH 2:
- Fix typo in commit message: than ==> then
- Remove struct device *dev and struct mutex lock from struct starfive_fan_tach_data.
- Change return type of starfive_fan_tach_get_ch_en() to bool.
- Simplify the condition check in starfive_fan_read() by removing the unnecessary
  intermediate ret variable assignment when checking the tachometer channel enable
  status.
- Return an error when tach_ch >= STARFIVE_FAN_TACH_CH.
- Add a description that accessing the fan status can be time-consuming in certain
  scenarios in starfive-fan-tach.rst.

v2: https://lore.kernel.org/all/20260819091601.41077-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260428082337.743546-1-changhuang.liang@starfivetech.com/

Changhuang Liang (2):
  dt-bindings: hwmon: Add starfive,jhb100-fan-tach
  hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100

 .../hwmon/starfive,jhb100-fan-tach.yaml       |  93 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/starfive-fan-tach.rst     |  38 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  14 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/starfive-fan-tach.c             | 540 ++++++++++++++++++
 7 files changed, 695 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
 create mode 100644 Documentation/hwmon/starfive-fan-tach.rst
 create mode 100644 drivers/hwmon/starfive-fan-tach.c

--
2.25.1
