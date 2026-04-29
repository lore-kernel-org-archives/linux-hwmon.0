Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9B1DF736;
	Wed, 29 Apr 2026 09:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455726; cv=none; b=p7JsUrEAznHN/O61oD8yZZb7zVGaN7+pRKzEgjHmw1fv5SBrYsPp8rUt6ryhwvtSOGbAs8VeklKoCPpoXBwaIDKmFEIFhCAbsFzM3qwN6GvtajeaUV/bIXYe92u7p9Jye1IrvD33z2xSeDQQG8aofIlBqXVWTeLxL0L99WDRV+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455726; c=relaxed/simple;
	bh=S+G5f1v55KF/VQLbCDiNNSR5kkKkvNfM7BwvHCeUeBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyhikDsAw8AX4mV23leLdbeUlcXKuMNW6+KnfOKYaSbpRvE9XUn/cI5L24oqXOffwHX3wuXaKl022iesmqa5is3cqf65qRl2vdVhUK1KNwFrZfSg/HfaoEinmTKUlkmMybL3E49yf7zxu7zk8vb3Ryec7nDkRDy4fcijxzMqvtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXXQsdYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXXQsdYO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1160C2BCB3;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777455726;
	bh=S+G5f1v55KF/VQLbCDiNNSR5kkKkvNfM7BwvHCeUeBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HXXQsdYOn3+u6oLbU1f6H0UcN0dlMOYU9IwNrGlAmh7hYPA722XQ5SVg/dAJqb7dt
	 zu7Y/rtHTcKHnVGDO4TaUDmn/ae601+Aej3J9LNpKjCd8CxBQ+5ltBLpas9jy3oerI
	 qhEjsYxh1bHwtOy8/DoE8KJUUdt+y+9Q7hhMqbKH0knfc24TofczEEMsa+rzsa8kWB
	 pLJ8oeNXjuWedxGiNOHSA45DUvKAVet4kqJPbSEjOciWJLqvm2ary3aFQi5xRCKbHn
	 qso2IXIrG8KLaNDg5VWBuFq689ygfsqIcDXdXgmfzsM8MSUS3zhNFE7rJ64ubi36Pc
	 q6xVfLWGrODpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D482AFF8867;
	Wed, 29 Apr 2026 09:42:05 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 29 Apr 2026 17:41:59 +0800
Subject: [PATCH 2/3] Documentation/hwmon: add Delta E50SN12051
 documentation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add-e50sn12051-v1-2-c101e6c80bbb@gmail.com>
References: <20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com>
In-Reply-To: <20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455724; l=3926;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=fjIHEdGdFgCZriZJJHZn9TW0wcDHjeFCHvbUS0lc100=;
 b=OQYAtUS5gceSbMFz9dZPyD2rf4Qm0AflH+UO2NrCetAs6F6sEafEl25322aXmtL3nAJdcfcn5
 NgmOVNwn0XuBDGS8Ksi5B0N+F+YdlZ/TzBFRut/b25qai0q2ovsvhJW
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Document the hardware monitoring support for the Delta E50SN12051
device.

The documentation describes the supported sensors exposed via the
hwmon subsystem, including voltage, current, and temperature measurements.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/hwmon/e50sn12051.rst | 81 ++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |  1 +
 2 files changed, 82 insertions(+)

diff --git a/Documentation/hwmon/e50sn12051.rst b/Documentation/hwmon/e50sn12051.rst
new file mode 100644
index 000000000000..cbbfa7895d82
--- /dev/null
+++ b/Documentation/hwmon/e50sn12051.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver e50sn12051
+========================
+
+Supported chips:
+
+  * Delta E50SN12051
+
+    Prefix: 'e50sn12051'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Delta upon request and NDA
+
+Description
+-----------
+
+E50SN12051 is a 600W non-isolated 1/8th brick DC-DC power module.
+
+This driver supports the E50SN12051 PMBus compliant monitor device.
+
+The device provides measurements for:
+
+* Input voltage
+* Output current
+* Output voltage
+* Temperature
+
+The driver is based on the PMBus core and exposes standard hwmon
+sysfs attributes.
+
+Sysfs attributes
+----------------
+
+======================= =======================================================
+curr1_label             "iout1"
+curr1_crit              Critical maximum current.
+                        From IOUT_OC_FAULT_LIMIT register.
+curr1_crit_alarm        Current critical high alarm.
+                        From IOUT_OC_FAULT status.
+curr1_input             Measured current.
+                        From READ_IOUT register.
+curr1_max               Maximum current.
+                        From IOUT_OC_WARN_LIMIT register.
+curr1_max_alarm         Current high alarm.
+                        From IOUT_OC_WARN_LIMIT status.
+
+in1_label               "vin"
+in1_alarm               Input voltage alarm.
+in1_input               Measured voltage.
+                        From READ_VIN register.
+
+in2_label               "vout1"
+in2_crit                Critical maximum voltage.
+                        From VOUT_OV_FAULT_LIMIT register.
+in2_crit_alarm          Voltage critical high alarm.
+                        From VOLTAGE_OV_FAULT status.
+in2_input               Measured voltage.
+                        From READ_VOUT register.
+in2_max                 Maximum voltage.
+                        From VOUT_OV_WARN_LIMIT register.
+in2_max_alarm           Voltage high alarm.
+                        From VOLTAGE_OV_WARNING status.
+
+temp1_crit              Critical high temperature.
+                        From OT_FAULT_LIMIT register.
+temp1_crit_alarm        Module temperature critical high alarm.
+                        Set by comparing READ_TEMPERATURE_1 with OT_FAULT_LIMIT
+                        if TEMP_OT_FAULT status is set.
+temp1_input             Measured module's hot spot temperature.
+                        From READ_TEMPERATURE_1 register.
+temp1_max               Maximum temperature.
+                        From OT_WARN_LIMIT register.
+temp1_max_alarm         Module temperature high alarm.
+                        Set by comparing READ_TEMPERATURE_1 with OT_WARN_LIMIT if
+                        TEMP_OT_WARNING status is set.
+======================= =======================================================
+
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8b655e5d6b68..ba08655fc496 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -68,6 +68,7 @@ Hardware Monitoring Kernel Drivers
    drivetemp
    ds1621
    ds620
+   e50sn12051
    emc1403
    emc2103
    emc2305

-- 
2.34.1


