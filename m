Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794616899;
	b=GuXR1GzxrUdEa5It+pbfU/UIOMiCY7iNM+C8v/wTBLuA95Rlg+/qWXAOtMp8IqpT+jNE
	 2DF4YrlDDtCEiejrnmSJWQplcTTK/TJCnSUujmLU5tV8BXWn9ZGfi57FVdgnppivYWBr8
	 ALAZzYcmedorT4u7dDvjVU3NFQHOJOUHhu64Cgi+UbgwbF3xioey1STuLQBEPjcxhrCh5
	 KAtirPG+2sEDGOK4fbFnuvjz6quI4eTD0dv4VHuPKND3AX28z3Bu00M/H7F7rXxFLTnTL
	 r6TUMWxV7vU3AV6ZYPvEsHaLS/5boRI7Q5A7S59oEgQsNYig72BV6qIMWeaDNdep3+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794616899;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GdIXmv+X3wjcWU15UyUJ03l3PeprFXiEbY09WCu6xJM=;
	b=lBjazmqN5jQufQH8HIDHKUMbADI+9VNWgF7B+g/8aLJOKnHusQiqfdP6DXKyDYtAGdn1
	 4kjLUrCceo1Q6JCYEdCwwXKcelxiezyBTPmeAuQAW58dixMKnoqtyrhCtoyDKeOOcv7UA
	 EcqSu6tgo5ouYl4bZmFZhqzlph3lq7M21e968QDiTq2+x5hjpolKK+fzCqBWvvke+F7Ii
	 iJH9+C50cnC2Ynk01W0w87JrZ369a/NVu6Yh1h+7hMTs42y1E9zzZrc+W7QT2p7U/ma+N
	 aPPHJbMnjwng4khLom/XHucijoMcxXhimBqbEpQNpjfzt5ThCEURBMQB2a3wbUsan6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dsg.is;
	spf=pass smtp.mailfrom=dsg.is;
	dkim=pass header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b="Rg/5cybm";
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAE1606A890
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 00:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAE1606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dsg.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsg.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=Rg/5cybm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dsg.is;
	s=protonmail2; t=1794616894; x=1794876094;
	bh=GdIXmv+X3wjcWU15UyUJ03l3PeprFXiEbY09WCu6xJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Rg/5cybm7kZjoyO+4L4Of52FHggrHLXP8ae1GOOZtGsnbHphy21pTK1K5qdpZ7szA
	 x5HAmt2UYVIGzb1pxNoSugxsP0wELKdF/AV6/qHPTE3s/2M/FGobS9QHqLbnJACYu5
	 b1n89Y+BBHaD5tYEiKo4DLZcrL7DliEdpDdMhbuIxB5N7k3N6iml/vYd8YkkAsx1NB
	 gWrF3vd6ReKJoMPV6+Jk0EvnKeIyN33QNbi+6seQXlUbrf1juPawBY4wgEgQkoecqq
	 zrRLaZcLBbnRvgylMb9BrAXm2Ojd60gEntsoxSSRqP2mH4vKMDCy2eU2p5y6hxXauo
	 kLr9on0lt4JLA==
X-Pm-Submission-Id: 4jRFgH4nfsz2ScQ6
From: =?UTF-8?q?Dav=C3=AD=C3=B0=20Steinn=20Geirsson?= <david@dsg.is>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Dav=C3=AD=C3=B0=20Steinn=20Geirsson?= <david@dsg.is>
Subject: [PATCH 3/4] hwmon: (adt7475) Add thermal zone sensor support
Date: Sat, 14 Nov 2026 00:41:09 +0000
Message-ID: <20261114004110.328050-4-david@dsg.is>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114004110.328050-1-david@dsg.is>
References: <20261114004110.328050-1-david@dsg.is>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register the temperature channels as thermal zone sensors. Sensor id N
is temperature channel N, i.e. temp(N+1). Document this in adt7475.rst.

The hwmon core reads a sensor's temperature while registering the
thermal zone, from within hwmon_device_register_with_info(). Read the
chip limits before registering, so that the temperature encoding
(CONFIG5 two's complement bit) is known for that first read.

With CONFIG_THERMAL_OF, devices that have a devicetree node, or sit
below one (the hwmon core uses the nearest ancestor's node), see two
changes:
- Each temperature channel that no thermal zone uses logs
  "tempN_input not attached to any thermal zone" once at probe.
- When a thermal zone uses a channel, the hwmon core sets that
  channel's min and max limit registers to the zone's current trip
  window, as it does for other drivers registering thermal sensors.

Signed-off-by: Davíð Steinn Geirsson <david@dsg.is>
---
This patch was written with Claude Code, using the models Claude
Opus 5.5 and Claude Fable 5.2. They wrote the code and the initial
commit message draft, which I cleaned up. I directed the design,
reviewed the result, compared against the datasheet as far as I
could, and ran tests including on actual hardware.

 Documentation/hwmon/adt7475.rst |  3 +++
 drivers/hwmon/adt7475.c         | 17 ++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/adt7475.rst b/Documentation/hwmon/adt7475.rst
index f90f769d82d6..b5976e3ff3d4 100644
--- a/Documentation/hwmon/adt7475.rst
+++ b/Documentation/hwmon/adt7475.rst
@@ -118,6 +118,9 @@ with a resolution of 0.25 degree Celsius. Temperature readings can be
 configured either for two's complement format or "Offset 64" format,
 wherein 64 is subtracted from the raw value to get the temperature value.
 
+With ``#thermal-sensor-cells = <1>`` in the device node, thermal sensor id N
+is temperature channel N, reported as temp(N+1).
+
 The datasheet is very detailed and describes a procedure for determining
 an optimal configuration for the automatic PWM control.
 
diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index d5bdb8011e6d..73c19c10bb34 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1243,6 +1243,9 @@ static const struct hwmon_ops adt7475_hwmon_ops = {
 				 HWMON_PWM_FREQ | HWMON_PWM_AUTO_CHANNELS_TEMP)
 
 static const struct hwmon_channel_info * const adt7475_info[] = {
+	/* The hwmon core only looks for HWMON_C_REGISTER_TZ in info[0] */
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(in,
 			   ADT7475_IN_CONFIG,	/* in0: +2.5V */
 			   ADT7475_IN_CONFIG,	/* in1: Vccp */
@@ -1928,6 +1931,15 @@ static int adt7475_probe(struct i2c_client *client)
 		break;
 	}
 
+	/*
+	 * Read the limits and settings once, before registering: the hwmon
+	 * core reads the thermal sensors while registering, and that needs
+	 * the temperature encoding from CONFIG5.
+	 */
+	ret = adt7475_update_limits(client);
+	if (ret)
+		return ret;
+
 	data->groups[group_num++] = &adt7475_attr_group;
 
 	/* Features that can be disabled individually */
@@ -1966,11 +1978,6 @@ static int adt7475_probe(struct i2c_client *client)
 			 (data->bypass_attn & (1 << 3)) ? " in3" : "",
 			 (data->bypass_attn & (1 << 4)) ? " in4" : "");
 
-	/* Limits and settings, should never change update more than once */
-	ret = adt7475_update_limits(client);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
-- 
2.56.0

