Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A49442131;
	Wed, 19 Aug 2026 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131926; cv=fail; b=glCpRQO9eC3yoVVQv7IobAelXyUokls3znqulj7H9WIVaSafnKS5CsuutYOUx2TTp1OGiTrZ4HD9YWzJ40XXRkCweEObfzmoxvmMZpW8vgYffttislocKSWdh3s1JiVw1hVa50Zx/b5Xf9N9KBJPSl+FvkeQFfyBl2waFXgM+jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131926; c=relaxed/simple;
	bh=pCuJXbt8enrRmqHg/rswlak+UPLYLB1J2rWRgirpmJM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GRUmNXaazOQxVXuODVawF/JyIkGl51MzYa4Tc7fyzweouz+LMBus6QVyJTlCTv4poB9+UFNbqHm+GqzfGHEDlcDeAcFfFRBPKZ45d0pjJFcY7p++//RnKq1zw0WAVL98udPXMDVlTfVSy8sWKNPaiX66fBpeomyKf3wY4zJMVo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBHSiVIh5GHPRYbcTdDT8gf/jTT0Q0h/FnvT1lPG/nDFOkjBJ666cMLW6oOfDWplKMaq9mSCxg8AUSt/H/tYdEHFB93Xkzs9KxLdFrZDflPZX7LRDXhb2+MrQus+cFYvFTflKuYD1EVG6YxfC+ZbJ3AFHatxdc7NC2D9EgWOwXUPDzs29VZX5C5zdOI/xlwcuWvRf8c92yKmC7E37nkpYobJeWvLtKoXR4WMI4A8vmneFX+W7gLIYyl6lXy/xNEB84CJWCcpCCwNmmBs0wlgw0B/VXVnOU45WmuZaATz9544Z1UzNuOFgQJTj7fzdc+D2ah4kmDEVxkoChMDF5m9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMsPZu9pH8Fp9AFnUAtFLoWHKTMt2/oinM0lC9RFxRY=;
 b=kbduhUVyljn2Ucz/oQin9GJ4tJ6MjprK1E8yOFT7U3SNcjRjNLIlax9RfsOLKyXwkeTphRrD4GZ0+7ukp/HFkbIT746ZzMMYbxq8kuKeamuRyHjSYRwQh5B+/53CnFPSjXY/IFIW0IbyMbmeeN7UcaJlMbb4zd9ACo14n9KbSLYKhAIstgtrCnT9fU7cVD+jjvjWwiFD5FhUTAa+2ufiRY1vo2fBTYN5R4ncUrkO2LapJ1K4k5GZwbXUiwCynPVLep2M2hYXi1+sc0m7Yxi+iuZ2uCzQJ4r87ZMl5rJNUdi4hvtARa0LT5MYzRBCULJwSiwcGhk1WoFzYIQZX2CiNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 19 Aug
 2026 09:16:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Wed, 19 Aug 2026 09:16:13 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 0/2] Add JHB100 Fan-Tach support
