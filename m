Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DF92F43
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736452440; cv=none; b=cDQzbFh86P1hEuaJGy1GFyuMAkLjOhewTEyUiOUqvrmPs4HQTkvuoInTDVNFOuzjPi8/j8sH3hfds6o8fel2Khba6n7p7kNiPQmlH25Fiqb1cyxgn16VmvDqLDDUJbMqho5Z/b7g8ZTal7Zpq/7GWPxl+J4qNITjrb0udPqdaP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736452440; c=relaxed/simple;
	bh=PT3ZxRkCICLefg9JjAPA1I94YFWRW9JqEiI1Qzlgvys=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jdBq90qJYZdtbABfPgEdMw2uEhkL7h0gWOBCy3P7yIOn4EvPmr1aDZk+1CCFs1TT4+8bkWnE2JozJqeZIVoWG17ug2fHTdu79tAHuFwPjkQ9/2fabnQ7+vX4FIJAEZijqLvBmL/sH+n7ndD/ceL+w75zbysNd2zcQxbRSG/BJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzRFQbzK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzRFQbzK"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso2052352a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 11:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736452437; x=1737057237; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSsvSSmPbINOFevQis1kIeqEeDiONI2gKCzXrMuI2Qw=;
        b=hzRFQbzKhlnoCFJ96xRvcLEOWgNL9POOgK2quVcReztEUM6blvzJsJ29AoNcuLoNYw
         /2FD1jKCOJU7VoTkG3pl0f92WmXjwFZh8A5XVSTjj8UpWEqoe6KWWVfx36BnYTi49p5w
         l2yL+uv2XF8AFCqcEMeHSB0pshnMfWsjWwrlShUgi72SN0W1JyPl6ZRx4oxR7urPoNsx
         7y2PZEj2R1k40Tev2totrd2jehqO3qn6MtsWy7S1g6o8e14i5vDagG83wG8z9J7my/L9
         CI7ZU7s4Yiw58vzqKoijYZVz/0mTZdo1m3FgHUt/mqlfMKEMu6gbLhQ5dNIq/nl0CQeB
         ClyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736452437; x=1737057237;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSsvSSmPbINOFevQis1kIeqEeDiONI2gKCzXrMuI2Qw=;
        b=ZtFPVAGKkt1XRaQb1CeuYN5bgiG4hJTyqapavPe42z18O0MKIAPHjhhJ1fM3A5ErQs
         9eIiMLvm57XNZ4QDWL2raTGyFRGx1lucaYm8zuJKzn98GbMyZm9Q7Oh+lm6JpReukTJi
         63mfK8rks3sJTsFp8nTcTPiHLueohExHOhi2/RJBO31JMkkJorRWDzxDGdq5T9uTpIdj
         1wmHyNLVKf7s39UrwC3LlGeeR3k5D0S1aclkahRryh7ZEkz+bzwfVHMswnMfXfz8ALIl
         /gMmpBAKg+6PmZujmWJ9kltxfgdzlzUyLv2oxbkYWXpJcHcOzCBfOJzbmdR+PuNpDYji
         g6VQ==
X-Gm-Message-State: AOJu0YxDhDW9n/jCCTYdlwAbZD8uft4kQPMd2Ke0V5kxatfaB1CHZPKR
	386FnBQNBD8AE2EF+3bMUqpx5v6Q5rm6XtmePDKgL1DzzR+e8reG
X-Gm-Gg: ASbGncttFDA0z5TyCJmkweziOXPlx3JLgRgvmyUPJuOcmJasge16NBJ03dC/G0MPv5Z
	8VT9TU7xYnurYMU2ROblnsd7JuoLhfH1usficJb0Z1DtYXVFdqh5EH2fJZArl+A8XJJ1ToPp2SC
	tW+SzS88D9tacE6me8pJHFj0GZV6ZPf5QKWNpqCp38AeYTMFUs2q6zrql+gZIXfQpmmVcLjsFB3
	WOCBUxTf50Pc7gby8Wox7gJqLBnkaeOn8oHMFabPwjgcB06M+3IELpicayzZ+cDEHK/M6CXm6XT
	+kshFNzBspMQrtW/CTSHuQL6d5B0GuQLYvdeXQRTYwdCIRzWCLkbiO0UGzRV3h9mpeyLRacBTME
	M0WnMxE7DRPIWtY1zHx7ZdrdmIkm90De/6B+l39tPKWPK7W0i
X-Google-Smtp-Source: AGHT+IHbWfZYorA7Ym7YiqhLIN5ycMXVnRxbJwOERL7VgFf+HHlnQfJ8QIq+ssGzn5JOG8R5WjB6kw==
X-Received: by 2002:a17:907:1c22:b0:aa5:391e:cadf with SMTP id a640c23a62f3a-ab2abdc0cc2mr771218866b.42.1736452436617;
        Thu, 09 Jan 2025 11:53:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:ac5c:5700:44f4:3326:ed45:6e1e? (dynamic-2a02-3100-ac5c-5700-44f4-3326-ed45-6e1e.310.pool.telefonica.de. [2a02:3100:ac5c:5700:44f4:3326:ed45:6e1e])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c9562551sm99058666b.123.2025.01.09.11.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 11:53:55 -0800 (PST)
Message-ID: <1ebe6961-6445-4408-bfb4-b56173af9db5@gmail.com>
Date: Thu, 9 Jan 2025 20:53:55 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] hwmon: (core) Use device name as a fallback in
 devm_hwmon_device_register_with_info
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A number of network PHY drivers use the following code:

name = devm_hwmon_sanitize_name(dev, dev_name(dev));
if (IS_ERR(name))
	return PTR_ERR(name);
devm_hwmon_device_register_with_info(dev, name, ..);

Make this a generic fallback option and use the device name if no name
is provided to devm_hwmon_device_register_with_info(). This would allow
to simplify the affected drivers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- move IS_ERR() check into if clause
---
 drivers/hwmon/hwmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 685d4ce8d..9703d60e9 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -1170,6 +1170,12 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
 	if (!dev)
 		return ERR_PTR(-EINVAL);
 
+	if (!name) {
+		name = devm_hwmon_sanitize_name(dev, dev_name(dev));
+		if (IS_ERR(name))
+			return ERR_CAST(name);
+	}
+
 	ptr = devres_alloc(devm_hwmon_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
-- 
2.47.1

