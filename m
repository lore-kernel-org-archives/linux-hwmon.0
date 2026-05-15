Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E7368291
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 01:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808345; cv=none; b=g+psaI8RbDJz331DUvikFQPEwe/E9kYMEPJ5aceMGDcVZ9e7B86j7aYtjijRzDSqxnWH3mXPZnMwKxs+X57Loqf9BCGs8rmtRAZKz3+ArIU+HXjgv8ys8ZWo9wEIjOXb9dJAkPsojxO/C/eQiJHtMGyKf8vjljuE7ggrrGBIKE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808345; c=relaxed/simple;
	bh=pLoxArBatVDbIhAwUyvlk+xFJHmCRIUHZeAeIS4fCmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDueAX8dRcmPR7Yx91DXfVEF3YNEGYlD+0DQx04VmRyq+RPYtbHI2MVTqC2EZqkpDAS6MhxvpBdzH8KOh2/xNth4G8BWNsOoWVxzwDgFh3tkmb8ZN2fnFmRoXuXDJAcWhcFUb09ltffLHm31DfSRjVg7bWuP5vAWoRgdlNfMnnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtXzGI9l; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtXzGI9l"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13317450f83so3623011c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 18:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778808343; x=1779413143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck0sou/vci/zx13J9IKsKWJdmsA4VkQmiXInZTmN46Y=;
        b=jtXzGI9ldbHp7dnYv4oVR6sgBwfxv+HYXk9jOrKaUFBLYCVNMwLAsR+92XB+V8Tqwu
         2Vj6exsJ9uvQ3iSkAHmDwxabWj92VTTrsrUN52MyRx2vbzDvO8PgdvQAleZ3aGYQiwjD
         LvupTp0+xGX5wQB1kYIQHkSQwz4ZU4K2kVIAUDBJkzuWE82hC21B8ttOQcuXwZ7ZNOy8
         arJuDKiXXHR9Em3TWyebfFBNr5QTJSEB6CU8cW9+7wcF2iIe1c2UjHkhmwdlK4cYz89b
         T79p0xoZTs++zRHatdkWFYzPSW/lp94mWjwnOgGUJMW5pBWqRPxLlEpi/y/yqc2XY3fl
         IRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808343; x=1779413143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck0sou/vci/zx13J9IKsKWJdmsA4VkQmiXInZTmN46Y=;
        b=EVlcBTxJp52Ln3PN+ZdS1i0I0trcVqY8B+MJ3mxEgiKoV2RYGIGLmW6830Mgz/RkKm
         497HIF5+cJD72B/XT72k/BjhBNpWKiHcW5mMeAj880IdLDixCVqTu+qBOpeM1kbzFFUQ
         O0F0RUHJRODtM2V6SJQjJeEbFcs5ycvqKoXKmBUA5a8qGJHEii8cJnY+kGGejS5INozL
         6FbWrvn1ajYeNrtJsrcw0qpDmh5zT5K3vBtPIcu+F0Lvgbtb53CRelqhf8BpXly9sO/W
         mVnTmNdekwVQSzaBIKFM5dUykUuvbQo2RGkAk5OnmixS+HKAsgD2BXVYCqYrQkSQQC7m
         qiYw==
X-Gm-Message-State: AOJu0Yzuk+F/W1JcVKlNmGEAfygzNFAWgyT7OfE1q9I3UbRgvORYDYYy
	PV5KRBELGFU0WzvrijlWm1+uZw3N/Nw/FDNkeRV9rgEJh8gIuz1leVgZjYKF1g==
X-Gm-Gg: Acq92OFfyHQuPsHNUd5VFaGsvDxLkEsondWprCK76m+ObvU0T/r+7KJcV9YLptSllvl
	+rTFvuE4/nybfx0bS5pcSyUfXT7kqcFete4TnMUmekWWlAwmpLcFxCL0Og1nRrLvNXtwYJaz8la
	GxTtTN9NI4M4unWj8jOCqW9lqm2pm87gDwCiagHAy1i5+7ZoQbnxT4/7biyTQG/y2z29YqcXEly
	RnRvDi9BchcU5grPcwNFK5IY95XfttH4z7pFgIszIYHHI++iJkvX7/F5iPNFw5FroQonvyGsTyY
	+3HZRkiifdSXofaD+X4VCpK3mlhnPxoFjNu4FLpJRcXVS/OdC2WTCRIn/pmr3ePTXke7PJd/Cvt
	OPTsgFUUqhvSiGgHrxCpcZbLwVVfqDA9lV5h80OcJNrxDa3mSIeOQ4EDtAPMr16siSPy9WsipaU
	aA2++55xXuzIXAoFiMCeB9cz1OWMFoBtseyv3/
X-Received: by 2002:a05:7022:6729:b0:12a:7165:7405 with SMTP id a92af1059eb24-13504b5c8d3mr773249c88.8.1778808342498;
        Thu, 14 May 2026 18:25:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm7199205c88.11.2026.05.14.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:25:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 2/2] hwmon: (lm90) Add lock protection to lm90_alert
Date: Thu, 14 May 2026 18:25:38 -0700
Message-ID: <20260515012538.1419732-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260515012538.1419732-1-linux@roeck-us.net>
References: <20260515012538.1419732-1-linux@roeck-us.net>
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
v3: No change
v2: No change

 drivers/hwmon/lm90.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index c4a9dafff81d..1eeb608e5903 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2946,6 +2946,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 		 */
 		struct lm90_data *data = i2c_get_clientdata(client);
 
+		hwmon_lock(data->hwmon_dev);
 		if (!data->shutdown && (data->flags & LM90_HAVE_BROKEN_ALERT) &&
 		    (data->current_alarms & data->alert_alarms)) {
 			if (!(data->config & 0x80)) {
@@ -2955,6 +2956,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 			schedule_delayed_work(&data->alert_work,
 				max_t(int, HZ, msecs_to_jiffies(data->update_interval)));
 		}
+		hwmon_unlock(data->hwmon_dev);
 	} else {
 		dev_dbg(&client->dev, "Everything OK\n");
 	}
-- 
2.45.2

