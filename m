Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C952556E;
	Sun, 26 Apr 2026 00:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161801; cv=none; b=Y9GZLGeZMUDotByYIqLvsRtfbOFlG4PcNOtJw0h1WRCKY/jZdkm5KTNy+ARzFWRFVl7Je53lIfuXCDytUfPdj35bLpT0zFQRRaX77ZOmH2tqzed+y5wEmjFZvsqrskaMl+Dc9nQXZuUVzCxDAaepEgyJokA5FHDAklPa0V805EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161801; c=relaxed/simple;
	bh=5fGj6iW05hAnyDjVzh7Hsg1J/Xop4UKdM9625VU1SGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GLexfy55POdFyVe0U5bWWZ71Lhm+uDGn92VdwKlCHm/gUhvFC8WScx2JmPpk3kVAq3y9mu0tD1dQutfud7Oz6AzZkYAoQGGYVLa0ZV2pQRQjwfAsXNdHdmDXwDZH9+qKeSj0pZSwwSL+YibJpXn/1shpb8fc6NPrny7oW3onRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMYBlI+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMYBlI+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0205C2BCB0;
	Sun, 26 Apr 2026 00:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161801;
	bh=5fGj6iW05hAnyDjVzh7Hsg1J/Xop4UKdM9625VU1SGA=;
	h=From:To:Cc:Subject:Date:From;
	b=AMYBlI+KOJvCWR69weQNstISnUfZP26ZfvrRZLZMtKGUbOrcNPYNVqSJDrcYMp8gj
	 +1LlMJRdrZMpPZ4XdI7qOIBcilZt0GPBAMOOUgZ570ZEEm1iZcCWj3S2gGvY9Y8vgG
	 633Yx6EF5A41sBcmiBdTey78SI10siN1eI/60hTgw6iA2rb5K3gYn1Kz6MTI/ylPUr
	 pdrdYANMEOJVXBgXr+6/TGermqVR7QupwZqsE+Txb07BBM+5oqC9RwRrE+rbffKYuT
	 47zU5KY26dovWu3dABIESfqE3OdCOrI7ZTsSv+FVUzo8gha1maAGVcvVFvYiDOJP3C
	 UQq1hh8/fPgIQ==
From: Sasha Levin <sashal@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: Remove stale CONFIG_SENSORS_SBRMI Makefile reference
Date: Sat, 25 Apr 2026 20:03:19 -0400
Message-ID: <20260426000319.55908-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kconfiglint reports:

  X001: CONFIG_SENSORS_SBRMI referenced in Makefile but not defined
        in any Kconfig

The SB-RMI hardware monitoring driver was originally introduced in
commit 5a0f50d110b3 ("hwmon: Add support for SB-RMI power module") with
both a Kconfig entry (CONFIG_SENSORS_SBRMI) and a Makefile line
(obj-$(CONFIG_SENSORS_SBRMI) += sbrmi.o) in drivers/hwmon/.

Commit e156586764050 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to
misc")
moved the driver to drivers/misc/amd-sbi/ to support additional
functionality beyond hardware monitoring. That commit correctly removed the
Kconfig entry from drivers/hwmon/Kconfig, moved the source file
drivers/hwmon/sbrmi.c to drivers/misc/amd-sbi/sbrmi.c, and created new
Kconfig/Makefile entries in drivers/misc/amd-sbi/ with a renamed symbol
(CONFIG_AMD_SBRMI_I2C).

However, the Makefile line in drivers/hwmon/Makefile was not removed in
that commit. The orphaned line references a CONFIG symbol that no longer
exists and a source file that is no longer present, so it has no effect
on the build — but it is dead code that should be cleaned up.

Remove the stale Makefile reference.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 4788996aa1374..982ee2c6f9deb 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -201,7 +201,6 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
-obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
-- 
2.53.0

