Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E632188CA9
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442203; cv=none; b=DHm6Vsjj/Bnh8EOgFI1kn2mbkQ7AvddugskVybcfvwEhac0wO7hxLz72lx5NnvuidPOnAjXFLEDhJmTT2UW4LMs1b3Kv0K1pvqCnUdm1WwzFQhQ24SmSxCz36fqKRJc2SqcS0UmeH9+wQyUcncN7Jq3OEhsgM+OeApfAp06YwCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442203; c=relaxed/simple;
	bh=Fi4C/wrdv4cN/BGKHgLWSQNNun1ZoOAnt8XL1vZdaic=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=O+dd0ZnA2MnIX/6NJ2va8wyBLZ5xy/kgsyJh9qid+9tS7K1ni/yjvU4hecAM1UoRbnNQVh4WbJ6Loi2t5THhj6AiEy1PuOxs0oPZ0IEn6cvBafmWawsj1q1eq1UiBDtvpvqNbxyjpFUIPOSziBwy3e2//QaD08eAShcWyRoVy2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIBoUTjx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIBoUTjx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso1457893a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736442200; x=1737047000; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm5Rcwm9oSqYnU/XQ+Dypf0isX0bp1lDOcfitzD7/Nk=;
        b=ZIBoUTjx7Zjtcd/tiRqt2NJZ4OszGQkocwr6j4CGOVxdPxxbuqxChwh9Rl8+4ynB/9
         LhYW634/kpGK6I1uSfWIJS2d1Eg1b/gKWvAOJR3yRddycfEU7gtIqO8l7c/4zC/FlGjt
         kf9f14DYl0moGvdIYP7e/66mSBI9oDpDFGuGu++No2AhEAEK0nuS4xaLyXZurW08/wZb
         /YppGOlCVYnJfXdIZAW7YcKke+sMwvJCCAlUE73iKfjshTbqX9Z6Sk94oLh/fd1jI4Pv
         EEoMWvPJ+DuSavkionQoOd4ulKDl2g9nBKBgZVZQa8EBBwto0zhbOB9M9idIV2wmulFk
         mU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736442200; x=1737047000;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm5Rcwm9oSqYnU/XQ+Dypf0isX0bp1lDOcfitzD7/Nk=;
        b=YIeqXdgePgmtfKz8abvs5TRGYWt3RX7qJNy13DmCbfXu3jnS2Gaf9RTts9c8D4A7MG
         EpNPBDDWaiWCuZ+uDJ6ufOQqUBL8TKBqV5oGjWYxTKDdHu0y2YkBCVPY4AmoN5NG27ZD
         uXv8OG54E+zUzaUq+GsntFVK1+LzP/i311eCNGecl3CPUn9esvPfd6RIC9FwVzUyk/l1
         f75xqZifNapJIYvK34Hbat0mUbDkcb1kw/HLZ7FZhZN3aAGIjCbHPQySz/jSs3rFY3me
         VZsbnsN/LAiAi9lZ9T8j2N1qb2tAaGDn6XanEaCZNLRubzOTCgsMQVNK8lDxGvplL7l8
         WlyQ==
X-Gm-Message-State: AOJu0YxBTKWkHQVHUUw5p7t/zXhpMp1AL4DIvvse6NN8WSGbDOSVOLHu
	ohrxU0+tLei/m2vBNb6dshs9K0qBTQh8aGMR7V6g/ja7NGB3mHvb6gtq4A==
X-Gm-Gg: ASbGncsdttimNnUnp89f0hdQigIIQAW4qkge/eLUbR/waP1/TVcUMX7Qp4mlc3eazNg
	+e6thB8debTFGWvrVcdJLrZ7FksfY8p7fThIeA/zRNq4lSPvHmh9Kegt2J8ZhhmkY/Qkxbxign7
	VtAm9OBsfLV2XurkZ73A81IjqGwG+yzVNofRGI2KYoP8Q5RlYcBHFHfslnYBEhQ3W0maR++ed1I
	4KpC5ubcm8k8LqGcHW8pvPDryRwbCs/Xot5oKd/5wiPRluLWBl+L1+qzpu3jof2dtUn01k1DGGP
	FMfv70Oww1+LceCFtZNFm/Ja7NEDLtAgH6C6UaTzBH5A7uOpalU8+wrfAYBC68GKbWyAPgCvnbJ
	+HnDjV0oxhu0RtsrekeOWHzg4jeVfTOmBv6MxQdLXAnxIlpCL
X-Google-Smtp-Source: AGHT+IGI2DRsNqCKVepmX9wCz1oAF2xgF09xK9WZCSYWa4Nadf8OJe8l0CbG7bDhYx/1anCwySJ4fw==
X-Received: by 2002:a17:907:72cf:b0:aa6:a33c:70a7 with SMTP id a640c23a62f3a-ab2abc8ecb0mr658972166b.49.1736442199084;
        Thu, 09 Jan 2025 09:03:19 -0800 (PST)
Received: from ?IPV6:2a02:3100:ac5c:5700:44f4:3326:ed45:6e1e? (dynamic-2a02-3100-ac5c-5700-44f4-3326-ed45-6e1e.310.pool.telefonica.de. [2a02:3100:ac5c:5700:44f4:3326:ed45:6e1e])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c913605csm88533066b.82.2025.01.09.09.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 09:03:18 -0800 (PST)
Message-ID: <1cb1c77b-177f-4b03-9fcc-9c892391e654@gmail.com>
Date: Thu, 9 Jan 2025 18:03:17 +0100
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
Subject: [PATCH] hwmon: (core) Use device name as a fallback in
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
 drivers/hwmon/hwmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 685d4ce8d..1fd3d94e1 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -1170,6 +1170,11 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
 	if (!dev)
 		return ERR_PTR(-EINVAL);
 
+	if (!name)
+		name = devm_hwmon_sanitize_name(dev, dev_name(dev));
+	if (IS_ERR(name))
+		return ERR_CAST(name);
+
 	ptr = devres_alloc(devm_hwmon_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
-- 
2.47.1

