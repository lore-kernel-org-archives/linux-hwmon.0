Received: from FR6P281CU001.outbound.protection.outlook.com (mail-germanywestcentralazon11020097.outbound.protection.outlook.com [52.101.171.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A1625;
	Fri, 13 Mar 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.171.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400952; cv=fail; b=WGauXjNWRZI0RYkixW+3b5cZ1cmleNApsH1cg/MfuNcaA5CKoOwYsVbjRjBK4VTdMOW3ckU+1D0OCxCS8l2PsC8qpl9yveJr42SJMFOabN4CDUODsyfytFHu6jjIvH5kNpGEKq8Ik9RtTuvsvxS/EDJKEkB9KXeMS2NEUWAbyYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400952; c=relaxed/simple;
	bh=TQu942DP5fZoyNi6YKLaLItHndHdcv1RFkI2qQzaecA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AUmw27YlwMHHmhQeghmfYgzW90CMIuyL7RtFxUmPFkZCOn1n/hvT7/Sh7GSXgpMysfrvK6Ioqh4HtDgYuy8t6IZAb9+BZu8HEF7rNuIUJVALoUbvZh7FL+WDupW6jSKNUIVKiaXHMD00jlD32isITf4jL1mNoMWmFBxzkwggvUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=OqDP4eIF; arc=fail smtp.client-ip=52.101.171.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="OqDP4eIF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+vA2VUrof0dnIOVjijiVXWB8XSFUrsLJN0fX6HYeBu/DtaLqXn32d+qKbzh9nGcYfLRid3Euzlf13jkP2TQYS569YQiF3FwvXfbgfxxfN7PQh9fERkZHr/OO6+Qm1J9SifzWzFcbZFP44mW63yE3KHDUQMB0biWzfsn443NGbjnIWCc0Y4c3W1T1qBWyKQSTtgTfKI9P8C07wwmQ/gxZQyk694wLVkVwKVeQ3U8XYwEMMNyZLbo/SqBJVcgALqI+t45ArEiQ6dEoBNT0AVRmcrDswAJNbCRRjs2WGQtY0uNWN8wWcfQQmMk+gqLRYXxTLL5HtOocn4i0DGHSraKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3TZOOwW2MuOYuUTAb0lcYkN9KTcbgns51hcwLhov7c=;
 b=rG00yT+ZGqM2n/KG7edxMIo6ofFwfE+RfoiQRBTEx96XqiszZAPM1KVRauRPLs8boCgyZ+GOWheGeEw7277cysDTpdJOFsD8ZLQnidNhh8S0RqVvq06zkZ1EZJF+1A+q95xyQhffujTyc+ywFQkfFQM4U+T7KPA8mDIoxDqetPeZXpspRVuTOLQuM2PRhgx6ocOy2xvWdbKBDMb3NteDDrzR/e460p71BrAgC5NAGZc2iNpHfRMFukEj6b9zA9SVz6g1L0Zh3AL9fuiF258GqwtJydaS7Zg+R0Sjt+0Szb6pDiSsF3TswLWtOoKqpkaOeIITMUyKM+KPA7/Jqm98hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3TZOOwW2MuOYuUTAb0lcYkN9KTcbgns51hcwLhov7c=;
 b=OqDP4eIFRAFm2ntKOwzDaghnhJL7yyLwth5fQgohGhXaM9FKRhqSu2QFmbgwsgn1H4B39ZgIZhAarkFTOt/nE+cZeO4CYg6ft9THI6CbbEvUjNEV3Z29u6xU4N0J5P8u6y2y4nEZwUBOxEwEzFmptTLs04zU4kdCq0TXF9OCoKN0TnlJo33siEo8+Xwfoc1TDLVZRlVFWcWL1GQ83/FQb2oL0zAvUcO8jg7XqiGb42GMrhv2SOD9J9yIMtwlO39cramHE4yD9lh9r8yW19aSuIT3yUKDA7VML4STD0CtDP+Qph4VpkWNSbUdOyV+mFgwOFKfa5P9rk1rCnIlPUYq1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
 by BE1P281MB2785.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:36::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 11:22:25 +0000
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c]) by FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 11:22:25 +0000
From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
To: Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aureo Serrano de Souza <aureo.serrano@arctic.de>
Subject: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Date: Fri, 13 Mar 2026 19:19:55 +0800
Message-ID: <20260313111955.36811-1-aureo.serrano@arctic.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0014.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::11) To FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1bf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR6P281MB5900:EE_|BE1P281MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: 3248aa0f-30e2-4ce2-55ca-08de80f2cd89
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|18002099003|55112099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hn1IfK3osadb2tlMgyLbHJ3ZNiTM47UsX5OaVcs0nFpNr8DveBpiHceGBJRW8b9EHlupW0Yl79yw+v/uLRj4tPaRWLSO9oKnD0uavRB7zrDkTMH3LBB/F1FdJMmavW8hUQWmVe6hjXjeGQz05J6W7+z9Dgh8v6E2yOzUr1cPqWRE2JiUE9zBx94LodLYI0Vn36RdQ1Obuwkx7R0kWJ4XPoafhSSzw/aPy6APhkxFKwfpk+gsT6X86IvhKERiYWjOzjYmirsRLvve61SYOZqDHJp6/bpZfYAfnajzq/LtM6lpuUQoM/IexZm1P5nVrhBQdWrKksE+48/ZKKv54woekODS0MQaiW0X2XcngTq9tzL+/qxK4IYNTEn4c34+7EWS0ObXIcmojxwy8pV2tqGHrAYrO3nymyM31hNTJdcwLBiL19Bmp2vbHj8D0hpRzat0HvuzFl/DUrmSlILwyn8OMXdrakPLqdN3mc6pviex9K/3Mh4+ZqcdrtPMSlkgZmVvcEtZQckJ6ImippWFyi6iEf605QTmH2/OO4fYtZu4EQhXvXz9A/Z5UD/AESIUSjrtA8oSD9fJCoM1VNyiVttnXZVmi6XJPLqF7PFS/Ddvsnpp9W4898kJbJkuCTsDefnZvwVeeONKkJggDHjEDb4tgnMUjY5ohMogNP8EhdH9BFa4ctJK3/VU7632S7y1Dhg1UrnqAhGxxv1UT3HE3lMoDk4Y2SFTXBlfmFEgWJPuutB3GZaTorVet/Og/0nKUQjI22EKxZrUnTiJXpyvTqxvspVVym3DwaHsWqGXaRaLzxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(55112099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XXzhjBq37WJlroydgE+biaQ4AvXHb+yDpJsNlqgSy3tLc87gTLOaKO9mMZJF?=
 =?us-ascii?Q?Ifnq/Ppa569rTLlt+hUbIDlQJ47z4/2DkA0PwkLI69mvorZl7INrlxT/mYjs?=
 =?us-ascii?Q?G+Qisx4eYjNPj3yolmoeryQFQo9dNLpoxL6o5sQ/DFVwf+8Wvw7QZo9MCx7b?=
 =?us-ascii?Q?DYX7BrFUp/v6ANoKus8y915WwPeFWbj4XNz1GJ/HTVuWGoGIyec9XSppZW1P?=
 =?us-ascii?Q?VgUsaoADfVX9NJIKWy4V2L79wr3CKsIWEKGH50Le2EtqJcFQsk/rxSdj+73l?=
 =?us-ascii?Q?DwpRK85qK5+ussf0L5Jl6GtQjEl7naSJ0z3a5jNQVtk4Qv1u7o0RlqMFZJaU?=
 =?us-ascii?Q?K0ykaZEmE+cTpevJjUy5OQ65V8FIwn8eg2fPvCkljh9UjvgDN6KGNA+koMeI?=
 =?us-ascii?Q?rPPMX8GU3pS3IZ7oxjS02hzEgLnY3UmhpZEQxXCHtkfRy1kLLC+ZDPrpyFAA?=
 =?us-ascii?Q?q8jcEUWPb6RlifjGktB+P8xm7iLqT2Rr+gELbcQ/YSiMJLTFJ5nN9eyfJGB7?=
 =?us-ascii?Q?ZZwoHZuxqfkxvXfCdALqHH7ne0aPjpcDykFUb2n8bXRP02R39rfV/MPptZ/G?=
 =?us-ascii?Q?z5iAJYNJET4T7Mhy6n2/nlH0VHmL09TVIMcgVAJA26uK/LcZh7DYeu5idaYi?=
 =?us-ascii?Q?WJzDrSUz/fhOYUH0sgHiCdgXigRV5IiBQye+u+iR6T112S3eN4vAyxCXubcG?=
 =?us-ascii?Q?IjLTF2oW+oEwQ0wTc0rGta2jTDLEmIUkALyVYZOCU/GR4SGYUwchlvI6cJXn?=
 =?us-ascii?Q?+g5B67C9fRwG212hqPiSVqKAliOSONmc2mYL1No+Ib7r8/kDvk79Ibdzxspq?=
 =?us-ascii?Q?FlCa4XmFmJP7PEjVzTZlnO3bR2YasY5sENI1xHW9O1nMDwn0mHXAK1Y6cg1L?=
 =?us-ascii?Q?2lZi2zKe1rVJ8Dff/5MgtXYOWE3PxERtZX5fCocwnhcA31pngcabsudj/l9t?=
 =?us-ascii?Q?XSfmcJli8InCmHBIvpkaW9gUrI97ejoZ0j39iJ4m0TWAtzZqk4ZoLdlV44tR?=
 =?us-ascii?Q?svOlcOnI6zNUDgKL0j5goWl3Rff/wdiuZFJ7OdEffEFrvneT9/+4yef+B9MN?=
 =?us-ascii?Q?Xm/aDEu86qDCIN9dzYRH6z3/0IHTgBTgg8Qt8nmIr+HMeUn72o793MGF1h4F?=
 =?us-ascii?Q?X+mpBGDm0ta6+ndvOa5eeGATmN2fywygcffBuv+Z6VXJ9t9X/fa+mmTs9cDr?=
 =?us-ascii?Q?J74Roan6kZu9azBFJ7/8EvLbhOJzuy9nQ9jfM3oHs30duclvHqQEyRU/x4il?=
 =?us-ascii?Q?8cUz8AV12fAGZ0iwL1AsCFW2lbWpctfNWDOFyi9bA1e+vtiADUvOP2CXnjAl?=
 =?us-ascii?Q?SvC2CmD37Cyxu/gXDdB02LGnuVhfMA5U/tUG2zguos5f8Z5/agLwH4H7oZ9h?=
 =?us-ascii?Q?Gd98mizZwNV+v5HnS+S74isntHNB2mmcTJDME918wocreQgHaSPXcf3qMKlK?=
 =?us-ascii?Q?ksxkZkmQM5XkysQ9z/BydIKL3J10QSzvwW3VUX18RwSr6q972Jy6v2x16otu?=
 =?us-ascii?Q?F2LnaCeJaL7lyNxhtSD4KBToQRcfQlIoobJ26c+6s/0tS1Hw48/BNylP9Wdv?=
 =?us-ascii?Q?C7Els9WjhqLkf0MWaqyZcU8BZnwS9FYLnxOKoLTs+W3Zs7gpzzunTux6LWwi?=
 =?us-ascii?Q?9yYBrK1np5s1B9zzpKLhjDhKNAEbs1sfNPkmvuc9kbGSvwTfg5njkD5RhFBn?=
 =?us-ascii?Q?led+60Atfjb4aI7281wrevghZx2NO2n1J5IrVgWUg+40qK2bBs0FNw9RF4bF?=
 =?us-ascii?Q?qE6oeZGm5A=3D=3D?=
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3248aa0f-30e2-4ce2-55ca-08de80f2cd89
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:22:25.5277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+PRoMBXmx5T8Y/dNglDHzntfmeAKwMZ1wsJGi6Agp7giN3SwbRujgQum/QyJBwt2ZlgGIDz5DPkhb/I6KZZ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2785

Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
Device pushes IN reports at ~1 Hz; PWM is set via interrupt OUT reports.

Fan speed control is manual-only: the device does not change PWM
autonomously. After applying an OUT report, the device sends back a
2-byte ACK (Report ID 0x02); the driver waits up to 1 s for this ACK
using a completion.

The report buffer is kmalloc'd per write for two reasons:

1. Stack placement (suggested by reviewers with __aligned()) was tested
   but hard-rejected by usb_hcd_map_urb_for_dma(), which calls
   object_is_on_stack() and returns -EAGAIN regardless of alignment
   attributes. Confirmed on AMD X670E with AMD-Vi (IOMMU) enabled.

2. Struct-embedded placement (suggested as an alternative) would create
   a shared resource between concurrent arctic_fan_write() calls, causing
   a race if two users write different PWM channels simultaneously.

kmalloc per write avoids both problems: the buffer is heap-allocated
(passes DMA checks) and private to each write call (no sharing).

Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
---
Hi,

Thanks for the detailed review. Here is v2 addressing your feedback.
If I missed anything, please let me know.

Changes since v1:
- Remove module_param debug flag; use hid_dbg() / dyndbg instead
- Move hid_device_id table next to hid_driver struct
- Replace spinlock_irqsave with mutex for fan_rpm/pwm_duty; use a
  lightweight spinlock only to protect the completion signal shared with
  raw_event() which runs in BH/softirq context
- Use guard() from cleanup.h to eliminate manual unlock on error paths
- Use get_unaligned_le16() for RPM parsing instead of manual byte shift
- Remove all impossible bounds/NULL checks that the hwmon core never triggers
- Remove retry loop; use a single hid_hw_output_report() call
- Add hid_is_usb() guard in probe
- Remove hwmon_dev field from struct; use local variable only
- Remove VID/PID from MODULE_DESCRIPTION
- Fix: do not update pwm_duty from IN reports; device is manual-only so
  the host cache is the authoritative PWM source. This eliminates the race
  where an incoming report could overwrite a value just written.
- Add completion/ACK mechanism: wait for device ACK after OUT report,
  signalled from raw_event() via complete(); return device ACK status
- Report buffer is kmalloc'd per write; see commit message for full
  rationale. In summary: stack placement (suggested with __aligned()) is
  hard-rejected by usb_hcd_map_urb_for_dma() via object_is_on_stack();
  struct-embedded placement (suggested as alternative) creates a shared
  resource race between concurrent writes. kmalloc per write avoids both.
- Add Documentation/hwmon/arctic_fan_controller.rst to index.rst
- Add MAINTAINERS entry

 Documentation/hwmon/arctic_fan_controller.rst |  40 +++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/arctic_fan_controller.c         | 278 ++++++++++++++++++
 6 files changed, 339 insertions(+)
 create mode 100644 Documentation/hwmon/arctic_fan_controller.rst
 create mode 100644 drivers/hwmon/arctic_fan_controller.c

diff --git a/Documentation/hwmon/arctic_fan_controller.rst b/Documentation/hwmon/arctic_fan_controller.rst
new file mode 100644
index 000000000..58366551c
--- /dev/null
+++ b/Documentation/hwmon/arctic_fan_controller.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver arctic_fan_controller
+=====================================
+
+Supported devices:
+
+* ARCTIC Fan Controller (USB HID, VID 0x3904, PID 0xF001)
+
+Author: Aureo Serrano de Souza <aureo.serrano@arctic.de>
+
+Description
+-----------
+
+This driver provides hwmon support for the ARCTIC Fan Controller, a USB
+Custom HID device with 10 fan channels. The device sends IN reports about
+once per second containing current RPM values (bytes 11-30, 10 x uint16 LE).
+Fan speed control is manual-only: the device does not change PWM
+autonomously; it only applies a new duty cycle when it receives an OUT
+report from the host.
+
+After the device applies an OUT report, it sends back a 2-byte ACK IN
+report (Report ID 0x02, byte 1 = 0x00 on success) confirming the command
+was applied.
+
+Usage notes
+-----------
+
+Since it is a USB device, hotplug is supported. The device is autodetected.
+
+Sysfs entries
+-------------
+
+================ ==============================================================
+fan[1-10]_input  Fan speed in RPM (read-only). Updated from IN reports at ~1 Hz.
+pwm[1-10]        PWM duty cycle (0-255). Write: sends an OUT report setting the
+                 duty cycle (scaled from 0-255 to 0-100% for the device). Read:
+                 returns the last value written; the device is manual-only so
+                 the host cache is authoritative.
+================ ==============================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513c..c34713040 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -42,6 +42,7 @@ Hardware Monitoring Kernel Drivers
    aht10
    amc6821
    aquacomputer_d5next
+   arctic_fan_controller
    asb100
    asc7621
    aspeed-g6-pwm-tach
diff --git a/MAINTAINERS b/MAINTAINERS
index 837db4f7b..8c32dddd6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2053,6 +2053,13 @@ S:	Maintained
 F:	drivers/net/arcnet/
 F:	include/uapi/linux/if_arcnet.h
 
+ARCTIC FAN CONTROLLER DRIVER
+M:	Aureo Serrano de Souza <aureo.serrano@arctic.de>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/arctic_fan_controller.rst
+F:	drivers/hwmon/arctic_fan_controller.c
+
 ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
 M:	Arnd Bergmann <arnd@arndb.de>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 486152a8e..b6ab72752 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -388,6 +388,18 @@ config SENSORS_APPLESMC
 	  Say Y here if you have an applicable laptop and want to experience
 	  the awesome power of applesmc.
 
+config SENSORS_ARCTIC_FAN_CONTROLLER
+	tristate "ARCTIC Fan Controller"
+	depends on HID
+	help
+	  If you say yes here you get support for the ARCTIC Fan Controller,
+	  a USB HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
+	  The driver exposes fan speed (RPM) and PWM control via the hwmon
+	  sysfs interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called arctic_fan_controller.
+
 config SENSORS_ARM_SCMI
 	tristate "ARM SCMI Sensors"
 	depends on ARM_SCMI_PROTOCOL
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 5833c807c..ef831c337 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
 obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_AQUACOMPUTER_D5NEXT) += aquacomputer_d5next.o
