Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474DA40D59C;
	Tue, 21 Jul 2026 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615540; cv=none; b=A9Ho8Cb/C7KwI09HURDyoKzsTl0bw1XMgmtYBP73h+lk5UFV0eXnCxYd7D19TXtgCHFQ0Sm8Jd4Mwn8JASkPwySi82rVdj3ClXPrdinj3j3+yqXfrqVoias/5TxL9WeWfWuL1dS52ASTn7+cjjJIYgZhDjj0e6TFc9sJRuxpejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615540; c=relaxed/simple;
	bh=12v4kLfM0t53W8e1jIm92V7bHObkh5Z/3ph0XkzStPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZzZbVCO0dKX1HeO9d3QBaRaVFYnf44sRRqaWiprF3rWkwiyvmVp4/J4p3bNLUxoeIuN9J0UzrY54jUH0QkrNVz4Wexm/gjMRunP1O28f2onLMo6TpGgOIvBZ34gVm3gMMXFZEK6NUBW/0EYzX0nXKZVU/OiaXQ4rI9gMao1K2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7nR6CcA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7nR6CcA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FB3DC2BCF6;
	Tue, 21 Jul 2026 06:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784615540;
	bh=12v4kLfM0t53W8e1jIm92V7bHObkh5Z/3ph0XkzStPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t7nR6CcABguEn/mo2SKJ9P0HMz+reCn0luUZbnLNTDrKgw9UEdT034Pwi6UZnuZqr
	 iH7A1aaS6lVxyKUdurwiTN2hmOrpFHnrWRpJQ9zZp9TOXAPfowUzBZ9wARdXsiJH12
	 C4d6AzQWDDXqyiUGNjEDw5J9+yyo5CixVl02SuDoIuNpn4/FgJX4CwDzKqdgDLOBde
	 gdGwnbVxXqRPomD56tZG3GANE9TsZaPBLrtDPkXsyOxGCFiDeZMvfYLnnugrgP3azJ
	 HLw91TTM/y7UrRejlp0pJ6O4yGLeFaN7b/kBZEiHzgBDmvrsyThflMIjh7+tfCFdJs
	 iDpvmlY5rFXXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05055C4451C;
	Tue, 21 Jul 2026 06:32:20 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Tue, 21 Jul 2026 14:31:35 +0800
Subject: [PATCH v3 4/4] hwmon: (kb9002) Add documentation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-kb9002-upstream-v3-4-70563922be8d@amd.com>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
In-Reply-To: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615506; l=3142;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=N49+QrvixV76oNVim+qejmy5UhGOUcqywymzDOcJACo=;
 b=1Dj1xNwHpAcp8U5UVGZqMXmFPbyiqkW9jO+2TeXGHiYOnhsr0b2ApGYW6FBTtjceONUz8fR01
 EEUvPoYQHmACn98EwNBuDZwHiO4Bi/4HVj1ux/aivrwC+KGqq6h3meT
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
 Documentation/hwmon/kb9002.rst | 65 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

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
index 000000000000..e6d8d9c78923
--- /dev/null
+++ b/Documentation/hwmon/kb9002.rst
@@ -0,0 +1,65 @@
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
+temp1_label         Always "kb9002".
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


