Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691837C937
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682327; cv=none; b=RCxr0j0aXD87dsrgYFAMtu9Q8Dyd0ESviXGWv/Y4kLZ11FePMPAR+nM8IQ0hV7XF3eM1f5JQtSLVkzazBZxQFhI1uJXp93z8WPGF7boy4SSVzNHBbeOVu/iTzgd3VfV9oLewQWhjXE1MdIZtoo0d1JGzzQMGxzgLrPNYEo53jnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682327; c=relaxed/simple;
	bh=b5LZhDLioRaeFDBV2rVB9TwTfEaaRYU1BMHhY2LnbXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpdDO8ZERGJBZFLzmf3ybmVGiIz9fLFh7n336AGj3j/ZwuE8AaorclTRhAboShHfRZfA0BVY5Cl+4sDxF9+bU4mQZwXMnaoLuHP6Izrs9C/nzwoIc7s/a1RvCAkB5M0FhH121Z7SMA+jrvnPlNx/IY9H9K9N+DV5Bk9vFa/FFnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJJyviSr; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJJyviSr"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-132830d8281so2170106c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778682325; x=1779287125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kxg5J+DJA66hKBzr8ve+judsAPYDha9W5T4ChypKJoc=;
        b=aJJyviSrapbtLhEu0xfGZ0j5JZlmQyLx36pLtmya5OEEZAG52ejIBPdmgPmG5iw6H3
         0MOUugb9B2MidYfhGhntkhHo2CQ0ehwjsX9vS0UjdJhzBUhe4ULutvrj2YwtS1fmQld+
         6hZfJGw9XQCAi4tf5lJUuk5tCUUk+ukkbqH6rH4dlkKXIaWm8y9pIkB2v+11ePNuxFFE
         2tUmryvgoT7UF3t2DcnaOqANpmnB2u0WN9TnhOnCLzUcuX5KG2OF8QZ5w3AXdSk+EfCK
         jGI4bFC/TGEaV0ZxX9dSxiYSZCwiC10VjOajf9vYEbYE+XiFeyq+KjFAcpEZn7EvseUK
         yW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682325; x=1779287125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxg5J+DJA66hKBzr8ve+judsAPYDha9W5T4ChypKJoc=;
        b=FIFt1EyZja3XOeH39SX0H6FgOID8o2xNi594rbvNKPNYb+YRcDGXHWhC5CRy08NmXn
         jV8HuOYPjpzwtpAl9ZYvI8Ylkr9WaK+L3OqttA1fwj9OZD702dF/m+o6oz7JvJiDRktk
         7hMM7RnI8jVCP7HLYC3ybvEyySAV6JqvUnWILeLccc467tPztdE3nFHGQ2SfaY8+8dXe
         RMnhcaxGRYtZ6FneTJLpVXzOJobFojFU2T9epYPkFYzqLPYyV8DUqHsxu8LxSUEWEGBo
         xx+oxHu2j7bvUBcl8bXw9zw42AroMnfN5JBkwA6QQenWFGtuY9i3huD3o6peBs1IbvY0
         0K7w==
X-Gm-Message-State: AOJu0YxJo1NE3ZnhFYzyprC61OOxGThcqqdV8Ucgql3MVWko0/SAe3HQ
	LH+GxVSN8XdUylYzzkQe8tlnIGr3dYeOANUAWfMgVqQqD+7jYMj/HP8CfItZIw==
X-Gm-Gg: Acq92OE3n0kuzY2Fzu2SQIrL0lxovYfW3QBXoXOJP7xHKRLdMeoxJq6gm5lUWBl/6uP
	omiXFDiNmFkcwqrjCrtbGSv9e35YCgrm+jq1PKPzIyuuECPwAy2ZE/DDI7eKXRgiDeNSYJFC460
	ICV1T1RXTe3ZPSTNv3Wge0m30HlIY4k8EsaJjgJSD4XmpfKwHsD5feINMXzTfv4TlPGJ58t5ERa
	ZsMCMQTQcs7X/J4khQhVHM/AI0baYAfuYNMrno6vzS085LnYZCHMHF7nsv4hrzQfyrZaBz101Ac
	8wiPZOAekPz0tfjfjwyJp1uvJQwbN8XlsxnfokhUN9RjiktK02XyI0VT4V0D2IwwcpCkqEVxtQa
	QeWL0AU2ZdW4isd9MFXFsFtv/Gj+BjK6bARzhBCk6qpIjQhzZTt+Uzh/RkN4BY06C6LMCoq6EBl
	2THWnEjilHfYU15ZlbdXGCEjE9n55gfx3HzEz2
X-Received: by 2002:a05:7022:f40d:b0:12a:713b:8958 with SMTP id a92af1059eb24-1342ee48056mr2227567c88.10.1778682324533;
        Wed, 13 May 2026 07:25:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm28594810c88.4.2026.05.13.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:25:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (ina2xx) Use scoped_guard() to acquire the subsystem lock
Date: Wed, 13 May 2026 07:25:13 -0700
Message-ID: <20260513142514.419345-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260513142514.419345-1-linux@roeck-us.net>
References: <20260513142514.419345-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scoped_guard() instead of hwmon_lock() / hwmon_unlock() to acquire
and release the hardware monitoring subsystem lock.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 613ffb622b7c..3765c8542a75 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -875,11 +875,11 @@ static ssize_t shunt_resistor_store(struct device *dev,
 	if (status < 0)
 		return status;
 
-	hwmon_lock(dev);
-	status = ina2xx_set_shunt(data, val);
-	hwmon_unlock(dev);
-	if (status < 0)
-		return status;
+	scoped_guard(hwmon_lock, dev) {
+		status = ina2xx_set_shunt(data, val);
+		if (status < 0)
+			return status;
+	}
 	return count;
 }
 
-- 
2.45.2

