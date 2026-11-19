Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106838;
	b=CRD/XxV6pd1OlE4CcRUMenz0Cbn+Bf/i3bDTp2SYdM2hlSX93Hmh8f/vHENAuYkhdC8l
	 pVtx5Q/OG2npTrnyijgnVIXcTsbTcv2uz8hT6pK+9DMPAgb2ClVWGT8nZnjsRhkNfmeM3
	 d7KTxtBJZOvtsDviqdN0C6b29ZIQ7C0yFxJzVHxgK9H52WbpRJBx8fUN9KzewNV9ek/Va
	 ohTvTHWRup4AGCtQNJRqdyMT7adMNQ1+BJVcmylFrfXo1LxytPwXoM+yGQlf+cdb59ndb
	 R8wKORw/lAPegAxKV8ku5umvRwCrhoPCHSuu/RE3EwUHEpsE/VPpPFOh8jCcJq1jFvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106838;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=cdR9zEM1/iQ/doLLrPGmyHMtocdnCH3qNIqUsOWtRPM=;
	b=dvyL6DtHpyzkqfZFSsv6D6xjlSlHdWr2UYREQq2VFwqTPbe9H3/k0tOTDbpCm124C3hD
	 4l7lrv/1X4twAZfGQjLUPBknPO4peNx7/50Jk/suZeE62Ah2sFkGoZRf//YqyH6mhUkzr
	 M/3qcNCPppWMqEsledfgNXwbFubBBxQqHzaWJcA7rWoQ2Hib9cUWleYgvMtttVTyhCPKy
	 vnqvUYkKkrGu/MY/5urtHm2+zu4C1srBCGzSVQ1WS6S5JJTKxo43JvKrXgLy+W+ldLPoi
	 x0wpHggMn87GsKi+UTNjkV+4dtz9KCXnpPgXGjJzTNJs3j7ekGL0YFyF40uJO3tufTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=R0X2NZlU;
	arc=none smtp.remote-ip=185.136.64.225
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372460A2618
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 16:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0372460A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=R0X2NZlU
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026111916470946ca3a21d90002075e
        for <linux-hwmon@vger.kernel.org>;
        Thu, 19 Nov 2026 17:47:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cdR9zEM1/iQ/doLLrPGmyHMtocdnCH3qNIqUsOWtRPM=;
 b=R0X2NZlUM5Xt2yeLgf9YuC+o9iM3DbpyYjHK14kGPK3J6L5S0ZGMU5u4D8v8Dw5VtFg7SE
 g5eLjt54vMxgFkShTglHAVHuV74etiCYgiPogeU8sl63vjcjpJHHRvg6HjrgzB5VSdCqZaK6
 gWDClrDl73DwZmsyu/EKVBtHy2c5VcFCDY3YYuMyyOf5n0fX5ttrx767nz1b83SDyTiDfkFz
 akMK1nh55qf8KGYRLRnmJEjJ8H2/c2zsvnfn6mqpmlM7sOZ21YMDtiy4pBhindJTyS3FHE/D
 sVQbMojguL4hpmPov+K08zntL9QoF7DDupnjFTTA3pzUqKRKxI/sy7Mw==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/2] docs: hwmon: introduce simatic-ipc-ec-sensors
Date: Thu, 19 Nov 2026 17:47:08 +0100
Message-ID: <20261119164708.1280862-3-benedikt.niedermayr@siemens.com>
In-Reply-To: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
References: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 Documentation/hwmon/index.rst                 |  1 +
 .../hwmon/simatic-ipc-ec-sensors.rst          | 64 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 Documentation/hwmon/simatic-ipc-ec-sensors.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 2167e04ef573..2ecc46d906f7 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -255,6 +255,7 @@ Hardware Monitoring Kernel Drivers
    sht3x
    sht4x
    shtc1
+   simatic-ipc-ec-sensors
    sis5595
    sl28cpld
    stef48h28
diff --git a/Documentation/hwmon/simatic-ipc-ec-sensors.rst b/Documentation/hwmon/simatic-ipc-ec-sensors.rst
new file mode 100644
index 000000000000..4a6c005f29a6
--- /dev/null
+++ b/Documentation/hwmon/simatic-ipc-ec-sensors.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver simatic-ipc-ec-sensors
+====================================
+
+Supported systems:
+
+  * Siemens SIMATIC IPC BX-54A
+
+    Prefix: 'simatic_ipc_ec_hwmon', 'simatic_ipc_ec_<fan name>'
+
+    Addresses: embedded controller (EC) address space, described by ACPI
+
+Authors:
+
+  - Gao Nian <nian.gao@siemens.com>
+  - Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
+
+Description
+-----------
+
+This driver exposes the temperature sensors and fans managed by the embedded
+controller (EC) of Siemens SIMATIC IPCs.
+
+The firmware describes these sensors with vendor specific ACPI devices instead
+of following the standard ACPI EC model, so they are not covered by the
+generic ACPI drivers.
+
+Only the temperature limits supported by the EC are exposed.
+
+A separate hwmon device is registered for each fan.
+
+Sysfs attributes
+----------------
+
+Temperature device (``simatic_ipc_ec_hwmon``):
+
+======================= ==== ==================================================
+Name                    Perm Description
+======================= ==== ==================================================
+``temp[1-*]_input``     RO   Temperature in millidegree Celsius.
+``temp[1-*]_min``       RW   Low temperature limit in millidegree Celsius.
+``temp[1-*]_max``       RW   High temperature limit in millidegree Celsius.
+``temp[1-*]_crit``      RW   Critical temperature limit in millidegree Celsius.
+======================= ==== ==================================================
+
+Temperature values and limits are stored by the EC as signed degree Celsius,
+so written values are rounded to whole degrees and clamped to the range
+-128000 to 127000.
+
+Fan device (``simatic_ipc_ec_<fan name>``):
+
+======================= ==== ==================================================
+Name                    Perm Description
+======================= ==== ==================================================
+fan1_input              RO   Fan speed in RPM.
+fan1_label              RO   Fan name as provided by the firmware.
+pwm1                    RW   Fan duty level (0-255).
+pwm1_enable             RW   Fan control mode:
+
+                             - 0: full speed
+                             - 1: manual control via ``pwm1``
+                             - 2: automatic control by the EC
+======================= ==== ==================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index d54fc6b8c60e..5ed0dd24dc7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25912,6 +25912,7 @@ SIEMENS IPC EC SENSORS DRIVER
 M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
+F:	Documentation/hwmon/simatic-ipc-ec-sensors.rst
 F:	drivers/hwmon/simatic-ipc-ec-sensors.c
 
 SIEMENS IPC LED DRIVERS
-- 
2.43.0

