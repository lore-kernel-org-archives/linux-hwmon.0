Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAB41804E
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2024 05:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713765133; cv=none; b=ZMKboLaY8mgGbVrKKQgeXfgyLQx2WLTcdLPAJSxwNB0WFs76DzhIAO/jt8OffAjFY9n+zaSjfbdRZTK8N9pm6S3HNlmOq6tl03UUIM5U/zp6G+QfV65btKJGSrF1PN5kF+nWt4T9FHFANlgsBY4FUpm7DeRn0kucdUg7LVhNsnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713765133; c=relaxed/simple;
	bh=TxQUciVEnGFCKIhiOQPPvv8IseNZKshmRL1p3LyPowc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrT8a8tDS04FkAKnZxIIZ+ZJWZLgk2VQ9VSgvEEj17osNQ19rwO+ga2QoJTvlX5Tt/KYW1bqyEGSSLZdnxdJwlbgi7X0jC3vYJCDG4dbH52BITj0QYSNwsGgvdvX1pW4yjj6GW12jy4cNCtorGvUbKxdV2Yd/7S4VaJCEqzIuYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxpiCznx; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxpiCznx"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d2600569so4986689e87.0
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Apr 2024 22:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713765130; x=1714369930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yS29vThG06rh1rP64dQkWUwKf62kA7HWXn+snVcWWCg=;
        b=lxpiCznx3pW2QttM8hYUhdpJggCYlKUV6IzDXKYl1i3ur2I1QdmiI1IOTv4SiXNUYD
         FM0GbMci6QGDWq3BIGOKRsTKiGo6nmDjQ3njNPcJlqlA7/7ZkCfVj9U84A0ficVPqwmG
         686zm2b2uciH9BW8CdFc2hTnFNe4HWEbW8toY33+3+twLOSytu9bmdixj/jcbIOU+pYd
         oOhZTnjkmEOgVYol6UIkM4LBMH3FHnQ3NeaNuLvkE3nsuNMHI+kgeM/EUFb+tOluS8/5
         FWwVUSwIMRbyzupWagjjPXzogieZLUBcx23M3RKEQAOKm76KpSU33C/HvRpDurKVqb9a
         sEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713765130; x=1714369930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS29vThG06rh1rP64dQkWUwKf62kA7HWXn+snVcWWCg=;
        b=ipslMjzAN+1dCDlolaBCYviOOIdYwiXkXkcwZ2aCsDEhS8N0zuORmodh0hWVIbN4YB
         ws5eMQS50MxCdbcfOZQQ5yR8vIOvZonLtT6oopFEkE6VVREm6qmfaTAPBCmKM+wJf9d1
         WryHdI6PaLGKxL7Zgzxp6rDfSsDl2PA6NvU1H17dlzQfr6MsH7nQWlCemxTnAK420pmC
         OiyGu+QA60XOdwW8H6c2zIPvfgT1YLWDibql9RfD4u/GZSxD8aO4qIgV23QOGNLQimOq
         CsDbSHTfvnEJKi2BMX1TsvqwXC75H/j7cz3BS37ALcaWf5x6BSB9JgFOlJ8XrQ3sppVH
         aqhA==
X-Gm-Message-State: AOJu0Yxb5tOc2xvIy+Ogo0bpBCVzzx5gVq3pJvLsq81SzczesdXqC2qa
	iydRgwiTqUnpThVEfaL9YZrATaGQPMDUZA1JkQAxCcDLL763mhgu
X-Google-Smtp-Source: AGHT+IFzSHLAky22cDQ62MASgUpJjQu3qXPO3w2BM3nxE3HKK1ZjTY6NG3mZ1AvvxrPLHjXUEErX2g==
X-Received: by 2002:a05:6512:33c3:b0:516:d55b:3123 with SMTP id d3-20020a05651233c300b00516d55b3123mr7877171lfg.20.1713765129803;
        Sun, 21 Apr 2024 22:52:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:7426:df00::2? (drtxq0yyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:7426:df00::2])
        by smtp.gmail.com with ESMTPSA id n23-20020a05651203f700b00518a3f2e3dcsm1641274lfq.57.2024.04.21.22.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 22:52:09 -0700 (PDT)
Message-ID: <2cc46844-75af-4da3-aa56-3f69a5ed3dfb@gmail.com>
Date: Mon, 22 Apr 2024 08:52:04 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in lm90 driver regarding GMT g781
To: Guenter Roeck <linux@roeck-us.net>, Aleksander Mazur <deweloper@wp.pl>
Cc: linux-hwmon@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20240420183427.0d3fda27@mocarz>
 <abc624f1-e1cf-4933-b2e8-a6f3d46d38ef@roeck-us.net>
 <20240420223824.624e725b@mocarz>
 <04831e1c-9957-4750-b438-9d5395b8fa45@roeck-us.net>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <04831e1c-9957-4750-b438-9d5395b8fa45@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/21/24 00:20, Guenter Roeck wrote:
> On Sat, Apr 20, 2024 at 10:38:24PM +0200, Aleksander Mazur wrote:
>> Dnia 2024-04-20, o godz. 11:14:06
>> Guenter Roeck <linux@roeck-us.net> napisał(a):
>>
>>> On Sat, Apr 20, 2024 at 06:34:27PM +0200, Aleksander Mazur wrote:
>>>> Hello,
>>>>
>>>> I have a Wyse C00X thin client which is apparently equipped with GMT g781.
>>>> It is (or used to be) supported by lm90 driver. (I have a log from 2020
>>>> where it was simply working fine; it was kernel version 5.6.0 then.)
>>>> Now, with 6.8.7, I get following error:
>>>>    
>>>>> lm90 0-004c: Failed to enable regulator: -ENODEV
>>>>
>>>> However, when I just turned this message into a warning and let the driver
>>>> continue, it seems to work fine, providing temp1 and temp2 as previously.
>>>>
>>>> Do you have an idea what could cause such a regression, and if this change
>>>> (I mean: simply not returning error from devm_regulator_get_enable) is safe?
>>>>    
>>>
>>> Do you have CONFIG_REGULATOR enabled in your system ?
>>>
>>> Guenter
>>
>> No, it's disabled (and it was disabled in 5.6.0 as well).
>>
> I thought so. It works in v6.1 and earlier kernels because
> devm_regulator_get() returns NULL if CONFIG_REGULATOR=n.
> The driver used that function prior to commit ad804a4d82fc
> ("hwmon: (lm90) simplify using devm_regulator_get_enable()").
> 
>> Shouldn't devm_regulator_get_enable*() stubs return success instead of -ENODEV?
>>
> 
> One might think so, but apparently the author thought otherwise.

Apparently the author has not known what he is doing :)
I have a faint memory that I chose to return an error because some of 
the other stubs did that. Looking at the header, it seems the variants 
of *_regulator_get_optional() and *_regulator_get_exclusive() return an 
error, which may be where I picked the return value.

Now, thinking of the use-cases and the comment in the stub of the 
regulator_get() - I think we should just return success from the stub. 
I'll send a patch and let's see what Mark says.

Sorry for the hassle.

-- Matti

> It looks
> like the function can not be used for drivers which have to work with
> CONFIG_REGULATOR=n.  The only option I can see is to revert commit
> ad804a4d82fc because that commit doesn't just simplify the code but also
> make regulator support mandatory. Matti, do you have a better idea ?
> Other hwmon drivers are affected as well, so we'll need a common solution.
> 
> Aleksander, for your use case, you can just drop the offending code
> until the fix (or revert) makes it upstream. Sorry for the trouble.
> 
> Thanks,
> Guenter

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

