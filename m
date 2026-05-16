Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3439B4AF
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 23:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973539; cv=none; b=XYKGnzXYz44e6Iz6iqQCo5AWxvBYOgTDQhaEAH/dOwY/0S3EmLp02cNAu6tRFTOKHC7PQIy7OUFXxAXymdqFf7KmhGbXK9DzlmTP/rJ1JZNS5R2falZ4MT2D9dGHP6XOMJZ6hoELMCPuL3c64Tl7XzskrSLpK1z9iHkBKHx/oSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973539; c=relaxed/simple;
	bh=RfhWyhkILQ9JdmZHbT+RrfNjTCyKMG4R356hSwJe3G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4FYzE1p36AyvMPgQmHo/tj9edPLhNFY/Bg5GlrrG80C9esMlF3vqriVwvEgqzxBxiqmwyEwA3kQOkGhFrLKMwcFcfI0FpcaSFCU/zuCfy5ti4QelGpHP66KRDvqA8fmrDk5sty4S4tKrT2Fwwe+9ZCPGi7OTnycBqhuEleQMU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NgB2h3mR; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NgB2h3mR"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c19d23b19so1373643c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973537; x=1779578337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAd95b7/1qRCPRUMfS/TXEKMP5bhCN7d3v6gwbzEek0=;
        b=NgB2h3mRZZWHVoyEJ8oRUwKl3uRT00zJcYf/Wrm9kp518nqyeOdKrZycL6qx7AJZlN
         nBuvMZ7kIuV65ReiVxsNPBih81NgO30TM3ZoNTwVB8nl/zKzK7KOQYfFYJVrlXpYzmD5
         vtxwx06t5xysf1BySfcxAQuIku28yGDSvmSZsXsJfsOx2wVqugRLJ7V5TbdQ8o80lZk9
         ONRz9VxjhM2Gxs+T+1KP88L2eg82LyNbOU9rQo3KULZNR4JXWJaC4xjdTm4ezyTKLrXL
         e6N9I+CZAw3HpAE5YZKPh9Iiq2XGJaoFtju95CaSIdJrMr36vk3iw55vt39MnE1IMsDn
         iZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973537; x=1779578337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oAd95b7/1qRCPRUMfS/TXEKMP5bhCN7d3v6gwbzEek0=;
        b=dMTO31rb8FBT2INWX4P07+vu6mk4JloDnSWh7PKEiZja2vBM3NBidQIRQsRfWVJxEk
         drqr9i1hcbnrqYcsaU3HlxH/YEgPm1mp6q/RfqqeoS8UrBAcBev+36mwXNsYvOJJAsA9
         +LRNhtNUSf2vKGdIQy59ksbG6VFfNNfq3IpzIieMUSbGe1ZETQLGFHfoPCJ/GtzZmIdM
         kpzERJgWa9qELUgVmnV1E53NnIqGPVqbdV2pNqLz2oTxV8BsoqZTyq9PHQ7oSp+/QGhK
         qXv44wy6bw4l3uh6bkbvhhE8wlkFFl8W4m8VMcZEMxeuUuoLzPjut4hxQPRFpPCqZwdr
         AnTQ==
X-Gm-Message-State: AOJu0Yx1lopDW+8X5m82u44lF6y+iz3q2OJGF3Ltq5KXJg8RVK7MCYby
	HRdc7MFOYT2dPdcEs0FqtEIL9zDVNNJT99qlx0leTkKxf5GzaqnUn8xQOfVQ+ZP51sU=
X-Gm-Gg: Acq92OGUpwuM8tnXIIjRTZyb6bEGqdKodT3Mp94DT/V+4kMdVQhoRXNziK1E2Qx5Ns4
	cVoJDOMamjVpuBdCkb49nTlFd+8sRxYp9IdXRlBcsWGoMFGvODkfQHAqej0TgXxL9vhZKrCvDFn
	v7UJ71oKSMu7kjtqeLCSNoyR/1xP/tS3MGNUgrF2S/kY5TPmD+NwxEk2n2XyZPB2C58lh9GGud/
	b+lPZvC30zEYOWJY5WtfgVUHqDp7mkSzZ0bxJ57r8/LlO8mqwejhc7hyb6i952OWmyiTbpDLtlB
	YwW9nd2iYIa3AA86QF/flwUqtUXU1hhO+jCAnaF9pzpt48s+izkiR0qY3Stv4HJBYXgDLjJL1Y+
	5q6ZY5No3wcNMPCf25l8FYr+H1N6V7s6niyBnIXkbE7/ur2zxJCfIHy8W0oiXk5qKBu+HDN8bNR
	GILaC3M5w3WUalB1GCb/N92ySq11euLGoKDFaL
X-Received: by 2002:a05:7022:e06:b0:132:f27:5302 with SMTP id a92af1059eb24-1350440d03bmr4186170c88.3.1778973536840;
        Sat, 16 May 2026 16:18:56 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:56 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:48 -0700
Subject: [PATCH v2 2/5] hwmon: (pmbus/adm1266) don't clobber GPIO bits
 before PDIO read in get_multiple
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-2-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=1492;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=RfhWyhkILQ9JdmZHbT+RrfNjTCyKMG4R356hSwJe3G8=;
 b=SRT6QNrMcC6JVdOXSE5bR5Pt/QkIyNsl4uxKqVxOGrqHqTKpw0GLITxsugccdGLhsMTCUu6Qd
 r/PkU5ndk+lBlRQLQPOLVgS4TsIj0wGu8s0mDgsqhiBAcdzS/+4IiP4
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_gpio_get_multiple() zeroes *bits before the GPIO_STATUS loop
and then a second time before the PDIO_STATUS loop:

	*bits = 0;
	for_each_set_bit(gpio_nr, mask, ADM1266_GPIO_NR) {
		...
		set_bit(gpio_nr, bits);
	}

	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, ...);
	...
	*bits = 0;
	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
		...
		set_bit(gpio_nr, bits);
	}

The second *bits = 0 throws away every GPIO bit the first loop just
populated, so callers asking for any combination of GPIO and PDIO
pins always see the GPIO portion of the returned bits as zero.

Drop the redundant second assignment so both halves of the result
survive.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 11f9a44f4361..4dd67c02b412 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -210,7 +210,6 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 
 	status = read_buf[0] + (read_buf[1] << 8);
 
-	*bits = 0;
 	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
 		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
 			set_bit(gpio_nr, bits);

-- 
2.53.0

