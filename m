Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242015;
	b=rMOWm9iIggijoY+wVXNjF9baqZXN+K3NyAnYMQQhMnfch+V8cT1wMgBFkRTwpNKWMg7W
	 du1kUBTwSqb8Y4kHzDpBwD1Qis4gIdT7TYAPEnA+KpWboXtB8mq164+UvJUhsQxjlJRdD
	 Wmq5f6+pqzSvBoEsg8n0lerlMBqJG7j2iHC2pszpI98sLAfzmMZtfoNz51AJKZb70rr//
	 lW1nY2+CVOez4V+uiGQ6JArBexY4CzP9OwKJX3NINuqCtiG3KSK6QE5v/m0PcOepfqJ4u
	 yPGtlK9czdYbwPUPtsfl2s/rhHvDskaeeWQ7Z3NvL6wPDys7Y35hNVxcyEWXIhmig3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242015;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=Kop+hinQLKchy1QoJRL2IXxqQFH3lAsbksyTp58ePKQ=;
	b=dvsWjt0asbBNYUo+LfN/L7EbxhuYTmoaFfsa1dk5HlfXBBJeNmTk4hephTM9QXVnDF6W
	 cfMrEIMZdNqAAbXxhhmimNaHgkgVArxJs8k5+xabFy8UQD48E/w7+1ihnj6ZVnuKGXboS
	 MdSikjAUxaCF7BDukQwQvD/oW8/SCuhmJhHpYdsp0XxKKjgJgMCjmOwPwFYRn9hGxRhRe
	 PyOZ3U7w+tbsWiTMifp0Jwi4PSw6oVbnTzxNTLD3UqkVBBJYIE1QMJscj1dQ2kJ3uWPoJ
	 Oi/n2Lf6LEB6laYPLwAY1xkAyI2i3AxCHjH/3Psk6MZDu6nFv6Ghsy97Cqep4LO/+/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=GtM6LVdw;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD4606A321;
	Mon,  9 Nov 2026 16:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAD4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=GtM6LVdw
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jNb216fyGzMl0n;
	Mon, 09 Nov 2026 17:33:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794242009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kop+hinQLKchy1QoJRL2IXxqQFH3lAsbksyTp58ePKQ=;
	b=GtM6LVdwjyAu0EGKKh3z/khCzX7TQEyXOXZcr0c1t1Um2AoO4o4Px2ZJoXGW6kwT9cUrwL
	vhz4mpFEqCo6illYvaW4TQW6rWMdO1gs73/2BUQvIij33nNJLqCHYD3lV5EaBpxfo5UOw5
	NQirnRfomPNx+3AsUg2mzu4WYDp5veQfxcW1TNX4+DA5+YHkaawdyk4kDP3Q2VnVOuw7pE
	ZCB/yzugCvO358iGUIau1lGiPx2NS2+4wjYFQbt2DXsmln+8rCuKYZSe+BY/DjKgFyocpj
	spN/w1FuU6bZbuOoPdzmbM+4O49bRxnRx9sOTWzetJaChcXkVC5b16Cn7xmBEg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hamza Mahfooz <someguy@effective-light.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6683) Restore manual fan control after resume
Date: Mon,  9 Nov 2026 17:33:28 +0100
Message-ID: <20261109163328.61787-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jNb216fyGzMl0n

On MSI boards with NCT6687D-R, the BIOS restores automatic fan control
on resume from S3. The manual mode and duty cycle set through
pwmN_enable and pwmN are lost, and pwmN_enable reports 2.

Remember the channels switched to manual mode through sysfs and their
duty cycle, and restore them on resume if the EC switched them back to
automatic mode. Other channels are not touched.

Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61): with pwm16_enable set
to 1 and pwm16 to 153, pwm16_enable reads 2 after resume from S3 without
this patch. With this patch it stays 1 and the fan returns to the manual
duty cycle.

