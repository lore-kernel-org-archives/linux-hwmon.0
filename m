Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938511E495;
	Tue, 14 Jan 2025 19:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882604; cv=none; b=R3o1PzU4JZv1EE+W40Ai+b0fZZh2uHNy9z+lfrofLGISpt0j/HVu+gCubwNOU49/qxK2BoSCSAkEs0ytXqcBdRVyYSkVEZrpn+tJSeFPSG30F9B/FKcxjRvGt/CaWJF2rrlzAqW3vEyYIP4bXVJcXPEHLlGpJ1vWzfEppXF/E5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882604; c=relaxed/simple;
	bh=t0VQ1eoai5qNy82QOQOAGevXVDWMM9LWbTC/bS5u0MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOgFGCNGeJ3AGuXXSeEOcvlhB0NMCPdaRbXF2gEgc1pQeNOMdG5XTXpHKJy5gJc4oyOdpk3rnfsQQOK5HSP23YH8nEJXqUWjG5an9YdV5WnpzFT9MPONu1X95oj1dV8MRvdMSsKtzz4fO+j1a4VQlu0gGIx1msp4ehmjh1CxWJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lltSmTpr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lltSmTpr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b1f05caso105041095ad.3;
        Tue, 14 Jan 2025 11:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736882602; x=1737487402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lcM2DfNt6fj4YEk1trckR0yxNSL9PGafmEXu+/w45go=;
        b=lltSmTprxpASMV59ukUt/DtevxHod1uMZ9ObjZVLig/Q8fPWWlty3B0y4gd16vbm59
         0rXBL67ELAWkTGre/Ovh6bqK6jLZj0O+3VHoGLNxMQXpgap5+PYqZpjFUX8r036ZYVah
         VV6RpUf2Ixn11Bj1z6RGIlSlvdKR2s36gmh6ask40pUwyY77ZGjXm7OzSuQ24Mi6eXUA
         1/nkITvWqB7VeEKHiB4YOaueuLV0V6SVsNf0ieVdWU2C9o+gpLenYksKWn2tfECNSVKV
         QqeXAfbS2HbWqSSV1C97YD0Bw4bxM+Pc3BCdhWYz+oWMGC8LNTSfHsBgjuSeiezDZKZ+
         6twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882602; x=1737487402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcM2DfNt6fj4YEk1trckR0yxNSL9PGafmEXu+/w45go=;
        b=UFv+LCB6GdjjjPxdrGSj5GLav8J/YkS3EICNmdLM0ICcYVE6mT1zIqhifWgGpLbduB
         IRH3UkxPp6C7MvJuI5izIvEEE6Nzy9A/e3nxXcpMkSSmvANE7QhqWLakewn1vVaj/QqX
         Hpwq56SHX6lo+G18SonbWoulG/H7ptz3FXKkupxf6r2LdiEJYOffCb7qqQSK1Z1JH5EC
         Bw3nADLiNu7cJR5lCzNAMiuab6xjQLDirI4qvsW6MFE0ncX3JpGa4XzqS4LsSoOgm4Hs
         GDO4vd9aCggp5ON8ad4AjZIH+tXKrwLH3s4tHWutuXzGU9R377mIsJsD8ROXHHJs1ZIC
         PUMw==
X-Forwarded-Encrypted: i=1; AJvYcCUEBAw6TFnQuCwIgUhZR9jZvFqNcHLuNesENC+w1fhIAoDE6vM0ebo5ArPweIGcDnWkxdj/SxHhwLk9@vger.kernel.org, AJvYcCVjnflCwKlPOEI+uMWYjmv7APHf8OJ2B5vzlc/Z0by2tjJGSeb7KtgeTrFOAQziRb0V9qczWK1QVEYxv+A=@vger.kernel.org, AJvYcCW3Let2VcuOSa6YP0yOMCD3oTLBrGZCLqo50OnwvZxZxtMJEahuU3k/H+Xk33FkZPeP/mg+xrGs8XFW@vger.kernel.org, AJvYcCX5MYMK4ifV76Z4ygu3rq5cXn8sGcwXear/DAdSaVE/ubn+o5XkAmCig7Y/jC9UysdoNqJopATeq4e/Lvi0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/uZ4pE7m5r7xCvwiKEGxWPPbD1+fwr6s2m4nYMitK7QpyMW2E
	WswzfuQ6Qmq74uPHXrnFA2kpw5Cvk7RLkQvORytyI9P9VfyswePi
