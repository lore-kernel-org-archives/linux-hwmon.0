Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E4A394EBA
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043856; cv=none; b=io2LusZCS1XkGFTbbkSfgfqotd5evMHNCJch0I0IQe0oJcQA+wlsFqeVGUJHCP2QXj0BGn9EjHOfdr/2rBWhAVMPvT9ezxDyupiyklXmPhnU/EAUieGy5vNKIo8iYJMXfbxABO2uRUYeobof58EFqf1NGCn2wgxtaZptJNKCRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043856; c=relaxed/simple;
	bh=/EaieSvFrRkr9azTwg0L+lRZYx4M8CIG5/sA9LhQOx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNohw31mzIz9KdRPZdKXXw7Fio/JpAbb4fTKrjHPgE6JBgGEjFJpLUuFWDOLRzE/cuxoIW527brLktAC7abO/X1kvOdsWK2lfC6oXffKYYR6KNNFBOqqTh5AHGQs2GtIVIpPfbnzsXv1pPnzvbt0u6neJHz3SrnkXOssmHaOSxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoRGSf50; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoRGSf50"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f10e55beaso928026b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786043855; x=1786648655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PV21MAhcjbCpKEfp7iHgiEKWEs7SXbwWKXnvMBb01xQ=;
        b=EoRGSf50F9piT25AT6OvDqzB0zm4t1ztxoumZ5r3FXw1Mnp70TmZPRuDvjRjToGe+M
         bs2ZNTKYEEf+n0Cp5G+q0UCKdgfQK62qAGTDkIyPAgwb27G1t7d3Gp4CqNohPZZnLG/Z
         BYtxXAqyVUZGbKQCLVuTLLK8puQzHYPtAt29g14OtJJ+E6YFc2/iIXklkT/aZHdzRFIv
         OhKrEqQBM8224riFA6hMg3YMrUg0EAr5E6/IApBDvzJi7D7JpnozlsCqV2On72ywut+c
         31ZgiluT11UO2ewu/ZhKYDE2mtPQJpjqKYDgvsMrVXYXUjYBVDKI0wsgdWWOqplvRUqP
         UHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786043855; x=1786648655;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PV21MAhcjbCpKEfp7iHgiEKWEs7SXbwWKXnvMBb01xQ=;
        b=qWC+2RzRNqR8HfwlSf52qgjeERNkmxi5iUOfeKMQUa938PuYtR7tTkB5cG9lJLCbJU
         c8UEtX1IdoThe03w8mRkRVcfpzj+MZY21murxKCjpfTmujf7oVMIXSe3w17OHLGBBCkb
         L87iyZ5MqNT8SeEUYHk3mwaY1b3MYxM6fomvZEYexOIL14nBuxJhpK74Z1HONTrDheYT
         Y1clvkc3yxA00D5hwg6Uv0hh8OrUESNPkfFXBPHPLgYagOlmgA5M7W6tjc/FCzR8/bE/
         zqbDqMZCT44Obyz/5rAQqAqvllxBEm6GzoGf/ePCx+0LzyTrSRBcAmfByYwpAcauJ3tm
         GbtA==
X-Forwarded-Encrypted: i=1; AHgh+RrB42ieFjjg+VruALJLVfxiADtUeNgQgq3txunceBJdxh6eKv3iHWVGJoBNhaahqSuKfX76PlSgHvkO+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YybtNYb7EvSU0Ar+I05emrvZyUqnzfvpE9qzcRJLIOqhgmf7sG1
	b5Ycvzsas2T0dj4jWVXmG/4QnuDzw9sTWQnUYn6I0GW6N32b3SbrZhN2MDbwng==
X-Gm-Gg: AR+sD12l59aOkhd+WWAEcy68Sb7bnWLbNMsY25CNbEIxuETq7HDR+ij4kM24T2vKNmZ
	cQ1Qzm15RJQI0rGtGdCKDp3wt87o9SyduEIWFkcF00LAJ4lEhvZ9bkY2a5/dQbThFyGul9ajpJJ
	T5AwjefK2O4NH+XAr0KbMcCHIcQtlr3XGfiE9utVqc8mvwzt72spmiwHrs+ZvlG2x2oOeGDOJBB
	wJbAWric9zcFZe7TnpZBGOJYO9+/XCx5K/XdQaGWBQUbb6uRSb2zF27MQMUMyGoOGc3MgSX0EEy
	EKyUv3GlN0yuiAbh3bj4muz4Chaa3tEfKcJs/g/aao8+70+1yyaypwIGBqBJFPsCeCNLl9TocGX
	3If+/vTByXKzTeK/23q7ucAuHoBkmm8GeRj/Ix9qPAkJU3tY13SUSWUGwMY71mjdNPOQE6A/Vmw
	MAOlN4T3N56QoC4vN2RfOQB9eu4vfDWl0JfMEYf2pvb2RbNj9YcHxA0zBRXzDbWD96OfFoT2v4c
	gpNwq6GDHqXUsYeazGaNsJeYWSHt+rtVrVnLA==
X-Received: by 2002:a05:6a00:8083:b0:847:8e98:9a4b with SMTP id d2e1a72fcca58-84f2e12db9cmr21283646b3a.34.1786043854516;
        Thu, 06 Aug 2026 12:17:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bc10sm1962493b3a.3.2026.08.06.12.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 12:17:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b0305a8-f2a1-428f-85f8-b1b731fc2ae9@roeck-us.net>
Date: Thu, 6 Aug 2026 12:17:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
To: Sergio Melas <sergiomelas@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20260806131103.19104-1-sergiomelas@gmail.com>
 <20260806132452.80AD21F000E9@smtp.kernel.org>
 <f96884d5-7bb2-4646-9175-1b385789690b@roeck-us.net>
 <CAP8e=sJbD21FyeU+9w_CVGLOXhxdWmsCwcrS5uNB0Z+9qQ4gLQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAP8e=sJbD21FyeU+9w_CVGLOXhxdWmsCwcrS5uNB0Z+9qQ4gLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/26 11:26, Sergio Melas wrote:
> Hi Guenter,
> 
> Confirming that at my knowledge this is a non-issue.
> However, using the 4-letter machine type code DMI_PRODUCT_NAME could
> theoretically
> offer even tighter precision, but up to now, the current matching
> method has never failed in our
> testing and field deployment users of my github:
> https://github.com/sergiomelas/lenovo-linux-drivers/tree/main
> 
> Anyway, I am compiling a full database for complete data of Lenovo
> machines from PSREF:
> https://psref.lenovo.com/
> For reference, the complete mapping matrix and DSDT traces can be
> found in the Yogafan Master Quirk Database.
> My database on based on this source and others is here:
> https://github.com/sergiomelas/lenovo-linux-drivers/blob/main/Lenovo_Drivers/Prototype/PSREF/yogafan_v3_quirks_database.ods
> and
> https://github.com/sergiomelas/lenovo-linux-drivers/tree/main/Lenovo_Drivers/Prototype/DSDT
> 
> I propose to switch to this identification method when we have more
> machine references.
> What do yo think?
> 

No need from my perspective, if the current code works.
I'll go ahead and apply your patch.

Thanks,
Guenter

> Thanks, Sergio
> 
> 
> 
> On Thu, Aug 6, 2026 at 5:44 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Sergio,
>>
>> On 8/6/26 06:24, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [High] Specific Lenovo model DMI quirks incorrectly use `DMI_PRODUCT_FAMILY` for exact model string matching, causing all specific quirks to fail and fall back to incorrect generic profiles.
>>> --
>>
>> Please confirm that this is a non-issue.
>>
>> Thanks,
>> Guenter
>>
> 