Fixes: 5410a1257e26 ("hwmon: (nct6683) Add fan control support for MSI boards with NCT6687D-R")
Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
I used an AI assistant (Claude Code) during development. I reviewed all
of the changes, tested them on the hardware described above, and take
responsibility for them.

This addresses your comment on suspend/resume in [1]: on the MS-7E61,
the BIOS restores automatic fan control on resume from S3. The patch
does not depend on the fan curve patch; both apply in either order.

[1] https://lore.kernel.org/linux-hwmon/487b2f39-7e22-46db-9eaf-9b1dd9b31d31@roeck-us.net/

 drivers/hwmon/nct6683.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 65e374c64fb8..d88b981efb1f 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -365,6 +365,10 @@ struct nct6683_data {
 	/* Remember extra register values over suspend/resume */
 	u8 hwm_cfg;
 #endif
+
+	/* Manual fan control set through sysfs, restored on resume */
+	u16 pwm_manual;			/* channels set to manual mode */
+	u8 pwm_cmd[NCT6683_NUM_REG_FAN];	/* their duty cycle */
 };
 
 struct nct6683_sio_data {
@@ -1052,8 +1056,11 @@ static int nct6683_set_pwm(struct nct6683_data *data, int ch, u8 val)
 		err = nct6683_fan_ctrl_update(data, ch, true, val);
 	else
 		err = -EBUSY;
-	if (!err)
+	if (!err) {
 		data->pwm[ch] = val;
+		data->pwm_manual |= BIT(ch);
+		data->pwm_cmd[ch] = val;
+	}
 	mutex_unlock(&data->update_lock);
 
 	return err;
@@ -1130,10 +1137,17 @@ store_pwm_enable(struct device *dev, struct device_attribute *attr,
 	manual = val == 1;
 
 	mutex_lock(&data->update_lock);
-	if (nct6683_pwm_manual(data, index) != manual) {
-		/* Keep the current duty cycle when switching to manual mode */
-		cmd = manual ? nct6683_read(data, nct6683_pwm_reg(index)) : -1;
+	/* Keep the current duty cycle when switching to manual mode */
+	cmd = manual ? nct6683_read(data, nct6683_pwm_reg(index)) : -1;
+	if (nct6683_pwm_manual(data, index) != manual)
 		err = nct6683_fan_ctrl_update(data, index, manual, cmd);
+	if (!err) {
+		if (manual) {
+			data->pwm_manual |= BIT(index);
+			data->pwm_cmd[index] = cmd;
+		} else {
+			data->pwm_manual &= ~BIT(index);
+		}
 	}
 	mutex_unlock(&data->update_lock);
 
@@ -1549,11 +1563,28 @@ static int nct6683_suspend(struct device *dev)
 static int nct6683_resume(struct device *dev)
 {
 	struct nct6683_data *data = dev_get_drvdata(dev);
+	unsigned long manual;
+	int ch, err;
 
 	mutex_lock(&data->update_lock);
 
 	nct6683_write(data, NCT6683_HWM_CFG, data->hwm_cfg);
 
+	/* The BIOS may switch the fans back to automatic mode */
+	manual = data->pwm_manual;
+	for_each_set_bit(ch, &manual, NCT6683_NUM_REG_FAN) {
+		if (nct6683_pwm_manual(data, ch))
+			continue;
+		err = nct6683_fan_ctrl_update(data, ch, true, data->pwm_cmd[ch]);
+		if (err) {
+			dev_warn(dev, "Failed to restore manual mode of pwm%d: %d\n",
+				 ch + 1, err);
+			/* The EC does not respond, skip the remaining channels */
+			if (err == -ETIMEDOUT)
+				break;
+		}
+	}
+
 	/* Force re-reading all values */
 	data->valid = false;
 	mutex_unlock(&data->update_lock);

base-commit: ec921ef8d81acf0cc41b3f3b6db54698e9a2917f
-- 
2.56.0

