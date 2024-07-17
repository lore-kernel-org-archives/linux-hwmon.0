Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47881CF8A
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721201468; cv=none; b=f4KZNQuQB3RNUF9aw5lRO/BC0zlHfQfAN7XfawNGJ77ylzRCb+eiEuSElkmmD9DcomGIi/sFGrkBIYCrqJ/6UxkZPj6y8qD+gxjyKr25tvr83EOtS9hoCGUUMN6zRosnrzVveztx3nTgPNek/ruj/umjaQ4wwrUnTqgonubMpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721201468; c=relaxed/simple;
	bh=msdvHICFqZBk3Qmz2OXLcwYLDlWXsaOJTSf+xIoW5K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVvJCOc2nwHQNlxAD02LmRT9hU86uO4S01BfCLtvPRbRIod7yaDTv6qJPB59WNaLVam1Fjc82td5wBGuAfbDBXbexBdNudSiX3ycb7uF/4ApJqxdMFpZ6ZYwM8jT3Cv5BJO2LBExhiKMm6T5LL53RfTSdSrvW2wbC1Rz60otr5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UsdYwnf9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UsdYwnf9"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a09634354eso264759a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1721201465; x=1721806265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H+3a2UnmA5NVXZ9zwW5RQvv7oqwdwKXWiUEHwm4fFk=;
        b=UsdYwnf9iL0cjKnfgPvGE/oUnh7mRypsvsOytZsAU2YjQkrAsYcKPUeODqWcmnnxXJ
         WJhiOYdMrbnHO2A2kqIqzQ27n1PhDZhLz8fcCZ7zBoh5MuopFOK0ILeYRpGug6McQjdX
         inm3A91CnAAvT2IgIVGVPWCN4MdAbTpO7mi60qw2yCYysm135aOz1WvfnleaB+bVAwWe
         3pfH7cvHEmolmxzJRLvEpqaUg1bKkNkOP4UK68+QGzymXP4j8BgSdDG52n7Wp2jJK1Mz
         54IDepftB7o/owboE6Ywq9dUTInTGCenYCAaLElWVFRSWUBft7PC29vsIbrD6cN8rB7E
         cg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721201465; x=1721806265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H+3a2UnmA5NVXZ9zwW5RQvv7oqwdwKXWiUEHwm4fFk=;
        b=UAq/pXxFLzFCaUUYySSRAWtGW1RrbMAcX6jig7OhmKVahyWuobPgLDRNcjR54ivSai
         ywYby/pDOtFxACL+Zp/1xSbZjBMXHo5yiWOWJexn+S31MlshQdAxHbzEGKVrCLKpQDo1
         9T90YztdwbzYgr/F3L+3Z3aeIYsu5f8ozQgeSD+iD13fkMPWbIFhtgSgzVn8KeiuNcEr
         rtfWJ2OmKnGSCF8IAJLh1SXI2VZq0AhNIAW9OIpANjhZMGHWlJFWzmi93laXGPxF7TyU
         Hv6RoiXOk88o+3MaUGjvYOxzNOvnU/brNWvdOd2FwHcm3HOvO4+5mLSsDwG90RQBcu4V
         /Izg==
X-Forwarded-Encrypted: i=1; AJvYcCXGMk3PhoXYmsBxQbC39CwZOKq43ge7BHaqq5bzZF/jHeyUvfLCls/wZo0Z5ETMPOtJm3dox9Ktjue/Cr1SAcC2ptabXrMhYGH7CHw=
X-Gm-Message-State: AOJu0YwZ5v7wFlcRZhxCVZIU9uUPEwO565XB5ZXN0yHzl9CQ7H4S2ZiL
	5T/a4E/34QFMl1V20U1vY9z4UIL0Mwc0wV7XqGRDhD3N3QoFiVbx+1pf1/lO7Og=
X-Google-Smtp-Source: AGHT+IEZtcVXcfwtImP1fpyarc5yRV6TUo8N8SeviTjYaw+TozD8Xo8zU+Xhcw5IGQhmNtEuvts9Tg==
X-Received: by 2002:a50:d69c:0:b0:58b:d7f2:eef3 with SMTP id 4fb4d7f45d1cf-5a05b9dac64mr580801a12.12.1721201465233;
        Wed, 17 Jul 2024 00:31:05 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59edba561e0sm2766841a12.50.2024.07.17.00.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 00:31:04 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2 5/5] hwmon: pmbus: pli12096bc: Add write delay
Date: Wed, 17 Jul 2024 09:29:56 +0200
Message-ID: <20240717073000.786228-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717073000.786228-1-patrick.rudolph@9elements.com>
References: <20240717073000.786228-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tests on PLI12096bc showed that sometimes a small delay is necessary
after a write operation before a new operation can be processed.
If not respected the device will probably NACK the data phase of
the SMBus transaction. Tests showed that the probability to observe
transaction errors can be raised by either reading sensor data or
toggling the regulator enable.

Further tests showed that 250 microseconds, as used previously for
the CLEAR_FAULTS workaround, is sufficient.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/pmbus/pli1209bc.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/hwmon/pmbus/pli1209bc.c b/drivers/hwmon/pmbus/pli1209bc.c
index 2c6c9ec2a652..178e0cdb7887 100644
--- a/drivers/hwmon/pmbus/pli1209bc.c
+++ b/drivers/hwmon/pmbus/pli1209bc.c
@@ -54,30 +54,6 @@ static int pli1209bc_read_word_data(struct i2c_client *client, int page,
 	}
 }
 
-static int pli1209bc_write_byte(struct i2c_client *client, int page, u8 reg)
-{
-	int ret;
-
-	switch (reg) {
-	case PMBUS_CLEAR_FAULTS:
-		ret = pmbus_write_byte(client, page, reg);
-		/*
-		 * PLI1209 takes 230 usec to execute the CLEAR_FAULTS command.
-		 * During that time it's busy and NACKs all requests on the
-		 * SMBUS interface. It also NACKs reads on PMBUS_STATUS_BYTE
-		 * making it impossible to poll the BUSY flag.
-		 *
-		 * Just wait for not BUSY unconditionally.
-		 */
-		usleep_range(250, 300);
-		break;
-	default:
-		ret = -ENODATA;
-		break;
-	}
-	return ret;
-}
-
 #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
 static const struct regulator_desc pli1209bc_reg_desc = {
 	.name = "vout2",
@@ -127,7 +103,7 @@ static struct pmbus_driver_info pli1209bc_info = {
 	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
 	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT,
 	.read_word_data = pli1209bc_read_word_data,
-	.write_byte = pli1209bc_write_byte,
+	.write_delay = 250,
 #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
 	.num_regulators = 1,
 	.reg_desc = &pli1209bc_reg_desc,
-- 
2.45.2

