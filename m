Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181FE1CC17A;
	Tue, 29 Oct 2024 18:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730224840; cv=none; b=Ik9/uFYpQH1P0OSozycSqYZ6cwMC5rP2zoIPEoCuX4qUOtxtqJSM2WYe1u3PLPmp4EQsI+L5D0KsNEclnvfQ0+BlZpslnXz+Yhrw2XAVa8OeGw9zkyW+nkPrwlD6F2Mn2W1RTvaMkuN7ARGwRtO+p6vCVSmJL2isQ33rQ5aOeXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730224840; c=relaxed/simple;
	bh=ZpeWn1jEQld5+c/YoVQnwITPf0G5TEZAddNZ+6K+VlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXHDoTVATSpTZStrkBjqKTtL2/VvkzsMrDWPBUqSrLzyZtoMFU7NBKOpa23peg0TBZOwLEeAh71YOVo5APk0PW9wMMENizmufseP8QD5d+npgxVwtS3lE/8Nf4uzJndFo0Y7uBhq5OlM37b471SG+QCh17Ww5htoWgUP/F/Fz7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/rpdIJR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/rpdIJR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so4128376a91.0;
        Tue, 29 Oct 2024 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730224837; x=1730829637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vjSI6ju39bZ4wN1ALmGofXwzNf4jwsk44A6Vq/tqAaM=;
        b=c/rpdIJRr9W5ItL6KYU2tcFw3QGrrg6YjgSBOfelDf7e6OQJ+9jP0vvC9SaA3aSvCl
         ZR+DeKTKnpYVHLZlwfwXz59bmPHRr/lCrYN/QDV48y5JLiiIdFgINPiSRX5GY/90cKyR
         jAfvZoqpqAbZ2zFyCxEsUUBK7bXpKeyK8mml0hez94nIvHhAJtbJg99jG/1kcfV1wyJL
         ug1ntqL5/4sONM86XuLpwrKScJAKfZ5KwQTsgw53N/Hg6oD5YT420RDBZcOzKl4l53up
         Guo4smTlUj22O5u8Hl2pAkcM+W2ycUebL82GqAwgLoCR5ONdeKmlc9T0RK03CcMeVchg
         aVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730224837; x=1730829637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjSI6ju39bZ4wN1ALmGofXwzNf4jwsk44A6Vq/tqAaM=;
        b=tE8Zqi+R3cXj4MR9LFjQEgBldhrcbF9IRbcrhUk/AGXzw5BxTxzu5DHmY9hDtONBVf
         GoniOx5R2C59R9jAAjSe0QgC83aGfQ79kbnB9jRiqSyjkH2vtDuKnU+W/W1LyXh5I7tG
         8ynZM9KMk/ywXgTGvebEYCH5sa7Vwk/nCKNq1sLQJvnCv2kCsUH+FOhOxbbtceVmPP3+
         znu3QYh6TqIh1zZVhQEUzpxVAy6c1IWntXbQAKFvIcav0hzpy4iWJrLJ2t8CWCQJRuxk
         13VM8wIj/N3948O6+UhI6TM7T36SpfVLP+U1Z41zsWmKVg9PvMB8wVZdRlduhPsH4+kE
         7bnw==
X-Forwarded-Encrypted: i=1; AJvYcCVZVhClAckDB3cR9NpOkFnX2WEGCxpxQPACqWXJ2VezmaM5akDc5+PjOzR975cTR/MvNnh86OW5UwzO@vger.kernel.org, AJvYcCVkDiQdBYI4Crz9nPV9yw0QCGw7iy2udMCYrH+uwccu+G4Ss0caBBS+LSo4wMQbofwcMZu/xPzga9LcDTg=@vger.kernel.org, AJvYcCXP+1ur7giMJkziOr/q1v26tL/rvhHxQtnk1RkU5fYDncONn9DGsCaxASlPR3OetwJvdR8LrEWe+iAn@vger.kernel.org
X-Gm-Message-State: AOJu0YzD0uX7O8t5OiHXOuYbVsmGBOcLzHAgz5+Z5FNm+tDHCqLADqeY
	D5elKymbt+Lt7NI75AJdsnxvfkHzbOOpOFHXY4VNuPG5OQuqin1E
X-Google-Smtp-Source: AGHT+IENRdeMaZ7gv1ITNsni7lDpM2otM2pMXUVWV3T2QruMuq+FU3SuF2swQ/2yKajrURDRsaTPMQ==
X-Received: by 2002:a17:90a:9a8d:b0:2c9:a3ca:cc98 with SMTP id 98e67ed59e1d1-2e8f1057e99mr15352259a91.7.1730224837099;
        Tue, 29 Oct 2024 11:00:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e57f74asm11793166a91.46.2024.10.29.11.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 11:00:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <871caf63-daa4-4383-829e-28d7cb6f2959@roeck-us.net>
Date: Tue, 29 Oct 2024 11:00:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] dt-bindings: hwmon: pmbus: add bindings for
 isl68137
To: Grant Peltier <grantpeltier93@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: robh@kernel.org, magnus.damm@gmail.com, grant.peltier.jg@renesas.com,
 brandon.howell.jg@renesas.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1729874904.git.grantpeltier93@gmail.com>
 <CAMuHMdWHZR9pN3h=Jdsqs5Qb0mi_4CobBtu82PRgzrm5TRgE4A@mail.gmail.com>
 <ZyEONRFoooymFcfJ@raspberrypi>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZyEONRFoooymFcfJ@raspberrypi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/24 09:32, Grant Peltier wrote:
> On Mon, Oct 28, 2024 at 11:18:39AM +0100, Geert Uytterhoeven wrote:
>>> v4:
>>> - Revert devicetree property name to "vout-voltage-divider" and refactor
>>>    property description and driver implementation to match existing
>>>    vout-voltage-divider implementation in max20730 as no suitable generic
>>>    voltage divider schema exists.
>>
>> Can you please elaborate (or point to the email that did so, in case
>> I missed it)?
>>
>> In reply to v2, Günter wrote:
>>
>>     "I would prefer, in the order of preference,
>>
>>      1) an applicable generic property definition
>>      2) a definition that is already used elsewhere
>>      3) a new chips specific definition"
>>
>> https://lore.kernel.org/all/3f460b62-4cd1-49dd-a98b-1fbcfdbd3af0@roeck-us.net
>>
>> Thanks!
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
> 
> Hi Geert,
> 
> After looking through existing bindings definitions, the only generic
> voltage divider property that I found was one that is intended to scale
> voltages for IIO io-channels. However, the use case here is to scale
> particular hwmon PMBus telemetry, which most closely matches the existing
> implementation of the vout-voltage-divider property in the max20730
> driver so I opted to copy that implementation based on Guenter's
> preferences. Is there something that I missed or more information that
> you are looking for?
> 

I had a look myself. I agree with Grant, the existing bindings are really
not a good match. They are directly tied to iio, the implementation in
drivers/iio/afe/iio-rescale.c is completely iio specific, and I see
no means to use it for anything but iio. The problem is that it is
a "compatible" property, not parameter property (or set of properties)
as I would have expected [sorry if I use the wrong terminology].

We could possibly use the actual properties, "output-ohms" and "full-ohms",
but I am not really sure if that makes too much sense.

Note that there are a variety of voltage divider properties.

gw,voltage-divider-ohms
lltc,fb-voltage-divider
mps,fb-voltage-divider
vout-voltage-divider

All those specify a pair of resistors. I think that model is much better
suited to the problem at hand than a "compatible".

I agree though that this should be explained in the patch description.

Guenter

