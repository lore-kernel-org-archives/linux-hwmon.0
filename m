Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEAD39D6D5
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973541; cv=none; b=Qr/lqQmaIiFivLYfqJPotyny3NEUZNiRwNwcd0QtdhoxDUcaz4sRx9s/gTqXS3gQ3H6yD22SEMk9Cyu0AC2VBZVrOMUO6p8e6qlULx5yNcCtP52SS79asPa40gsyH3AKFuStK7zdkFT3/RUzhx/0SL8tqnKofROSh2Id9z/DzKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973541; c=relaxed/simple;
	bh=YW/rtn93ECVx6D7M6zDzFzA7o/ZhLBNsrM1gBF6+BOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUiO0wvhZwKKEH4u3sHmN4DjHUzRZfNqM+kmBQyeWjS5U/28SpKJrL/umGtTxtoXJAIL2nRhAY97TqXuPTjUuN7J0Ws3j6wY8TCTCbgl67rXe20WeWjYkx3BS/PxDiMvRa/HuVk3k/MDq2vJfJEFF2KPwbWRCjldA2TGfGw6AT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=gYWz9Lln; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="gYWz9Lln"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-130c9dcbd25so1362263c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973539; x=1779578339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOf0WuzHhr8GvHCx/Z0rI+KnB+Uz0CaABNA+3XjE3+k=;
        b=gYWz9LlnNCPPb9j3hzqdI0LtvJHgn4CtftQPz64NQVDC81+lu6FW/CMdKkgfKCN6lt
         Mwcs7mEqPlfkWooNM55QnYdgzhPeaPaup937Ap8nkisqgiI6X6/X30qUsLjKiTHAnuhC
         TXIn/krXg0vhf+wqtXewyiFc2AtHkhyIbU0NcwPULRe+wZ+jEAHeRxeywano7nQCwb6M
         qk1pI5eV1FJJXr8dDIKxh3sXKqqx4lDNMvSVWpmndSGUD/UuEvXG27kgrnLpy/n7otQA
         gzFhSQ2ttEPa3iEMutecomO7qroeKJ6VHoVX24Bwz4r7vSSkpkd9J1LV6q+C5ks1rVrU
         Pwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973539; x=1779578339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hOf0WuzHhr8GvHCx/Z0rI+KnB+Uz0CaABNA+3XjE3+k=;
        b=BoFxTLOgONur+QM8zQzSOQvnpdpB5sfxo/IMNFBK2tHzlQ79vlF3EnidIRou+fkgJa
         KhMUDc8hr7U9LAy0mkw+V6Rl0YRnDkyY26yyKU9AG77IqIAot30eTvM8YkQvBStwdU2g
         t7pThwdLCy6xfZqPpYbksV1ApB4kckEDP9jNEil9pCtGuHGUXv7LDx0GrOH5DbDWSPXG
         YSgq/HDnnyZ/fZkVjqCqSrtUG/yTzkIR5V4egVotLTWCsanoqMxTdu6VZswkD9zApwTz
         ggrIRVwnyMUT8YiTkA866ut+aoM+dM4mJelshtN21nLmWbu/Y1TL/IgKk9vxONXhz7TQ
         PFUg==
X-Gm-Message-State: AOJu0YzQrvGmanffnXzpRBVR0t8HeAswW3pXlxceinHTt/JiqrwKE8+B
	Df/SXG62MY3aiehnwvUTFZPrIaAxxrB/fviq0Ttt1CqSueiup4RUZrjkCn8f6ZYj4oYLp72eLHo
	PnGOYaTs=
X-Gm-Gg: Acq92OELnPmA6BC0dWsX7KlvcsQV9cOQRbaTSA5cTgnHsygP6+YPgdgpew62zdm6ndE
	uLeXL2GASxdsDKaV4y3I0LG3q2L4nnBn5cDmZHpalbL0GIlWEwPBZ5weHWFVECJjGV4VkItir6F
	tqoGF9C0DyhJVFLmtARlEx+ApY1RRrhqfK/OhKcI3eCZO1MYP6xSFULOQ0SwcW2HEd+aIuVO3lo
	NnUYQVwuvDunVu7EFxQliXPHj3h3mxswGmevvPWJA/OmjXt+hQZHFOZwU2YywritxJWarot64Vp
	GgpvGRTtLE+uF7Po2SC+mjjEr+7+u0dlbS6Gn8o3dxzglVWC2oC533VOGr7T44lQ1FPar6HDU3t
	EmY3QmLZt66M6VPr3cWUkvfM0qdkJRT//PdxgrRQMsyY/WI6ltKmZnUmENYzflzrurelsDwMleQ
	W6a0xgc4pgymQwDhWU37XWPx6Ev58Mtw+PflNv
X-Received: by 2002:a05:7022:301:b0:12a:6d05:3938 with SMTP id a92af1059eb24-134ffc6a83fmr4319683c88.7.1778973539141;
        Sat, 16 May 2026 16:18:59 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:58 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:51 -0700
Subject: [PATCH v2 5/5] hwmon: (pmbus/adm1266) serialize GPIO PMBus
 accesses with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-5-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=2051;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YW/rtn93ECVx6D7M6zDzFzA7o/ZhLBNsrM1gBF6+BOQ=;
 b=rLK3xSF67bYw9vOeeVD20baFsgJe0KchisiXDbpwdnxaQaYe62yO+8pWC8Y9C0GL1xbsofPfP
 QokCUjbGOa1ANdxf9Jmh9I0Uw2CSuGE2CeVjGT1O0Tx0ojG+lQxhi2p
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
---
 drivers/hwmon/pmbus/adm1266.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index b91dcf067fa6..2e9ae03ab64b 100644
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

