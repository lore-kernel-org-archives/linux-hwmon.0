Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491B2877E8
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151957; cv=none; b=PY2sx0G0MQabe49nrc8uy04eaUuQxgf1rd9em9KfgmmU9/kHm31wt2p03BgiDabGfknIO14pnCXGggW/DU9SPC9ZS4zp0bUvCGrfTr7LWv9tz/gok3E468ruZK38+zAKFub1fkn5fsbr2K+a2kjQf691sgyry+pBnlfvJlaKsgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151957; c=relaxed/simple;
	bh=1JG+/zkIS+GEXFeDqZ4D4F9Ctl/p/94MPO/ij8zaqjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbzeozQBjYjF76tj0EJPFmqp89tRifCg3Fa7OBny53VbxF5BkdQK/KfO9ZdWgyFCHpklgx4waJx07qsWp4gVTv89s6587985bosmbRX8fpKvuqDr6/vKVFnjdqWMUDTs9YqYafyRzpKU+7JFhlrOKqtTOLNEvwVCBCCMEvXUmX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=BHDlrNtW; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="BHDlrNtW"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1329fc4bf77so8076172c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151953; x=1779756753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zlzk3IweM6/T1gjXkni5pH832MnF1gtDJTKqsEsOXm8=;
        b=BHDlrNtWFcjsv4sNRVfNpmf2mpHdjuAbMov+K+YfBX8DJx5FKlJ2vVGbawleEYJInO
         nawHYFADCL48EgoxKTIaHrx9wAgtvmv44RswJDZED7VbfshZmj3Yal2vxSSthkaOIj4l
         bOpMGZJgCTFvHx7HrOZm+5LrIhxsPkRhSevzIfoLzmb5g3JUBJ4Q+z5XQzf9CULKoQff
         4ZH0a63aVxaIwAUJOc/79XdjD/SzSAe2OIUMldil0Gx/iSKkqs+prrEnEFKpcrqRddMv
         +t+ceypaYPMDMqYJwb2pNLd+WQEMbArKxjGKQBzViBtkvQ640Rpe3hQixj+JZpCDR3U5
         tOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151953; x=1779756753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zlzk3IweM6/T1gjXkni5pH832MnF1gtDJTKqsEsOXm8=;
        b=XauhxYBV2LrRXkk0C8BSZ7eb86G0csWYF4y6qYgd/z9xjNICUtga2AIXv3U2GmKEPb
         0TY0hy1NjOuUDil0paMEMDE0IQXADCergMKibb5RKUUDBMpOcAqpJ/4bQKE76ykP1Gb1
         lulwLGFyoJ/G513vXCw9TIKC5gD3+8WE9qalqm1ITLoovXfL6aiaehIccv7pNU/VeQmg
         gdQuFnJqD2pN7V8U2/mPeRUK2JLpJjUaTbdy+YFlRlNATysl7Y0xN1WKHuj8uJxlDlCU
         hxNjPNbDE6JY9aYS8ec1KgLNssuuYwssjH2l5e2qalx+ywMJHWeeB5WqOyuhPOt7OZLQ
         UZJw==
X-Gm-Message-State: AOJu0Yyb7LQhN+FxYtZ/ervLZC/+4bhtW+wvrsmdzXMEi3nauggN4jk4
	CNLn/REQs+2u4Y9zlgKyTwHRMs53GR6Sn6NVPnSzi5CdakprSfNk4ZzlpKWf+tB8yeA=
X-Gm-Gg: Acq92OEdbfRT1QS7KgqH0mscmFNzzWoiRmO71N92bIWlj+6rmKDLlZfGq78zYRZu92H
	ITotC2BCyMfdJEvXrf0qJfPWUkPeYMfqk5VSXOAmA5cf8NBOOd4XQZueK0ErHhJmY3ZKoXeOZq9
	2xndsOruEBtY2CjphujLs3wItqjgpY1DxljqDwDNfcvkG6jV7vveUvkL32XrhOKv6670Ryu2mNm
	KIZToVAuk6LEeSTSmt1WdLpL+ANC/lP4wdsflLto2YaYNcJu5ihJ6kLhfR7MiQqHMEPYpLWVHGl
	WuVce+i/oLMjrIv4jrbuZlNXvKuqBkHmj5yGjOAdO4aFtswE049gfNRchpnzjimyPTiNPL3o9EX
	6dxGlaLn6pPrzvk5AAGESntwhUk27Oc9KAL+wdR3ZkmGSJ6NtafU+RQP5JB72tyYjMuiQxBbqPs
	4vI05OBHdF6LgLC0nJxjRvYB6fOQ==
X-Received: by 2002:a05:7022:7a2:b0:12d:c9b6:bbdc with SMTP id a92af1059eb24-1350494e473mr8550867c88.30.1779151953289;
        Mon, 18 May 2026 17:52:33 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:32 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:28 -0700
Subject: [PATCH v3 4/8] hwmon: (pmbus/adm1266) register the gpio_chip after
 pmbus_do_probe()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-4-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1812;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=1JG+/zkIS+GEXFeDqZ4D4F9Ctl/p/94MPO/ij8zaqjI=;
 b=eDz6CtV+xk55DonqDrs1pNdpplss0Fqb6RErODkJAylZJrzDENIty2KbtoJC91N9SDjbi5UCS
 sbEujihg8YUC0+CRw+cQAghEQIkGIUQUkYd3V4fLbB9hMDwRxFEPzB2
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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

