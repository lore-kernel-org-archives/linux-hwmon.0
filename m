Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7AA1D1500
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 20:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676854; cv=none; b=apmQJZkOxXjv1EQna8o/I+viqCtmpc6t5SochYCzSM/I8x/RwUSN+bqnLpp6Iyvb7KrODVPS9EVOjITxLf3BYhB86eXvJ5qDT11mjC+UnlWCO+nCxcaEqDF75rcKTQte4lFaHAM2SPapOSZJsCRPoG2T1qChEQFLIlIQh9IDPmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676854; c=relaxed/simple;
	bh=jb2K8UDcfBeSW8lORES97VPvEbFaTn883GjHqHOkRxk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JcGC6hzdsI3+dUVnfqIP6gAg8eEkbFKQCYdUcFjM58Dd8Kmfw6M2R9E3PB6ZScMByltp9FBIF9QS7jM6CIbXpYKdze37PyliJzjwz9t8WpLW+JyGh1lUKhMpdWLn2jdRjcB2LTLtBCURJ6oi18YomcZVHXDsqTVSohgMzo7PrRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeGNvw+E; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeGNvw+E"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c89f3e8a74so3154194a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 13:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676851; x=1729281651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D437GkmU+RusUDYzI0z+cKOugcVoV9c5q9FSP2Pkw0c=;
        b=FeGNvw+EK4xOQ5twZSt2Q8zy76OcaEQDDaLT+r7PmpDsVS9HsrH/yZT7MaaSJJse1e
         Q+Q8xgLFZZcpnDOtrSWzQNMRHM5oqznXBWdorMib8UELAbB1kzlKXfGjKtgEqRzNrmLU
         BU1iAu2pL0L3Tg14J7pz0SxW80HfpgYqYLaHu8at+T8LYikrAx4MNuCTbo3TM4p96rb6
         Y869v023CCdfEE4Cjyx9LqKlMNhYBHU6MZQ1yN+JZeShKf9XTUfspKx6Zbza3A2T9mXE
         2fUQaqzFRZJRQ41vitFnuhO8P1XNbdCQmNKheYACnf4FhPZ/KQM/BE5QJ8YWO5OVp/fn
         zeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676851; x=1729281651;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D437GkmU+RusUDYzI0z+cKOugcVoV9c5q9FSP2Pkw0c=;
        b=dnncAmtO4tLmaWQWUl9PrxRdCdJkNXCTrc9prGeI3fcVmkWqYOdBUrmYLBiA1YcYP2
         aRL60J+FRwIpjdKcUIaiVXckhSwCXN8Y58LtOod2N0kuzDu1nEuQT55XREYRk1vIyC8a
         2f+u8AppHbfTggPH49iOLSjLxukWCWLsrMkhTyJ1hPCKjRarmhfUTXxrN8ji065IaXpL
         PaLNPLAKbu10xCirqkqQKPBN5y8YOzMHbTk7kK+GzwE7GAi1TZeLNyItRoPV0k/U8ZSp
         PJ0A66pZLujW644WCpDLtiNG8EzGwfiYxvUDfZcD99iC+rAaBYO/FarCi6qWfupvN4OC
         Zl4Q==
X-Gm-Message-State: AOJu0Yx9fyIqWnYO//2yt9yY0wRX5TAIvOprL8Q0Jyjt1HTqOkj47L8S
	ostbyiPyUP9EShCC/UCaF/1dCbLRjyHhfEpiCWhcs6xJaBdvxdhHCbdVFg==
X-Google-Smtp-Source: AGHT+IF4rgShnrboygrR3ep8QC1Pu5tuYYKEniRnAzdN10hGetPF2UFsf6eB93XXqNJaLkJ18THZ+w==
X-Received: by 2002:a05:6402:27d2:b0:5c9:47d9:ad21 with SMTP id 4fb4d7f45d1cf-5c95ac40c72mr220537a12.27.1728676850587;
        Fri, 11 Oct 2024 13:00:50 -0700 (PDT)
Received: from ?IPV6:2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce? (dynamic-2a02-3100-afd7-9a00-94ac-542a-1cd2-c9ce.310.pool.telefonica.de. [2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711add4sm2198223a12.22.2024.10.11.13.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 13:00:50 -0700 (PDT)
Message-ID: <c4b4568b-59f6-43ac-8281-536a82ecd6ab@gmail.com>
Date: Fri, 11 Oct 2024 22:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/8] hwmon: powerz: Simplify specifying static visibility
 attribute
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new member visible of struct hwmon_ops to simplify specifying
the static attribute visibility.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/powerz.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/powerz.c b/drivers/hwmon/powerz.c
index cfb635f94..4e663d5b4 100644
--- a/drivers/hwmon/powerz.c
+++ b/drivers/hwmon/powerz.c
@@ -54,12 +54,6 @@ static const struct hwmon_channel_info *const powerz_info[] = {
 	NULL
 };
 
-static umode_t powerz_is_visible(const void *data, enum hwmon_sensor_types type,
-				 u32 attr, int channel)
-{
-	return 0444;
-}
-
 static int powerz_read_string(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, const char **str)
 {
@@ -201,7 +195,7 @@ static int powerz_read(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static const struct hwmon_ops powerz_hwmon_ops = {
-	.is_visible = powerz_is_visible,
+	.visible = 0444,
 	.read = powerz_read,
 	.read_string = powerz_read_string,
 };
-- 
2.47.0


