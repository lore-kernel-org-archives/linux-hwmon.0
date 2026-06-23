Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881D359A91
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241108; cv=none; b=rEJRghhqtR+NDp6+0Om5ZkfJkygS1ijUfpamHjlws/0kLNABo+vDkq6EKdXSegLRqJmod7z4VxfjpKVIH4L1xX/s72NQFaciy7Dv+jB8mVpTEg8KEim613SNVJp2PcRdhApSDIOVvqmSGTOdHrL86EJSSNxOD6YWWDSR6XO2gvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241108; c=relaxed/simple;
	bh=LzJiggBHLjBj6N/HSTkbqtRCMo0V90Y4rJTAT0j39is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSRDjReWhEABX4tFW1p4mWe6QfOfnw1DTOSlRNmgCa0plG0fnckDUOOz6/9A+ISflltLPUu9G+1kXEqWTx7T9wgc2fLQ4G5C1VKmmTtiG1N1ZzT7JQ9bti7nTQJ7Ggh6xMpvFiTj7BFsPX2F7Qdqmlr/YOhKhg3QHG1igdJPetY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXE6iT4x; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXE6iT4x"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-13809223fd4so217905c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782241107; x=1782845907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4lMK+ZpWDYrVOdz5BQ8dYsd2bSHJ/5zrZM2ImjIhIf4=;
        b=HXE6iT4xnXuDuPkrgN8dkz8gsK6nlu4bpB556gOOq8hHq3p/lnnZKLZ+PXMgnpT75k
         XyIPsBtcB61h8JNrbwLvEyIWB/keX8mAdjZRC+H+i8xFz9QGNpVgj4Q81WsON2pnCdoP
         kt1RGMXLumuZP6EhDa/1YjAU2l1tIksO/aL6t1/8DlleJP92+1Pg8vXIRCn0jiY3DYfc
         P8X3R6VhAai/V4VW2U6mPfug0DQFVV960g7tn24Quxh+YCddPfB5jeUlAdjZ2nRtNEO/
         ARLrxW4YXLHkbWBIBggnRakuiHX3kugsPYrS1/heKNEv1Zm+bDEt6xfdBlJiieBAgd6l
         EuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782241107; x=1782845907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lMK+ZpWDYrVOdz5BQ8dYsd2bSHJ/5zrZM2ImjIhIf4=;
        b=HbIRXG+XKlsF95fIkSKisZlOGaeK81yd794Z+dwYd0GdyCLTbLFXUrqxzYbFzFf1/y
         3uNrX8HWPNv/vdy4reZWZiNPwye7i2M077jnOOwEGUMFUrmRS5E+QYM3I6Q43M8GZHi4
         RulxN3kP0nLiZWQghn62oeZCtCDuaPunY0b+78vvaKLTGglfJI9HbETRxN5nOk5Aesyp
         AcRPWtrpTo6Xj85VqiNu12Ge1/f3oeccDbBqS+657LcIoz39cLeMRXOBh2XLjHMVGLp9
         nwKsCRG7jQTzaBsNOVARWQ8uUu+fzfTnVg7aQMZegkrtbfxJwSKy67yfB92oEk/1KydL
         HKQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/w9nMIK/m0YJVy8mdP4b0l1NA9GAJB8ME4lXsldOKH1JxU3F5XUBEr9Qft5dWTk2voGt47mv/D4x8hqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEisFwZ28nySP2kHJK97gwz+d8FsKTmykLiRcrPadGkmrJX5n
	pY3/Mo93GhwQeV+BOyT2i1QRdCuDPRg/BBeHU7VdVnof010YffavILHc
