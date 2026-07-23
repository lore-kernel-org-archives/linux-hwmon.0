Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2943B5314;
	Thu, 23 Jul 2026 20:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840178; cv=none; b=JjBVRI4TpUHvUxAZDJHlaZ4XbaDlFrSHJ8qwShlYu2RglInZvctJaB455jrwv3H5hcqNAsz8L99ZV3HMRTr4A2tsVsmIdo46opSv5xChY51akwaSBQ50c9cMsEigv7gKYwdOJJmXxVuYmXMk6lZCX+FO+07tP2fhjnskPiP3pZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840178; c=relaxed/simple;
	bh=EClhRpruQEvlpGbCphJCmoLGR304M9HBeUainuax8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/iSGpG4XT5ZkQ0xRlgwX84ATogSXUFQ5wLT9y4bzBX3Uw9GE5IigxuxSnLIT4tTyVtEmcFSRofums6jjXru2VAYqz7gPdYLRbTOhO+ldjiBxS8+XCFrC3fmlycfMAHuwXrX7Q/5MquniBvLJJ2pgg0nIBPv8XIdZKxpVniQuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBGSh3ui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBGSh3ui"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C306BC2BCB8;
	Thu, 23 Jul 2026 20:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784840177;
	bh=EClhRpruQEvlpGbCphJCmoLGR304M9HBeUainuax8Kk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BBGSh3uiqVEv4o0CzZ2uWEumnaLw4wkEhLMS3GxI+149++LcT37JM99/FP4KkJXPw
	 ekhowQnW9e1/mpQiQdejAN4MX3RPEQVyZ2kA7cInITXER3DUfvE2bpvYjBBnDzjhW/
	 re6V4f0E88xQRgWBKpaugGSPEJNAV48VVupVLK9Fd8OuBaU2CqQS1g0GSixritX77/
	 JTr+l97umlPu5tbzZFywrmphqAmuOujWaKDl4h4aINF+G3/eTBo/+NgKY0ZdccBIhD
	 uY6dExtBwzr93AGslu7kboaY/iMp53kSyIMACLa3xvVJcP/28/htGovSS2a9lh0kCU
	 1fMgTb4rSObqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A144CC531CC;
	Thu, 23 Jul 2026 20:56:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 23 Jul 2026 22:55:50 +0200
Subject: [PATCH v3 1/3] hwmon: pmbus: event notification with alarms
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-mpq8646_v0-v3-1-1af1f3d38848@free.fr>
References: <20260723-mpq8646_v0-v3-0-1af1f3d38848@free.fr>
In-Reply-To: <20260723-mpq8646_v0-v3-0-1af1f3d38848@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784840176; l=2243;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=J9iIMMt2Lp2Xbzm5GXCYVVI1Koec6CMd7Yg+qpVdHaU=;
 b=5D5bftlXA9sE7ILYCNZrxNS3L6VrZ81684FrnFs1ik7DLw1s8Rwh5dfl1fpG5kn2NB1+WUFoA
 fTiyDCCe+UpA9xbzqKa5xr/gUUNF1hRuBNqszUTzguCMRJ15zB/Mzxm
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


