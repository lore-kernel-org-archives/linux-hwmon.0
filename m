Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F75031D739
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Feb 2026 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255040; cv=none; b=dlzr1nXEO9B/1P1Tc86EqMg6fdUJGK8iNvYRUIuejOFscfBh1n44y1OYEhB8guZHBo+IEJtSqq35WclwlTGzxKapFwjZwN3WP8abrEWmO2ju6EA2AFuDgBzDNKq6arzJZfFIWBjHr6DnDX/zVBIQOwkwWBSo9ZhVtFzhc+TO8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255040; c=relaxed/simple;
	bh=HVqIbhWqa2dWbzKPrO+eXBu0tIwhzEG5l+aITsm6uoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i70PeL/2/Li7/dedalmBxFIb9mgdLscW8cmg6/jinMYEpvWklNtfVOXxEm+wyUQ2GQTjLeIVcV/1hNE+ziwL1O1Kd4njuHGjsjloiyZGDAOsz2SIzVI0dIrFZpL72OCfnFu3Ek9uB1hkPaB3dgUaWeIyrOhp9/QcM86+jHkAUNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYzaxfOI; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYzaxfOI"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35621da1a7dso2154467a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Feb 2026 07:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771255037; x=1771859837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dCE3gF12Qsuc0Q0S4BkQq+M+t5dj53pHezYMH10XfpU=;
        b=lYzaxfOI4Zr8wlkdwGOezn/+ni9zjEQwEoNrtDNJ8r8C9GQw5cNh4LBHKDc6jDfQqj
         BrITYa/dHg0zitjKuBiTjIy9T22QpLLc+GOHJAlobd67u7AIGFTXA9/B+PIL2/RUkxB6
         IXQE1TkGxinFNpDBotgx4PcpsgTbTrXpPkGIJrgn4NWt8XqpLZ6/LvNQ16nQoBEjIwF5
         Zl914immoAN7rAnMfbP8d5e3CK2Vsp6IgEJTz3V4LqMg4qW96w93vTMf5jCPYNv3qY83
         bnjpOSiUphLRoM+XdnM0zXzaOBjKBPO6teFy7Ft6Co782ThrPInSfQ9iCLX4o5TqJtdj
         P51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255037; x=1771859837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCE3gF12Qsuc0Q0S4BkQq+M+t5dj53pHezYMH10XfpU=;
        b=oxQhjQNAjZ6wjgG+LowM8F08jxnAM4sw8s4+xFVe8La3vHH0zLlWW9eZ2n5G2HFRhQ
         AHmaCFqK6CggeJvJNLJElCaRPW5MaRUuLbu/kzwTU3YEGy8Ne/R26iBwsRAYVNh0HLIF
         FSbU1BN2whh71agAPovaIiJWQmhT9yoUtAOZLY/hpj0td6LiP89M9yzmyL1mzO4TjWpJ
         IY1zqH9kZezSdvRdf99opJ6A+1I5fjaguFy7zgbmsAF1yK1OKben5u52xvJ+oX0+5hp+
         Vc0xdoJ2NJPp8K3Ay/I738aMTsGbgdDHEZjHhc5pZKeRPrg9TTjrYKSPj66SxOJpHC6m
         HPRw==
X-Forwarded-Encrypted: i=1; AJvYcCWapatx/QVxWkR82iNfL6BrxsyTzSP2DvOBquk2a9Eiqq7GPI4nC6CcC+QO0ZzKhdr4kxdPzhCRbwTf7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YydNBnO/0zfI4Z+KLK0b16g1I6GV3/jsvs6H1FeNwuFVtH/Oz5a
	a8jJ2pXByubwaK1nGDfUr1F6/HL5+I7RweRde8NQ20MIndU9wCjgES9G
