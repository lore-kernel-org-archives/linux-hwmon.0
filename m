Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEAB342146;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034239; cv=none; b=rv5tXDOKktO/RdGSuBfcOm9na9LQqH8oirw4sm0UAUr0fnA5gcfOFUu3dZxb1yYE13JjfrB42pEzZ2hCpltCMsDDBo1LCQhhy1hwdFasN51Z36yezJk5Hfl0KGbXntIZwyr92+Jd+IjfCop4EhfhjgN5I9G7dCN6ZckuNbgb00k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034239; c=relaxed/simple;
	bh=gzBcBqMw3VOFowvnVoTO4lF0wtDv+lGOOZZf2QrR0qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ni5Qg04QPtPxHkqGuqpmJ+AeDLwWsPy/+ZUakRt6ZrUDvBihVFFwd5kGbnzmpgnaRPxx5CF3/Jc3JUngAn47ZNxFNAY8ErPhu5h/SoI8aN447fRxCk294loy0DAQpbCq5sIEAlaCbW36Ych3UUR8NpgSTj9bXf1IXlBssQkO61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hr6LdIFx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hr6LdIFx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AA5AC2BCB9;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781034239;
	bh=gzBcBqMw3VOFowvnVoTO4lF0wtDv+lGOOZZf2QrR0qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hr6LdIFxr1bYKoRRmxLBuL9PgNAOseMGYdvmqnAALtxHbtkPmJPq+5iPEBV9RXuk5
	 5q1yECriWB60cQcfvDXtnYa+UQleiYZRb8H1jUK5wJYWsPyOPvSD7h3JP5N2G9eaLm
	 kIh7VXVy3+V+H1Ci8tzpGT6HM+6iqs0jAsaCnpSMuO9Y/zA6HLZKiCGGCaIyI+j2dE
	 uLHMMMM0ptDnCVsev2Ii3V+kuvCwNjybAxcX7UvoS8oXUUY4iEWDGd4eFr5Tr2XrHG
	 LmtIX0H9ClmaelPtxq0DXajWdcjC2/j9vjPoo7Kb6mEH2bJi76OtDf19FjIke9EGud
	 w/Rbun4iyzJ8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A645CD98C6;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
From: Ferdinand Schwenk via B4 Relay <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Date: Tue, 09 Jun 2026 21:43:11 +0200
Subject: [PATCH v3 2/3] hwmon: Add update_interval_us chip attribute
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-hwmon-ina238-update-interval-us-v2-v3-2-016b55567950@advastore.com>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, richard.leitner@linux.dev, 
 Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781034237; l=3831;
 i=ferdinand.schwenk@advastore.com; h=from:subject:message-id;
 bh=naArtmSHACSbi3CCOmku0nt+VQ/y8PXcc6k+1ebdK2A=;
 b=iD7Gh8kTWmLkvsX8QqENKxVd0ivfEW38LSCpaJTBASHKxxQMe4CtB78zuRoe3weymSyL+WUk2
 6H3qRDsGbgIAqVWVWIMuYv2J+e4N5t37X1CiJIiPenCO3KuXMZ2/g0H
X-Developer-Key: i=ferdinand.schwenk@advastore.com; a=ed25519;
 pk=HyA9NdHJ7NystP+1SyuWJeyXNH2EO4A09FXli9mfs9Q=
X-Endpoint-Received: by B4 Relay for
 ferdinand.schwenk@advastore.com/default with auth_id=788
X-Original-From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Reply-To: ferdinand.schwenk@advastore.com

From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Some hardware monitoring chips support update intervals below one
millisecond. The existing update_interval attribute uses millisecond
granularity, which causes sub-millisecond steps to round to the same
value and become inaccessible from userspace.

Introduce update_interval_us, a companion chip-level attribute that
expresses the same update interval in microseconds. Drivers
implementing this attribute should also implement update_interval for
compatibility with millisecond-based userspace interfaces.

Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
---
 Documentation/ABI/testing/sysfs-class-hwmon | 14 ++++++++++++++
 Documentation/hwmon/sysfs-interface.rst     |  4 ++++
 drivers/hwmon/hwmon.c                       |  1 +
 include/linux/hwmon.h                       |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
index cfd0d0bab483..b185bdfc7186 100644
--- a/Documentation/ABI/testing/sysfs-class-hwmon
+++ b/Documentation/ABI/testing/sysfs-class-hwmon
@@ -27,6 +27,20 @@ Description:
 		Some devices have a variable update rate or interval.
 		This attribute can be used to change it to the desired value.
 
+What:		/sys/class/hwmon/hwmonX/update_interval_us
+Description:
+		The interval at which the chip will update readings,
+		expressed in microseconds.
+		Unit: microsecond
+
+		RW
+
+		Some devices have a variable update rate or interval and
+		require finer-than-millisecond control.
+		This attribute can be used to change it to the desired value.
+		Drivers implementing this attribute should also implement
+		update_interval for millisecond-based userspace interfaces.
+
 What:		/sys/class/hwmon/hwmonX/inY_min
 Description:
 		Voltage min value.
diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index f76e9f8cc1ad..94e1bbce172a 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -106,6 +106,10 @@ Global attributes
 `update_interval`
 		The interval at which the chip will update readings.
 
+`update_interval_us`
+		The interval at which the chip will update readings,
+		expressed in microseconds for finer resolution.
+
 
 ********
 Voltages
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9695dca62a7e..c481bb535e35 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -572,6 +572,7 @@ static const char * const hwmon_chip_attrs[] = {
 	[hwmon_chip_curr_reset_history] = "curr_reset_history",
 	[hwmon_chip_power_reset_history] = "power_reset_history",
 	[hwmon_chip_update_interval] = "update_interval",
+	[hwmon_chip_update_interval_us] = "update_interval_us",
 	[hwmon_chip_alarms] = "alarms",
 	[hwmon_chip_samples] = "samples",
 	[hwmon_chip_curr_samples] = "curr_samples",
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 301a83afbd66..5a5882fee299 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -39,6 +39,7 @@ enum hwmon_chip_attributes {
 	hwmon_chip_power_reset_history,
 	hwmon_chip_register_tz,
 	hwmon_chip_update_interval,
+	hwmon_chip_update_interval_us,
 	hwmon_chip_alarms,
 	hwmon_chip_samples,
 	hwmon_chip_curr_samples,
@@ -55,6 +56,7 @@ enum hwmon_chip_attributes {
 #define HWMON_C_POWER_RESET_HISTORY	BIT(hwmon_chip_power_reset_history)
 #define HWMON_C_REGISTER_TZ		BIT(hwmon_chip_register_tz)
 #define HWMON_C_UPDATE_INTERVAL		BIT(hwmon_chip_update_interval)
+#define HWMON_C_UPDATE_INTERVAL_US	BIT(hwmon_chip_update_interval_us)
 #define HWMON_C_ALARMS			BIT(hwmon_chip_alarms)
 #define HWMON_C_SAMPLES			BIT(hwmon_chip_samples)
 #define HWMON_C_CURR_SAMPLES		BIT(hwmon_chip_curr_samples)

-- 
2.54.0