Date: Wed, 19 Aug 2026 02:15:59 -0700
Message-Id: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: a80e0893-fbca-4601-d3b1-08defdd28437
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|23010399003|376014|38350700014|6133799003|10067099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	FxxrWO8E9otGtAMWBolDaQ9t3zME3SX5udnchgahfbrh/10YTOzM0aLqtp3G1lMCA/DZ+SphUWCDSkpu1yNcIM5jt7DAdxIIU66XSgA3S3aTwQyEgAAFLxU94xOD9saiQB8XRPB/hAXCYRleZZcpmqCMWaKNtvb723pe7skGUqbGufVmvGIg2SEBzE0XyPhgGKn5uT/X3DetK4GSNwmlo9nOPEVf0bQMwY7fNYh1GjNOn5VQVBoTe5xq9B6owQ9JJhWwPtBd3l0QmEh0V+SzJyqysqJuFJ6mcwB0LCDyHLHDc3RwrkDddkpAdHY6+Wo4TgrfgzNR1DO9aIf6tvRMwfRcAXHlBYavcAUyGI/V+eewZpEouxDlRWUvM921J1bgaebahwyp633WOoWZat8ayik4/8o13vWvJVlUeBRXExbVtqVnuTJJ8gBNXkwyVpvh/CkUukAWayzCiC+S/3S0+lEcfZUWxHF8sff1QttC3UgT1M7SVopD5gOMVPcXwtRXcmPzrBWdtoWx/OekM7fXkfifVLhneRC7W+8ty+kwsJCF72LKL9RzuOIfUGf3aIoc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(23010399003)(376014)(38350700014)(6133799003)(10067099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XQ4OJFNyEk8zK++qp8nqXFQ0IwlWB5S49hVPF/f5Rm/bJWAZefjePsDqaky3?=
 =?us-ascii?Q?sXqV7bkzTpQaZbY/iIjwr+BdPsfPSAIMDdlKnunLS4I1FdGoiIwqrb9zqrVt?=
 =?us-ascii?Q?1Xp+IU0qFZNLG67PakK7EjfTwotrVFBXSp6lkVxXgCUqZIXmi0APPONB5ukI?=
 =?us-ascii?Q?HbxCFRKJ1V3Xc0izwFH/upW1jLJgrR5d/4zMzl9fORn5aEXkQlzK1LPFogYA?=
 =?us-ascii?Q?jmHICZq0zFUZLskUVr0zhmdB9BHYFW3NZBFoTy0vzzVXcRlcLyzJHwWArIE8?=
 =?us-ascii?Q?+KhtQyhKAPsBam/+RGgGbwiltslZBQxROKu1btqZxJKdQv75xo59HHhIXvwj?=
 =?us-ascii?Q?C6QYB4KL8JHlOfAVt/TOcfQrWlWM0UaWIkIxonczCNa0qIxLkT1JucvYzx+a?=
 =?us-ascii?Q?235krz2yML9h/g3d2vzvIoogvPDq9J/pIBizyYKJkPixqPWPuC8Vhoet1yhE?=
 =?us-ascii?Q?TDuW99ePh5iraxkGDt41ud1mdjJlEbAeLT8RWtNf4nSmBzGQryEBJqlrA/cx?=
 =?us-ascii?Q?kIde9MsZXv8wfVY16n6p/8mITbyBBcAhHrDve4zrICXicGJ4T2ZBTg5u4vEG?=
 =?us-ascii?Q?epq9r5/2j2W1X6SseIAkGJqmRgtJcqFmmnWTmpo17+NE129aUm9RFrRqBnEI?=
 =?us-ascii?Q?9zvBI8r14+vpbR+4fh7Sc4zk+2JaR5sYvRYOEy5bSIfPDNfJnY+8yb902bGQ?=
 =?us-ascii?Q?yCt4KHaO1a4WTzI55jdKVdfTMnaFJy0EjNY+PdaW6qStP8mj3UCZmWMJ5+q4?=
 =?us-ascii?Q?yNWG01uZeVYvY4sEjCHPOxSvzqbTYjKJIkOX/DITbDNU8wm3vGJzFbaa+QEK?=
 =?us-ascii?Q?jBqyKbjaMc6krpxFBEL9CXzct6jrUnnIJVoY35fUcu4kCNYnmJD99V8H/yFj?=
 =?us-ascii?Q?i4l4Zx5r09N9aMNtJHa+f2IzIPKQNx0MpQxIaVcawFg3Sw22S+XBFJXHFYHk?=
 =?us-ascii?Q?KWwuuheDvJOuRKgm7iSQ3qs5xYpBf5ZaYc+gKGPm5LIUyJ4KkTi7NOnXbWZF?=
 =?us-ascii?Q?p1UEJjAEdjYctEWOsyNnmEW6qhpT5ZHBwAIJqWoNAzF4HaLninVHrS5nY+sD?=
 =?us-ascii?Q?OnBV1Nts1OpIZ8lGpGGu9caFctvG1UemChjT2fT6jV6dl2QxFxjVptrVzjOg?=
 =?us-ascii?Q?BSZ1fFN5OawHKfHdbiJ76fIZo6rN8aq0YTvZ1lYnD7INX9+DLnb+iFkn4pXD?=
 =?us-ascii?Q?tUFqoZyEW3WMzB7pGWbf+TW/6A219z1M14xvNY7G+yEbHG2G2MphSeINpXd+?=
 =?us-ascii?Q?3xvDd3N2gV1HGA8Y/wxA4MrtygPL/IcZhr7KjNBlbfgRCsYZnjK2R/8AIODT?=
 =?us-ascii?Q?gRJrUiCSknT43n/3GT8P+NPGHKGDuaVFCzL7Kmxcbp7KIJys6IhATQzWoLRH?=
 =?us-ascii?Q?dVLrhXp6DAFizkdB0UydiREweQu9jYtO8/iSRjw8ef13/0sru203iVCXvZHG?=
 =?us-ascii?Q?qAdyD7ZLN2qqFTz3Y4DxZO8wCvh5IEB1hbRR048DTpvZ7SdlkusmFalZ4Cvs?=
 =?us-ascii?Q?+TwmhQ0hVR5ltO3t1Hg+Sh2v4FTo8J/+kQF5EOD/H6cM//5KOp09p6ezdMld?=
 =?us-ascii?Q?6sgQ7z38gWJFbEvz3BBQ3tiHYG6Ceu2DMZ9rfpKWswn5Ri6rw/BNKnpgEwLL?=
 =?us-ascii?Q?lH+a8tNU0g+qguxLJ0Hb+r+NdRxA/Qspmt6rUfqLUy625sMoZbG6gGd0StU4?=
 =?us-ascii?Q?+R4kRnZwpFQJTimd0vXt12c2+eiyZdxPRF3A8rprdMMvcq+dtWW4QMmE036n?=
 =?us-ascii?Q?jxEgSK0AnB63aybjxwJSppg05ySw3LMDRrOPkKsHm9gnAM1ZO51s?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80e0893-fbca-4601-d3b1-08defdd28437
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:16:13.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+r+/Mf+xUrSDbI5zVRnyGw+/ar9BSD/s5a4swte7M4qo8B6RPsK8Q/coQ3ZCEeGC87a6zvT0B0gRn6nMXbXg45OcdoPEMQRspJtT535Jl2Dc7vab6o/iGYJlPJjZRuD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

StarFive Fan-Tach controller can support up to 16 fan tach input.
The series has been tested on the EVB1 board.

Change since v1:
PATCH 1:
- Add explicit minItems/maxItems and range constraints for tach-ch.
- Switch fan node regex to support hex addresses.
- Add pulses-per-revolution demo.
- Rename example node to fan-controller for consistency.
- Limit the reg property to a maximum value of 15
- Fix tach-ch example by changing /bits/ 8 <0x0>, <0x8> to
  /bits/ 8 <0x0 0x8> so both values are parsed as 8-bit cells.

PATCH 2:
- Added hwmon documentation (starfive-fan-tach.rst)
- Added HAS_IOMEM dependency in Kconfig
- Added per-channel pulses-per-revolution DT property (default 2, range 1-4)
- Added mutex and spinlock for proper concurrency protection
- Added armed_stall/armed_slow mechanism to prevent spurious interrupts
- Added retry logic for zero sampling value in rpm read
- Improved probe sequence: clock enable before reset deassert
- Added devm action for remove path cleanup
- Added input validation for write operations
- Added MODULE_DEVICE_TABLE
- Added linux-hwmon mailing list to MAINTAINERS

v1: https://lore.kernel.org/all/20260428082337.743546-1-changhuang.liang@starfivetech.com/

Changhuang Liang (2):
  dt-bindings: hwmon: Add starfive,jhb100-fan-tach
  hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100

 .../hwmon/starfive,jhb100-fan-tach.yaml       |  93 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/starfive-fan-tach.rst     |  34 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  14 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/starfive-fan-tach.c             | 561 ++++++++++++++++++
 7 files changed, 712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
 create mode 100644 Documentation/hwmon/starfive-fan-tach.rst
 create mode 100644 drivers/hwmon/starfive-fan-tach.c

--
2.25.1
