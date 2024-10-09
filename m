Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A21B3F30
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Oct 2024 20:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504351; cv=none; b=l4cyd7/xYwVqc5nBQZQGTlImZ/8298yaJXrH+X54VtKY5q0SB/+xVNo8uuhpJ5XDYMLoGrGBfHqsm6goUr13Qke44uFiDr2ZJQWtT5+gT+mHTYIehOKTmluSEtp0aTOBxISlF7dqtTWBAmu0YWmApJc8k8RXaUC1ukky4hvgA3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504351; c=relaxed/simple;
	bh=5ReVWaHLB2JW1Lmuy7poN/TLNWwLwirmKypedMcyCWU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KHUnh7nk8GD/nCNPUT7XqHXkVYzSHG8AYGgCu0EoDNBMMsSCPZDVIfvCLQUCTczewF6wDaQlxIVbmkYP0gN1GQh2irhSRm/NQYIMWp5W7BffJW6T7o6oOc8SoJhhswQFCPzIhg1OXlRrUzcxHarVE+n9a1EZ/M8VHE4x6LTtzCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BALTVJc/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BALTVJc/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c918c067a1so115446a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Oct 2024 13:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728504348; x=1729109148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tab8ulX/uzp1+6fYBIMdT1It0Zn3BMBbGkpf8f3dsPo=;
        b=BALTVJc/j80+ijL0TWTVcdH4w2hRkXU9cnenwboStUEa9m9lU/er5JBeeSDWemTVoV
         oCGj7yVZYOkRNEQEap164F73cnFuKsqeML1zjIzJDwYdugXJktmkQqsbTEi4G33xmSiB
         dT+rARa3fvzc4+733y42tWJD73wx6N/nVaCny5znX+HUQ8C9PJqwkUcQotJxD78anNOy
         z6ZNT6SG+SR4PiFQhZWoIfSdmoVEJ44OGw1m1vAkLIjG9kvreMCVsCLPx01GIpprOoFe
         3H2WXYmUZ4KmbZrtTUkt1lW5JUPsLHMNcyFITTy1O0Xp3DlY5oer8tySpQhJDSwL4A5I
         PXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504348; x=1729109148;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tab8ulX/uzp1+6fYBIMdT1It0Zn3BMBbGkpf8f3dsPo=;
        b=lmOCsVi33QkvqQWfMXQ3rexEVsWaV7jbRxLQIJkGX1eeICxT7g+hJNflQE6urc97CS
         GgbSWTSaG+ysL6m26NfMpJx3Z1ZO6Jzfasxfct2za8RLsBu9fuPuLTlYF6Et/nGseJFG
         R4sAUaIg3Zo5iYLZlDzRxWY8z8gMe6a7XD4P3UAwmarS8vEmcma2Y9LnmdQapka9z+yn
         Nzdr5Q4xvkWvclMiyX1gbaG+1ey3RQyfcRkVGGoXGTVdKy+usjKyYiu008RClD55JtFU
         hOeEF7KR7cxN5+ATJFYgnOMjnB6/4Q6s+BJdW3pQrlJlF4Kqq2k57ZkV1lhIbMZCciGW
         ZjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6KcAJ6CWAkuugHnHJo0alDPC4dCYxhyME4NO5vLHR7K31jSwdxArKgppGbFAQdc/ED/UJUYuPzhb3Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysckiUTvI1reHm2TySNWk84Pc11DMgk8HOCx10oLMpqBvb1Rqb
	8s8tb4kfHRT5JKnbwzYCUrYwEm9FYPcRT5CvBlcHQ4AIbACCAnS0
X-Google-Smtp-Source: AGHT+IEwn0NyUjw3v519oNipSVIGNzNVzXZgEjNriHyVuj6xRjyAY9rdCtYOt/uqt/1eDX03+JoeEA==
X-Received: by 2002:a05:6402:3546:b0:5c9:27aa:8421 with SMTP id 4fb4d7f45d1cf-5c927aa8c10mr2235163a12.1.1728504347842;
        Wed, 09 Oct 2024 13:05:47 -0700 (PDT)
Received: from ?IPV6:2a02:3100:b338:6300:ac71:eea5:34f6:504b? (dynamic-2a02-3100-b338-6300-ac71-eea5-34f6-504b.310.pool.telefonica.de. [2a02:3100:b338:6300:ac71:eea5:34f6:504b])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e99440b8sm5294199a12.29.2024.10.09.13.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 13:05:46 -0700 (PDT)
Message-ID: <a0226799-0885-441e-91fc-fdc548529433@gmail.com>
Date: Wed, 9 Oct 2024 22:05:44 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/9] hwmon: sl28cpld: Use new helper hwmon_visible_0444
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
 drivers/hwmon/sl28cpld-hwmon.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/sl28cpld-hwmon.c b/drivers/hwmon/sl28cpld-hwmon.c
index e020f25c9..07fff262e 100644
--- a/drivers/hwmon/sl28cpld-hwmon.c
+++ b/drivers/hwmon/sl28cpld-hwmon.c
@@ -23,13 +23,6 @@ struct sl28cpld_hwmon {
 	u32 offset;
 };
 
-static umode_t sl28cpld_hwmon_is_visible(const void *data,
-					 enum hwmon_sensor_types type,
-					 u32 attr, int channel)
-{
-	return 0444;
-}
-
 static int sl28cpld_hwmon_read(struct device *dev,
 			       enum hwmon_sensor_types type, u32 attr,
 			       int channel, long *input)
@@ -73,7 +66,7 @@ static const struct hwmon_channel_info * const sl28cpld_hwmon_info[] = {
 };
 
 static const struct hwmon_ops sl28cpld_hwmon_ops = {
-	.is_visible = sl28cpld_hwmon_is_visible,
+	.is_visible = hwmon_visible_0444,
 	.read = sl28cpld_hwmon_read,
 };
 
-- 
2.47.0


