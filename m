Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146E63603FB;
	Thu, 23 Jul 2026 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850932; cv=none; b=CvYA73OmH/93O345ZtNX/zIvyGKJfCzBW05wS/UCwhapcXq6SawPAI++aTbThwMMl1rCHc1hCOHKqBaCJd69ulfr0A8KA4iMvADAojEqD/UVJNr98POAkspDdzY16eYHfFr1vXx1QxmdLASQUH+B1CQllYfj7lsm2ZaYBAuWkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850932; c=relaxed/simple;
	bh=EClhRpruQEvlpGbCphJCmoLGR304M9HBeUainuax8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtW+PVp/LjNP7i2BIpBE19wpzCFO0nxxDCiw7wrXVOI54+tGsSWj1XpOMssRDLD8/uWODovuwnAhgwEQr7PttvddHSesivArkRWHJGtXb2m+y70syror42XC3/2qXfdn1joKoZ42dsO1vrlHj2DjBhwbNBCMOK1FVqXPUjQ1k+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Imbm2FSP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Imbm2FSP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9559C2BCC7;
	Thu, 23 Jul 2026 23:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784850931;
	bh=EClhRpruQEvlpGbCphJCmoLGR304M9HBeUainuax8Kk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Imbm2FSP69tBvHU8FmTPhcQrmpcDJ8WZQNEFF/x62Q6OYl3Y0mX2Wpgit/mGVa6tJ
	 21AcO6EJIpmsXpnp7Mx+svRTtHccqveOl080dZO+uCSvw04GWqGMnPjglA769mU2ql
	 qozSNjW1Cgu2OkDTJF13UHcRIMDybhgg0spCMuQ/X+Ai+K61a0Rif5Hoog7B0/sOyf
	 wIsb7DuepRIFkavC9gIAhHXlBVoTPze9rGPBfCCxgU9H7vE6I5GGev11FKnxcFI6pJ
	 wAsnmMsZ9xKlyvY+ks2qxC4KJVXxFDAjfmImWZE2UJj+f9f/puzOzK7R84hWkjF5uq
	 SsVOlVM3Uydag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B24AC531D0;
	Thu, 23 Jul 2026 23:55:31 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 24 Jul 2026 01:55:27 +0200
Subject: [PATCH v5 1/3] hwmon: pmbus: event notification with alarms
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-mpq8646_v0-v5-1-5915b5ae9aa2@free.fr>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
In-Reply-To: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784850929; l=2243;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=J9iIMMt2Lp2Xbzm5GXCYVVI1Koec6CMd7Yg+qpVdHaU=;
 b=Tu8y+Y4O5E7dR6dPhzKnw6ycuMzubvoQWJ3W+1lhTMz7ggE+/XkN9xYAp3aTT6YaogMHedSuM
 XZZmmlBZhD7C95BkM5718DAmH9FKwFphlKuOwImcnSiHIIxjXOUeD9T
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


