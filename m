Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0937F8C1
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612210; cv=none; b=S7S3BJrg0TNXuXGY6FwJCW+6/kifcNcqA8SjTPq6LjNMtxhODJ2eH/DpUTZSvabtS4qeGKogI2vYQSsnibb6x7lMJuPMLrVoSP8iQWEEWKL2xvEtoCeRMFsrhfN1fRAr0zkTDTWnC3fTsInAQCxvz0uUHcW9siWrP5aorf2hKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612210; c=relaxed/simple;
	bh=MQn9S2juUdWwB971TPlw/6GlRx8zeFsKlkI79enfUNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/uePaYxLEWc4dGvVAp60MrTwpcQ3WS2KvPgbxizpYL88hSbMoI1SjT8OoEysO3pJTVdGA1l5VRwXb9D3famgvSgOa98Aj3QkGvrC62iIfOuvo6OW+oL3tA/U3PTk2aLSGfJKEcEyaUmjzbS01GMRFtfwUrSPwOT/VKermQYQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=g+LFXSjV; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="g+LFXSjV"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f33ae12f97so214749eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778612208; x=1779217008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jd957bMzMubkFSlEfdCxzQ13eA2jDWDObgVCBdnHBUg=;
        b=g+LFXSjV9GiVPEUk1+Ce8Y0n/z6925UZDy2V+DBQjlojfLsi/eRsVqnaVi1ZM4ol51
         ml6Wyg2GmFvvgYxy/cI/DO2njrjYxdHiU0iLKz9nzXvuL6wTBUcTA4GqdHLJywuqWV6/
         fZLI1BtfS3Bn6bxYB42cqGROCeFESCO6Ne7zM2FqSf//2/Q09N5lje4VzNj3DIXObQ0T
         KxSWbN2eDX8sOtFTyD68jsoGRAnTykalcB+OHDdTDiD1KqY1aKjDqv+fxCFg6i/L6bbs
         J/oF2N3o1BhH/dkur4qMxqqzezXNOccaxUbeM5T6+FM6fyT0Txj1al4BflloT3gHXAdI
         TSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612208; x=1779217008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jd957bMzMubkFSlEfdCxzQ13eA2jDWDObgVCBdnHBUg=;
        b=J4adZtPZLtBdGn65dE12eGj/4cdO/g+upBnG49i9fhTLOlWIsMgQuTzEg7SsVTIQpo
         8sV1Msms1riLyfhDRWUdJLgrKD6IVurKZSIxepDY4q7RJxqnOBUnNeTxnk9AM86bsLO1
         fG/S2ZGgo47e+nNuwLqLFBZ0/Kni4SLAL/jTiJYs56q2OjDhAvGU44T+PC7UKacNIgqI
         5MmB+77TVBVU1o9uEnfP9pFNRctSHdM+/sujacNhEjbEXMVWhFSMTJ6tnLf03C6p7ith
         2O8ZJ5GhGmkB8+C4UR9SGxKhWOdQiP53omAG/weQP51diO2iDJVqfaoB6vipFKlZyOCv
         OwtA==
X-Gm-Message-State: AOJu0YyjzoAaq5yCi1+u/xot3lzdjKaCgnY+z4I3wMKleIT9yVOwZLah
	U5hcARRqftEO6DO4+OxlqiMdFF8h8BkdeuENkdvnhyl/i9jU7YWPIcYGx2qwRvP9u2U=
X-Gm-Gg: Acq92OFtizWNc1uvezE+r05k6VtesBE90x3JTKg4DS7AczvG3AmbIz2MDHy2XlT7uXo
	RGSenAkqPRIHt5Sd3DsY2eUfcOVnCcIqtsQJfM5TsM3OhQqyCKj2opDyFXQo+s+VRWOmI+TkFr3
	NvoBaURj6b0ZEXjf1SvVjgfUUZAKJYzFxtGrHoz0e8OsSbq9zje6Hp5e2JW22BX4US/y8e4CnSv
	PVucwnvGGpsUpWHCw/nVZq7YXZiaaKUQozsamfDxt2/ew1p2M8DdaAtJbBZeMdq3PaQ3PaSzMLX
	Moqfj3Hd7cyoeYN20s7VlduyyA32p+6JtgUk+vQUb/OJp8f5aB5Qpt7talqUg3fG0evRS5rrD0K
	AQnoHQNjGt/YVtIyJ7CgmCfvY/0cEff6JyKbkiSPBWUEzpyq+yZin4Zx2Run5zQbZeZQrObKELB
	H3XQA3e3sJySPokQY9glhciuXm4g==
X-Received: by 2002:a05:7301:7c0c:b0:2ed:e16:6b4c with SMTP id 5a478bee46e88-30119c61891mr200944eec.34.1778612208286;
        Tue, 12 May 2026 11:56:48 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm18626408eec.11.2026.05.12.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:56:47 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 12 May 2026 11:56:28 -0700
Subject: [PATCH v3 5/5] hwmon: (pmbus/adm1266) include adapter number in
 GPIO line label
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-adm1266-v3-5-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
In-Reply-To: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778612203; l=1498;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=MQn9S2juUdWwB971TPlw/6GlRx8zeFsKlkI79enfUNY=;
 b=/1R0t9+PHi3Ij1OLz9JTiBWvcRhbXYl6X+C7ktA1Jg4Q62V/7JVhue0MRibcqorkk5FYBTQDM
 q3ABcrZHUcpCAmvKM9Vy/jlMbdgpnA4oVPX18pX1qdjx1VtJrAiqett
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Platforms that fit more than one ADM1266 on different I2C buses at
the same 7-bit slave address (a common shelf-management pattern,
e.g. one device per power domain) end up with duplicate GPIO line
labels because the existing format only includes the slave address.
Including the adapter number disambiguates them.

The adapter number is formatted as decimal to match the i2c-N
convention used elsewhere in Linux (sysfs paths, dev nodes); the
slave address keeps its conventional hexadecimal form.

The label is purely informational (visible via gpioinfo and the
gpiochip /sys/class/gpio name); no DT or ABI consumer parses it.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 05b31bb08f38..12cdf6de341a 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -292,8 +292,9 @@ static int adm1266_config_gpio(struct adm1266_data *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(data->gpio_names); i++) {
-		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%x-%s",
-					   data->client->addr, adm1266_names[i]);
+		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%d-%x-%s",
+					   data->client->adapter->nr, data->client->addr,
+					   adm1266_names[i]);
 		if (!gpio_name)
 			return -ENOMEM;
 

-- 
2.53.0

