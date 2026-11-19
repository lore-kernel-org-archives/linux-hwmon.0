Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110354;
	b=JuHmAtIvi8cRMYrlyTT0q5zpULroWJAMyNMM7Ryox49e7Vsu4iz2clZRarNtp+rMfzUq
	 1/31AS17wZ4/zmMANkUOIFZB+3zFzOZPGrevmKpQzR9PQ51hs2cFRFO6Zg40OG/0Rgwxw
	 nwIbGgOO05GM2SqAJzkemt3QSbMilAv7dsGEFz00QmRKh1JdVBEBZHz+1WAzfsG+/Yq6C
	 9ABXkdP9wdwkYUasyuduuVuaQzfTepBNvhvh0216IwXrqZohjE4pEmbFtJL+OnPPbPk/F
	 6QW9AUrpx7TBG4SVD1WUYbn99uDg2luAFzpWlbakQtnFsAIAmW5BMMwZ6FCxueO8U7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110354;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=HGkDIBCvmrzkV4GNKpL3/QNrubycYpZh+fZM7Kekpgc=;
	b=PCtOkq2HOthmjkoNQbgOUTL92Uq1Gvk4oL6Y6S1IjUuEsm0ShKVg+VFJAGrOo/cBzP2y
	 H1gpgtcV1TBLnaDv8I2BwPUvX9/QLj5/jvRVhmMLNtDI2GawiZruVuRtQBq83g6326i36
	 nghDePLTLZNnsEbVCkzGcbZme7vTvwsiOcujlTXQnGWTtWcm8tdMaXTWOOrID1GpnTL9i
	 Jl9G2hcjzAsnEzwMEl0x1/+8bOohBeOrLbGLzHSW619FEmp8Y07ztEgjoaBDurhCUpAQ9
	 Rzvnrivczsk+ZwNfJ18KJQnp7WbOmsKo/gG44M2dhmytRpj6osMDlLn8KaaFDA1aIAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=FOvQ8+Zh;
	arc=none smtp.remote-ip=185.136.64.227
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A0606A326
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452A0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=FOvQ8+Zh
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202611191745490a486b805b000207a8
        for <linux-hwmon@vger.kernel.org>;
        Thu, 19 Nov 2026 18:45:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HGkDIBCvmrzkV4GNKpL3/QNrubycYpZh+fZM7Kekpgc=;
 b=FOvQ8+Zh9q3SWvYiT7MxxcceIMGm2DbVslqFNmIffTOOqyAc9leVM9BY2dU6IOf76Y1JCR
 fS1VPQqcfe4TxRwWnf2vx+Qbd4MQ+DkHar0DO7IpDQz2tRBwsrU4fRRq3dSInk8SIw1H9RYR
 Pe0NzXeuqhNHdl49RoDJgEgHuti+BlhLlluB980pZvx5+IOYZxCZHFmZnvoEvgiPg3WZUCjH
 KMQcm1Plv+/7de7MwUSxqNp4JyzNkpeb6E1ALQgVB1C2uxh38MXCY7YxcRRwWRgY50mMYnyM
 FSRz0IARfR5OpAE5KfZq1QeJulA64szNve75e0AHONnO4zaGAdazvDIw==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH v4 2/2] docs: hwmon: introduce simatic-ipc-ec-sensors
Date: Thu, 19 Nov 2026 18:45:48 +0100
Message-ID: <20261119174548.1324539-3-benedikt.niedermayr@siemens.com>
In-Reply-To: <20261119174548.1324539-1-benedikt.niedermayr@siemens.com>
References: <20261119174548.1324539-1-benedikt.niedermayr@siemens.com>
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

Add documentation for the Siemens SIMATIC IPC EC sensors driver,
describing the supported systems and the sysfs attributes it creates.
Add it to the hwmon documentation index and list it in the MAINTAINERS
entry of the driver.

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

