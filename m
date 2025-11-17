Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9316E302776
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400056; cv=none; b=CmhMAfueSyK1WTzr1tFyXltl4SalbItEggb8TlEOceB2b9sHlgzSMQOoohT2B7+reidQGErzgE3ogAnc61wX5+vattMKrPpgTnJ4yJYFgh1WOYBGzPh7nREXlEIw7FZ9N63i64EahhsvB9UkybNIQxNj0VXoR0hu1hXOFtwF4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400056; c=relaxed/simple;
	bh=N4OICjWEM35NitXoukgsLTOrCTT5LoB+ud+4MZZV7Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmdmVowuV4HtsLbfgamOq9Fi1uPE2FCwSBr38atut2yStDLSeOPio4G5Q8vwywi0KKNMtZhIzsQPn5xuLVUkAs83NLQ/qvPm8ZwsTWu94/t4GiCh+AYeJiluUaMZJwJjkYl/WSTqZv1Trf58zLtiymQ7tghcUwQTWKSZUp3NGzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPIjF6JW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPIjF6JW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so1489866b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763400054; x=1764004854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WOXJb6tLZxFRr3JXPqe6Ykg/5b78wxUHm4IKECAipgQ=;
        b=VPIjF6JW6rgVmConJmdbt9hvSH3R1BB0X2WRWvFkCcR+CKJnYvo3Wa0cEr6LRDxkNI
         yfnWCovAbTjXcE7Z0IOGjcXOMcrMyj0LwujlxUVVL2co3uvB8ABdWxRTnQ7udOuyZozT
         8f80PSrbKlPK2D4TPuSka+Zt0I6TB+SZVpOADP3guh4SbHw04OoRDN0j4e5CyjGvgAjn
         bIEIxQxoeJVNJSQz5EmVa8KbIhmIlbl4Inw/GvK5B+kYgcab2QZra9UzSjheRLZRMfw/
         OuVNQixe5kjt3R2EdskiI5jXNWl2h+MfK+Y1a3rQkoJs2kPNuMgeBIv076ErUnYpzgJ0
         HY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400054; x=1764004854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOXJb6tLZxFRr3JXPqe6Ykg/5b78wxUHm4IKECAipgQ=;
        b=fEWKrH90jLP9bSEvA3t4wQXQjCF5Ix6PC6SIC+Otta9n2516pJ/KPHykVGnPBWe2x/
         y+mxSP/w/2zEPnDKBKXHvQIYOHcqHQ3yRxdtr97rvRws2ihWONfhin8fRQEl3xLBRhWd
         z/uxr9Orsu5eQ3m2uZsAe00MzVgQyW6wwy1TnBPal1Bu4i1ITh124L294HNT6aBKuHIK
         HoLKzYSjAD0Wxj1+VNAZ2lS5pNk5w+JDgzEr8C1RhNv2vz9FUwLqXOZvLEoUSHFsnP0t
         ryR8JSOBAZ9jpB5XbHVuBqXcQdwiBTIvIYHhQYYcoUVUmy9K+t69JLjztrG/IKBcP87B
         HkRA==
X-Gm-Message-State: AOJu0YyGjMCFbnr3hnrssVg8NV27GCNWpFnDZzYT7YJCy09us+v/X2St
	fKJogV9ZwKEklm9aXXK+lkT6JFZEVL5rYF3pp3QsdpqA76ghbsLG5eIcPfFLUg==
X-Gm-Gg: ASbGncuk4L1qqbqUQBb7a8YvobndBNcjoEKa5ZC5+E8CJ8kd1+a+5CI/Lkj86eebMuX
	A+4JhyFGO6IWWDKE0YptQkXUdEHhkRrDJ3f5eqhXy6QEhwu/AOuLCHbZRUDoAPYKzjizri/4g45
	zqeQsPXG7pGUffN+c8Bgyrk5+CsY1+yNtq28adwW4MeB241HKpXQuNuH6z+ehIZybtgJyFH9lAM
	apm/pbu2sbtYs0PtlnvH95mNQtzFrEeUtKIBd5zcqVh56eQdcV7wujY8FkoiopjkIhHApZcT6H9
	DcgnHy3xJAL40If2hmq7nVz3Bb2cbNmFhdJkW16VUBk3PVetdXBVffUFImxRVpZxrB1VCWYxmj/
	T52OEcnK8n4SQNbv5zS3h77q2kGUEse7k+I2KpxwoCUOy3y6jRGi+f0bMi8QLZJutjNpaymwQ78
	OTsGpb/twIsfFy0AgVe/TEZMEEiu9jYx2Od5p/qUa7a/FWZi7O
X-Google-Smtp-Source: AGHT+IGiuPgilFFIVTQdoI2iCaNugOP3ZzSNCvhPLTZaQJ4g284DVmjaQdFkJaJldSCf4SPz5kqN3A==
X-Received: by 2002:a05:6a00:4f91:b0:7b8:1a40:c27 with SMTP id d2e1a72fcca58-7ba3b4ab380mr18156279b3a.17.1763400053646;
        Mon, 17 Nov 2025 09:20:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714fc5bsm13805506b3a.48.2025.11.17.09.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:20:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8612b5e2-d2e4-417b-9da9-b4cf1d13ade9@roeck-us.net>
Date: Mon, 17 Nov 2025 09:20:52 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] add Via CHA ID to via-cputemp
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: linux-hwmon@vger.kernel.org
References: <20251117.133746.173713564005237147.rene@exactco.de>
 <9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
 <20251117.174214.275632644162861879.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251117.174214.275632644162861879.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 08:42, René Rebe wrote:
> Hi,
> 
> On Mon, 17 Nov 2025 07:44:04 -0800,
> Guenter Roeck <linux@roeck-us.net> wrote:
> ...
>> Your patch does not apply to the tip of the upstream kernel
>> (v6.18-rc6). Please
>> rebase before sending the next version.
> 
> strange, does for me with patch, anyway, will rebase.
> 

Yes, it does, but the parent SHA of your patch is not in the upstream kernel,
and thus git is not able to apply it.

Guenter

