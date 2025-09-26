Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218328BA83
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Sep 2025 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758875266; cv=none; b=ByN1gHm55x/y9jiirNk4kF9lI6VJ/jTCfQofybR6NRqB9K3zHgVI6APrb8qgQ3hpm+aa9gXo0xWrMWdia1+5ml3GJYVYXLFJEcUdSEeXUTW7Itk/Upu/9235D8d7LJduFFCO0pswhWen+ReV/XLSUhs1Q1C3OaQNtZE5VeIl+Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758875266; c=relaxed/simple;
	bh=FJ32/p4g+CxM5aiz56PxjKWyf3TIW+l8HDgnXk6ULco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anwmJY+niBlzWcsAtSgR6DGZRknRyI+IpYRSRDffaW7VOIGbjfAZlj2eYRuxh4hsbNspaa8ZvRfk7rSmzEl1OoVVdbciAr7coGJmQo8RUZx/jxBEZVlPI0WT0b+VX//RrSXVTi2i7zOmyiqSKuKOBYqVomKvdgrP+rBAakzq3hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENQwCCYN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENQwCCYN"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso1549917b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Sep 2025 01:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758875263; x=1759480063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3c75WAzk0fFcFdEuaqWRC+mXQtAjTaZTP2dlJBnjvyw=;
        b=ENQwCCYNZuGCdsWln08O4tGsY7haTvhaSvBmmO7w4mIORjv3onfsPRJpKkjyYXN8Av
         O/3y1eLgGUXVFZZkdxx0TGD6PDZO8ekjWBkfD0raCFLfdON621d1jz+Br5Ur8K24bImF
         VSbDoSR036OfOa/Y2aOG7cUSej6ibV5kQinIvUut+x1piOT9dbm7Pl77RYhmIp9alV1g
         BVKUShTppIEVLQCTDhI6Snk6OCsglgRRXvgi5gSisqL9qz3Ei1qgcQ2nCYfhBbpvcyVv
         vnf0sLYpQYnYec3wZ20G970mqzmQ5YbezKd/ckRngekNkMaAVe5XCW/AVsonFC76vEKS
         d0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758875263; x=1759480063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c75WAzk0fFcFdEuaqWRC+mXQtAjTaZTP2dlJBnjvyw=;
        b=besLq9jAbXKCXeAbgXduwwEA85L3MqXgDNO2n6gj5NVwagb9mgce6lucHFievPUcEo
         7KUofLmFRlJBYiTvjIKLO7/yuxAwro54nmolj9uZr8YUaCoJvjqz6KexnnlIgUBmkh7W
         /fg6Oh8MkXtcn4xYZMeWpJK8rta7yVFz3gbslF3aDSP/yfs2GpC+f+52zO2+JRvkhnSy
         nr5kkYYkClsI5IAxSyS1y369nSMW6uk6h9DQB7jh3s/UbmdoZclvfTdS+sb6ExdenCiY
         nYLmKFh75W8cjRGoflsPGJjaoCV+H/GKmKDDUtcL3rkQbhkWBRUXVEchO7MFOnDKJSPA
         wiVw==
X-Forwarded-Encrypted: i=1; AJvYcCVSmuwMqNqeOEdiYNwPkcftBHz5DenyR96mOKDCLdKF6QDoHHaFl13RGX77WE27kEUAojlOCw5FXI5Amg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZC6JJ8ZM2lcz0HqUOmFrRqG6mne4dW2SGdpQCJoy0xc7HGgBu
	2R1/qL4xyVWcHkSVSFo6bIz+I4Qh6u6rN2lnZPajg0lDnWVCsV+IWVZb
