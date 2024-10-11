Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4144E1CFEB8
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 19:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676692; cv=none; b=GysmCSJtJXp5g5QSmvKgXsep2uwtO3vnjfIq+IsGpnaObpRQaLkQhrRfskcY/5DxLlX3u5rbuVN9GYfP0FklKMgDlqYDV0k+bq8dRjr5/P0KdeQJeb0BCJXOZZTWDiDqyUgF5O8F5gud73bF8gIdg7BU6R4b040a5m7+LeWZb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676692; c=relaxed/simple;
	bh=HIUx5GEl5Z2eG7FJX1fpH3u0wmKFMT/Mns/qbDm/pCQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rY3n0YhU+FeCoydozyAUSEwSIinjexNcnIxwhjJKOxq8U5uoPTYc2AvSepXvfJrFFGzlnRQYXuTqRUvxeMGBCIf5W/rFBd+rvgnhBA0zUn41V3RyPNb9s8g6atIkBQ88N7x6nwX5NinTKslAbo+S6dPNQVMtTCG80eGPIFhv0DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMnOxvUs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMnOxvUs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99388e3009so323326066b.3
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676690; x=1729281490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ex+QHl0yEf9dxvIiQMFMAsFSJuV29BlEcKRrdoFvs5k=;
        b=IMnOxvUsUTcECe+vMVL5FKxlA0KT/mdfP3SvIFZeu9Qs5oQGY5Fv/AEOL2j8RpvBtG
         gm1Cxvbln7tXMvhxA0vrPaTXenjLPEBf309CL3gZfo9WyH+MQpZHd+6eCJh9BPFWBL1a
         KVsdEupp/EB6xs7isyXZyEapHicSG5ZbeOrGa9THOXBnotOY6ZnbfP33rX+7asZ/Bnfn
         5lUzBVtLGr5LlQdHCXVy/t7KVvEovWoRYsjQj0jQMNjaSeFlQobi0UdWBjGdgYqSRt0S
         HEEztfxO9JaRFDtuSflhGfflHcVgkPQqRH7ji6PMuGwfgNEKxk/B8+sLGAWinM86Mq4F
         5yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676690; x=1729281490;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ex+QHl0yEf9dxvIiQMFMAsFSJuV29BlEcKRrdoFvs5k=;
        b=FYiYHdBYm3HEAZ+G12K0DRc938+aLtDdZVyiyTEOV8j6o890NeMKYwlmns8AHIP2el
         HQRqEfNYoxv9qCSBjq49DaR/y/t+Cu/ch4bPpVXahNUt9oxQCwwVKoEclKOH2wm4jzHJ
         EtYOP89qP4rYTCciXhF/6d0Nz1hoIPIvdRRJIKhVR0TxGZ60SO0jUPcF3QwjZmpXYx4h
         6mbuv3VBxhJD6sch8w5sF5Mmm43hC15bOhMP5yMxhU6QOWic7rJ1Thj9LTgC4CTJL/Rg
         qlqzr8/xU9eABWoHdA7LUO5G9iQTY8Vp0J27WLZCkTXi1MGPczgoVRsx2CmJbFUouAfN
         KJ2w==
X-Gm-Message-State: AOJu0Yx/UL1g4JBdvVX9lEErPcL25Vs8v5cav/RMhGaMSQNVG2yDis57
	o5AOirhzOFMUa+S6jwnDXgKXcSf4hfRk3f2kk4nwYArg1zkI2f8t
X-Google-Smtp-Source: AGHT+IGPFD7mSlPINrELpoDWuf+IY/On/Ova1JFgD8l99xZkQBYWDipDfYUomOfwaPWnnjp8FDy8pQ==
X-Received: by 2002:a17:907:d2c7:b0:a99:7a05:a652 with SMTP id a640c23a62f3a-a99b943b060mr311750166b.13.1728676689495;
        Fri, 11 Oct 2024 12:58:09 -0700 (PDT)
Received: from ?IPV6:2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce? (dynamic-2a02-3100-afd7-9a00-94ac-542a-1cd2-c9ce.310.pool.telefonica.de. [2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a7f5cea5sm245094166b.96.2024.10.11.12.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 12:58:09 -0700 (PDT)
Message-ID: <5c26d8cf-d6dc-46c5-be7c-fd8207b3f177@gmail.com>
Date: Fri, 11 Oct 2024 21:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/8] hwmon: sl28cpld: Simplify specifying static visibility
 attribute
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Michael Walle <mwalle@kernel.org>
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
 drivers/hwmon/sl28cpld-hwmon.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/sl28cpld-hwmon.c b/drivers/hwmon/sl28cpld-hwmon.c
index e020f25c9..454cc844f 100644
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
+	.visible = 0444,
 	.read = sl28cpld_hwmon_read,
 };
 
-- 
2.47.0


