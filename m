Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86870155C87
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 00:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769992181; cv=none; b=QGF8qQJ4j0ipZ+Os4hcs0bDTUOQInlpqF0cNemf3CxAzbuyHMwMysUwwpTPTLo7Cgi92dFt7WSKq81/QLhykb74TnmsraNBS1ilj7KSzCEtIdYaykPRdENcZQlKPHkQcX9Bshl8DNseHFzeqLB7Z+merwXfGb/1fwXGgRxp2CLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769992181; c=relaxed/simple;
	bh=6SFe3Ghqu8kb6cqq/+mrrOvxiNsxEDyfe6FJhD8ydZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=le4XYM6aW39VOL0k1n0/TptS4J0gAWZs4ZE7RjbpMngcoSrbMthc0An9heecPGxsU+Bo+Kx244QKchamYy1ArPzqB0jPzweV7RTdyDlUriSFgwRAkKfQt23jz9zCbaaOummecP6jZXMqE+acK0qKjKVNqYL/LuoV0CzWN0CAuDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYQk8XQo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYQk8XQo"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f47610542so2076517b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 16:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769992180; x=1770596980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aiJyNVeka4jGyWbpUJLioxLaUjYpoLttjwErqJDkxhY=;
        b=cYQk8XQoT/x3PDVtUEHJROmSqh74fU1i2NGhFL496dR1mS8NWZt+aydoB04x5MLTkJ
         7QPAABkefseEelmfBIZgQKAwW3woe8EDmOc6gKGAehf5jhq3l5jjcP8eK+YIgYYvlCQc
         cmKGsw4Exp/P03oyVwfML3jYQes+Kr1kOEpbcis9xYH8EaKcrVNaijeShfIfwth8JkYq
         LOTLww+xLET5woUj4Kl3DRh2PwHQP5uKsBbgNWQNSLn/NrN0TeALfvWSgmisrjsfgI+S
         Fs9S2YgW6djPRmR7S5fFxh7eyZ2ATGN+gFk7uWp12qJd/78wJvjyJtSXgtP8blITUngK
         ZEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769992180; x=1770596980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiJyNVeka4jGyWbpUJLioxLaUjYpoLttjwErqJDkxhY=;
        b=EB4PvTta/17XyMUwgjsT8VWbIAbpbw87DF15b+BIVY/jQAKtSMA1i6JXdvT0rhBL+V
         UaVOImiFdAImCpLoDkGZ8rMcojtH/rHp0yrmPr/sC4i6uf6+cS6kk9JtZ1X9LhBYWoTB
         Z3dUaA8qquNbUmTz7MAr8j9AiJ22G4eDywGQfdMzQSkxTzmOUeTHcaoBJChB9vivyYPg
         Xds3iRANKICPIujtXxwbBP2I5VMqcY8sI2wBbnWkAtK95lKj9jkuh/upz9zm7WJkZXIc
         2jDd0c/6mCLIIvlTgMoJKZazqn9HIcfV6x244PH3NC1QlA9x1Gt3G5wEYe+VvxJ7KG7f
         86qA==
X-Forwarded-Encrypted: i=1; AJvYcCUHKNlBA3vA83nTawLoVcl4zslFzGvUoCpuPkSTXHwVmLSess/rUFiit1xeC9oYzM53KKTK+9Nl7Fsq/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcisk3df0OpHJoyi3BRHt6c3k4Q0ORxD4W0urzGIyQWY1i/I3
	FoBDKNiDsZOVua5CdDOTF9coO7c4VhCPqbXBQz+4koNh7ka5dZ/l+DLs
X-Gm-Gg: AZuq6aJA8NyhluLRwI6xF1CS7XkRMEED59S7kkD5qpXOK26VM8P7JN8PEMo8R1kX0/P
	x477iZ7oXH+bYGb1ExM1Jawv/plUpGhd3kh1dbOLINUN6+4KY5J+UV6750+n3PHifE0KtYY4QwF
	2MgftbyyQ59si+SzLv/kKE74jvvqODx41y0xClQC+vps17TAS+BYrv0zGMjkHYw9wmwVez2UFOW
	puGQnd1nLRv5Za0CUt9kakbfSG42dRHwJ44VYwqqA6GYbJg7OJYXVx0nbLm6jshOUhyx5aYiYt9
	6DQHQUecFOGSnNIRI293thg75sD5THl7YeWANCL48bzwY9sg60e89OKTPRCp8Vt12MwQc3XLPxj
	LAzeYcLktOOn0WTeMqLFbKfrez00/0ui4CFiJLXyyPsR5rr/W2F3LpGtQR5bNF2X0Mfx9l58+iZ
	zRkJQJMSv+5K63dMKQJakrwQah/emUz14FbPdXfYRwI0vYhCVpPkJUR2xXo9UVzrM4KP/9CJo=
X-Received: by 2002:a05:6a20:a105:b0:38e:87b6:9b53 with SMTP id adf61e73a8af0-392e005b53bmr9760363637.30.1769992179862;
        Sun, 01 Feb 2026 16:29:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64276efb16sm12801668a12.4.2026.02.01.16.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 16:29:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <787ffcff-28cb-43e0-97db-19dd7a996d13@roeck-us.net>
Date: Sun, 1 Feb 2026 16:29:38 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: ashish yadav <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ASHISH YADAV <Ashish.Yadav@infineon.com>
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net>
 <CAJKbuCYcRMrX5H5rWXWXOz4FCZi5iu8CCE2Oi3WEsWqEikqsYg@mail.gmail.com>
 <f0d230be-676b-47b9-9565-22319b8e62cc@roeck-us.net>
 <CAJKbuCYUCr-R-91Ou1y6XDEPdqabSDvCxUypc-YmW=-EPxgNyQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJKbuCYUCr-R-91Ou1y6XDEPdqabSDvCxUypc-YmW=-EPxgNyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/22/26 03:42, ashish yadav wrote:
> Hi Guenter,
> 
> Please find my response inline.
> 
> Thanks & Regards
>     Ashish Yadav
> 
> On Tue, Jan 13, 2026 at 8:40 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/12/26 23:24, ashish yadav wrote:
>>
>>>> The need for this, especially why it would only be needed for PMBUS_READ_VOUT
>>>> but not for any other VOUT related commands, is still insufficiently explained
>>>> (and I failed to understand the rationale provided earlier).
>>>>
>>>
>>> It is specifically needed for READ_VOUT as it is being used by
>>> external controller to monitor the rail health.
>>> Other Vout related parameters are used internally in the IC to for
>>> output voltage related protections and does not impact any external
>>> decision making.
>>>
>>
>> Sorry, that doesn't really make sense. How would the chip know to match
>> VOUT with its VOUT limits if both don't use the same scale ?
>>
> The chip telemetry would still show Vout as 0.7V as it does not know
> about the external feedback resistors.
> Hence, no need to scale internal Vout related parameters.
> This scale is only for external vendor use to tweak their telemetry
> output voltage reading.
> 

You fail to explain why VOUT_SCALE_LOOP - which is supposed to handle such
situations - can not be used, and why it would be acceptable for other VOUT
related attributes such as VOUT_MIN, VOUT_MAX, VOUT_MARGIN_LOW, VOUT_MARGIN_HIGH,
and the various VOUT fault limits to show the wrong values.

For reference:

VOUT_SCALE_LOOP:
"Used to account for any external attenuation network on VOUT sense
  feedback and provide correct VOUT reporting."

Guenter

