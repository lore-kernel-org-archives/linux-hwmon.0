Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7C2E5429
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151959; cv=none; b=Z//ybsP/SyY18p3pji6YwF1CQgS7201GxkPV6novjuj0IcUJPvzLBBSIYzrW03ftwetv6f5OpbmlRPgmCeu1PwOSpkVZEa1udcBz9OgdrLQ9Unm8XKj30AmHPUmVbm5QfTniO0zo2IKwLuA31bwYiv8dA6bZV7iwBz5ojJR4aR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151959; c=relaxed/simple;
	bh=kGAUxCtbDfmt+7K9n1CVIf/I9Exjw2mL1Khe/Uk924I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9sYTKntBIGny+ctrlw8mH1I36wI52t2DHoqgGTNz6Y7B/+TgsqQztS1vZI/nW0zW8kbnFBY1oYY72hGvHqs3Vo3mn1ZNTJ1lmHUqvWo0IuF3Zqfxstisd7rRFtT7XJHu+QpyLV46CcBAFBmHmXrmMd37m/nyVzLZryz9ssKocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=kWvDZK8o; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="kWvDZK8o"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1331e851faaso1492679c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151955; x=1779756755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYDly6dzMfBVk+bP7Sp71lgzYnskpjHG63z/xSSPQ2M=;
        b=kWvDZK8o10adgbx/UbTu/EBWNCyeZi/m4r/9Tomh0M1hP7u7esNQrv3MRtNUbmTXSP
         s1kv1LnfvzXxf8VbHAeFgVosX9gofJeUrYYHA4/66AThgeX7WKfaQt1AAq7Ydrq5fcQc
         +pPwJJsEZaL2VNHJthiFNuVN+zYm9tJ/QyJA4501qLOXvnGvqEKvchs9BuOrxVA51aaL
         mxqXW5K/NcQ+Pp46OzFQv8IYRN2OEbWdTKzF72odMrRZy8/9NrrHPdFPuBpNDwxbp0Cv
         ISF0Ag6Ocr5+eAJpq3ebQ0BMTLr1Lt7FgsWDwzAz+QNHL8R3Ghm83A41ry8m7nJT3pzB
         BX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151955; x=1779756755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYDly6dzMfBVk+bP7Sp71lgzYnskpjHG63z/xSSPQ2M=;
        b=Gog6k1c6PWWvSGtKPD6pc39LICwxmkMTbXsqUfCZ0aEtb2UeZPpfVFsb3I8plxjfGV
         Rsp+O5YChl8JawWU0oqoOhe26hQVPGFBdBRr4SxueowU+Cf3NmKWqGYv8hCR548JyKtH
         79+s+yXhXV4UcMJqa8o+WskmB2GDL6ENriSznr/YMPmfkX25/rXCPhiXJKu6xAg+HF2D
         snzWRDJJ6SzHgv2tseoyzZzn661/RH57HIqu5ZhY30/4baRJS9IwIZJWH+bJVUR60mNi
         0LlG4QeYYWGbOCQdvCUbDbownhYdij2aD8ZF4J89o/BeK7Wd94VQm0swGIzIML2PZygB
         vr/A==
X-Gm-Message-State: AOJu0YyZxrB4jQmGkbORLiak3C5XOCFiZZseZu/1kIwhJv1QlX7k51iF
	/PXayE+YgjNrhfWOcLbZnnJ3PgY/o/HVAR01iJU4qe6vktsa2d4oXlMiXCUX+KDTYf8=
X-Gm-Gg: Acq92OFMqef+CsA6HQfgfbWSJ6t4h097iVdRlNJB71UCx6qfLmd9kmmwiJqhioUYpnq
	rr8Uf/M8L16vJvyihWwBLxZaOUVEp0Ou3fruhNcYiqE29kel5lZRpMg8sjm08FnN6xoq5AvP9Y7
	bTM74lHNI4nu1jIOZ0vjnosTpOat0LOJjAxdfYtw9q9NnTcH9KMDNKCKUDhX1fSczz4DHmtLDjz
	Ewcd33B24TnV8XdVo+M5YhW7cjidyAJAmGZj8uhiE7m0X0JYxT1ZXO1+j2Go8a2LbdbK+0dsbUt
	atPdoDWYhixmMaxHUD4bvuSBOUHefnsNOfAy0KsfXIVBYblIvBuqKVyrlNkxwjM0QCXmeqkdBqm
	+Tf8XetOc+XlVqizIQKCYPsZI76/NKX4UgDX/Wiybu9ZrRRMTffU9PVlEEOM04Y852TGSOJ/3Mp
	KJ3DHsQWe+7Cv6Hhb/2hOIL7/1mA==
X-Received: by 2002:a05:7022:f508:b0:135:40b2:ede2 with SMTP id a92af1059eb24-13540b2ef7fmr2486006c88.3.1779151955117;
        Mon, 18 May 2026 17:52:35 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:34 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:30 -0700
Subject: [PATCH v3 6/8] hwmon: (pmbus/adm1266) serialize GPIO PMBus
 accesses with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-6-e425e4f88139@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=2124;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=kGAUxCtbDfmt+7K9n1CVIf/I9Exjw2mL1Khe/Uk924I=;
 b=9vVVO+CcgVRiqRirJmI1dL8zn8m7wPIIrw7ytI1DhMCMynB3bEERLXVdkm14ZxySs9eWEYO0i
 r5IYC90CXlxDB9B4gVoLnDeylPugQhUkW+RZ3r6FrpP0bsHQg+c1XSR
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_gpio_get(), adm1266_gpio_get_multiple(), and
adm1266_gpio_dbg_show() all issue PMBus reads against the device but
none of them take pmbus_lock.  The pmbus_core framework holds
pmbus_lock around its own multi-transaction sequences (notably the
"set PAGE, then read paged register" pattern used by hwmon
attributes), so an unlocked GPIO accessor can land between a PAGE
write and the subsequent paged read in another thread and corrupt
either side's view of the device state machine.

Take pmbus_lock at the top of each of the three accessors via the
scope-based guard().  The lock is uncontended in the common case and
adds only a single mutex round-trip per call.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/hwmon/pmbus/adm1266.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 8b9fbb99a4bd..a80fb2ea73bd 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -172,6 +172,8 @@ static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	else
 		pmbus_cmd = ADM1266_PDIO_STATUS;
 
+	guard(pmbus_lock)(data->client);
+
 	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
 	if (ret < 0)
 		return ret;
@@ -194,6 +196,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	unsigned int gpio_nr;
 	int ret;
 
+	guard(pmbus_lock)(data->client);
+
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS, read_buf);
 	if (ret < 0)
 		return ret;
@@ -235,6 +239,8 @@ static void adm1266_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int ret;
 	int i;
 
+	guard(pmbus_lock)(data->client);
+
 	for (i = 0; i < ADM1266_GPIO_NR; i++) {
 		write_cmd = adm1266_gpio_mapping[i][1];
 		ret = adm1266_pmbus_block_xfer(data, ADM1266_GPIO_CONFIG, 1, &write_cmd, read_buf);

-- 
2.53.0

