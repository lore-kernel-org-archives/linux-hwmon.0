Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B142A334C3D;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254560; cv=none; b=O0VphsVPa27bGOA+LmJYBmrAgp+k+fIuXUSD94FcFLOMyCeiXXh5Qvt0inKoPsNTHm3TPnSq2+YrIT/AOaaRa8uhwWOCZZtPfk+RsQtUEwC34oNQT7iRRAMMn+dVg5UluBjnyeFnAD6bXW5SRXiWbGkvEnk7+3NYbEAgZjgFGYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254560; c=relaxed/simple;
	bh=6m2EEwWqSxVfaNSRqvdd8tOLTH5Eq6hgszuHPYRehR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ck9VRD3EYXPe4naonY9SaVtVzIkBNnUjEKxmk/LjJtShRIV7mVwokkE8q/+sluWP3NnziPhDv/cgaAaWzfAcyxomMX0NsFY+3KIFS0Dnr6GXN+cUnWwkw3cR8rcq3NbAEy24wkPewCf6xBxrAgs4EjAnCch1E1DCLmPIQ8YRRJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKX3+u0M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKX3+u0M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F345C2BCC9;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785254560;
	bh=6m2EEwWqSxVfaNSRqvdd8tOLTH5Eq6hgszuHPYRehR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BKX3+u0M2N7vBlSsinr45iAAQCn5MidTnRNzMNTMgjRdPAszqkuwa6BO7Zn/b3fv/
	 RTqUjO4W6Yk9KAxAOdQHRCf4dLsb4Cb6/484RA4BBnQOhCWJ/lqb9Ouva2zzfxAac+
	 /rI7BZ78jN2LMKP7bUHCNmItS7Xcp3gRE0oJJalKhXg9VOq/Lv/7Sr5pxmKf82eyAk
	 mXbY1Vj4I8USGTONEjMQrkhhlVSWKmdimaWUNVW7ohu5muokYU1UH2wuxwCjnldE7l
	 zun7fWSEKpb30F3IrfnapOfvJcoTbL4hLvSFqqWIvl73jfMQM8n8Z/5cVjBiS962IP
	 W4QhDVy3wdonA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A549C54F4D;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 28 Jul 2026 17:03:49 +0100
Subject: [PATCH 2/5] hwmon: (pmbus/core) increase number of phases and add
 new mask
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-hwmon-max20826-support-v1-2-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
In-Reply-To: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, 
 Alan Tull <atull@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785254629; l=986;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=oKIIng3y59ZHT0PaUVcYuwBTM83FBKhU2wmTmXOIUCo=;
 b=cskd5rh96mpDBzhtMAanbyj8XjWQpihj8hxk9jsT/bKf5Mz0XjZaYSztKZJuzDMcPM0hQ9Wep
 dvX0Rv5JeZYA40mIjK7D+/vhkuZyJQhO3XxmrGIm+IbYV7qUF+ymvSg
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Increase the number of phases to 16 as a new upcoming device supports
such a number.

While at it, add a new mask for controlling the source of the output
voltage.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/pmbus/pmbus.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 23e3eda58870..3d5586c67f84 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -242,6 +242,7 @@ enum pmbus_regs {
 /*
  * OPERATION
  */
+#define PB_OPERATION_CONTROL_V_SRC	GENMASK(5, 4)
 #define PB_OPERATION_CONTROL_ON		BIT(7)
 
 /*
@@ -386,7 +387,7 @@ enum pmbus_sensor_classes {
 };
 
 #define PMBUS_PAGES	32	/* Per PMBus specification */
-#define PMBUS_PHASES	10	/* Maximum number of phases per page */
+#define PMBUS_PHASES	16	/* Maximum number of phases per page */
 
 /* Functionality bit mask */
 #define PMBUS_HAVE_VIN		BIT(0)

-- 
2.55.0


