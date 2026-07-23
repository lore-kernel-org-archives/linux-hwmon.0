Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671864756AC;
	Thu, 23 Jul 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821572; cv=none; b=NGYmohftdnNwtiDhQWKCPo85V6FZkBKHu8baL8nv1b7Xor9u2ZhU15Zy1WOUQZghFzqrE8En0gS4SiT1DK55ZjuIAB5aB0TCjajViV0G8PiEyGfea9V6btzOUKUc/IeKtjxuX8T4C6k68HRwlUlIJJy6hzaElLz+ydXoCEV4kNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821572; c=relaxed/simple;
	bh=EClhRpruQEvlpGbCphJCmoLGR304M9HBeUainuax8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebvTLxo+x/1Z1FnMyPBE/bnhNyYWhqqbIrFDe5jY2TotxXm2MsH+sqVfDLhHKGE36DY2UTu+KaLXtb/FI9bktE1jLGUqWkAFaabcZgXcjHABQW7XlS2WCs1Ik6meQcY7raL1nhMfnoTXEODhqIAbuNyIkzIxxouKIUrGaCj7Kzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwyIrDY1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwyIrDY1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC02AC2BCC9;
	Thu, 23 Jul 2026 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784821570;
	bh=EClhRpruQEvlpGbCphJCmoLGR304M9HBeUainuax8Kk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZwyIrDY1bRfCKW4oxKX5sddxcdBp2/s3MKkrdthreRwUr9P60VRMoBXF7FkjB41h5
	 RDU9fQ+bhLhNcjBcsxFGa51QCm7qS8gEEvXOuvCw1WG0A3ix3eiPu9YCX/uQbOpMeh
	 BGyDzJfZrd7lyiOyatIkXqQtj2eYaA3N+N5EiNSJ+JRMET7VKMncRxaOkGAchOZRHZ
	 HkKFXr96B+BosCkbPVQMXBq8Uoq/2wPlCJ/V9Ot9UwJFWuuz68CDpBABA96NK0sU9Z
	 0Q/V2XIQMecF7Em39OE2kdIcE+Zy/i8fxd/i9l+9s9V9xrGcP0ctn+UQZhwwscSD0E
	 cnnf/peXnl1kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99500C531F8;
	Thu, 23 Jul 2026 15:46:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 23 Jul 2026 17:46:05 +0200
Subject: [PATCH v2 1/3] hwmon: pmbus: event notification with alarms
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-mpq8646_v0-v2-1-3c4cb71f23c0@free.fr>
References: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
In-Reply-To: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784821569; l=2243;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=J9iIMMt2Lp2Xbzm5GXCYVVI1Koec6CMd7Yg+qpVdHaU=;
 b=0MHJ2fG9W4yTZSOsD5TrYqcJQIin0dQUHqNpzIB3lEDIt7IW6DItksPP0u/R3HuwAR392eCGw
 zIvOBGi3p1hCRXSx27CxO5bru/6u3f+YwaimukMq22YUs3bORXlQnPF
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Let's add an accessor for the hwmon class device the pmbus core
registered for an i2c_client. Export it with PMBUS so chip
drivers can call hwmon_notify_event() on per-sensor *_alarm
attributes from the driver's work items.

The needs: for boards when the chip's SMBALERT# pin is
not available for the CPU, pmbus_irq_setup() cannot deliver
poll(POLLPRI) wakes or udev change@... events on the inX_alarm
files. So the drivers can install a delayed_work-based polling
fallback (like the lm90 driver) that periodically reads STATUS_WORD
and calls hwmon_notify_event() on 0->1 transitions.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/hwmon/pmbus/pmbus.h      | 1 +
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 23e3eda58870..46ab056c0058 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -565,6 +565,7 @@ bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
 int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
 						      *client);
+struct device *pmbus_get_hwmon_device(struct i2c_client *client);
 int pmbus_get_fan_rate_device(struct i2c_client *client, int page, int id,
 			      enum pmbus_fan_mode mode);
 int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3143b9e0316c..6ba00ad73297 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -695,6 +695,14 @@ const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_get_driver_info, "PMBUS");
 
+struct device *pmbus_get_hwmon_device(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	return data->hwmon_dev;
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_get_hwmon_device, "PMBUS");
+
 static int pmbus_get_status(struct i2c_client *client, int page, int reg)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);

-- 
2.43.0


