Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6032BF3F4;
	Fri, 24 Jul 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868506; cv=none; b=VEn7QjOW7VU4PnOk3nn5/VmsDGkL9atFRgaFWrq2BaTYD+6nE5vvIVpff2mHwmzIFyjMj3qIf5+CE2KjjJRXweqY6f1A0uoa5b/JgYjD4a0V44S8LjYjGu4/HxLHJMLa95sdqBN8hPycwBs/UYOmUtxTx5uZwkQqK8ozBcOxhvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868506; c=relaxed/simple;
	bh=3ZDrDaI/ls3A1gQWBoU7o2OIY5ppFEs6RqqR9Gf0PVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSPWuKeLSUy++L2VNPr0iFDqvryFr6CFSibQzLiaJYNRzhLCd5+tD9nUhDnlo1SL/6m4EA6NRnLSnFd7vMQCt6ZEnC1lQhfDENxCbPbVZk9P6ic6JdXLF/ZNx6loG+v8nFHTObchAoISu4EIK1w4S/QnqaxqgOEVD5cnLMknZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blOZ30X4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blOZ30X4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23703C2BCFF;
	Fri, 24 Jul 2026 04:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784868506;
	bh=3ZDrDaI/ls3A1gQWBoU7o2OIY5ppFEs6RqqR9Gf0PVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=blOZ30X42406ERw1pVfnTc23E0hc2ahekYw8TzU0B6nbA3rGiRiX7bd3oS4aEUunu
	 2BwpR009Kw95t6c0JJuuZRiYWJLvUx/+QONpY4nMHGHy54dpzhyJTeU37a23b72fRI
	 oYh91WyeBTMid+1RaYqMNbqS5jodu4q9Di8QRZOr95iuaod1pztb/ucR2ryNrH2lPH
	 hMwtlBCxDXOLaKktBpFZFFEX7eprwvUTjO1krxLesibNWaStSBoahdcvgaNAiqHEIW
	 InSW7mCo9iZFAQE9v6KvyGwV3EqbSnH1a/fkdH7DxO4Wy7WAFiwrbGAFK8bMbr2mgi
	 o5Aelq8Z6UVCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094CBC53213;
	Fri, 24 Jul 2026 04:48:26 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Fri, 24 Jul 2026 12:47:40 +0800
Subject: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
In-Reply-To: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784868474; l=3103;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=X7KlZJRpM+tmPVIiJTkz8JxxyjoQXDvY7ETNvVGG+tk=;
 b=f59i7Yg3QvT0pIiqVK0XkiLHmZdxldbiLNB/D3jXDutvMeKqty/pchkBJezjulQP34DuPq9Of
 MkE+0INR8YsBFg124L+NCmq5dqShecYEKoWyHvDATS3GrxFBJXDiMCy
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
driver.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/kb9002.rst | 64 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 226789376217..9dc796d087dc 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -112,6 +112,7 @@ Hardware Monitoring Kernel Drivers
    jc42
    k10temp
    k8temp
+   kb9002
    kbatt
    kfan
    lan966x
diff --git a/Documentation/hwmon/kb9002.rst b/Documentation/hwmon/kb9002.rst
new file mode 100644
index 000000000000..6f8116dde918
--- /dev/null
+++ b/Documentation/hwmon/kb9002.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver kb9002
+====================
+
+Supported chips:
+
+  * Kandou KB9002
+
+    Prefix: 'kb9002'
+
+    Addresses scanned: -
+
+    Datasheet: KA-015171-PD (available from Kandou under NDA)
+
+Author: Andy Chung <andy.chung@amd.com>
+
+Description
+-----------
+
+The Kandou KB9002 is an 8-lane PCIe 5.0 retimer with an integrated
+microcontroller. It exposes an SMBus 3.0 target (with mandatory PEC)
+on its sideband interface. The internal firmware aggregates per-lane
+die temperatures and publishes the maximum value through a 16-bit
+addressed register window.
+
+This driver reports that aggregated maximum as the only hwmon
+temperature channel. The running firmware version and the firmware
+boot status are exposed under debugfs.
+
+sysfs interface
+---------------
+
+==================  ===============================================
+temp1_input         Aggregated maximum die temperature across all
+                    active lanes (millidegrees Celsius).
+==================  ===============================================
+
+debugfs interface
+-----------------
+
+Files live in the per-client debugfs directory created by the I2C
+core: ``/sys/kernel/debug/i2c/i2c-<bus>/<bus>-<addr>/``.
+
+==================  ===============================================
+fw_ver              Running firmware version in
+                    "major.minor.patch.suffix" format. Read-only.
+fw_load_status      Firmware boot status: "normal" once firmware has
+                    finished initialising, "abnormal" otherwise.
+                    Read-only.
+==================  ===============================================
+
+Notes
+-----
+
+The driver requires ``I2C_FUNC_SMBUS_BLOCK_DATA``,
+``I2C_FUNC_SMBUS_PEC`` and ``I2C_FUNC_I2C`` from the host adapter. The
+last is needed only during probe for the host-interface mode switch;
+runtime accesses use SMBus block transactions exclusively.
+
+The retimer's SMBus address is configurable on three strap pins and
+ranges from 0x20 to 0x27. The address is selected through device tree
+(or i2c board info) the same way as any other I2C device; the driver
+does not auto-detect.

-- 
2.34.1


