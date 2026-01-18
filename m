Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A4286409;
	Sun, 18 Jan 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768729567; cv=none; b=KWtAZRC4qEF2F50viH8DGtPtB/puiXnqPUCaZmx7traXGi57siQQfFAZw9kUt1NMHLtMhVfco3pRwQsI2t3jR+kY5zFWb4LdfHXvI6pUNHgM/oA/7fyKRQR9Fa3lYxxMNUogX0dvo6aEMEsEAHqSZ7R/AMLFTWQF6ZgYDyXRk+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768729567; c=relaxed/simple;
	bh=ZHA3Y6ahnuhWr/qdLBGqMbdpE8Cov1zMTcHNmsXYyN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJ8K5GgMqsMwfGEq1OLd3Uh/Xz8E5XHfCIQdcJUURrmNQ9EOTz8WnjfGyfFJ33ztzFejae9LKftcmNsrStC0vIBZ9y8HieAc6TZnbkaOnavzTOB9Z7Zc7WC/5UqWS7K65vMcl9oWkNlEVyMg7s08aATXD6EPWgqK2gZjg2CeQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AGr9IA/f; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AGr9IA/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768729562;
	bh=ZHA3Y6ahnuhWr/qdLBGqMbdpE8Cov1zMTcHNmsXYyN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AGr9IA/fCwzWuKt6eAl/iwUOYEzla5UI1szcPW8giSjDfHeMI4AcJdcyTOpHmPcDS
	 s32mJDiTGxhiM2wEjwVpR2w2gi55qVhD5VSPs/uJAZfzB/2x4ELoRXCf/txEtIAdVj
	 GkS8H3HjPl2Qcl6+qkaPoHCviyyjW7waDRAsWNPo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 10:45:57 +0100
Subject: [PATCH v2 3/4] hwmon: (cros_ec) Move temperature channel params to
 a macro
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Stephen Horvath <s.horvath@outlook.com.au>, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>, linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768729562; l=3084;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ZHA3Y6ahnuhWr/qdLBGqMbdpE8Cov1zMTcHNmsXYyN0=;
 b=Ez8tcaRtPAn4u8KjO9+lrqKyqdg1uFRBWXvtWKLZ8tP03zVXF26jBDa0MGiBw8LCBmb9Af2eH
 LiueNDL14fPA9ukwd2KzUVmddUFI0RO/pFGoviqxyvid3PYMROvcK7e
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

An upcoming change will add more channel parameters.
This leads to a lot of churn and very long lines.

Use a macro to encapsulate all of the shared values.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 49 ++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 53abd55cba05..f5be293fdaa6 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -310,31 +310,32 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+#define CROS_EC_HWMON_TEMP_PARAMS (HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL)
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL),
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS,
+			   CROS_EC_HWMON_TEMP_PARAMS),
 	NULL
 };
 

-- 
2.52.0

