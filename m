Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401E343D74
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765877093; cv=none; b=A21JPXRFIxvv7voe6oWIPrAy4qsbRgwUJh9WcC7GAyZull98m/GJCA3yGzqUS3dbysUvltpEGM9phPQvu576XkZzJIsAx6kEUaOMpEQt3rDXo8NsxbeIL9HbRkfaazSUCBGhAts+mv8HfcyarsnChPH5MzN8/7/BBuRNk1zdxCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765877093; c=relaxed/simple;
	bh=paEefmxoehvY+YUe+LCWiicYBOi0U2+9xjA+hvX7oaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oeZIcB/jybcVg2UlVkT/T+g1lrZA6DqVF/lMnjQbUxUkTTCXUmeU9UdDDBQEQH+F+ebnAX43ye/wxbAJ44ppkWQOeIjhIua5EJTYPi5AvtEHG7XGKLCtCfQwfGpk/OrsIts5zfDSiFkzvKdYWZ/tkvc1spd03YOElmX/SeB6/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNQ4WCxe; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNQ4WCxe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a081c163b0so31135835ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 01:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765877091; x=1766481891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yGqgIcLPwReeHWayJdPKmw8LO6wwuYchAh2n/4kUlys=;
        b=FNQ4WCxeXFltg3TI5apYq98kMuhFzjXM/A1vptw/NrdblZrXUei1E4QAgt0fJ7Knd4
         1jJSx/IZJ8cgUWoSAMTQwZMpopTQrcH4Alk6JJ4AmmMi8f41lJ6dWxjDWBY/fclA0s1I
         2UpiReiRZXtrSUmdsCXssQ+3UIQui1OPjuK8X1AR3YFc+iCdP87oPi3XnDKMlYk/IVVw
         pDtC5vNl+mqMgM2H2rbnaCnVr0rQJZqhhCM1wSxwOyl/2w2/IrXc/mElT7WjoqPOt0Ip
         sS//nbfQBnGVTUC18ev2u0qqcLzJTF+/m9L6/n2LlZYpqeHPANeVUxC+dP7PzNXK6394
         8cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765877091; x=1766481891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGqgIcLPwReeHWayJdPKmw8LO6wwuYchAh2n/4kUlys=;
        b=CDFpAet91DzaAynTmwz/f00roSlIOdGY++b7GSTCLeUVC7p1rtia+xnBmCrf6qlGGO
         4Xro5TcVjNTSLNuIdIaGs5VkLVmMbT/YdXvWSWJXPoBoDvW9vFxxidGIdj3CgUeJmA2V
         wsc485Q4u6gO4yxPy+ch5qcLWwBezb6Tgw3b+2nVD7DIzlr0UgTCk/71DCHPIeK8Llah
         d7aM+CXZINrY81ukTRIJvfnZN8Ju960WMrUdM6b4TJlm3A9FhO33gqkUDKJ1QfJj9Vhk
         XhWRND3cuYqV3LwBwB6l91qCZpglZzyompFWjHLjJw74CV4+cJAFLhfwZnfu7Ex8dTpH
         7Gmg==
X-Forwarded-Encrypted: i=1; AJvYcCWEVf4jC3somfgJQOwIuQO4chB8pssu9hlPXvrIsSXOGtSdKKvxUtzHTT8ucwv1rEUCNQYrVh8cxG1YkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM8ShEKunSlnhXNdQlD40Sn0AvcBQDr8mZzijLzBHVRjXJpeDt
	HhlfPkm5KVPYJHxFoSARMk2ae+SWzsAARyP6fnUvwrQ246oLgWvGw77+
X-Gm-Gg: AY/fxX59L9O0+u2UazXnb/0uO14WYOOZXI88vpz96NISpPJR9djk1sHg657f70IK6ne
	5sanmWRLL6nh4IDRjxLDMME+fWyX8ze000MUD/cZIDWxJODrt4F1xCpQZvrF39s8Mj5ddX1Plej
	bAYc9z8l3RJwjDsQ6HJXpKfMZP8AZd+E0sP4mvs5qxZYTGUDt/I/dYSQWfI0Jo51gxWHST0pB32
	D+5rkefhqeB46GvBIh0r46cxyEmg1voX9wDPren///OB44t5S5xiesnr4IHvPDc6Cc+igKs0xBX
	7royaCTyCe/PujWE2v7fjJFw9TCYZtEUqOxFCR+0agv0Gv6eXbARb9lkKDMczp2vHQ4b0EXF9g4
	ccyZgndp+5kUpkXsPyYA6LrGXpj5QKE+tOysTX92IN3V22e8MX7ZT1KMbLDpLGa6hxGI+BLIsRm
	+uf08lDConxjnXWIlD7tIlDYdThZX/hPtwub9LKiZE9mE4h/Nxi4ZhHsTRAJnH
X-Google-Smtp-Source: AGHT+IH5c+gL6TTiACTSjzjP26WyiVh7Lt3mCiL+YYiGE0Gu1aeIglmlI+kZT85Ylt/VrHKuzQBeoA==
X-Received: by 2002:a05:701b:2415:b0:119:e56b:98a4 with SMTP id a92af1059eb24-11f349c583amr8312277c88.11.1765877091172;
        Tue, 16 Dec 2025 01:24:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm53343179c88.11.2025.12.16.01.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:24:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ecc793be-9b5a-4f9a-abd1-5767141d23d8@roeck-us.net>
Date: Tue, 16 Dec 2025 01:24:49 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add STEF48H28
To: Charles Hsu <hsu.yungteng@gmail.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20251216083712.260140-1-hsu.yungteng@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251216083712.260140-1-hsu.yungteng@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 00:37, Charles Hsu wrote:
> Add device tree bindings for the STEF48H28.
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---
>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d0f7dbf15d6f..6a020385a58e 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -417,6 +417,8 @@ properties:
>               # SparkFun Qwiic Joystick (COM-15168) with i2c interface
>             - sparkfun,qwiic-joystick
>               # Sierra Wireless mangOH Green SPI IoT interface
> +          - st,stef48h28
> +            # STMicroelectronics Hot-swap controller stef48h28
>             - swir,mangoh-iotport-spi
>               # Synaptics I2C touchpad
>             - synaptics,synaptics_i2c

It is supposed to be comment first, then definition. The above
splits "# Sierra Wireless mangOH Green SPI IoT interface"
from its definition, effectively claiming that st,stef48h28
would be "# Sierra Wireless mangOH Green SPI IoT interface" and
swir,mangoh-iotport-spi would be "# STMicroelectronics Hot-swap
controller stef48h28".

Guenter

