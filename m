Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD92D9787
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 01:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487126; cv=none; b=ofZ16vOpZp/3zNIHlnIhyiydM7rMSEXBw/PYSMw2T4UoLSXAsnld/Ybv2lfvX1LHtQtWJjO2veNynl2M1wX7usXtr8Qu0QAR8ibw31j+/rfkQVyOezo9gv35aS5MZcORwBIOYNeXIjZ9GgcKd+wZhZ+Xz7pILwoCcAraVx2GKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487126; c=relaxed/simple;
	bh=+mWhncabqWyY3T2HcPLgbIJyR/uo3fZmCp8oxxEjaEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThhT6SMzp9EbrqeYzo6+Ko7FZR7wX/yST5OQJBFAp+YNzene4iwaqmK0RwVWrqgPpQRFThZ0X31c0jLYPkCKgSR2VcPGx+GL8xkpiRMuCeRR5UDenyV7CjaXB2erUDWHsffyD5ZFyM2BG9zcnvikXlfH9PS3W2Wvuh+EAy8tOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m93uHEtm; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m93uHEtm"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c160308a54so1032489eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 18:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774487125; x=1775091925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OdGBSEoHUXT6Lvd0T5SefG5fM4+mDZz0Khmf6pUh9sQ=;
        b=m93uHEtmZ+bS6JihS2r2uRrjQ2vZL3iy6utyVvhmsZHMtDSgqQjEKzaibiiqsvhX6S
         yPTKZYL5mLFwbTWZkO3yESwpdt1JFQyCIIYNFvRQmwLG91te5bYh3VYPPBDUaK/MwxXE
         dzLacW8aXUPwUrBFekU1bgPR7HPFkBuoNipcJp3WJrKq8DvHD/EHiMl2JXT+yfRX4UAm
         23gxvzP4zO5kdAToFyCwRO7SxnN7Wy7nN9kNTnEwHPxwjINbZbd5ZysYyhihn5FPvTwM
         SsTty1o+Qn0lQc2rKRMUgYvRAjytocWM33doTl3thECERVbd/O3FNiTImMlFNsKx83gh
         1fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774487125; x=1775091925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdGBSEoHUXT6Lvd0T5SefG5fM4+mDZz0Khmf6pUh9sQ=;
        b=cHysxAWNcMaFAopK+zuM7sh5WiqLcuT3tKovcztymOLkc0HF3oVyCAcdBPhi5rZohD
         N7H9Jg9EMoGWxn4/bQCV/dc3HoFHjrkgUX9XEgHIKyXsS54p9BXgnh1revJB/rORwcP1
         oalGxLyGRzmyKAbUKD0qd28bRbMT+TjF2ocTpmqEP88Pr8wKx5INXt4eE1tLE+1+ullO
         EZ0rW+xxvmQ5O70Su8w3F7/HgfHNHnMpXDoAk9DPMNn0672qgRTssnXa7NLAU51Vdv2/
         hOiwLSKDiJR+abhJg689CylYmP3lSjTfgEzkpRFQiOAFFRy8vonokGu0mX+7em9kpCtw
         r+9w==
X-Forwarded-Encrypted: i=1; AJvYcCVWNU+O/B8tlLh8pmoWB4p8ixfyegfzLgoGYioPWvs8Q/sUlETacxrTos3p19e5NZr5tmj/n2L+kLQYBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/xS4Tl6ovBU1H1P157AJovq4dasKYMSsxe0DrWB0MLlj2DaB
	veEfnW40CsKkQ25WvK+UhmASVVw4WrcePDFbxd2RQcI9xIxD5OWdrWsE
X-Gm-Gg: ATEYQzxHS7kiZg103WTncb1pxwVuwKsTdP9ixXz6vRM9ljGAWW3XUhAuS8y1+rpdJSL
	5LJxGrX73EgmhFAa1UMw5W3Om7ggBfQmlI1VN0S32NK2j0R048csPoRn+BsLZIxsjdHnFFbiaVh
	xrqbePgVgPXF9dVVVxonAI3h4q8v76T5k2kuAprJTOXDTmPk4U2bArQCOLkz+6n0g+fCMlf6sNm
	+PrLJ2qQmefdJc9uu6IhtYSQwFX+XBpMik0UOJO5HJ8OPrxfTJSqLrL+l10jH45oaE1ItvFtjKO
	mDjVd9NqESRSbcvDlPy7RH/+VD6u8P6MZdvh1hW93z1bWSdYnJ3GtiSIvzZwvmX1NtS4UZ6XKiB
	pFmSZHlsUclYvU+jY33X6oD71Wci74a3820POWYPz9PWSoVEImcZiQ3nzp7NooqtZYRncCFx4ee
	FdrH3HLOmcU3jWI6YozCQg9z4zmRlDebTw8YSiET4sPaZioduWaiig575Ld2X/13f932dljkhYG
	AYcNM+FIBo=
X-Received: by 2002:a05:7300:3c05:b0:2c1:69d:a604 with SMTP id 5a478bee46e88-2c15d38118cmr3222314eec.20.1774487124620;
        Wed, 25 Mar 2026 18:05:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edd570asm1037271eec.24.2026.03.25.18.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:05:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <09105b02-3d85-4808-ba0a-f3799787425a@roeck-us.net>
Date: Wed, 25 Mar 2026 18:05:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
To: Conor Dooley <conor@kernel.org>, Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
 <20260325-napping-turmoil-de37168fb072@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325-napping-turmoil-de37168fb072@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 11:20, Conor Dooley wrote:
> On Wed, Mar 25, 2026 at 05:08:08PM +0800, Zaixiang Xu wrote:
>> Add YAML devicetree binding schema for Sensirion SHT30 series.
>> Use fallback compatibles for compatible chips and add optional
>> interrupts and vdd-supply properties.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/
> 
> The robot did not report that this binding was missing.
> It also told you not to add these tags.
> 
> You also ignored my and Krzysztof's reviews.
> 
> NAK.
> 

Maybe we should just point to AI feedback:

https://sashiko.dev/#/patchset/1774429690-129139-1-git-send-email-zaixiang.xu.dev%40gmail.com

and only get involved after AI does not report any problems.

Guenter

> pw-bot: changes-requested
> 
>> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
>> ---
>>   .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
>> new file mode 100644
>> index 000000000000..1b5ce822b37b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
>> +$schema: http://devicetree.org/meta-schema.yaml#
>> +
>> +title: Sensirion SHT30 Humidity and Temperature Sensor
>> +
>> +maintainers:
>> +  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
>> +
>> +description: |
>> +  The SHT30 series is a family of humidity and temperature sensors by Sensirion.
>> +  Compatible sensors like the GXCAS GXHT30 are also supported.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - gxcas,gxht30
>> +      - sensirion,sht30
>> +      - sensirion,sht31
>> +      - sensirion,sht35
>> +      - sensirion,sht85
>> +      - sensirion,sts30
>> +      - sensirion,sts31
>> +      - sensirion,sts32
>> +      - sensirion,sts35
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: I2C address (usually 0x44 or 0x45)
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        sensor@44 {
>> +            compatible = "gxcas,gxht30";
>> +            reg = <0x44>;
>> +        };
>> +    };
>> +
>> -- 
>> 2.34.1
>>

