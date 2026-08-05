Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526FD388891
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940126; cv=none; b=KsDudyGYyonKP//S6rcYwfOaQ9JbimlS7FEIlJMf0u0RvHYxY1rU/ZygI4Nyg3XvYY0BGnQjHWbwDPW45vu8gOLbaFvN6as1/lPp57Ssj+3V+P1/WCFdqmQdQGrIc1EnFjjOblLbGH+b2icbDW9U3ps69Fg3GhVchDlPx/Gw+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940126; c=relaxed/simple;
	bh=JOjkV+yQ1SsbaKL9JXqYGEB5GsOysLYzyrOsVnSlxGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrqE/HjfTxqD5FIZZkrfjYjuOqmfTMjpLBcq/BYV6RaJxwXtDq3xqee0+gC/ezPlouzf7rg7D6hp4nXaveId5AGYmm1OThkPT1d5BnA+fQLdymjQMrgfhyw7ln92QXaC1GqusqOT/J6UdGxCo7N0iA9X/K7QC2myztm/yMIjOhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZW5cA2/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZW5cA2/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1709802a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785940117; x=1786544917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRHVfj7DWEfwIfPe1ALF5FeqpHZEuF1xiC3qCsqXqoE=;
        b=RZW5cA2/yu0Aw1wnOGgeuwTlFQMFCqnykBefzZibBJvRlpHlHMq7tQtC40RV3kx5dc
         KslmMkTWB8GywGQptdT8XdblBb5mIg5z8mMznYExfd+4/Ne9hqzW8VTOz7BghZZoLsgh
         dZEomGkGytsvToFVe7FccFVAGkTmr2CQ086e4RIctfEHZBsq9oxZKrDsdNPCiOY78WKE
         WsFddtpkxAwIc7PwUlLM4we9Jy90+MYA16hNgS7VQWn3vK9AQwlqQjrIbFngOAlN4TPP
         72mhyAmzRXF0U/s9k7A3zJy7BSjMdA4cQn6ahj0V60X1FiI/qPYOKoAYHKrShbU8+cJW
         X/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785940117; x=1786544917;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vRHVfj7DWEfwIfPe1ALF5FeqpHZEuF1xiC3qCsqXqoE=;
        b=TWP11MrLkFbRP0OEc4+cGl+g87Mz6euYM594cJYhj2F/b8Ni/WJhNXEIXagvDSkts4
         vFkmCkU/N6gEkaxz0I0BbhkyvfYzmbin9V9jl5cShz0K1257qvmcOiYbFDF61FWhJriL
         KJSEl+rX8pt5yex4PGh0Y4B5DpXM5PYDn3LvKqf3m1cwYP5+ewW7D6f5R6HcK6NvBPn7
         T4+bul5BimBjJyhJx6u+CJNmvk2eDXFuC2EM7ZYUZMudKs2HdCntCEJm4deQCf0AaiIO
         k7rXkTurgO8ajT5fw1gjV+WLHWzHDIq7IlLGAe62vJCCfdZxgXWm5gbVD1Pl/gXKnIlZ
         dY/A==
X-Gm-Message-State: AOJu0YyCSTsqbLf6BVcgNS40oxpQNmAv1QI5FhrUjIosZY7c7ZfhRmvf
	aZMy2gPzWNpmp/B7YNbmgYzccn9FX/c4e5CfgCA2K5nNVnn5OLBwyXu5
X-Gm-Gg: AR+sD13w4ZD1J/XSDzQ1Lp6E6cgCAlvXZP/HTIAfiLegtDV12oB8YtoVDbLG+5yIovH
	7NC/mDp90mEAS4/XD66MRR+McmdaAuq+jY6hp0XtwcaoibsNlKQKk2TT6wnZIMb4cYoKkXqBvDg
	9jcC6KHfc76e7zi+8DPg7dmIZqU7X1B6/w4XbIizmMUw5p8BrEl/Sw7NB2AI5mRj54mY7OsQQoU
	bl4XD/6pJUCV0s/z3UHsWDZ625F35b2mxABqIQ+ZLc7wePLafm41IhzPL/n4Vt1NQx9jpdrosvD
	AJXLnswz0Gkf7nsurFfbCgZIv6FCvCnsoeLatV0Jbyq/1lmlDgiMfvzO6b1b2pGoBaNXtXfN6Vk
	6a8f7BzH3pyXAhiiD+z3WH99sZuF7P2lf16aurfVwvbYGa7/6JJg6BOt1TmhhzFi0Nohl+MeA0j
	qdYje80kvVskTbt5/iIuGVSEAeRkS2X/Hl4XHh1dP1uHSFd7Rby9/WtwVtN7riYUPgA5970YKTZ
	kHXq3T3F/Grz+52IL3HDOrkzYZrUoh4xtUfeg==
X-Received: by 2002:a17:90b:3bc8:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-3903c550811mr3114503a91.2.1785940116708;
        Wed, 05 Aug 2026 07:28:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df89asm27008528c88.9.2026.08.05.07.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 07:28:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <842d9244-8e00-4df4-89bb-c40d0c73e203@roeck-us.net>
Date: Wed, 5 Aug 2026 07:28:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hwmon: (ltc4282) Fix issues reported by Sashiko
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Nuno Sa <nuno.sa@analog.com>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <anMA34nFCvAQUk6V@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anMA34nFCvAQUk6V@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/26 02:26, Nuno Sá wrote:
> On Tue, Aug 04, 2026 at 05:57:18PM -0700, Guenter Roeck wrote:
>> This series started with a patch fixing a potential overflow issue in
>> maximum poer calculations. Sashiko then reported a similar problem when
>> setting current limits, and finally found a problem when evaluating
>> adi,current-limit-sense-microvolt.
>>
>> This series fixes all those problems.
>>
>> Note that Sashiko reports more issues in this driver. Leave those
>> to be fixed later.
>>
>> ----------------------------------------------------------------
>> Guenter Roeck (3):
>>        hwmon: (ltc4282) Avoid overflow in maximum power calculation
>>        hwmon: (ltc4282) Clamp negative current limits
>>        hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt
>>
>>   drivers/hwmon/ltc4282.c | 20 ++++++++++++--------
>>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> Hi Guenter,
> 
> During ltc4283 sashiko's review was clear to me that this one also needed some
> attention but no time for it so far. So thanks for this.
> 
> Also, the clk_init_data remark is very much an issue. Not sure if you
> can fit that in this series. Or I can also send a quick patch for it.
> 

I did run the series through Sashiko several times before I sent it out, and
it did report a variety of other issues, but not this one. I am not really sure
if initializing the data structure is sufficient, so I would appreciate if you
would send a patch.

Thanks,
Guenter

