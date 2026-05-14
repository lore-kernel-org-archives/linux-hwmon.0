Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B73016F5
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 23:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802992; cv=none; b=N5BXGL7RwRziP+Aoe76rOsO9UEJ5YXGf0MEY5f0/Cu6nY5VaB1a3oLVaz/c8w8fpIcgf8tpIvf8TZ+ZMxlRLT8qOZdiOgSP1zg2NcgRaL4D56qzqHWnwHvb1Vzp90UzICXV435mL9tj/jMlnFV67l/QQ2DB5bI6zIr8rOxZHcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802992; c=relaxed/simple;
	bh=x1VPibhhBwbc4usAfQlTzTriJOTM21kgcHhcFTZ9Z48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSUDhWf9cZCeE/1NlWM6AAnSVZtRzOqGFh34aCw+tYZAf/nyC4rDZKQ7Vn1cLoSx9GlqB01JfUM1Yif6O3+qm9nxtPyoBTCOdphKS/QIWETTM4nMOhILVuK4EVQwcPQs0wCvXYVZxw25PevQqf17acunNWGnqjw9OwkWDRMTrDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFWdaEsn; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFWdaEsn"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b4520f6b32so14180975eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 16:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778802991; x=1779407791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcbn8jD53V3D4GpeIDCO3z+LucG74AbBN/CQsHvx2dE=;
        b=qFWdaEsni2X3+Ri+0Z1q7wL8NAILrk9g+rD85GvY8SEWUwIKS7D5CXUEh0FkTQZxWb
         fIeVTTyTrLmAttwCjkMA2dTz9jwmeFhBB/xzI2j0TbcIIPdkx4KQQ6KrccC3ejBGTWeb
         8KalC5+7wW85QjMS9vHUfbH2JOg6oqBFHGjfVqXFrg9H0hMS+ae4LAXUaDHDYfm//Bcg
         ulOmAVM8LOs9CF/K5qZdUxMK9FoO/0jOUzjepdXQjuXd8pTY4klZB+CrNSR+TZ1vuhMO
         NjUs3wUBlpnWIc8+Ht4wJMcsOEuj1c6niCXoxyb353ZNlG+8MNS59lxe0FdqR2YIFIhp
         H/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778802991; x=1779407791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcbn8jD53V3D4GpeIDCO3z+LucG74AbBN/CQsHvx2dE=;
        b=CQ6p9YBaBU0mscrlVveLiUx8JXMFDphuHSP87R3VLK1Be/XaH7C/NR9JBskbmSt0T9
         8mGvOLDwZBKZJ57WEF6y8AUdrBCAUrO2evfhiHTJgV1EQTIfUEaMxaTG6hIlVbd6ud1y
         t5d/cB4jfBeOg2qpygjqrrq/8A1ypLB5g1i5hbBx+2HKqASal2jnO09H9b2T/KTQpReG
         wrJqx0uWQrO5nN9J4YHPbO9ofD1I2JAlr7z59Jxyg3gya7jJaDPA4KgDn8YIW5e+KSu6
         k8tgr2h2Jq+3AFV3zvbVCWV4U/tbfJHAwQyKv5TG8KJkoudgdZctPA+RtLH4JJsjYheq
         9TXA==
X-Gm-Message-State: AOJu0Yz7lZ9xFHD9s+s6svQ5C1W7O22hOMY5jvI8AaouCkqCtuwuYVJK
	+LJU4msLdh1Yj5oJIloogdFQI1qUcNnaQRArCg5Tg3U4QQmG0JxH2T5KqoemAw==
X-Gm-Gg: Acq92OFgJlihC+Ma3v1lTqfhhdXpN1F/bM1+9oovnAFI9hIIRyKeLN7CyNsZ5g4gOI8
	NME/XxCrob56pUPeQBLhXXzghyqZghJxDPzXildwc+PPW7wU6VIbC8aoZw2zoqt3VE4zdTgZfqq
	uTlmnF19O2go6hFUuveJWoFcsy7H2rWCECtUdB0CbHVsvAlXM2oQyMTLhMTpHxjVtMIk8vcHoze
	6exFzCp5ROJ38X14tkmxZRQvasZRrDY92+xZ/Z9fIFGOzvDp8emRVu8OMHqBFB+J1t5AR5F3YXA
	LHwqi+/6lIawexAwUlNx7oqAlsu1scIO6ExUZLAMo+p+tFnU8Y8aBkMrOyol2v21bWLotVpzbzd
	o+zB4EdxY/7tjYvJAzoRkc95u5q6H0cCrvMSWZ+F/px/1645c3WI2mvANGV/QsXl5mdGjynVbxW
	//SUP+N5hDUjKwUhPiAzWJniQldEt9zPcujjf4
X-Received: by 2002:a05:7301:198e:b0:2ef:2878:7ad0 with SMTP id 5a478bee46e88-303986524b5mr828738eec.27.1778802990802;
        Thu, 14 May 2026 16:56:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b3cb2sm6415558eec.30.2026.05.14.16.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 16:56:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/2] hwmon: (lm90) Add lock protection to lm90_alert
Date: Thu, 14 May 2026 16:56:26 -0700
Message-ID: <20260514235626.1403695-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260514235626.1403695-1-linux@roeck-us.net>
References: <20260514235626.1403695-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

lm90_alert() executes in the smbus alert context and calls
lm90_update_confreg() to disable the hardware alert line, without
acquiring hwmon_lock.

Concurrently, sysfs write operations (such as lm90_write_convrate) hold
the hwmon_lock, temporarily modify data->config, and then restore it.

If an alert interrupt occurs concurrently with a sysfs write, the sysfs
path will overwrite the alert handler's modifications to data->config
and the hardware register.

This unintentionally re-enables the hardware alert line while the alarm is
still active, causing an interrupt storm.

Add the missing lock to lm90_alert() to solve the problem.

Fixes: 7a1d220ccb0cc ("hwmon: (lm90) Introduce function to update configuration register")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No changes

 drivers/hwmon/lm90.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 08a568f7b56f..9d0c23420842 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2944,6 +2944,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 		 */
 		struct lm90_data *data = i2c_get_clientdata(client);
 
+		hwmon_lock(data->hwmon_dev);
 		if (!data->shutdown && (data->flags & LM90_HAVE_BROKEN_ALERT) &&
 		    (data->current_alarms & data->alert_alarms)) {
 			if (!(data->config & 0x80)) {
@@ -2953,6 +2954,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 			schedule_delayed_work(&data->alert_work,
 				max_t(int, HZ, msecs_to_jiffies(data->update_interval)));
 		}
+		hwmon_unlock(data->hwmon_dev);
 	} else {
 		dev_dbg(&client->dev, "Everything OK\n");
 	}
-- 
2.45.2

