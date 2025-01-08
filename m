Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD31FC7C2;
	Wed,  8 Jan 2025 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354675; cv=none; b=nXEBhnTvu8dphsEJETvZzM27H56+jc7Cx1hrHeiXfVOhUtik33I7omr+vJ/5JmJ5x4n4a/1VTRGpvLn1XzzXS/4CILoaind9Y5/vIDnLvwnJRxbPKzm3LPxGeY2ydMaR+T43aHuoZyq+SigbtAQQ5J6FDIf6TwTpJxYvfdW4EhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354675; c=relaxed/simple;
	bh=LXb/4cnhDaCX/VgUusIBuxIezkY4R3EDlN9QwWGSFMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ru2q7441ecy8Q7LpEotLCQ4IgozTISPC2jKfv2Sd9mPYZr/WRwOodK29VC5dIsC41eq2LksPsHMUgh+YDyAPSFQc50NBLzETCk56rLaHN3i98nyyJ9gIMAop8Po+0TnbxFY6Op2XbFD47AOQ/uYbvr724TsoTAl5TLSSyWPXUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSvU0Oos; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSvU0Oos"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC061C4CEDD;
	Wed,  8 Jan 2025 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354674;
	bh=LXb/4cnhDaCX/VgUusIBuxIezkY4R3EDlN9QwWGSFMg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=pSvU0OosWSJOawvny6EIA0aXDVuviUIo8f8/5Zzoej2g4f+mmiS056F1fE7JYpxFV
	 ZDxJhytNjkGTKisvRFvqkdLbKkyF8Y6/pibkzTK77GPNfPi9WMIfA5GwNqkeJ8fp22
	 OzfNoYa4iJUJCvsYDMahim67e7wXB3HWX87vzi4K8bSKLGYxlFLI5We1SUo1pvXCm1
	 1sHdfNl28FMPeN2WvcGYLpxvbVorof8DvpFEv14YZ/1zWsPs3hEOV4+GfUte/Z9cjD
	 b9NKsHUq0Lm7VcDM/wBWVXgUv4pEGafA3aeLhzwunY7IbScJX2u2khZ1+VTZXU2i4/
	 unxGXhctM6n5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C51E77188;
	Wed,  8 Jan 2025 16:44:34 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 08 Jan 2025 16:44:23 +0000
Subject: [PATCH] hwmon: (pmbus/max15301): add support for MAX15303
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250108-dev-max15303-v1-1-9154eb2c9d9e@analog.com>
X-B4-Tracking: v=1; b=H4sIAGarfmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwML3ZTUMt3cxApDU2MDY93UZNM0S7OU5KRUyyQloJaCotS0zAqwcdG
 xtbUAJnOORV4AAAA=
X-Change-ID: 20250108-dev-max15303-ec5f96dcbe9b
To: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Daniel Nilsson <daniel.nilsson@flex.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Robin Getz <rgetz503@gmail.com>, Erik Rosen <erik.rosen@metormote.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736354673; l=2244;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=phBtWv0JmSXD1jmhsvkWUdoTzfmFQsSMU7yBfuZFESo=;
 b=Ap9HKOT5a++EFRAYJRnCQ68XtDUslwWqw5r93RK23dXVBExyHuZbp6iP6iwgpeCoie3HC8fK9
 BLdQZKGxnvMC55d3aYaW4fmc3QwicGkTqA/1Yj4yTW0C0f4e4R7q62A
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

The MAX15303 is a full-featured, flexible, efficient, 6A digital
point-of-load (PoL) controller with integrated switching MOSFETs. It
contains advanced power management and telemetry features.

Tested-by: Robin Getz <rgetz503@gmail.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 Documentation/hwmon/max15301.rst | 8 ++++++++
 drivers/hwmon/pmbus/Kconfig      | 2 +-
 drivers/hwmon/pmbus/max15301.c   | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max15301.rst b/Documentation/hwmon/max15301.rst
index e3dc22fe1c6d0035593e59481a610452eec8abf9..e2222e98304fda5885b94bc37c0f1f16474ed271 100644
--- a/Documentation/hwmon/max15301.rst
+++ b/Documentation/hwmon/max15301.rst
@@ -13,6 +13,14 @@ Supported chips:
 
     Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX15301.pdf
 
+  * Maxim MAX15303
+
+    Prefix: 'max15303'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max15303.pdf
+
 Author: Erik Rosen <erik.rosen@metormote.com>
 
 
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 233533e28f7678c41bc1973ebcc3b53b10854baf..419469f40ba0283c72b71071566efec575263e98 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -260,7 +260,7 @@ config SENSORS_MAX15301
 	tristate "Maxim MAX15301"
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
-	  MAX15301, as well as for Flex BMR461.
+	  MAX15301, MAX15303, as well as for Flex BMR461.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max15301.
diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index 50dfd477772ffe680446b5c0bf31d45a70042d27..d5810b88ea8d8dad151e2597da205dbab6155ae1 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -25,6 +25,7 @@
 static const struct i2c_device_id max15301_id[] = {
 	{ "bmr461" },
 	{ "max15301" },
+	{ "max15303" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, max15301_id);

---
base-commit: adc52dd4078067fabf1431036ba180eafd8a7eee
change-id: 20250108-dev-max15303-ec5f96dcbe9b
--

Thanks!
- Nuno Sá


