Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7827B32B
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 18:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809287; cv=none; b=rcwENbKXhFI+TLunyBNo4zwuohl95Vfgc7c4EjAOB+qjdSkV57xW6/Yt9k0qM2gdgih+4DgNliOooRekUkYeyfUQM6a8IF2r5m0cDOitCUWmSTkdmnF3MlfAPGhGnorfPnF1f6wH5g16kjeJmYdm6gx9NGIqTu8qAqn5uSd06U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809287; c=relaxed/simple;
	bh=y4xR85L0NltRqGs4WyiqTFwM23gfnOted83u0+5X+Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/YOsVIMpyiv/h1LB2mt7+6T5RL9xzY1AyDnJA8wN4x8cMe4/uWrVj5LtLabERFQ9hhMc6Ief+wh8gDKfO33sArRJsNhL+YnqKxkkq1MXpUKaG5hznod9PZLlEJpcLxx+8E04MG3crdNz08JBkDHa9w072TuSEoRdavBGWrJdwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi75ilFU; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi75ilFU"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c175635a33so2582582eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774809285; x=1775414085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PwfQIOmM/SI0e3i9N5g3IUUoTbPvavo95pVFv1sraXw=;
        b=hi75ilFUx2fqukWKHU5MlsLWpdE4diuo6bOnEScZYg6tbaW3qn4daoqgIaVeJLHo/w
         bp+VSIf1kgGkCJmmG5PnGYxkjshamII8kbj4p+hIJN/nSOa+Yt9Gd6VUZc2hqCxHhq5J
         QaEV0GUZnnZ9sA0Kg+7YaSCHGDg6qSLFLd+lz3VbmdqKkidDUNhWJdbgA8VzxPCp1VCd
         rkRRt6kZ9g2F4OwTLJog3d+rrBSeYDxZy3JHpKyF+YcKw7itpTVCAo/EcJUN0KqXdvKt
         spsQKzQ9aoFwkzxpNn0sJy8wH4Cmoe+FrT6Nkc/cBN5Q6kGiwWOBHKYYxcZZ8yus6f6C
         X+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774809285; x=1775414085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwfQIOmM/SI0e3i9N5g3IUUoTbPvavo95pVFv1sraXw=;
        b=SIh4VM/f29AAea8YIUAap2FnMoOAjD8fWwESbYP4ah3QxY/bR/GukMGRsIIhb5EZX/
         NvepA0nj2jzXgz1jCQM63sIjAbxTVn3azWsyjWq6fkrSb390TvctcVWXJ1cbew0g6Our
         hmMMkrSAlZIaNZ+poJEfkF9Ii7IpV9Y0PuUy4WZ4gHrzVJNwFGfHNcRkjOdcW5qFYz4d
         Vyj3F/JtO6gxSmjuBb+U8UDhpyguvNHUOy0eTMX+CvrBcr6aKFl1vN5IcbMBMqJEXC+J
         1L2WXiGSXbVJtOGR7ZS+WboRQZfNkiKgLAjK/7aYGoo/kQ6KybK1IY5jl1pxzI0Yl9wn
         c+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVQJ/g53IxWrWUZfygxlepqwpLA6Jf42piW7zuYBmXutH36LyhAyJsDlj6TBf3koXjOdjUKDGWeNK4MKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU3Zw66H3Zx3GpnKWT9jHyxuFYqOgNN18U5XrF0FGdG8CIOICE
	0P4GtG12YGni3jX3rxLEpAOpbmoxuCXrvT4/Rpwm3U2UFZTcLkl3Gw5u
X-Gm-Gg: ATEYQzxpkPToG15reT2xMAghzkN+Lk2bYurhUYs7sJCgQkxXqMq9s3ZrZL90QA2NO2J
	Xabj0XQS5cIC9HzMkYkm+MvAkhqEhX8hXz88GpNfS5GDDrISGgpYEEkh//+flAK0i0mjboQIbRo
	KylZO1PE+vPF86LTKWpR/HFRU2B0YCJic3smLbEkqfdUWjDUcFj2h3wyCsuBNZUX/BJ2trrKX6U
	kg2ibAznQE2eoYHGcoIE3my+pxm7Ei2w2LyPoKHiumhie5n0pdZXnLkB2sAWtaVlPqSek87FXJK
	yT4MH78ZH/0XQNUSAszEG7t6T6ZFeiPMPRogNvSN5Y1HarDZun4tQHpk22N+XPXkSixWYEbaHoR
	YXTzBLL6BH84NzfQl0nqVCq1mwhBzTs1H/Yt9XNwKTkms6llSuNN9eG48iuWkLJqW1y43KTSnur
	NHmip+AJrailJA9yUSoT73gy+SAEzfgWtd1x/RXwzM7lpuYuJlqs6RizOKDIRj483KWKDowV9rm
	PEYItMoz7g=
X-Received: by 2002:a05:693c:3005:b0:2c1:7793:7bbb with SMTP id 5a478bee46e88-2c185f3905emr5191666eec.27.1774809284596;
        Sun, 29 Mar 2026 11:34:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c41c1513sm5229388eec.8.2026.03.29.11.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 11:34:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d37357a2-90b0-49fc-8af8-434ebac8ca6b@roeck-us.net>
Date: Sun, 29 Mar 2026 11:34:42 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: (tps53679) Fix device ID comparison and
 printing in tps53676_identify()
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "Delphine_CC_Chiu@Wiwynn.com" <Delphine_CC_Chiu@Wiwynn.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
 <20260329170925.34581-3-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260329170925.34581-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/29/26 10:09, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() uses strncmp() to compare the device ID buffer
> against a byte sequence containing embedded non-printable bytes
> (\x53\x67\x60). strncmp() is semantically wrong for binary data
> comparison; use memcmp() instead.
> 
> Additionally, the buffer from i2c_smbus_read_block_data() is not
> NUL-terminated, so printing it with "%s" in the error path is
> undefined behavior and may read past the buffer. Use "%*ph" to
> hex-dump the actual bytes returned.
> 
> Also add a short-read guard: if fewer than 5 bytes are returned,
> report -EIO (protocol/hardware failure) rather than -ENODEV, since
> a truncated response is not the same as a wrong device ID.
> 
Ah, but we don't know and can not assume that this is a truncated ID.
It might as well be some other device.

> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>   drivers/hwmon/pmbus/tps53679.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 1a6abc32afe2..d6600502d6b0 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -175,8 +175,12 @@ static int tps53676_identify(struct i2c_client *client,
>   	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
>   	if (ret < 0)
>   		return ret;
> -	if (strncmp("TI\x53\x67\x60", buf, 5)) {
> -		dev_err(&client->dev, "Unexpected device ID: %s\n", buf);
> +	if (ret < 5) {
> +		dev_err(&client->dev, "Short device ID read: %*ph\n", ret, buf);
> +		return -EIO;

This is not an -EIO: It suggests a different device. Please change the comparison
to "ret != 0" and return -ENODEV. In other words,

> +	}
> +	if (memcmp(buf, "TI\x53\x67\x60", 5)) {

Just change the original code. The expected device ID, according to the datasheet,
is, in hex, "54 49 53 67 60 00", with a terminating 0x00. So, when using memcmp,
the comparison should be something like

	if (ret != 6 || memcmp(buf, "TI\x53\x67\x60\x00", 6)) {

Thanks,
Guenter

