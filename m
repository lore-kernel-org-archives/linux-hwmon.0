Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EBFBA45
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 01:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771637111; cv=none; b=bm59QOT4y24EcQh0bGwg+Ak962yniQxzozbCENShKlV/UbBR4QiABlvqyCmSytW/aTfIDXwZW0n2ZyFrymewLzEbRB+QiYTUkqAfJmYZYVX4LYtnmCuqi7DiZYxAoTWvH/VSS83sgZK05MXA+74OgTS6S8glZpV7pE0zG75/9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771637111; c=relaxed/simple;
	bh=8AfdFFGJRQq9lQ6HAg0Gt3kisLntoSpQWQBKXocNQCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVubaqGs7O3XoLsReb/HeAozzF3MCyd+IORpXxoGlXLWL9D74V5DqX3Q9c4is7s4YKrmQDCjJVBYefJw8wptO7ZwBvM/Ns9NUYIg+faEpjG7oXJvRGayP4oU5c8LdekfLqs8juzwaPW5rYQCrsKgJmastdlNiGz8300SoecJoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iu5Ay1s7; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iu5Ay1s7"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba94dbf739so2959888eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 17:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771637109; x=1772241909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uUPr8PJo5TNKKtjOrhpKB8nOTPqFyfkRZt7mLsh19Go=;
        b=Iu5Ay1s7ugQqiqXJRZkHyb1eUx4CrW9DV3Rg/5Yp2OMVpG/N+Xo/BUM0v8WvkY42d5
         81hi4dDGe9sFBdYIlsgetfVgb6dSgsPcew/tt9wEoAwzT0Tm2LngQB+l/kN9nT2PQXtp
         Xa5zNEc/8sluEM1es2MK4U0FRLORYubu3skZdq9upoRPuBOeJ4wsUYvqj3eQbV5Lx3Ex
         3lME9cQnj0B+QptXF+fG0H7fvxyJOR4g+8eBVSGI6OMJal8gXqOUVpDhJ0anHKXrFVkv
         M/UZKwLqzByiIWjSTFQdBGgwO8ZitNDuXl2C6bHoE9ly5bBVL1Zi5WB8cEnaWbEqZsoV
         EFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771637109; x=1772241909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUPr8PJo5TNKKtjOrhpKB8nOTPqFyfkRZt7mLsh19Go=;
        b=RTdksbOCgSSq9sM6KtD7vuXdkutXQBOFmS8rdslAA20kFe0r2HVd8JdYH9MgnPMgso
         OGAYZrFxL/xOG5k3H81HJ2XwZ/3q2WANObPcfUxulwCjlqW60jvvzd7fMJNmATKEQl8f
         MreTd0iFFQqfBbgVeaXHb5/zKKLsAEvtfFzaV6toXckVMuUMvBJX7Ekz4wwfTf9LusX7
         ZsX7bgd8xF+ztslnYh23/87vGYJG3e7uvKGgnKt+4sKbd3tL1N12VaFK9GhI8lKYz9lO
         UZJ4XnPOuwSKsMB+crm4nz54+ARn728ZDL9oF6Ds5lp59rxnE/T+qub4Bt2rdvEmpIZX
         PmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4lspVG22VJi3rOI9tsznRpYkxubs1fc7ZtjUIIuuSI3Ax4jGgiixturP6BN6sLiWMsg1iY0cbjXs2Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTG/YozkuCrn7dJYxVTNXn8EqL2C01F3gUW2K87X3BMl3RQY/K
	zh/DdEi6k72m3F/QUpzDOsfK6Bc6+97hAdI/Ix00OBpwKCh7VO18VuAe
