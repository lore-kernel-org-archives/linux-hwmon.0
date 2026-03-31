Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650904014AB
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969315; cv=none; b=J4XlgJoC2Inc22sfkjAo3xmCiOLypHK3s03kGgOeWPLrgQXd7Z7iQei3fRhLdhkIsCcILTOrmAfLMZnihh7/nkiCL+OtNb81sERp1K01N01UY86tHLihrETtnuNxSV/6qY3EdCzJ+tHaN9xlQf1yCLT7keg/qh1WDEX8YnWu+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969315; c=relaxed/simple;
	bh=rSYLjCk6IgJkg/whsFLGVYnaLuP+teERQJMM42oT9Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBQ9IOPICREskzfEB9iBwoPRR37xFw2AclEHUOBblRGXZ505mIXIJWPFx/UE52IF/8HGRibQQ/fIKr7GK1Ab6kYOSsRY3/vr5OYxtbee4AFb7SqVTxOgiMQC1yuQgzhqZXZgt6VAT5PBonugVT7JrknBMy40hsT+V7gPtvDt7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDL5OCTv; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDL5OCTv"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so11276317eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774969312; x=1775574112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KM48wfeSc/4p8XXkPbWP3jeOVfxI7DUMwJdlSUh0N8g=;
        b=UDL5OCTvF0p3cuPkVKJICIX0g4vAfnQfb8lIwEVV2Sev4ADNMDSJ6wtajNzzg/Ich6
         d38IC6M1qRiQvMzHRSMMS5zU5xMpeRCxmMu0FzSHnQ+mQtT2/A7kKnTs4cWqhuwMyYkg
         kxBGMjRXNYxM8j4fm3eNQ24riSawT+8zzXuNNEHWbPFQG7yrq9cLjCXi8dkVW3eiLIbn
         /3vEG+2abbxmNzgktAqA2oYpj0Y36mJTCezLwlYi5QWeZTXDcfPgZSHO0Y/6PS47kbAs
         39oTpOqZFeAQEft7REsvjr4nh7Ay9dDaQOLhOp67/kyc459HScXjSnmZ2LllFCuYs+Y3
         6ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969312; x=1775574112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KM48wfeSc/4p8XXkPbWP3jeOVfxI7DUMwJdlSUh0N8g=;
        b=OQMflOhSWiiB/AT73U1QW37yg6BFmhae/dvBkHI+YjEQKrKToLzzHzek0psdQCALFx
         rHbd8QqLewJB7TFWCLR/cByZaBVq4xEmmRAJJr/bGIb75UEx7nqoyZDBuTFz3zR6ecNz
         /LMtGfVqwc13RK8ztrh2iXat0ImoFOFxWr6ZofEylyUSI3+EETLmqmFuE8EE5ZA0V4ok
         JMh1BdlY8yhmAy8NfjlGE/jomjTl/PT3EnZ6F/Vndhzs929VSTdqVGR7koq9fLOhmbRG
         lDU90ZDeX0rKAD8hXj/6PadesQsuDevvTLjz7I1oThY+S5Pwb1F07ZvgHf5xZnXSUYE9
         188g==
X-Gm-Message-State: AOJu0YwFnwTEGQsPr9EAFN+TyB7GtAdKLR2qLvxfJTXIGQLwE5MWh6x2
	al2+Ms1cmQZEMarEsLYunRNrXrEOM3cYBBzAXF4A5ancwdCVdbttj9N8
X-Gm-Gg: ATEYQzzBNjUklLIwxCG6eEC9zatFe1vPEoF8oKOin2YAXzNuviY8u6YKrku9wtb4Bof
	KZDJwh5LP8B9LFLmXTtQp9OAPMYsDOkMuGab6LkgRn1Yb5EIQRI5c+ERgG7cmWooyPRc/aucUP5
	bZYmr/NMBsTWwhzxREkdq4pUCnvSYiSxYu60Ajo3JpJwrZy8cqBhf6Vu5J2/Qbvv3zn105Vuyo2
	hD6iq0eTe7ePTm+np+ZMZUFx2DX5dQlp6nME/4qJzngyG1A+WOOVKaEp5qedfD4RKCyfvkSAihq
	f7eW0bimFLaeWR1ZLoq+JHf6Jv5nLki+VCVe0O9PyugrYnHaB18vqXq6NEgo4t4O3B3hkruLg1v
	mQ0kCaEh/exHRt7GJdw/UXkuKUyHbBKpW+lR0aZVaqfDaqAT3tyvEeGWGWhJAmNnN0zT7UTaqzt
	2GzjOYuI/b9BxbIS4id9oR+nm3Ysr60GnhmUT3/OdNUpCk47hq7lu/UV423QhwnYpX6dxyRASY
X-Received: by 2002:a05:7300:f28b:b0:2c3:fb9d:cd28 with SMTP id 5a478bee46e88-2c3fb9df488mr4950248eec.10.1774969311623;
        Tue, 31 Mar 2026 08:01:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7483ffcsm10157464eec.26.2026.03.31.08.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:01:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca943191-5490-4640-a940-0d325ca90f4f@roeck-us.net>
Date: Tue, 31 Mar 2026 08:01:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>,
 Corey Hickey <bugfood-ml@fatooh.org>
Cc: linux-hwmon@vger.kernel.org
References: <20260330230836.314311-1-bugfood-ml@fatooh.org>
 <20260331051653.332155-1-bugfood-ml@fatooh.org>
 <CAB95QASo+qOfFU3tFgowcvyKSyj6Xt+2dE2dDkFV3YrPYWcLbw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAB95QASo+qOfFU3tFgowcvyKSyj6Xt+2dE2dDkFV3YrPYWcLbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/26 03:39, Eugene Shalygin wrote:
> Hi Corey,
> 
> you are correct, temperature readings for disconnected sensors are
> negative (-40 or less).
> 
> On Tue, 31 Mar 2026 at 07:16, Corey Hickey <bugfood-ml@fatooh.org> wrote:
>>
>> From: Corey Hickey <bugfood-c@fatooh.org>
>>
>> +       /*
>> +        * The address of T_Sensor can vary; only one of the following T_Sensor
>> +        * addresses will be used, depending on motherboard model.
>> +        */
> I don't think we need this comment in a reverse-engineered driver.
> 

Good point. I guess similar comments could be added everywhere and just end up making noise.

On a side note, this version of the patch was submitted as response to v1, which
is discouraged. Corey - please don't do that.

Thanks,
Guenter