X-Gm-Gg: AZuq6aJTVzQ8VvWhiGmtgjeWjzsRUvIM8c8xROGmtydSFks9FgnhMMJsd+4EERofUJD
	xYcJ37rEsGv6NcBo95sqjRop2ykborvL0TZ3jJBpgLKuhQ3Pd1tmbj6uqOyfnglQaW6CXATclvs
	RfNG1ZATzakQ4FlJrNt+cdVem0VinPFe2DaqoWfZ8flJVjAbVUFWgoyZ4yxqoRtunnI/obNpiIf
	wP7uS+4JQiLFn4Gg/GXjYYc8SJ/ZlXwJCHc1VpV5NFqnN3U1CwSrinIxqGOx2mJI4D3Rro/1YK9
	3O8na2LwAyyJR0+3MCXgnwFEsG8pqVazBBzVKjtSt5Hv5KAWtrvtkdutFbW8CvTR6SJyJpYroHU
	2btM+DHtWrl59svS8G7E1fzVJjpdszPSi/mG/J95MnN6uQm+4eGKqkYRkvAtSIOPnQG+GPCWHeD
	8c/WX5MdNnFrBgo9BUfj+aYaxMMjU/HaeMnLvoIJi2ic7OSKklyvb5s3vjNGHmlL4rotYZ98OkL
	Yxj5GkKaxA=
X-Received: by 2002:a17:90a:e18b:b0:354:a1b8:24a6 with SMTP id 98e67ed59e1d1-356aad7a8f0mr9075642a91.31.1771255036757;
        Mon, 16 Feb 2026 07:17:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a6b17c47sm5781823a91.2.2026.02.16.07.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:17:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <306e79fb-f3ee-434e-a90e-547e97d2a5aa@roeck-us.net>
Date: Mon, 16 Feb 2026 07:17:14 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: MxL862xx: don't force-enable MAXLINEAR_GPHY
To: Daniel Golle <daniel@makrotopia.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260216105522.2382373-1-arnd@kernel.org>
 <aZMKXavVQPelSXcG@makrotopia.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aZMKXavVQPelSXcG@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 04:15, Daniel Golle wrote:
> On Mon, Feb 16, 2026 at 11:55:17AM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The newly added dsa driver attempts to enable the corresponding PHY driver,
>> but that one has additional dependencies that may not be available:
>>
>> WARNING: unmet direct dependencies detected for MAXLINEAR_GPHY
>>    Depends on [m]: NETDEVICES [=y] && PHYLIB [=y] && (HWMON [=m] || HWMON [=m]=n [=n])
>>    Selected by [y]:
>>    - NET_DSA_MXL862 [=y] && NETDEVICES [=y] && NET_DSA [=y]
>> aarch64-linux-ld: drivers/net/phy/mxl-gpy.o: in function `gpy_probe':
>> mxl-gpy.c:(.text.gpy_probe+0x13c): undefined reference to `devm_hwmon_device_register_with_info'
>> aarch64-linux-ld: drivers/net/phy/mxl-gpy.o: in function `gpy_hwmon_read':
>> mxl-gpy.c:(.text.gpy_hwmon_read+0x48): undefined reference to `polynomial_calc'
> 
> I assume this happens in case CONFIG_MAXLINEAR_GPHY=y and
> CONFIG_HWMON=m, right?
> 
> None of the PHY drivers seem to adequately prevent such situations,
> which in my opinion would be worth correcting, ie. by preventing any
> PHY driver using HWMON from being built-in while CONFIG_HWMON=m.
> 

Technically, with "select MAXLINEAR_GPHY", NET_DSA_MXL862 should depend
on "depends on HWMON || HWMON=n". That would prevent NET_DSA_MXL862=y
and with it MAXLINEAR_GPHY=y.

Maybe it is time to implement dummy functions for hwmon API calls
to avoid all this.

Guenter

>>
>> There is actually no compile-time dependency, as DSA correctly uses the
>> PHY abstractions. Remove the 'select' statement to reduce the complexity.
>>
>> Fixes: 23794bec1cb6 ("net: dsa: add basic initial driver for MxL862xx switches")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> As there is no compile-time dependency, this change is fine.
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> 
>> ---
>>   drivers/net/dsa/mxl862xx/Kconfig | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/net/dsa/mxl862xx/Kconfig b/drivers/net/dsa/mxl862xx/Kconfig
>> index 4db7bab21a71..3e772298cc89 100644
>> --- a/drivers/net/dsa/mxl862xx/Kconfig
>> +++ b/drivers/net/dsa/mxl862xx/Kconfig
>> @@ -2,7 +2,6 @@
>>   config NET_DSA_MXL862
>>   	tristate "MaxLinear MxL862xx"
>>   	depends on NET_DSA
>> -	select MAXLINEAR_GPHY
>>   	select NET_DSA_TAG_MXL_862XX
>>   	help
>>   	  This enables support for the MaxLinear MxL862xx switch family.
>> -- 
>> 2.39.5
>>
> 

