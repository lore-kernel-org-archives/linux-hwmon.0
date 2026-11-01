Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572336;
	b=zA8v+g4wnKjYxV52yuXu5nHOaqL33jNTM2N8RepHW2FhFsbIUuZVhQQB0wr0rVYEaJxI
	 oOigAmKBwRcBV+tJhy6NdBB5EYwoz82f3KjwxrnX/ZJbBEyYPyECABf02zCUQRwH3Jjk0
	 8GHiGYSb0wK52DPf9QGYCGcChx75QtavE5k/T0HL8Atg6qd7vg+5Cq85JUnQhuiNBDaFv
	 QwIPkrDCv4tOV7nGphsoRjqtE2BGl0XRRz2Vaiiioid3fJQGOqP1xoMuWNJTgAjq4Aji+
	 eJAuLWSjuPhtcjlvn833Vuak9JvzfZj57vKqXIJQUs7mhUnbR1g5cUEokgaCac6ox4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
	b=yCPtakE38VMx1m1Apm00uRnYjzo6TSOBjERuULR5gl3BIG38OrvsachL//ptAQrkj1Fu
	 KdgbmeJ1xzOMk8yQ43JvuYBdEsSEOTqqRO3RgTHD49j8wueS2zEcWosV2Ou3FmVNSSOsk
	 AJAwgqOVyCXkY/dO4QPkA3Pa6yuBT8qa1oLD48SKGqquzz97yhfGhq/xDEUXvp4MeokVo
	 JSNL5PvbD5gztLbIpi/LxzLTQFmvsAVvgbWr42AU1YEcQ5Ipw9YP9dSPcnY6k6E0pwGH7
	 Lm/RqOV4ObMZ9WWfpNtfd4oaR0eRbknKRrcTX7em0v3g1Cd1xJzGpetrTAmnJdiLVQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW9P8zX1;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3F60A2608
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 22:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F3F60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW9P8zX1
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1159542f8f.3
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 14:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572334; x=1794177134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=zW9P8zX1pyVYSD4pHtoyQqAB1LmdPRCjqQLIg52jVIf3fgn60J/7tOUBGr+ag5Yd6s
         baq/9Lpmo9PfiMBz2ViKFVi9ndYN8lrf3wdExJCIMts1DVt8vhx62cqltMT8ALu3nYiT
         /HhtyYrEzxRHYwPGJG6toDse3CSuJFcZz1EBcTyf1OjOmjVgeuHmY1F55UzdEdsTT2U/
         pmilsUD7H6e1qFBmOfJvLbC6Hyp6+hORitDMmr4lYCTOZn9dgepgIdySCjQPwnXQmKVD
         qTjzmRDBwCtq778/S7sbo0PHJnGmgdg6biPJ9I7nN4hHSkFPlr4z4X31UImnJ/P8mY9E
         Rt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572334; x=1794177134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=egxrbVxF64a8eBEPXsaw19dr1zjeovWEhKYnHoiFxN1ecxUJ+Ehfy9nOjeJrNTfXLZ
         ArJZPuuO62+kQx8z5EjuqoiafI6ZplPQJ4q5xkWheYc0Lu08ilX08w2iocHIAmwpn3mJ
         lmFvPJSngcA0grWfuPL3xYzfnqrOU0JgSZagJp0dXHgEtW5lV3A7A3DLLbCcQYaG0KuR
         An4Sd9Vc4rv4kTS1ES20NAzn5NjWz8JzTUzuT6IHZ3w25lNcpfNPlaeSAsN6goOTykRf
         7cyOThTa6r4v6CbiWtKAVHEt4N8N6Cl/Rcn1Kw4cTbzogp9CPH8vLUZ6dMxV7U7hTC0J
         P3AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAYrenHU7/FvBUKxYJJOLZmtV821biSDWE7CYQ8FG8qO1aY4WKtHN8xSCdAPr7FVVuERazWlDoGgwl5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xMrwEdFMx91CQUm6ocToS7QUamPxO23WzsIbgMWyGfMNZe0ke
	Qg6nPSnpwvJH7/OZHMQ5QjvRiFx0BX+LR5w5M6LGZP/0jnP/peOZ5w49
X-Gm-Gg: AYBFou0oVLsBrHv402204Wexo/sIhTaKccvBrHCK5UBStich2+VV6HhqzYHC3WB9VtY
	+JW3pY46NEalKB9KEDJ8xz86Vx7MCSfmr2WWrt4KWJYgcxgXMZ/FkM5xUKadojkr188AfHRnQ70
	cXPqMUDAHauibSP24Cae5dQ0XjGWY5tDKZVI6wW7u7aoMd1zQeIZMSPhRXQw5ZH84eczlXlCOem
	dlaUWoWaV0l6tLnU8V8MrqLgGJzDGfXtjCquBHAX+9Z3AVRfgXgAiaxmpiXhv1Y46lm7GJq8Wir
	7LcjwcN+JEHRd0N6TmUJZnCXnNZoB+vLKUAV6bmAzQ9nUI9IE72t76f094+t2m6ltaxh1O0MX1M
	ubvaG5ny0WJ6XhbPWRpU5VS07mPme049V4FFis27A7A7RsrkYdBgblyEX8j3PCy9byOlQxvzpzF
	BR2N4xUQpRA7HxkdZE7HciZCkjMZ+kKa61nEBBAD9gbr4TtJZfNqUdPvlZrBA95FjUTjFFDEICL
	KcEc+3A3pn7ELaJubqObgp3c0hMgUgJF+0hMG4SgdgQ14iKv+tI8hTpQBQk33O7u5ApNyaRH3Lx
	imOsbbMgAAUgaH1wdKJsA3ap8TgwLBIG6xSt5R7lT+9pb8PZFTzzsjR6MWMfgfc=
X-Received: by 2002:a05:6000:2dca:b0:48d:e101:5707 with SMTP id ffacd0b85a97d-48e6e2eb1famr21799873f8f.13.1793572334284;
        Sun, 01 Nov 2026 14:32:14 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:12 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] hwmon: sy7636a: fix negative temperatures
Date: Sun,  1 Nov 2026 22:31:22 +0000
Message-ID: <20261101223125.302001-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thermistor readout is a signed 8-bit value in degrees Celsius.

Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index d51daaf63d63..f01f368d68e5 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -29,7 +29,7 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret)
 		return ret;
 
-	*temp = reg_val * 1000;
+	*temp = (s8)reg_val * 1000;
 
 	return 0;
 }
-- 
2.52.0

