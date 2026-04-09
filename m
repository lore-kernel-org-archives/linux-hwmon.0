Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1193B6371;
	Thu,  9 Apr 2026 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732311; cv=fail; b=Mb8HkGf1Gx4s0MKVmPaVCVAIhtgF+GDg9a/rwYXw6qzyYrqF0Ip71qQUkAr5uiTxbDbDo3WKsADv4qvbW7mDAJjDWpy8BqfG0SN0TVEyxg+jTJgX+SJPGoL8PfNdTAjtGn6Hf+I8z1pAlawc6aOUhsQvkS9bUFlUp79Yw1PR8jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732311; c=relaxed/simple;
	bh=BcbFlh5za+KiQ/s1WMeseFYQ/2OCXmC+edemeg0A610=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oBtQ1YUtsgvBbH0ZLIUK0spwrzbjwR6KzQXnlGenJxagJJOLCyJdFgPN6vPrI7gjUm6OJUl2pmCeSlHtnfyilW+jciUKOcWszXghJMnVURrutEDgIJMfP3nHGJA2O9BL+hcWyUHaDOT/ENOamzpqCCY+EG80BRcTUhh9IvzEo7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kt87POFu; arc=fail smtp.client-ip=52.101.52.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kt87POFu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfeJorrcdAqVHf9c0j3kZD9K330UZTCHc6IhkMIykD9HPDMf1YtDsevsfVQopPONCtKuf1N2bgMj9tCOh4zaKFH+fidofmUnvLtqs9Q2hKkB3ugEexUs4p921ibP9IVA6WEzOaLp6+1iiGiAG6GEaLYchficsEUkn2gUCC++aTZijdaDE46dVeY1GXLyIyryqRxNKqV0jt5TMkfoXdkPCD08wHY/0ZL+ua+fS7gBNUh9zB0mhlAGFNpG1Wf07AlXX8GJh57NRp67r+ZupOKvk6tVt/WEBU09RZaZ9tk2bCrnVDJk9dPRW3DppxIJ5h6EMexQwZMTjt/U09UTLpDSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+g53YwHUt6aE++p5X3oIFyr9j/NxYlNGGw3hIzOhWI=;
 b=sVDVIzqZ6HqYT7xsjpavJZ1lbE3jpOfcmtWpwEfLbrZ3G+JthRBzOhsUTD1dnrPBcJXeP0gnXyYSZPP8B/FvBjvcaBGV2P2+7yZ+KjrVSFiYacqbJLGOhdg8p17ylK80VGTxsTYHb4jZJzB92+hNmmsgu6aMcLOLm+9L/utsLeuCWXn9Ps4pQyAaFC09IRiKCJNbAKgcWjtwwwVZIzYBidxNFE3nMFYmF+ExjHpIBMkVy+pWDDwCFr5r0EFCrBswlKBizXhqQtQtpBhJrcMQQ9TK2MnRxtiUt7pkITb87iWbepE6U1ggkIL5qc3Fx2EgeUAG71HrnaJh/55Ex4oT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+g53YwHUt6aE++p5X3oIFyr9j/NxYlNGGw3hIzOhWI=;
 b=Kt87POFu2FUteEHhuMrBRSOPBrnWy84AdAKih0dD50Z8AVG2R8ydEHEbDNEkiLY7mCMo0wfnqQlbc13Ktg2Z50NegnuWXWsAl/ff01w5ukUehLN3+8cvUgwZagikBriGVBB7mFBlpmHWBntYA5SJn2Hw3+0rsLtgW1Dwg4Nue4kJjLzmjZdrYqvOsmKYC5u0g+jYFizpNMIE7LZR3JA9b6mOBxyfwOL7magT8vgngqRr8kopkgdg4pFxy45p+7kxlNSrOF6793MfKgwImG/A9IH/NjZzbBgLUK/UckqG4a73EtKjofAY9kb92UT+TNsn3397SnqCdLydsl9DB346Mw==
Received: from CH2PR18CA0010.namprd18.prod.outlook.com (2603:10b6:610:4f::20)
 by DS2PR12MB9639.namprd12.prod.outlook.com (2603:10b6:8:27a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 10:58:21 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::53) by CH2PR18CA0010.outlook.office365.com
 (2603:10b6:610:4f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Thu,
 9 Apr 2026 10:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 10:58:20 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:06 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:05 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:58:00 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 00/13] Support ACPI and SETAASA device discovery
