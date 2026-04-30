Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBA5375AB5;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529784; cv=none; b=H3GQS3EfSRvmv++mLx6ntheSnmUrk3FZuVBiyiZC9TEurxsVbiR6u8jchvJNgF4KZu+8TabRmtK8/Mx/TbkSPSlmk+psrMmxC69f0Qdl6L5MMxmj24JfQTpye6V3/TlgsHOIRWK9tu5xOyWaeP55U1fwEd7laqzFRQ/jLZAZZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529784; c=relaxed/simple;
	bh=S+G5f1v55KF/VQLbCDiNNSR5kkKkvNfM7BwvHCeUeBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwtTS2bJes1zwkaPiVmjOy5Hzdo8QyrT+jcCx9EGPnoLVgqLbBE5ebHS3V4PPKO08mQnsRkQ25dqT7nRBkeaWVslznJ3AdJrBvyHaqUJTHkkjZI+hVXfsEbO5+H91Frh5KbgXavOicpbQbCvpDqfywpUG4BBtTrwjLJovvGfaAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAPKqq/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAPKqq/r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95208C2BCC4;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777529784;
	bh=S+G5f1v55KF/VQLbCDiNNSR5kkKkvNfM7BwvHCeUeBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qAPKqq/r+LrDR4zNOvbVnwESPBnxuwjE7xUQMLRBHmnXCo19IlhrikdsB/DmfW8xX
	 QDWLQWOnBsKYWSTGpXZk7dic+YQNOGiXa0YUywNkSjs3nvw+bN8VPy9YM7DsqPhe0M
	 3g+Mwu8SVzRXpJdd5pUzcunriLpc/txQY02o2IyM1Oj5k0Dzj7O58zEUa4LUUt+/lc
	 ANKEBT39L6SVmBY0sOKeOQ3gDVc7ZJUnFytqZ5ZeKe+GBeQm2u0ns4Mn3/OHhTapGF
	 o5ifiiEtqhHtDoVFqUlRSSYBpelsnWyy2XXcJ2ORmFEQNx1pexyt5JGBRQq7Dcj8Wg
	 pCiyPM41i+LGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87311CD13D9;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 30 Apr 2026 14:16:21 +0800
Subject: [PATCH v3 2/3] Documentation/hwmon: add Delta E50SN12051
 documentation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-add-e50sn12051-v3-2-f6d4e043ec7c@gmail.com>
References: <20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com>
In-Reply-To: <20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777529782; l=3926;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=fjIHEdGdFgCZriZJJHZn9TW0wcDHjeFCHvbUS0lc100=;
 b=ib6V9/gAmP8zKPqH5r9SKUHbCCqMA66qKkJzxh4cosc7aQIbfo1pnJNtqse0qNVZ9HfxB364y
 EKD3rPO1imfAHDLrtO9eOtjn+pcm2ndlawD97FeXkAMtPFawYwLKek9
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