X-Gm-Gg: ASbGncsDG9ts7GuDuJDQQHBh6y1Ix2RZG3YdlqxwGxBPlvmgaAkpzFwyajhzjfvABTC
	GWG/p+bXks4kGo3txaWNzJFx2I6w9Y2j24K59ZYd+eDjdwfCJWDPR10rTyt3r/CaL30QaipLLjr
	SgNVjtVB5IIIyP7CmULmzPqgPCF29Mc7dct2tD5s7ZdBpvuA5py3/IhzTM1jZioqSz2fIn3xgP0
	djpjyHAryHgZLfscAS2V+RmQjRvbplAzVVKEguixt+X9fKarvZ/EYD7XzNHyEMGhvWyBgrf2hVt
	SI5bePEoSFZrFQYgjY3ncygji5rRRA==
X-Google-Smtp-Source: AGHT+IGmVTsqntCrUPy37LYagCValfswWYy49esFXnGkoEEirssEhvy87/YDJQso4ywVgxgXdjwx5g==
X-Received: by 2002:a17:903:1112:b0:216:138a:5956 with SMTP id d9443c01a7336-21a83f59822mr413267375ad.19.1736882601976;
        Tue, 14 Jan 2025 11:23:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047e01sm8589088a12.54.2025.01.14.11.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 11:23:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dc5380a7-e257-441f-a264-7bcfe193de2c@roeck-us.net>
Date: Tue, 14 Jan 2025 11:23:19 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for TI INA232 Current and Power
 Monitor
To: Leo Yang <leo.yang.sy0@gmail.com>
Cc: jdelvare@suse.com, robh@kernel.org, davem@davemloft.net,
 krzk+dt@kernel.org, conor+dt@kernel.org, Leo-Yang@quantatw.com,
 corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250110081546.61667-1-Leo-Yang@quantatw.com>
 <20250110081546.61667-3-Leo-Yang@quantatw.com>
 <190bb6f2-7bbe-4145-b45f-4ad6672884b8@roeck-us.net>
 <CAAfUjZF7jOoZz5h6XkxqOyt=x8xnv+SUbMWJ1bVdxUzFRTO8cA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAAfUjZF7jOoZz5h6XkxqOyt=x8xnv+SUbMWJ1bVdxUzFRTO8cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/14/25 00:02, Leo Yang wrote:
> Hi Guenter,
> 
> On Sat, Jan 11, 2025 at 12:22 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>>> +
>>> +     /* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed. */
>>> +     /* read rshunt value (uOhm) */
>>> +     if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &rshunt) < 0)
>>> +             rshunt = INA233_RSHUNT_DEFAULT;
>>> +
>>> +     /* read current_lsb value (uA) */
>>> +     if (of_property_read_u16(client->dev.of_node, "ti,current-lsb", &current_lsb) < 0)
>>> +             current_lsb = INA233_CURRENT_LSB_DEFAULT;
>>> +
>> of_property_read_u16() returns -EOVERFLOW if the value provided was too large.
>> This should be checked to avoid situations where the value provided in devicetree
>> is too large.
>>
> Sorry I have a question, I can't get it to return -EOVERFLOW when I test it
> I am using the following properties:
> test16 = /bits/ 16 <0xfffd>;
> of_property_read_u16 reads 0xfffd
> 
> test16o = /bits/ 16 <0xfffdd>;
> of_property_read_u16 reads 0xffdd
> 
> test16o = <0xfffdd>;
> of_property_read_u16 reads 0xf
> 
> test16array = /bits/ 16 <0xfffd 0xfffe>;
> of_property_read_u16 reads 0xfffd
> 
> The same result for device_property_read_u16, it seems that a data
> truncation occurs and none of them return -EOVERFLOW.
> 
> So maybe there is no need to check EOVERFLOW?
> Or maybe we could use the minimum and maximum of the binding to
> indicate the range.
> 

of_property_read_u16() calls of_property_read_u16_array(). The API documentation
of of_property_read_u16_array() lists -ENODATA and -EOVERFLOW as possible error
return values, in addition to -EINVAL. Ignoring those errors is not a good idea,
even if it is not immediately obvious how to reproduce them.

Guenter

