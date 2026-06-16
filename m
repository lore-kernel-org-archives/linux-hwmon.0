Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080E35F161
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618699; cv=none; b=QNcQQ3+g1g2BYHXMi6cjcIUn3xnd+27caeLM6Gzi+s/Pe1D1Z5hiDf949EhyzrSSW59A0iWDk/HWDLTpmpj1qb3Z/e2kuyy7RbQotzBFFrS4N1tdBA9mG65fA8Yg+2i7evWpIqXSzlhephBzkyEeWQgoW6hR/eyMt1do78C4f2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618699; c=relaxed/simple;
	bh=6cxxjDrrDX0zKAQI6a9dsclYS/1SMkPHQU4sr4ythiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+G0bcTBDtUPVR6W7PN/9FRHRN4mB0CGBzpFdIh9Nf9RNlT033Z6HLkrWxF4PAkitvSfRQvaSO84bNVsQH3QGv2/VVR0gr61AM9PDA4fympU6pQgau0D89dm5TW6yp9uICgXCjLcni6P6X6XmtBppJR92BtXlTbiqRLIEoOk600=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWSb/dCc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWSb/dCc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so3152235a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781618697; x=1782223497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ivi7d8A0wNIQ0RxwcaD5lNJ1sWKXe2e7ej4lfpFqPXo=;
        b=KWSb/dCc8hrwdC0/vDzCeHGB8OsCu4fgr92q6iEOzgT54FGBizPglsVcqfUM4JgPBk
         37h8rlkx5GrZaZgyle/lskpFtbhFe00R84EejdzBCChSjNzTU61NrHsPPbzNuUHGpf9e
         Y5l1iI+JFZfiSFU+8Db9MltI5t5WgTALRi2ZWtqtwRS+bQSQZQwK47bIOql6e3ZkHaqH
         HQfpR8xUsK1yG6XzOa4yz2AYAJ4f+2w24tLm5SnEMhYIW5ZkACmuBBsgg/xC8YK7mI+v
         IF3bxEnFaKLJzFbsHv/0+sjCSpehyA6tDcBByAa3MXPuvYoJKVJ2yLi+iG0jRQJ9vF8x
         0s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618697; x=1782223497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ivi7d8A0wNIQ0RxwcaD5lNJ1sWKXe2e7ej4lfpFqPXo=;
        b=DpTdnBuGrUdGDGnKxOhxz/7uyzmd1WTydGkE9h6Kzk0xx/TWCmIgjD5y2znpevLAo5
         qs5AOhLZbgqxzlnVRMXiXi8A5zFk0sSa0l9YY1p9ouJjicsjzvcssg7vxM/oGVpTetc+
         4aN1gED/xCmpIiD9Bj8RyFjo/h/natbeyHThcW7oh9jFos0SgIHvFrw0jBq1qsK7BYQS
         +uo6AUN/XtgF79a36tOKlcOxdWQebXkrVAtdABEyFjzujAtgEku3azSJMwcQedHIYf6Q
         0hlDirNQu73Nr09PjGO/1lBcv057qJkcTTkgshaRtRuX2kEsWbyiY87cVvJEQg2F+cEI
         CD0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ylm9WQzpQgqjJz36GOVUvrvjzIeU0XAQ5YpLAIRrYT0c07algGiiLHKyKHyjGkx28JUPh9trxSKWdJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpLJXyTqbqE0oSfKo6UeiE5bxDtoZDcE+AUeXuJJTQodSnRNNa
	30hjF1sgACuA77jQbuOtM+kpH5K5H8+vMf8Bi26UKhjNBfVv+VYvvJxF
X-Gm-Gg: Acq92OGenjcQUP5r5PCzGLtWMT5HpsOjgO5knbnQz5zP08fEP/lq31zGFCjJvRUS3YM
	+5gCAPZtCGYzmakamioQhSdwNJGnrxvr49obySLKO3bZ/qFaTXYfY0G5vHFo05PLsOH0s6f0+dk
	1kikfUC+7VkiP9XzSJ1N9RzF3fBS64chziFdwqYoXC8taBSy9Lq7uOlBli1dBDtKS8++NYIVJhH
	BTmjRUP2fPqumyz3GJ2RRrT2/+h8rWlEn2VZ+lzqajql7oYLeTxxjHKTbuE2prp2QGuGOfS2zVe
	dWFdjm52BX9ChH3sjU4y/5F9wOVqk7JttgFz54WRInh1hFv5Umi8eTAgHPzMT5RcMpD9hAKT07B
	I+zMX6X8xAHAqhPGas14GFydPrhdcrs9BpMLYO8Q1zLhpXyCKKFup7oylxRnMIL9KLNaURSeOol
	HzlpOrmEFHFK/RuRzYBveKfH/WSPeufE2qnlpVqQgWnSwwihFJmL798Saqpz6dEO2Fh7m17dvZ
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37c2bc42814mr15347185a91.1.1781618696752;
        Tue, 16 Jun 2026 07:04:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651aef27sm11809894a12.30.2026.06.16.07.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:04:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f080e20e-6ec7-4744-9794-0a92d03f48d8@roeck-us.net>
Date: Tue, 16 Jun 2026 07:04:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] hwmon: adm1275: Support module auto-loading
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <634e76680ed93e58ebeb35db080138b791cb6c27.1781591132.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <634e76680ed93e58ebeb35db080138b791cb6c27.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 23:47, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Populating the spi_device_id -table is not enough to make the
> driver module automatically load when device-tree node for the bd12780
> is parsed at boot.
> 
> Adding the of_device_id tables causes the driver module to be
> automatically load at boot. Testing has been done with rather old Debian
> system.
> 
> When inspecting the generated module-aliases with the insmod, following
> entries seem to be the difference:
> 
> alias:          of:N*T*Crohm,bd12780C*
> alias:          of:N*T*Crohm,bd12780
> 
> I suspect these are required for the module loading to work.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> 
> I did not add of_device_ids for other supported ICs as I can't verify it
> doesn't cause side-effects. Please let me know if you think those IDs
> should be added as well. I would be glad if I got more educated opinion
> on adding the of-IDs :) (I can squash this to 3/7 and 6/7 in next
> revision, and add own patch for adding of-IDs for other ICs if
> required).
> 

I don't know what those side effects might be. I am much more concerned
about side effects of having some of the devices in adm1275_of_match
and some in adm1275_id. So, yes, please add a patch to provide
adm1275_of_match for all chips supported by the driver.

Thanks,
Guenter

> ---
>   drivers/hwmon/pmbus/adm1275.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 9e21dd4083e9..c27bb0e49354 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -927,9 +927,17 @@ static int adm1275_probe(struct i2c_client *client)
>   	return pmbus_do_probe(client, info);
>   }
>   
> +static const struct of_device_id adm1275_of_match[] = {
> +	{ .compatible = "rohm,bd12780", },
> +	{ .compatible = "rohm,bd12790", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, adm1275_of_match);
> +
>   static struct i2c_driver adm1275_driver = {
>   	.driver = {
>   		   .name = "adm1275",
> +		   .of_match_table = adm1275_of_match,
>   		   },
>   	.probe = adm1275_probe,
>   	.id_table = adm1275_id,