X-Gm-Gg: AZuq6aL8jC/dLCVwSGp2O2DzOyRbgoZc6KgHxTvi/4KcouP682csQgUBmD16e/kxIJM
	TQjBde3Ln6hALHAdCKLhhnYdCoc31ZrDewQ7nADOARWm36uXcvNGfE7prWyGklGGdlvyxEDt58z
	/Tu9fXaN11ATJGUsFcUc3U2wbjREf1aYOl/iuu3CJYLSyQBQt0rDDH55xG1x/InWaWNHIFX2lDx
	L4/N2zHvf68PUY/UBBmfcW3DtsbhW6jZJ+0NE1Gme+9B8VzI8MXIEyR9dBobELjGt5DnaULmo6O
	m7tsvnhHpWO/QsTzFtZ0pKw8FnmVtDShtboHu8mAKOwvnDby7bRNgUcfOcaZpmcF8qgd0rxhbsh
	zwwSnWFhFSE7t6W9w0SUaqL4kVJBJ++4GIrKjrHXFjHUGl5XAAb9sG815oBU/AsODqn4MCvNM0h
	yI3mORu5V8JKUIVWVbbIcdqfsjVWsaj1Jr9rLclqIianA2hBCclD44HaXIILmxjGbDu53n1bk9
X-Received: by 2002:a05:7301:6706:b0:2ba:9f79:8189 with SMTP id 5a478bee46e88-2bd7baea79dmr785306eec.13.1771637108906;
        Fri, 20 Feb 2026 17:25:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af8c936sm1142061c88.14.2026.02.20.17.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 17:25:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9d7aee5a-ac46-47d9-ac26-0f3a63b6a8ab@roeck-us.net>
Date: Fri, 20 Feb 2026 17:25:06 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: MxL862xx: don't force-enable MAXLINEAR_GPHY
To: Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260216105522.2382373-1-arnd@kernel.org>
 <aZMKXavVQPelSXcG@makrotopia.org>
 <306e79fb-f3ee-434e-a90e-547e97d2a5aa@roeck-us.net>
 <c881a13a-0687-4e4d-b70b-900f91acd212@app.fastmail.com>
 <70a195ab-3b61-47fb-a361-17b53cf7bdda@roeck-us.net>
 <aZNEKS-fefEgqhTs@makrotopia.org>
 <316a6ee6-9e5e-4518-8dc4-2f39805934a9@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <316a6ee6-9e5e-4518-8dc4-2f39805934a9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 08:27, Arnd Bergmann wrote:
> On Mon, Feb 16, 2026, at 17:22, Daniel Golle wrote:
>> On Mon, Feb 16, 2026 at 08:20:41AM -0800, Guenter Roeck wrote:
>>> On 2/16/26 07:34, Arnd Bergmann wrote:
>>>> On Mon, Feb 16, 2026, at 16:17, Guenter Roeck wrote:
>>>>> On 2/16/26 04:15, Daniel Golle wrote:
>>>>>
>>>>> Technically, with "select MAXLINEAR_GPHY", NET_DSA_MXL862 should depend
>>>>> on "depends on HWMON || HWMON=n". That would prevent NET_DSA_MXL862=y
>>>>> and with it MAXLINEAR_GPHY=y.
>>>>>
>>>>> Maybe it is time to implement dummy functions for hwmon API calls
>>>>> to avoid all this.
> 
> I think I misread this bit earlier, sorry
> 
>>>> I had considered this when I found the build failure, but
>>>> I think removing the 'select' here is much better: this
>>>> simplifies the dependencies, and allows a valid configuration
>>>> with hwmon and gphy support in a loadable module that would
>>>> otherwise be impossible.
>>>>
>>>
>>> Makes sense. I think I'll move forward with the dummy functions anyway
>>> because with that the #ifdefs in drivers are no longer necessary
>>> and the "depends on HWMON || HWMON=n" becomes optional.
>>
>> Yes, that would be great and eliminate that whole class of obstacles
>> with some inline no-op stubs in the header.
> 
> What I meant above is that I had considered and rejected the extra
> dependencies in the ethernet driver. I don't think there is a good
> way to add inline helpers. Technically, one could use IS_REACHABLE()
> here, to stub out the functions when the caller is built-in, but
> I find that even worse because it replaces a trivial build-time
> failure with very subtle runtime bug.
> 

Lots of kernel APIs have dummy implementations. hwmon isn't really that
different to those. Also, arguably, that would not be a subtle runtime
bug but a feature.

In this context:

If NET_DSA_MXL862 is enabled but MAXLINEAR_GPHY isn't, does the system
still work ?

Guenter