+obj-$(CONFIG_SENSORS_ARCTIC_FAN_CONTROLLER)	+= arctic_fan_controller.o
 obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
new file mode 100644
index 000000000..24db8a7ee
--- /dev/null
+++ b/drivers/hwmon/arctic_fan_controller.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux hwmon driver for ARCTIC Fan Controller
+ *
+ * USB Custom HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
+ * Exposes fan RPM (input) and PWM (0-255) via hwmon. Device pushes IN reports
+ * at ~1 Hz; no GET_REPORT. OUT reports set PWM duty (bytes 1-10, 0-100%).
+ * PWM is manual-only: the device does not change duty autonomously, only
+ * when it receives an OUT report from the host.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/unaligned.h>
+
+#define ARCTIC_VID		0x3904
+#define ARCTIC_PID		0xF001
+#define ARCTIC_NUM_FANS		10
+#define ARCTIC_REPORT_ID	0x01
+#define ARCTIC_REPORT_LEN	32
+#define ARCTIC_RPM_OFFSET	11	/* bytes 11-30: 10 x uint16 LE */
+/* ACK report: device sends Report ID 0x02, 2 bytes (ID + status) after applying OUT report */
+#define ARCTIC_ACK_REPORT_ID	0x02
+#define ARCTIC_ACK_REPORT_LEN	2
+/* Time to wait for ACK report after send */
+#define ARCTIC_ACK_TIMEOUT_MS	1000
+
+struct arctic_fan_data {
+	struct hid_device *hdev;
+	struct mutex lock;		/* protects fan_rpm, pwm_duty */
+	spinlock_t in_report_lock;	/* protects ack_status and in_report_received */
+	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
+	int ack_status;			/* 0 = OK, negative errno on device error */
+	u32 fan_rpm[ARCTIC_NUM_FANS];
+	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
+};
+
+/*
+ * Parse RPM values from the periodic status report (10 x uint16 LE at rpm_off).
+ * pwm_duty is not updated from the report: the device is manual-only, so the
+ * host cache is the authoritative source for PWM.
+ */
+static void arctic_fan_parse_report(struct arctic_fan_data *priv, u8 *buf,
+				    int len, int rpm_off)
+{
+	int i;
+
+	if (len < rpm_off + 20)
+		return;
+	{
+		guard(mutex)(&priv->lock);
+		for (i = 0; i < ARCTIC_NUM_FANS; i++)
+			priv->fan_rpm[i] = get_unaligned_le16(&buf[rpm_off + i * 2]);
+	}
+}
+
+/*
+ * raw_event: IN reports.
+ *
+ * Status report: Report ID 0x01, 32 bytes:
+ *   byte 0 = report ID, bytes 1-10 = PWM 0-100%, bytes 11-30 = 10 x RPM uint16 LE.
+ *   Device pushes these at ~1 Hz; no GET_REPORT.
+ *
+ * ACK report: Report ID 0x02, 2 bytes:
+ *   byte 0 = 0x02, byte 1 = status (0x00 = OK, 0x01 = ERROR).
+ *   Sent once after accepting and applying an OUT report (ID 0x01).
+ */
+static int arctic_fan_raw_event(struct hid_device *hdev,
+				struct hid_report *report, u8 *data, int size)
+{
+	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
+
+	hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d\n", report->id, size);
+
+	if (report->id == ARCTIC_ACK_REPORT_ID && size == ARCTIC_ACK_REPORT_LEN) {
+		spin_lock(&priv->in_report_lock);
+		priv->ack_status = data[1] == 0x00 ? 0 : -EIO;
+		complete(&priv->in_report_received);
+		spin_unlock(&priv->in_report_lock);
+		return 0;
+	}
+
+	if (report->id != ARCTIC_REPORT_ID || size != ARCTIC_REPORT_LEN) {
+		hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d ignored\n",
+			report->id, size);
+		return 0;
+	}
+
+	arctic_fan_parse_report(priv, data, size, ARCTIC_RPM_OFFSET);
+	return 0;
+}
+
+static umode_t arctic_fan_is_visible(const void *data,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	if (type == hwmon_fan && attr == hwmon_fan_input)
+		return 0444;
+	if (type == hwmon_pwm && attr == hwmon_pwm_input)
+		return 0644;
+	return 0;
+}
+
+static int arctic_fan_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct arctic_fan_data *priv = dev_get_drvdata(dev);
+
+	{
+		guard(mutex)(&priv->lock);
+		if (type == hwmon_fan && attr == hwmon_fan_input) {
+			*val = priv->fan_rpm[channel];
+			return 0;
+		}
+		if (type == hwmon_pwm && attr == hwmon_pwm_input) {
+			*val = priv->pwm_duty[channel];
+			return 0;
+		}
+		return -EINVAL;
+	}
+}
+
+static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct arctic_fan_data *priv = dev_get_drvdata(dev);
+	u8 *buf;
+	long t;
+	int i, ret;
+
+	/*
+	 * Must use a heap-allocated buffer: usb_hcd_map_urb_for_dma() rejects
+	 * stack buffers with -EAGAIN, preventing USB transfers on DMA-capable
+	 * host controllers.
+	 */
+	buf = kmalloc(ARCTIC_REPORT_LEN, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	{
+		guard(mutex)(&priv->lock);
+		priv->pwm_duty[channel] = (u8)val;
+		buf[0] = ARCTIC_REPORT_ID;
+		for (i = 0; i < ARCTIC_NUM_FANS; i++)
+			buf[1 + i] = DIV_ROUND_CLOSEST((unsigned int)priv->pwm_duty[i] * 100, 255);
+	}
+	memset(buf + 11, 0, ARCTIC_REPORT_LEN - 11);
+
+	spin_lock_bh(&priv->in_report_lock);
+	priv->ack_status = -ETIMEDOUT;
+	reinit_completion(&priv->in_report_received);
+	spin_unlock_bh(&priv->in_report_lock);
+
+	ret = hid_hw_output_report(priv->hdev, buf, ARCTIC_REPORT_LEN);
+	kfree(buf);
+	if (ret < 0)
+		return ret;
+
+	t = wait_for_completion_interruptible_timeout(&priv->in_report_received,
+						      msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
+	if (t == 0)
+		return -ETIMEDOUT;
+	if (t < 0)
+		return t; /* interrupted by signal */
+	return priv->ack_status; /* 0=OK, -EIO=device error */
+}
+
+static const struct hwmon_ops arctic_fan_ops = {
+	.is_visible = arctic_fan_is_visible,
+	.read = arctic_fan_read,
+	.write = arctic_fan_write,
+};
+
+static const struct hwmon_channel_info *arctic_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
+			   HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info arctic_fan_chip_info = {
+	.ops = &arctic_fan_ops,
+	.info = arctic_fan_info,
+};
+
+static int arctic_fan_probe(struct hid_device *hdev,
+			    const struct hid_device_id *id)
+{
+	struct arctic_fan_data *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	if (!hid_is_usb(hdev))
+		return -ENODEV;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->hdev = hdev;
+	mutex_init(&priv->lock);
+	spin_lock_init(&priv->in_report_lock);
+	init_completion(&priv->in_report_received);
+	hid_set_drvdata(hdev, priv);
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_open(hdev);
+	if (ret)
+		goto out_stop;
+
+	hid_device_io_start(hdev);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
+							 priv, &arctic_fan_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		ret = PTR_ERR(hwmon_dev);
+		goto out_close;
+	}
+	return 0;
+
+out_close:
+	hid_hw_close(hdev);
+out_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void arctic_fan_remove(struct hid_device *hdev)
+{
+	hid_device_io_stop(hdev);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id arctic_fan_id_table[] = {
+	{ HID_USB_DEVICE(ARCTIC_VID, ARCTIC_PID) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, arctic_fan_id_table);
+
+static struct hid_driver arctic_fan_driver = {
+	.name = "arctic_fan",
+	.id_table = arctic_fan_id_table,
+	.probe = arctic_fan_probe,
+	.remove = arctic_fan_remove,
+	.raw_event = arctic_fan_raw_event,
+};
+
+module_hid_driver(arctic_fan_driver);
+
+MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
+MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller");
+MODULE_LICENSE("GPL");
-- 
2.43.0