Date: Thu, 9 Apr 2026 16:27:30 +0530
Message-ID: <20260409105747.48158-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DS2PR12MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 463c19b9-d794-4bca-127b-08de9626e973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	+M75NzhvoFvruvOO7D5p+PN6bXK2M6L5oFCLfLifXj2FNNPoIjoMKvBPyEFv7Jmzkv+gXgR4QOg1IOl5yJxRxP9wsSAkXmb7ss6brk9Ys7m17CfsS1rRZq8qXGjt1OQ7D8HIFQv3bEZX7z4FX7ixzp1bepgZf9jwykZmWxg4pafITF41GoWMPAXPqyUs9vFyUCtP9JWKvWZEcMbQux5SM1UJ8MERgKPwlZlosz7/ezhFtxx+Jyg3pON7F7ZQ8tq9bsJWKai9j86gUDRMltppmpXGyg6Bx3pKrkt0pf6NAHeftbWt7nyC8E3lRI0B6mn9DAzM9VFzCz3ab/9VPbFuRsD3kfkALyOxKmESBdB6V8UhKqe1OBawBj5p7RL9qZ3gXUw4mWbv1LAdSnzW1Tf7wyBVtFZ8t/GumEBg5IP/SohIiZBwIACv9Yrfxg1I1cR4SMktO7U2WBDxa7FLjVCte9kRzSQjS9SiQjReVcNsvEDP9OIAoT/Zu091l8eom+8OAGfABxcsp6MQ+a2aQ+pecqqE71nxIUf32a3xC+a+A/ucRf7B+uuymIWkZYafd6Dlf/9NvS5BBSsX+3UxcpvZPZFoC/YtQdQoodl59T0+gFFSswtf547BmiS6DUZCBN6nLpE+rbHKe/DbpJL697Z5W0J6U5+v4vAZqEMMnF4f7swju1OQlgMXTsXhKuzht5KAp2iwq8/nKBFT8/Ou2h/yw8c1zh6JThnl9msgfRPunB3COJsiMKt1wuhbtq+LhPBXTh8bIdbEkRgrD2+XolF//Pu/8omz0S+BVb+t4sYTqN6gd4W55GTzY49tZKx+U7aN
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/HogXwtXOwLrBaO5sjYi0eLKMBnf+UIwSMxSjBgoqe7pIy4bOFYRyApXigZhNFV9Het0ogdstd9Oxxo7bFuB2cLcq7skgPHXFhKcG1jsmMJ3sGs6FdECw54sU0CpHTgBGD/etpW3/aCCdxqr2JhsCmECOFxJkq7cSniri60gGzMl+0Hej3/jgtKLrBZzysMFX3eeqRtF4fIpmfuVQbfJKFhBwb815SdzsEpM1ezEQhYTaahf55RfBXaUKQJhlOZiP4e29D4wMbLo+NT5pOWsRR+LfvBbxKUDW9S8T7g+kUqeIhuXjM8GGywsI/TyQ5HcTbG75UOO0Bxg3wohmP674rP2qkARTmxGxnOWEmKLeYePpOdfqjVtugc4hUT+vjgp07kQs6MIwUUStwDZRHUFsuovV5s5vOS962fc6Y2ejkuGk7LvdopRA1c+zuukmYB9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:58:20.1071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463c19b9-d794-4bca-127b-08de9626e973
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9639

This patch series adds SETAASA device discovery to the I3C subsystem,
enabling support for SPD5118 temperature sensors found on DDR5 memory
modules. The changes also add ACPI support for all existing DAA
methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.

SPD5118 and similar devices on DDR5 memory modules differ from typical
I3C devices in their initialization. They use SETAASA broadcast CCC
instead of ENTDAA for address assignment, and per JEDEC specification,
are not required to have a Provisioned ID or implement standard device
information CCC commands (GETPID, GETDCR, GETBCR).

The series enables to describe all I3C and I2C devices on both Device
Tree and the ACPI table, using unified device property APIs throughout
the I3C core and the Synopsys DesignWare I3C master driver.

Please note that the series modifies drivers across multiple subsystems,
like Device Tree bindings, ACPI, I3C and HWMON.

v1->v2:
  * Added patch to remove 16-bit addressing support for SPD5118
  * Guard ACPI calls with #ifdef CONFIG_ACPI
  * Remove CONFIG_OF guard for of_alias_get_highest_id()
  * Mask mipi-i3c-static-method in the driver to select only valid values.
  * Proceed to register other devices if SETAASA is not supported.
  * Update commit message and links in the description of multiple commits.

Akhil R (13):
  dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
  ACPICA: Read LVR from the I2C resource descriptor
  i3c: master: Use unified device property interface
  i3c: master: Support ACPI enumeration of child devices
  i3c: master: Add support for devices using SETAASA
  i3c: master: Add support for devices without PID
  i3c: master: match I3C device through DT and ACPI
  i3c: dw-i3c-master: Add SETAASA as supported CCC
  i3c: dw-i3c-master: Add a quirk to skip clock and reset
  i3c: dw-i3c-master: Add ACPI ID for Tegra410
  hwmon: spd5118: Remove 16-bit addressing
  hwmon: spd5118: Add I3C support
  arm64: defconfig: Enable I3C and SPD5118 hwmon

 .../devicetree/bindings/i3c/i3c.yaml          |  30 +-
 arch/arm64/configs/defconfig                  |   3 +
 drivers/acpi/acpica/rsserial.c                |   6 +-
 drivers/hwmon/Kconfig                         |   9 +-
 drivers/hwmon/spd5118.c                       | 119 +++---
 drivers/i3c/master.c                          | 353 +++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            |  69 ++--
 include/acpi/acrestyp.h                       |   1 +
 include/linux/i3c/ccc.h                       |   1 +
 include/linux/i3c/master.h                    |  22 +-
 10 files changed, 461 insertions(+), 152 deletions(-)

-- 
2.50.1