X-Gm-Gg: ASbGncsxR/UCqEHVjAvMSAPaI9QFc9D/VTp+lSlWncyHiuXka3oEjKZgT2xiIfs6bE2
	z+fuCyz6A80dYonf/sBMOg0EJnKR/WCBvbanLEbiHdzoAQU/db9TUVyfO2EQ25jrHGL4QwBJwmi
	/Cs3azMhdQSFJ5fhv6VKMixOJdnvJYXsFWTRdaDD3Qcbnb21S7RxngB5MLk3uoJnJaZz0KyPBrE
	FrmmJq3lN3FIyOmQr35Fohc/6vaj7Z0vl3Z9ycaQ8E5RRaXM79D3XscDQ2r6RsR7aTFNIi9++sI
	XcL6Nz1JDAiHHGv+glLlobFtbx3TNbyGjAOjMPk7STqOaqvxUKEpLYvACVtPvgMT8LQoBohXxS5
	58rCuzomtTfwIau23/oJOD1WjqrIEVM1D0wNNyVGluNZNBCCqKkpghstjSyHT1rNi4d40jp0=
X-Google-Smtp-Source: AGHT+IFVG/zIzdk+YYb+6Peneg1BzhpGa8nIP/03clP9hKSS2cs92RS7kDIAloGplbjParz2Z0AAUw==
X-Received: by 2002:a05:6a20:258f:b0:263:b547:d0c3 with SMTP id adf61e73a8af0-2e7ceeee380mr8397622637.36.1758875263508;
        Fri, 26 Sep 2025 01:27:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53d9160sm4089812a12.22.2025.09.26.01.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:27:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f35193de-a106-42ec-b318-1501793fcfb9@roeck-us.net>
Date: Fri, 26 Sep 2025 01:27:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/hwmon/pmbus: Add support for raa229141 in
 isl68137
To: Jeff Lin <jefflin994697@gmail.com>, jdelvare@suse.com
Cc: cedricjustine.encarnacion@analog.com, ninad@linux.ibm.com,
 andriy.shevchenko@linux.intel.com, johnerasmusmari.geronimo@analog.com,
 Mariel.Tinaco@analog.com, jbrunet@baylibre.com, kimseer.paller@analog.com,
 leo.yang.sy0@gmail.com, nuno.sa@analog.com, chiang.brian@inventec.com,
 gregkh@linuxfoundation.org, grantpeltier93@gmail.com, peterz@infradead.org,
 william@wkennington.com, krzysztof.kozlowski@linaro.org, tzungbi@kernel.org,
 thorsten.blum@linux.dev, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250926014552.1625950-1-jefflin994697@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250926014552.1625950-1-jefflin994697@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 18:45, Jeff Lin wrote:
> In chip RAA229141 there exist ISYS pin which can report the current data
> for the device connected to this chip through this pin by routed by Direct
> Memory Access(DMA) command. To read the data in ISYS pin, we have to set
> the DMA address to 0xC5 and then read the DMA data from 0xC7. And then use
> the Direct read format with 10mA per LSB to transfer the data in 0xC7.
> And for ISYS input pin, the DMA address is 0xE0D3 and for ISYS output pin,
> the DMA address is 0xEE42.
> 
> Signed-off-by: Jeff Lin <jefflin994697@gmail.com>

As submitted this is a no-go, for several reasons.

The description should describe what is done and why (i.e., here, describe
the added chip), not implementation details. Those are useful as comments
in the code, not as patch description.

Introducing a new sensor class is unacceptable. This is a current (I think),
treat it as such.

Changes in the core together with other changes are unacceptable.

A new virtual command (or commands) would have to be discussed and be generic.

A new Kconfig symbol when adding support for a new chip to an existing driver
is unacceptable. Besides, the new Kconfig symbol would have no effect if
the driver supporting the chip is not enabled, so this is not only unacceptable
but wrong.

Regarding the code itself: Stick with existing coding style. Do not use C++ comments,
declare variables at the beginning of code blocks.

I would suggest to add support for RAA229141 in one patch, then we can discuss
what ISYS_{IN,OUT} actually measures, how it differs from IIN/IOUT, if it indeed
requires new virtual commands and how those command might look like, or if it
can be handled by mapping a existing commands.

The datasheet for RAA229141 is not public, so be prepared to provide a detailed
description.

Guenter

