Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D51940A1;
	Sun, 18 Jan 2026 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768729566; cv=none; b=JTcj5i4wts010YBt/R/yfeT2ez3Bu5FESs1r3mh2FY9dpKmqpTNeGa04gsdWfwJdlrITrWSvv1SwP/o1sehEVeifooRUsw8w8wRg89FRLIxpQCuddxUrBdGVpsU+bz/Ik7uzhXB5YN+a6LpbIkgQYzGp9ZmPRUAM4YBsrC8C0+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768729566; c=relaxed/simple;
	bh=pVOwRSURauI8OX8J7+67T93iT1O49GeqBfIL66ymK0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5veUsYYH+F286TjoMILCjg6s09gmOosYJbNWVCtz3nhypNVKbgwc8wLreyqaCKIFBW+NmhK1ojrl8998DlBtSxDf6DORoMnD9SP+VWx8LdBvuFoDASw0qjxyUwdYN/PLhs1sd8hi5N0s9WTUE+NtOBN9q1ZJk6411zRbZ03Thw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gq8xQ0v6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gq8xQ0v6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768729562;
	bh=pVOwRSURauI8OX8J7+67T93iT1O49GeqBfIL66ymK0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gq8xQ0v6YGzTM81xP0eeW4mJhiogmJwxObr1DYymjzZqMDPaRGUPvGXTWBSz3r/ZE
	 YHexCuGr5CHCpcII8xjdrBwiqm32fJrs7bMTPopSf6icim5Brkx8fWxwH2BhxhoxYs
	 TcOqIUvnOshaFuRQnyhI7LDVgoy2ZhiIQGRjVQ9o=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 10:45:55 +0100
Subject: [PATCH v2 1/4] hwmon: (cros_ec) Split up supported features in the
 documentation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768729562; l=1702;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=pVOwRSURauI8OX8J7+67T93iT1O49GeqBfIL66ymK0Q=;
 b=iXV13yPc7icclGm3211Ub44YYUGW4GfYiY9PuNnDgZHyzYSeJ/Lm/eBFv3hOKFvsnpS35tuBa
 6VSj/e9GGtgB1UJLBlg+ZqHjXVv1qhwPhTbiPGeL2S3FDSNkehUBAYK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The wall of text of supported features is hard to read and messy to
extend. Split it into a definition list with an explanations for each
supported feature.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/hwmon/cros_ec_hwmon.rst | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
index 6db812708325..b7dc88d22fda 100644
--- a/Documentation/hwmon/cros_ec_hwmon.rst
+++ b/Documentation/hwmon/cros_ec_hwmon.rst
@@ -23,9 +23,20 @@ ChromeOS embedded controller used in Chromebooks and other devices.
 
 The channel labels exposed via hwmon are retrieved from the EC itself.
 
-Fan and temperature readings are supported. PWM fan control is also supported if
-the EC also supports setting fan PWM values and fan mode. Note that EC will
-switch fan control mode back to auto when suspended. This driver will restore
-the fan state to what they were before suspended when resumed.
-If a fan is controllable, this driver will register that fan as a cooling device
-in the thermal framework as well.
+Supported features
+------------------
+
+Fan readings
+    Always supported.
+
+Temperature readings
+    Always supported.
+
+PWM fan control
+    If the EC also supports setting fan PWM values and fan mode.
+
+    Note that EC will switch fan control mode back to auto when suspended.
+    This driver will restore the fan state to what they were before suspended when resumed.
+
+    If a fan is controllable, this driver will register that fan as a cooling device
+    in the thermal framework as well.

-- 
2.52.0

