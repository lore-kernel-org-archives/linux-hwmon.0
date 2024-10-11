Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1D1D0F49
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676998; cv=none; b=DvTkBdJjsAuyZxDvD+hPcEyF2blKeBN1dsWNmj642hcznuN1yQeHiHhUKYbeIqVbTH4+EwjlkfMfl84SsssSW/QytTS5w1MX6WF6pjKMCzXXvOeAS2lfRJv7ur+KrMBaeRU+iuc0k2UTNOH3we7jO+VrzfR84SU5xNeCNhWX2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676998; c=relaxed/simple;
	bh=EWSMT0OZU/llVl0RAk/i+5uYd+JCy/irmlzqd+QCdhA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=vFUXzVgPAuVEl8+n0p1Df81eqmhaCJQc/UnaGeKeNQO6W6/8tg3woFEvgiU04vH3mpRB6s5Rnd6D255Ib9uvTEB3YIPysbxsYVjhb4Q6PnYdKmrZZjCjFBbDRGBKsWUlxwx7u+1qxy5BapAo3iYwpMOVKvlicRQ1RGNH9BKsr1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVDlAoPj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVDlAoPj"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99e3b3a411so44012466b.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676995; x=1729281795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eDz3XI6jFYHfp4NzA95pcy5R9+V6hQKHOygvEK3KB/k=;
        b=NVDlAoPjUiY4Ofee5DupBCCADzDytff40B2MPpf7k983odtP/YXM3aS8k9TJAH6Ejl
         1bZPbubpuUvxKo5ZCQrSWCFOJc3ppC4m+CocZGW34+Jak71B9YTqHd/+iZiP0Opi0K8a
         EtjTVzIT5s3SgnRlxtxV1lWAf/MhpUS5p6yv31RTZJNqDzHNfYFWMRKHDgVeR+JlUDe8
         FzB56RiobEGNyoYavfZC21zO7gZ1paDUVaAVZxA25ZJtj184myndP+cDkiloZnJbKoRg
         Cum8yh+JttB7wz/cqqzkErBDlxX+g/6JrxWZOz/Bx5ZHc1wNeSI8jdIhq3xloCLqfqhL
         ud+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676995; x=1729281795;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDz3XI6jFYHfp4NzA95pcy5R9+V6hQKHOygvEK3KB/k=;
        b=dIdJ9cmD7w2IpsZ4OZoJLIbPvNR0hu6mpoTtOnwMWOayaPFSkxMA16cuNckXzcM4s5
         6CO40RFHoalpIjMMQp3GlnciwWtTiRh7piWU1qwa+xLyCKNW9tMVhGeZhR4jlCK4LtRI
         LCMHx0tXUOrxRXb8Xwxgexy5R0wvmBiUBpWQFSfNRXgR4KR262JG6HsPDUK/pDH6R3u+
         qAHiQcAtZvXPbjlH2/42GEgCSBIw0XBfv8U2HbKnTYIueRtJrHsf95IxYlbhiGq/XYYa
         l//HRS6Vb7WguMFIKI+HY9ArPdIax87B9VGCxzXfGZeREpMUcyEykT6csSB6YnglJR/e
         JomQ==
X-Gm-Message-State: AOJu0Yxj3hJgvqhu5ZUFvzyR6BSmZhkqghZ4Iq+0ptxTYkJY27O11zsP
	EcwZqV7TB4F73bZyX1vQ1p9w2qu5kb1cjEalLGU8mtVUzZV2/F1nhnUphA==
X-Google-Smtp-Source: AGHT+IEOIMpKk6h8g5dnIgoIe+r1R488jY8xsS02OL0Rk9krv9aiTTNsi3AkN605MxTYKgL2aDUCPA==
X-Received: by 2002:a17:907:e241:b0:a8a:6db7:665d with SMTP id a640c23a62f3a-a99b885b42fmr334756466b.17.1728676995274;
        Fri, 11 Oct 2024 13:03:15 -0700 (PDT)
Received: from ?IPV6:2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce? (dynamic-2a02-3100-afd7-9a00-94ac-542a-1cd2-c9ce.310.pool.telefonica.de. [2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a7f5c4c3sm246555766b.95.2024.10.11.13.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 13:03:14 -0700 (PDT)
Message-ID: <8ef99170-b37d-4c9a-b3bf-59f4ea76cf29@gmail.com>
Date: Fri, 11 Oct 2024 22:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/8] hwmon: intel-m10-bmc: Simplify specifying static
 visibility attribute
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>
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
 drivers/hwmon/intel-m10-bmc-hwmon.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
index 96397ae6f..e221f2c1f 100644
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
+	.visible = 0444,
 	.read = m10bmc_hwmon_read,
 	.read_string = m10bmc_hwmon_read_string,
 };
-- 
2.47.0


