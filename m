Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568FA3A1690
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973541; cv=none; b=UFFnaOLxNg1kSqivd8Qk31o48YJkuju2dB+KDUIwmQus+vzvlQ5uKW+jC/1XL8yzhWsyoeeD6bfE+qzAKLjgufPOw+bEbZF2KfSLxQuyyqqT+Q9YgHCDfGAbnDK4YAOHpQ8l2IDU9ndc9EPFTHND5mQj0O6SENfko3Nkwxk8eNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973541; c=relaxed/simple;
	bh=yxjAXeOD8vgYHpYNi2nRb2U8lGvMYDcyt4MCoMgxNz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKfp3sDoXDZX0c8VE5zAuDIdhiKa0RUnBOzDKp6oVhbe12191HFOx5ik8jkyjl17ggCu7X3orDTm95h2cxRzfOvLT+KdGZzuG4h4hT60/ChGWPGvboLpRPK/ftY3CRIgnNalBz5gFrg//3t/YRvcELXFI952aw6oX9Bi6cE9d9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=XGRWecXk; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="XGRWecXk"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c1a170a50so1171999c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973538; x=1779578338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUnfFsool58oW+sRC5tpMK9MOqrwqv2manCcCe6X7bw=;
        b=XGRWecXkhtobTKZQlG46zaZAm34o3C9AA9gVr2yB0uDviFi4xxbnHQtsTFstT6xMi6
         YSnH2wTfJBT7cwFQaggRfl9RFopXStbHXByPoNN3A6pedzqzHfdKAryxcnCJZewe4A+X
         FtcVCQNVPXdYeIAWLM0MqKWaPGziopTZjIn1qaiU/gJrGr1iQrXOrd2luXzZ2PKs7UhE
         Lbcs2Y2FAF4VX3RVSHU5/0WQ2a+8nI+QDMs+kPRRWfaRCaQ9OPH8HD17iZamCP4Ft/Lu
         KHNgSzUC2fHSt53LNwqjNEsWXxbm+ySEzW7+imWPTTUdHjrQdUN5Ozl0b1M06DIEcAQR
         MV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973538; x=1779578338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUnfFsool58oW+sRC5tpMK9MOqrwqv2manCcCe6X7bw=;
        b=aq3zXVE932K/ca9ADppVrBTwiUop2dTCl4HPFWYqK5QabNRoozwMDtlOKc6OKz1dZw
         UctELYe6KpAp9Jlb3apLRYhIzU5qRG0AMfAjArsRytxH005atEyAkpU1Kl+FOv1Ily+S
         eFKBrhy+hwNKCUb/vDHeY2VHFAEYgZhgkmex/UCn8Pwt1OHTCYwxgrZZpXgNu8/VkJ36
         lqkBsJWUf7L1IWNJWKEefdaVGfIpV+eQPqPSB7BdyBN7xffubEM/rd7CqGvjYAaLJUgS
         LzqLUuLIl4kiKuT90MaM8+9ETMK+G8aK/beGgRq3zCrfpUNF+DHM8fBQ+Nr7FvF72xVs
         ypIg==
X-Gm-Message-State: AOJu0YylwjCf5sAKbLSFbReap9WUqInQWt1CAvhJ4RBpH6ujFqReewAT
	U24+n4+EpgPZZsJwEzkVcy+iSyb5+4zA1wlWDTC8cFzoiHSIu8Xx0oF0Bf08qZLhxXw=
X-Gm-Gg: Acq92OFvJaG5vf9Un6NnG3BXlTaHjWPtfIxH9iPRBrLOyLwKvj+QSSYK9Nt6MY7Lfh4
	9B/Zmbm3ormD1QDhIRA9l/fkw2GCP1GZBLzlUw4vmFjKuTs5SZkPmq2R8PpLF+3XXRK1FG9Rb2P
	u13oyw+7Sh/E7s8UAfgi/XkVmcBErh5O0/IFxQ/MIeftTsD71xv6LDRcSjugJfS5E7QCL9OBw94
	U4fA0oHg4Z5eFVFnWYCPfTjl7rNkhmB5XenoA+f6/kZYJOZ0PGb5Ho8YR/vJxzIRzmEQrq9RmEU
	d6n4eMMX+b7DRJzEubjksUApBtRiFvoFdQfyKRtiY0bQ5gC+0aDYvGkloR4rSHN3WwuBrTUugyq
	tQ40ZxAeKvQepcbJFKscqdZdkNh5oNJoNEtREWUb86poPzkp1Kz2/dFGQktzQ4A2rhq+IrBcAsz
	qVZr1l+eTxQhcHk2YHtlV7Rnfg30Iy66aB+IEQ
X-Received: by 2002:a05:7022:6621:b0:134:a710:d908 with SMTP id a92af1059eb24-1350451887emr3707639c88.13.1778973538361;
        Sat, 16 May 2026 16:18:58 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:58 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:50 -0700
Subject: [PATCH v2 4/5] hwmon: (pmbus/adm1266) register the gpio_chip after
 pmbus_do_probe()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-4-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=1739;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=yxjAXeOD8vgYHpYNi2nRb2U8lGvMYDcyt4MCoMgxNz8=;
 b=WTiOWdWghEIO6M71PDijdRA0E0SWlC77JtKTutsFSXf2+p8yo3CIbVwylMBta2u5GORRt7VpR
 WfxCxYPFXsSAF4CAqveVJLuBo0aBnPgglLTy0Y4rYcbslUwj/KD/i+d
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_probe() calls adm1266_config_gpio() -- which goes on to
devm_gpiochip_add_data() and exposes the gpio_chip callbacks to
gpiolib -- before pmbus_do_probe() has initialised the per-client
PMBus state (notably the pmbus_lock mutex the core hands out via
pmbus_get_data()).

That ordering is already a latent hazard: any GPIO access that lands
between adm1266_config_gpio() and the end of pmbus_do_probe() (for
example a sysfs read from a user space agent that opens the gpiochip
the instant gpiolib advertises it) races pmbus_do_probe()'s own
device accesses with no serialisation.

Move adm1266_config_gpio() down past pmbus_do_probe() so the chip
isn't reachable from userspace until the PMBus state it depends on
is fully initialised.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 57cb7d302cdd..b91dcf067fa6 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -467,10 +467,6 @@ static int adm1266_probe(struct i2c_client *client)
 	crc8_populate_msb(pmbus_crc_table, 0x7);
 	mutex_init(&data->buf_mutex);
 
-	ret = adm1266_config_gpio(data);
-	if (ret < 0)
-		return ret;
-
 	ret = adm1266_set_rtc(data);
 	if (ret < 0)
 		return ret;
@@ -483,6 +479,10 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	ret = adm1266_config_gpio(data);
+	if (ret < 0)
+		return ret;
+
 	adm1266_init_debugfs(data);
 
 	return 0;

-- 
2.53.0

