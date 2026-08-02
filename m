Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C153B19B3
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680038; cv=none; b=q16efHGjRY3xJzDUZo2hA7aic3u+KvL8Ilb/PN2DMTJxZa/F59VeJnV5O0F+hvVJEbQNcvlsHRhTdzNSuSSLwpp4zMmI/+IiX0LpkA9zhaX28Xod/+ASA9YVzYVJdSQx9kEmgyQ6fwLedypEGNWwCgUGCpDNs2IapCtuNzI1M6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680038; c=relaxed/simple;
	bh=Z83Flx6HFaysd4VEjIoQ8wKEjpM7Vev7LGCJs6j7QnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGPoiZByG2wsjI4n72Jx4zVcJWlncjkFjRMQyvaCwtn9DPLGMRSV8KuOSBhHN1OJn+ZRG6bFaus1Ir+LfncKsJZDjZxK5htkr4aSWSoF88CPcYYZbZlPvWswC+v2g2Bwiu15o0OHNFD3zK0FT0FaiMrdIsmRbNR1xC8qUDHS+n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzLXMQaR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzLXMQaR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so2980385b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Aug 2026 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785680036; x=1786284836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ED9iSFQsXOfHCU0giH/JV3DDdqC1CLPGUfYqEtZet90=;
        b=BzLXMQaRv/eqEGSzEwKP08B/UFKgehnUvpJAyawHKptiUR1W+JL0tivH/FXnaXOE//
         IwXCt5o69AsIAVEEhefD0YdkpcCX19V2RIE9Qf8E9/qp8E2n5nntjBTH7jCpGjVLrQRZ
         /V69iTlipw5Om8t4GEJ2Mq4rnGQQgYKSjICPwpGhtLQ4DYPu1qx73fAtHHzC4FQ1l/NM
         mSVH3CNMzgG1ltPRxN2OHAWRlstkYKUAc7elOYRyFGu9MVZlqkyTotSM9zC1nHWXz+zF
         5mhmE8ep3Uzml7Ix2gKrI21e31R+PM/XYYf8FSVuFTel4vsvga9XOWRbDXHVROjIup9w
         U3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785680036; x=1786284836;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ED9iSFQsXOfHCU0giH/JV3DDdqC1CLPGUfYqEtZet90=;
        b=Zc9ad0RMOaq4cnDDL5qR/fFNyE5F5lVN8RbKMkx3IShwa9VquQ/D3Bz/Hh5Czh5jBm
         RjKM63AAWiZSjLXKLwPnqr7nt68d/x92JsA3giPg/+IWViF/lmEkzKCxba349FTTWwSg
         69sTyTKSN4a8mqfF/BNcJkoHfnqKaJxQDCcxNkfoYzzerGCwCPtYmaGS3j9SYltg/9DU
         1QvU1Ke3RXBhJEeREdCUIR6GqIi2PnSf9b10qyn9PevGMXWad0pLzMhkx686HBI6XsMq
         BuAWDjngBlT4lXvDozMu7LhZAqCXuMxTVmA7TUH++K6oFH9irwmVMtePQgunEMAM5+Sc
         vTYw==
X-Gm-Message-State: AOJu0YwuPBnw6KBiBIjGU8W74MnVqPcCy6/qYHpuPujTKVih0Cum3BII
	T5PGX5yUL10Dlw4e0UrQQDLtoPJM3rsrrYJgfYZMMB7kgUIFIFhVSwaL8UGAwg==
X-Gm-Gg: AR+sD13w5kdR2K4rEuFT4DfhLieiFviuZvoJ6Z2xJRu87NvBvsPFb4i65ShsiSoJhri
	2CojKnPX6s40D70PmXWnxWJPhFi1G3Qn+d3/foyTOldL7XdyBcJZB5ptK0m4L4e+0UDRX7vdQBi
	Y4bBJHgOakPchUb3IrWc5UV15YV1iF8Ep57SyhaREFRKOzVhWpqIBDFjctow72bTdMti/kcYunN
	WwBeILUywzKndypxw/NrXdMwz0/7r+/4TbN/z+MtkfrFpnJ0dg1Y8uDWyzG78z4j8VRD2uPQMKx
	lSD1TfoS9Bbu0DnCamaldjvChwSMITXDprCDlR5i83mkcfvO9JUGp2O30mVh09V5BnV8udqX6JE
	CCbfc3lN0v7bAJ4YuK1RLpSWtadYOR9fAMaM4YU9SSKAWSoH4GlkF5g/9xtMfA72B3uYDI6zhqs
	O//loN/eu6BgqJDI2MmelUFbVrwjKvuGJ08dCkxvLD37rhIUDfQmVzCupI02O87Dpy1/yr5RfHQ
	khND6N1K5tidKcC8seCoCPtJsxhwEdRiXIXaQ==
X-Received: by 2002:a05:6a00:807:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84ee47ea28cmr5757789b3a.32.1785680036436;
        Sun, 02 Aug 2026 07:13:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29f31dsm2533894b3a.36.2026.08.02.07.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 07:13:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a61b320a-1577-4dc5-8b39-3a807c75cd6b@roeck-us.net>
Date: Sun, 2 Aug 2026 07:13:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (sg2042-mcu) reject short uptime reads
To: sashiko-reviews@lists.linux.dev, Ali Ahmet Memis <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260802130728.25721-1-ali@iusegentoo.com>
 <20260802132411.ADE811F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260802132411.ADE811F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/26 06:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Architectural and locking model violation: custom sysfs attributes are registered directly on the I2C device rather than through the hwmon core.

Ok because the atributes are not hwmon attributes but associated with the MCU.

> - [High] Arithmetic overflow when converting user input to degrees in `sg2042_mcu_write` allows bypassing maximum limits.

Correct
> - [Medium] The I2C probe function checks for `I2C_FUNC_SMBUS_BLOCK_DATA` but the driver requires `I2C_FUNC_SMBUS_READ_I2C_BLOCK`.

Correct, and common issue.

Guenter

