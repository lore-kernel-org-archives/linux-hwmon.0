Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C63AC0C4
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485906; cv=none; b=jTf+FSLKTii7A16Qt6FQhH8j07tJZKgU7Vu80Qa2tUNEtUVySnDV7fXzRJ/zv/fF2ktQ/FcA+egifwMjVPXuZ72x9ZbLF8XPqNESQteLqIOvaI0UCBjFMcr2U1Cz2kLPNNaJy/1uEglAWGhhns7mt/xEwP3TWH/b0j72kNKzLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485906; c=relaxed/simple;
	bh=XbXHyUmmSPnlINR9vCvpAV0eATuZ1frtfzVXW5r+IYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpzLAjXmR2wElUk/N1gOCe8nujHS5Om7G+OxSk6uA7uVzeyjAVYCxp9eA1DbzfChOcpScr6FkNHUhIXplFMZ6JAokK6PKjMBXVJ1yBVaOewn1GyBq3X12gSZSQClBfEMrP11WkY4bAZLrsg+RxIOau6tFBfrYd+fgBfAXc0eMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=K7Oj2E8s; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="K7Oj2E8s"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4105326eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 00:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485889; x=1779090689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4q1SHKtQsxrNG23clQPndB4aglh1g+mHmxJ8IDbl1eM=;
        b=K7Oj2E8sJ6NTYQ0PG6B29rRaplwdyP3TcaretaY2PgPz4C2ZzORvmfM4+bAw6/py7i
         7bkj30BdDBFAA91cCf+CqrwOfqzX7HFezcDIx8+q406VUNtB1OTkMypB6ntdSG1h30Qu
         So3aSoesYM4s554/ufFZUy1907o1jP/SJLqqOF6yLtIK9IaxaNyudo4e08lGH7+FN8YS
         6kESlDDaAxCq5KveFM6mxkUdjadgIrN6XvV+0A4jxpVN4H9KJdxPEzOaWNYCPoaVabMd
         EOf84eXQYZsH4UmGT6NJZsixXp6mcqaR4h4FCMKEhLJemqjFT++/U1jajYjSEhH/ijpx
         mU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485889; x=1779090689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4q1SHKtQsxrNG23clQPndB4aglh1g+mHmxJ8IDbl1eM=;
        b=sQcklAfWIIhYGAvhSvYHunAO06M+V5IAzweDPCflsSos/oMVRc6LcbAZNPIICnNXrT
         rIbOc3oc0pO8N+2oRYBwIE/W0tcQLXNEJAANlhAzHgKu/mTKlpG7sS9ZIuC80jwSL7kt
         RiK2a0i4KRI3EDrZHgiEV8PpRyrbYHin+sN3UHnT0TkKkNAYLLtfwVqcBW8/xxnKsjgH
         XKk1P8Tvft6M60xYVRhUtQpg9ukduVOyG2d1bj8fFK37QAn5xNCP2UUoxqoEflR7Qkip
         AdfAh+jNdgeWnkn7dxlQSHk+ieYjdT/Vv0ISpjGQRjJUAcd31oBeD6D6/hNXWAjPMCOz
         57mw==
X-Gm-Message-State: AOJu0Yy3I38atF7753Btxr1zLFfHygrtxpdhO3pYAsXE2Rholi0NhxVW
	k0x5pMbAvVWvRAvsJVu1bZ86smivmj5Kyt/Yu5FKen8LG5hZA+omyj4B5XQ2VuM2OpM=
X-Gm-Gg: Acq92OETg3+rZylm/scxlKOjxFFa6GHF72sCnewpOmIRUdmj+Prnm8qsnaTfKeeSWmb
	gfQ9OxGyu7sUQRqGhgJxQb11EI9tnuctA/+RNf9qixYXouzvoVgekgP73uHKqOaDzHVYAzBtki2
	78AwxNH6g2SmHh8/3Wqrjc/BeZkIKAPofeHnB6i2W349EeET0aINuQWt58XyIvqIA89foeZfyaX
	epaOUsLoQHn0xoJ4SMR67TEY+mUHRW5VcyyQmvrDxdoC7vnZe6R1tY72IOmxW6F5VPBQ9Mu2rnz
	/kvMbRQLT0Y4tBkwxja74ortXoKMxEP4VSBtM519HXkoygZ7+0PAfDufFDNxKRobDniW59hmIe8
	/2Lrzow4O4y3ZvXqka685fQGHygNbGoWhNueTqYggN3c2qkEfGO0HPMMgnClze7udIROA9USSUl
	EoWtqbnXNNc41hpyG3LjVY/Xqt96TBGznS2Syg
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr11223026eec.32.1778485888725;
        Mon, 11 May 2026 00:51:28 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm12549498eec.12.2026.05.11.00.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:28 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:51:23 -0700
Subject: [PATCH RESEND v2 5/5] hwmon: (pmbus/adm1266) include adapter
 number in GPIO line label
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-adm1266-v2-5-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
In-Reply-To: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485884; l=1498;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=XbXHyUmmSPnlINR9vCvpAV0eATuZ1frtfzVXW5r+IYw=;
 b=srho/Xbrh37yWynX9q07r5979zsJrJjZSCUUfohsmL88CnamFqct9tWXTH2ubO8iA0n6KDUrR
 lX3d9ecsTQNDNVN3STBYL/UA30ETWw6dqosByNDcLAW7PLHn9hlqnmO
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
index 0dfb02db8683..479e768ff87c 100644
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

