Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532B81E0E15
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Oct 2024 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504530; cv=none; b=ndQikINr8x7trOkzymPJWmnsP9UIGIDKsdSNL1ybKSB8r4t99TVzq3igjFPJx+UlZvzZqR9oE406CEpo4ojw6THykq4uxyaw7J6ug1Ca2XNhwfh4qqLE/RrD5x4aj3k/XKFf76r59Bv1nK+kCmy8yISRnlRSJZX8YR7oSHWIKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504530; c=relaxed/simple;
	bh=Ax6a3rc+cdZ9gaVud9rH1hpf/6qtLoULOXesN7Y8GcY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qC7dAVK88r7qPQpQlT7CCkJZFWIcaDemfFni/Ot/zIy6YqfW9LeU63NjZ8vTcE+PHoFACqoJn1N6z/Hg1K/Yt647HzHaHT9aYnY1gCHxGLKEXkyrttMZujlZk7Asmeo85pyn2oh4xhpvDH2bGB+gVpN6TCh35D9gPXcyVF8aYlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2PjTRyv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2PjTRyv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99650da839so28820866b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Oct 2024 13:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728504528; x=1729109328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bJ/NncwGHcv4vqspu9BzOb+yVhlD+2bUq8HOeBS9krs=;
        b=l2PjTRyv7/y8G04/bDzt3JO9B80pX3cqp9fydtiSEvpybBjORSJPn1jhuGJsfDrztU
         mQClr++3Wt4pnGxlQM/n9+op6oQClFZm9zaoXuH4N6b6HJvOelTYse0Rspv24ntHl3S4
         G9G7u/5VOkOtcJbDT8M7HolXGZmVb7RPzkc6+e58SISMWxq05IUkQUzW7PAfkgSuWODu
         S/bH/jqTv4MZ7NiDIpJqRkmWtkeBVzaDB96Lji6JWD+DhyAkQK3BEVq3jm50gnoF/YAq
         z2wQpRYL9qljFjGkY07v5CHRhpUuyC5hxYKLVG90wSmAkyEC/Wt37TzsWWWtwdRjJyzc
         dZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504528; x=1729109328;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJ/NncwGHcv4vqspu9BzOb+yVhlD+2bUq8HOeBS9krs=;
        b=FnjvyAUl64kJCxnzAPQ4NAJ8DZV3BtRJEf7zUSvz/ED+ToYSTMg0vVhRqXXnrctkja
         GoQ45Y7Gq5jTvXpAi5JlHJm8bChE9XybJl2bFC6HKOB5dKEjU3JVCVsiGxdn1koODLQm
         9am9IVUnoRVncDVr87J0HnK+0kl6CFRa8wjafN68d5DCEsrpS80ciw8iVdxMRsGQ07zy
         xr+WQOOFExKgvCPGiL6NjS7bCMyoeYn8IT/D7kCwqR9qW3BH2u40blFHP7mhWVonJlc+
         pqmr4KamHjgDqAGwSMSAED8+Okzvr4AHk662gIAIIUebccutaDmna90sOzSQw6Qk1Gdv
         5e5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0WATwygXRp/e0i2JwdgnIx7ILaQ7eeAO6WJaKl2XYQD90Klah3eJSQk2BUiSFNPnhIWWRDASlqJhLvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkbgT5W/eq9nGz7LTyekHiauazHNFzAAACYWKXDqC9j1+nCVcn
	/2MzT7PI4S0rrMAmX76nVUVlJlGQZdK1x53nP/FZFm4oT4pRRmT+
X-Google-Smtp-Source: AGHT+IGAhkETXfPlVJwHN39W7ovSYoF4P67HwiMonJqrpsjOwTQDgXOrhwh62zuoivqdkvSUA+oM3Q==
X-Received: by 2002:a17:906:7309:b0:a99:7d2c:b3c with SMTP id a640c23a62f3a-a998d341669mr331582366b.59.1728504527559;
        Wed, 09 Oct 2024 13:08:47 -0700 (PDT)
Received: from ?IPV6:2a02:3100:b338:6300:ac71:eea5:34f6:504b? (dynamic-2a02-3100-b338-6300-ac71-eea5-34f6-504b.310.pool.telefonica.de. [2a02:3100:b338:6300:ac71:eea5:34f6:504b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a992e664ed8sm707787466b.95.2024.10.09.13.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 13:08:47 -0700 (PDT)
Message-ID: <d40cd722-0307-4969-9ba7-c393440426d2@gmail.com>
Date: Wed, 9 Oct 2024 22:08:46 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/9] hwmon: intel-m10-bmc: Use new helper hwmon_visible_0444
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Jonas Malaco <jonas@protocubo.io>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Walle <mwalle@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Ivor Wanders <ivor@iwanders.net>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new helper hwmon_visible_0444 to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/intel-m10-bmc-hwmon.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
index 96397ae6f..2616c6bf9 100644
--- a/drivers/hwmon/intel-m10-bmc-hwmon.c
+++ b/drivers/hwmon/intel-m10-bmc-hwmon.c
@@ -565,13 +565,6 @@ static const struct m10bmc_hwmon_board_data n6000bmc_hwmon_bdata = {
 	.hinfo = n6000bmc_hinfo,
 };
 
-static umode_t
-m10bmc_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
-			u32 attr, int channel)
-{
-	return 0444;
-}
-
 static const struct m10bmc_sdata *
 find_sensor_data(struct m10bmc_hwmon *hw, enum hwmon_sensor_types type,
 		 int channel)
@@ -729,7 +722,7 @@ static int m10bmc_hwmon_read_string(struct device *dev,
 }
 
 static const struct hwmon_ops m10bmc_hwmon_ops = {
-	.is_visible = m10bmc_hwmon_is_visible,
+	.is_visible = hwmon_visible_0444,
 	.read = m10bmc_hwmon_read,
 	.read_string = m10bmc_hwmon_read_string,
 };
-- 
2.47.0


