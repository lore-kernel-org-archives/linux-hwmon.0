Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143ED2BDC0E
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151956; cv=none; b=B+KNzvwHIlGlZ9F5oqnX3L7EEwgr7ek0ISt7vbXtfYJIBqN/EzstV9/qnw4jD1USYLWp2qk6qjn9OT3QA51xiNmTpWd9PUOHbb+gar1BOe0Sf5Wfo9Zx/jj74lulAGUWkOcKW1o/yv7U4LVhRtMHUDVZW2YlAOLCsUTfbn1c4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151956; c=relaxed/simple;
	bh=iQxdf1yuFfxkq4dVmlhtA1OD3Mg8u9x0iWEOejR0KI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRBSeeyhVgOQUFTsm1ivlxUbyFoenXUZOMXXXE/cUyNXJaM16U5jFae/qtHoB0XN3wcdFgHWhc5jWIMxJ86QFpPdMBoz5cK9TAzWwimT4xyLi6mJwba4tyFyMh+WCY1L1aLAs1YQ6LRVUdRK+h1755cO7E8zl+P/9shfPPnvq9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QoX5yKYw; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QoX5yKYw"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-130c9dcbd25so2527867c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151954; x=1779756754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2P8AA+VKiT9we9opdJjInDAt+Givsn990e3P/EhFhw=;
        b=QoX5yKYw9dzTwxSdddXoeYY5y/bVNsZ0pGp6Lo0U6U0HNxtv+Qdz5AIftI6ji4eR1r
         3M7kt4AcLBD/Q7RlXTR1Wvn4lBXM/U918fFrifzLlPjFusPZLHdo5uUDkUcbZdT2Ub2U
         0LkuIlk/x2/RTsNPNYeTNuO/GxHMnY4lZHxE6DF0Y+LrkfVi/Gd+Q/pRVLzkL2Af4/6y
         aXkxL2h048IsfN65fCv7/k9q6VZB5CC4y8dg2UDnHjoqGGF7oHom+12jPkIVHbEVtSjr
         e7GWYORoFUflbUjAG0Iboi71j/cQWC7mK63roxpqYv/NxVKatksru6I1lkLlGIOj1ZOM
         h0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151954; x=1779756754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y2P8AA+VKiT9we9opdJjInDAt+Givsn990e3P/EhFhw=;
        b=Cj/TIZ6PRwj/zQoZ65zCDykM8esme3sNt4KJTRK9Knvef+XgQOfnfukjwD/8IZ8gel
         qvcVGvRA9a3tqgGkj6hWKn+dsCidad/sHk+cvvZfso5kgPisAaUhC8WimPezH7M1dACN
         gpds4NxKomsZPYDHZqFvFjwy4BrKtgROTpBYGzuc5yKRqg6wPDD+pY01ktnXFJmh4B3o
         pq1mVMnKO/w0n0T61cMjeJz2jzQgFjPihzHYi4cLvdRUj6qKIpfXL786cLxsUbh484uE
         onclSVr4ckG1Zl9PwvKo5WrfnVT/in2l989glQlwTtPbNJhXZbYhX7G6yf8UrRQ02S+H
         AqgA==
X-Gm-Message-State: AOJu0Yze7vLIDpBwUFpKul5/dsYiLzYqz53tzdJyQQ7UC5v5AAS4Li5E
	SgMko6RKqdcdVnSdUHs6eBBfUFLG7QZLw9FQS19/Wy09++Xb8EnZNe4Na8jKzJL6TM0=
X-Gm-Gg: Acq92OEsBXlWTIO2NQWB03K9XhlOALpw7oexHde/KxE/k+JwHljKisgda3Cfg9u/uj2
	INo9a6nU0WPE5Brf1iARYeJGjn2h74mkAxJEcAP8fXzVEMMTUIhoOya7ZKhPRI5ESkHXL33uI2g
	rdGUENKpC55eK7t34vfxXqkc4lf0gP50PmXHRDAVvv+4obcfAMJTrRoE2L/ppc3zA3Wb6VLOcDZ
	nAib4S2e5lWImF+Qwr3tz2/5lrscMi09Jf570Zoebb2s6Zo36EB8/r5oVdzfr4UAFxTwWdY6Nw7
	pnjYzRDhYXaK/TCnLAsarcAXm8DAW8CXfgQ1a73OAzFFqNllhDErU2pmJrvTKvB5oTIydMkJXDe
	DxL1tIqCatfbB0OS3BpEqxKwePLmmJrC8Rj3MCpzL0oKMzSr7/tkrSS8EPE14clomwJqQcGjXWy
	HPsEfs8cw4R2MleHElgvw6j7horQ==
X-Received: by 2002:a05:7022:45a2:b0:12d:c3d8:1f95 with SMTP id a92af1059eb24-134c880b6bemr8010416c88.4.1779151954194;
        Mon, 18 May 2026 17:52:34 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:33 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:29 -0700
Subject: [PATCH v3 5/8] hwmon: (pmbus/adm1266) register the nvmem device
 after pmbus_do_probe()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-5-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1611;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=iQxdf1yuFfxkq4dVmlhtA1OD3Mg8u9x0iWEOejR0KI0=;
 b=TcrBIRWgrteBYTVwtpzSU+2Wm3eg5LmBx6FfTh0fYto/+XZGoCtTnc6S6Pu63qnTE8+oW3o5t
 lXy2qBOOeXWAvofdMd9M+EiP8hmV2QzMP4JS+jPrPk+hvk+oDWwCO9U
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_probe() calls adm1266_config_nvmem() -- which goes on to
devm_nvmem_register() and exposes adm1266_nvmem_read() to userspace --
before pmbus_do_probe() has initialised the per-client PMBus state.

Same latent hazard as the gpio_chip one fixed in the previous patch:
once the nvmem device is registered, gpiolib's nvmem char-dev / sysfs
interface is reachable, and any concurrent read triggers
adm1266_nvmem_read() -> adm1266_nvmem_read_blackbox(), which issues
PMBus traffic that races pmbus_do_probe()'s own device accesses with
no serialisation.

Move adm1266_config_nvmem() down past pmbus_do_probe() so the nvmem
device isn't reachable from userspace until the PMBus state the
nvmem accessors depend on is fully initialised.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index b91dcf067fa6..8b9fbb99a4bd 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -471,14 +471,14 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = adm1266_config_nvmem(data);
-	if (ret < 0)
-		return ret;
-
 	ret = pmbus_do_probe(client, &data->info);
 	if (ret)
 		return ret;
 
+	ret = adm1266_config_nvmem(data);
+	if (ret < 0)
+		return ret;
+
 	ret = adm1266_config_gpio(data);
 	if (ret < 0)
 		return ret;

-- 
2.53.0