X-Gm-Gg: AfdE7cl3m32lPSPaGIRDWZf73IEJ4YwmH1+GHEIzQ9ThOqqNT8qsME/Dt9D+NxJwXoY
	QW+i0uEC/xXSLuF/qc+O2IjGEy+how0W52dXVBr6mt0qaDWsVEz2Cmn0z7sgiitDZSs+RK6XDKx
	Nvzf6AzDTnmmrLN5abECZMmGTXm7P+EjXbjOdA8A/eP4w2oeOnlGTaNhVY1luVSvLhhAHAlK074
	yeBbTYbfaf59NZwzMVVcci6sfBQxApYx1jE0tIVc9CzD/ycUOD16W3bjyOMNOS1lmLOs3pVyzDL
	aJJfXsMh5yhLQnZEwR3p26Anp6D50+nNY0qpUuCbdqKdJra62qxRxOO1d2GW2gHKTLrEIT8zCZD
	IAaInZgYHL1pxt9lAc6WiNAO0uoznMLxnFvSocNuJooTBkB6FHoNZlBJJpCiI4zMaN5mjNs3UC9
	uvcJTkJI2K647IvotmaLJjRUO1k9EVxMsPl2puNW6w/Tt2O347AchA4KQZ3zdS1g==
X-Received: by 2002:a05:7022:629a:b0:138:2239:be with SMTP id a92af1059eb24-139d0bfe146mr3074c88.8.1782241106419;
        Tue, 23 Jun 2026 11:58:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add81933sm14355280c88.14.2026.06.23.11.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 11:58:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6d34af3-0c4a-4870-a240-f7873621d2ce@roeck-us.net>
Date: Tue, 23 Jun 2026 11:58:24 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
To: Flaviu Nistor <flaviu.nistor@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <DJFPYCV2FXW7.1BFG9DURPZRCC@gmail.com>
 <20260623181625.5697-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260623181625.5697-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/26 11:16, Flaviu Nistor wrote:
> On Mon Jun 22, 2026 at 7:29 PM CEST, Javier Carrasco wrote:
>> On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
>>> Add support for an optional label property similar to other hwmon devices
>>> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
>>> distinct names to each instance.
>>>
>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>> ---
>>>   .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
>> ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>> index 17351fdbefce..f00b5a4b14dd 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>> @@ -33,6 +33,10 @@ properties:
>>>     reg:
>>>       maxItems: 1
>>>
>>> +  label:
>>> +    description:
>>> +      A descriptive name for this channel, like "ambient" or "psu".
>>> +
>>>     interrupts:
>>>       items:
>>>         - description: measurement ready indicator
>>> @@ -72,6 +76,7 @@ examples:
>>>                            <5 IRQ_TYPE_EDGE_RISING>,
>>>                            <6 IRQ_TYPE_EDGE_RISING>;
>>>               interrupt-names =3D "ready", "low", "high";
>>> +            label =3D "somelabel";
>>>               vdd-supply =3D <&reg_vdd>;
>>>           };
>>       };
>>
>> Hello Falviu, thank you for your patch.
>>
> 
> Hello Javier, thanks for your reply.
> 
>> Should we not add a reference to hwmon-common.yaml (with
>> unevelautedProperties instead of additionalProperties), as label is
>> defined there? I believe that Krzysztof Kozlowski did something similar
>> for the shunt-resistor-micro-ohms property. Could we follow suit here?
>>
> 
> This is a good question and I am happy you asked. I also thought a lot
> about this and the reason I decided to go for this approach is that by using
> $ref: hwmon-common.yaml#, I would have to change additionalProperties: false
> to unevaluatedProperties: false, which will evaluate in case it is used, also
> shunt-resistor-micro-ohms property which does not apply to this sensor. At
> least this is my understanding, but of course I can be wrong (I see lm75 binding
> also uses $ref: hwmon-common.yaml# but shunt-resistor-micro-ohms does not apply).
> 

Where does the idea come from that shunt-resistor-micro-ohms would be mandatory ?
That would make hwmon-common.yaml unusable for most chips.

Guenter

>> I am also not a big fan of a name like "somelabel", and a more
>> meaningful name from a "real" example would look better. I know that
>> some examples have already used "somelabel" as an example, but others
>> have used more meaningful names too.
>>
> 
> I will have to send a v2 since for the label property description I used
> "channel" instead of "sensor" (detected by Sashiko AI review), so I can
> use in the example section a more meaningful name like "Room" if no other
> suggestion.
> 
>> Best regards,
>> Javier Carrasco
> 
> Best regards,
> Flaviu Nistor
> 

