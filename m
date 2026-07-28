Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655CA3C4163
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276961; cv=none; b=Zj2bE6Q0KoLHNUDUZUqhzzfzxByqoOKq7CWGe+a/NtUV+SI4sjmwTgcT6G91TKS0ye5fZfDmNbjpbNyQUyx7LjAAMFwgGdF824Ew/a54iZQN4QjoOqjbN9C4/G1C/1gRPOJQ4eZLCf441drZF3SRKXDlt2eEm7GZPaPwBYC1kPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276961; c=relaxed/simple;
	bh=kDmieDGHB7qC5d/ULg3nvfofgN7MilYR3I47pvTTbjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wdr7TCj5OqMNei4yHtbgiibEIG6XiDxsccO5fOKf5g8L6EccxAJ6D6Dt0Eunam6LmnlREc/G627C2O2IrDElQ0dZh1pyiO479aW8x2n8HVxd94jt5bn54OEvLRzfr8ygNH0pKudq2EGfgtH0uPXVlnrpICo4usFpUWkhW3zhVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+Ovug2p; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+Ovug2p"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf50c6f235so4481265ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 15:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276960; x=1785881760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPJW547IHCyCPM/JEAD0xNvj4iqsAXEGGB3Y+0luzVc=;
        b=V+Ovug2plTkb+1XEnmt8yXonQ4hRkiQ39kii1BGDtEbUWm2eGnezATf3qEcEZbOiAd
         VI8/3BKmhMC5jiZQAdxjPq/WNFAErkc8XlCE2F/eSRu3na8cn4KejOJ1iYarZ3EdSTpE
         GMVA5l52KAy7nOTO7xORgqop7BPNYE007IKsXcoRdeUasBBu76jOEkDG5mmk87MikpBq
         cmA44iD4+Bu3/0e8+UTyCeVOlvNhBaUsNBd9t68stOPoq3Oe3pkEJm9XhBGWUo3zcZw8
         D9bXiZVUIzfh+HwIT58thVY2DfeFNKd+teHB9M3U7OWMhEYnqzndbxY01YmvXbw6LDPQ
         rKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276960; x=1785881760;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TPJW547IHCyCPM/JEAD0xNvj4iqsAXEGGB3Y+0luzVc=;
        b=BrKAVkvwA/xGg8FBJjwaQmP2CJTWy1BVQs1F9Ay9TIJcNfiqg2R+hoIw3I4gY5yK6C
         IEhOD0dPDlb/2oQfNbVtW0mjkXK3I8GsDPZ1jiqRUckDb3Sb9RqYNFMoF1vky1xVyoG8
         NWaGqEsPeh3WkGihp4WejaTNa6fgnPWbeFZagyotJzHh02/JPTXwUxtF9n3hUwtKdaXb
         nXvkA9rXbNQtTN+FNDbZOxJC25W/DrSg6HLEFlzkEXR8c12IX3rTi4Ktc8vnINttaoHg
         M8izQYnYOBadYG+aTmFoPoJZUUSCyO9I+yQTcEnKyziYJFNe/DmPzdr+7Ut8V0XbjPPF
         i2RA==
X-Forwarded-Encrypted: i=1; AHgh+Rrhcn1zKPFyDKhwPt4VWHAtHaSuiPnlP+bCXDsUqKoWdOO3OArMLpM1g8h/kIRV03z5qDC0Ww/ZuFrgpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5EoQ4VZ7ZXSRH/84OXREejXJntD4W7LKHi29n9FH7+v8EV4pf
	0GU9Jj4Gyqg+CsvnwJC0b3bNIUYEqP3DFRkBX/mtosvYRLCcspYuKRHJ
X-Gm-Gg: AR+sD13jD5RnTQfAoyFmjIsC4zIEHcYN0MFOu0zUmwtgMWCbnMKDVAWSo3EppyobGIh
	0ghySUGkNluZDAgSz5WBZsFj56Y7CZLLsCIWLEEB+UzrRSfjL3PePzbe7aAe/A5S1ZJApe8o5J3
	SAx3Atz1l9vNG2dkX91ZYGgfCQs+XNr2Ju2D0msC/4bGVDdNKSXgUEZzD0EmlqRvzX7S3vvUqR/
	PVP6F8FmqvRXuA+zIgibrtuTZoimNLrnYPrRBDkQMK85aLGYUbQLMewjb804eDJewuAAionq+z2
	bM8nGDjxV+e/ZzmIfm8T4it7vQ/e+v7VFM+1ACmXZMEHrtWzHkiBgZankd1Pwsv3wH8e8207mPF
	yAJPzOf/LFSkV/+0pGaRBGCclpT0X4c+1Ap+UFTGv/Me7S1ZqteioNL47RJxmu0IRk9fFcLpBOt
	P9PBx5p9KTgU4xwVprjsRw8VHIoVPLelUVQ6+is949OvghMXzAL+rsEjhDzbdC6PptsjhmTVhP5
	aQEWgbS1YFqWLdUll7TUwfGFUdnnOzc8vUw1M+jKcMRvd1W
X-Received: by 2002:a17:903:2986:b0:2cf:bfbb:61e2 with SMTP id d9443c01a7336-2d015d9d17bmr49349855ad.39.1785276959791;
        Tue, 28 Jul 2026 15:15:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc9bd4sm2158235ad.48.2026.07.28.15.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 15:15:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <500573ca-b236-46cc-b92e-987385ccaf06@roeck-us.net>
Date: Tue, 28 Jul 2026 15:15:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-3-clamor95@gmail.com> <amGz2YZogakb5XAv@monoceros>
 <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
 <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>
 <amUz_ilAvq_fBHld@monoceros>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amUz_ilAvq_fBHld@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 14:44, Uwe Kleine-König wrote:
> On Sat, Jul 25, 2026 at 07:23:13AM -0700, Guenter Roeck wrote:
>> On 7/25/26 06:24, Svyatoslav Ryhel wrote:
>>> чт, 23 лип. 2026 р. о 09:28 Uwe Kleine-König
>>> <u.kleine-koenig@baylibre.com> пише:
>>>>
>>>> Hello,
>>>>
>>>> On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
>>>>> From: Jonas Schwöbel <jonasschwoebel@yahoo.de>
>>>>>
>>>>> Add OF match compatible table to be able to use this driver with Device
>>>>> Trees.
>>>>>
>>>>> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
>>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> Please put your S-o-b line last.
>>>>
>>>
>>> If S-o-b's should be chronological, then this order is correct.
>>> Guenter added his reviewed-by after I have added my signed-off-by.
> 
> It's a nitpick, but as you added Guenter's tag, you modified the commit
> log and then your S-o-b has to be renewed.
> 
>> That refers to S-o-B, not to Reviewed-by: trailers.
>>
>> Do we really have to argue about something like this ? Do I have
>> to mandate the order of non-SoB trailers for this subsystem ?
> 
> I wouldn't have replied just for the order, but I think it's convenient
> and usual to have the own S-o-b last.
> 
> Depends on you how strict you want to be here, as usual. I for my part
> ask for reordering or announce to fix the ordering if nothing else is in
> the way for application.
> 
FWIW, my feedback wasn't directed at you.

Guenter

