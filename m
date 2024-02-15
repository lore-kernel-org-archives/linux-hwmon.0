Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA4C15A4
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Feb 2024 01:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707960159; cv=none; b=G8ONGFoOpcQaOPW9uHVQ1y7TlfjwQzAoJp9nHk9F3vkr/lzfptUqqotNTPGUnj9rLnZiytQIeWWgjzysxG0oEIfYdoZQJpCDjOEFCuZ55OPGFH+xamozDW+o8ZKcP6lyPfPT9bVndjSGI9Qqa6iCzr5/+iGVvrwNkSXk0M0REk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707960159; c=relaxed/simple;
	bh=Tnx8IjKyUSSKaSihzrH1Pvns+lcHzLTQgcfAoDCX8MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6GER7ljAJmOTL9m7hA0T6cF8ECdwhNof6Etm1C8hZpnwy5VF7VkC1nLeRHFKECaBE63llEEOyOie/rVUJlmIoQ+LOJl2Neux2MDfUx+UlsNY+CRxZldMokjZ4FqktXdsdRCkPsiEScgr2TQQDAp4Kk0E2GlgJeFdJt56QwOuh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzB/ypYh; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzB/ypYh"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e0d085cf59so309169b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 17:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707960157; x=1708564957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B0olbHSdjskXQXzhTfxwqF51zetRH+mi1HzqDpbPcPI=;
        b=PzB/ypYhBXdY2Fcu97lcDKNnKcckrxH6qKlOHMnugowRYZV0n4uiK0CDp+KEVryp+G
         IQHvZ7aRdC2f9zWAEe1byjXZntEvSaynXgZMcowyDu4SY9um3d9sfosjZD5fnGxXfIx/
         RGAEtBedBYwwizwesqzUorkUDGj3LYDr+/kgZK8TVkN4KkPC2HWruJi0CoYDI7i/J7hn
         ERzeuzf/0cuK90y2LcuYMXCtphOOAB72gol9kBxpmdqq+bwSQdo+WRrRgAvgltIonWtD
         Elmpy6ivpfsgyb9IPYUWnnwA6zCMkKyxst/AGgMgWJFK48riqqY/v9GKIcFH6OqHiME1
         KIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707960157; x=1708564957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0olbHSdjskXQXzhTfxwqF51zetRH+mi1HzqDpbPcPI=;
        b=eUjZKr++MAAL94t8jyZnXAxi3Fb0hZUvVOOfGuJ3kyZAaeZFYBunJ5RZ3lhqbZC/gK
         P/HjFHyKqjV2V/oyle2kRgpQaHSVB3PruTLWay2rhsFoah/A9pvRTapK7QYuNReAe7MF
         8bdfcYbRIvpT/OLOcHPmy+9YkGul5RCXE4x1wZKGYB0lfvLodbUaVKijLr3B+J5pIhh8
         ufTXrtkoIdf5+qrzhbFpxH1QG0MEQXytUc4XT+K3HoVgFBXmLQ9C+UT9gKwQpHI6iyqs
         XshsVTnnBnicr3/UeAHoKDPwPJ2ljCe9N/V95sswHqFb3kbT1NeT+mSbEsF9YVRF1BWk
         orUA==
X-Gm-Message-State: AOJu0Yzsu0aGY1Znic2nR2Qfca5187i5Qxtrq1XJNpQI/VXwDtcdp2cm
	/LNAJNjVW92MZhoWMn81OH9VU/Ft6zUX5w8j8zJdAYeAHrPXXD4j
X-Google-Smtp-Source: AGHT+IExKoS/BMFESds335HdCbhTKSCqxvAgpnB78KNUwL4OqTVY1CyrKA8zHrTC/4iip6baINDnRA==
X-Received: by 2002:a05:6a20:ce4c:b0:19c:5523:eefe with SMTP id id12-20020a056a20ce4c00b0019c5523eefemr764938pzb.3.1707960157014;
        Wed, 14 Feb 2024 17:22:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o16-20020a056a00215000b006e0938f7c57sm86145pfk.121.2024.02.14.17.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 17:22:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a3b6f833-b8a1-44af-b90b-ed7370b12815@roeck-us.net>
Date: Wed, 14 Feb 2024 17:22:35 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (pmbus/lm25066) Use PMBUS_REGULATOR_ONE to
 declare regulator
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Naresh Solanki <naresh.solanki@9elements.com>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240214194342.3678254-3-linux@roeck-us.net>
 <8669f426-38a6-4ea8-ae4b-0d29c1d09a29@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <8669f426-38a6-4ea8-ae4b-0d29c1d09a29@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/14/24 17:04, Zev Weiss wrote:
> On Wed, Feb 14, 2024 at 11:43:41AM PST, Guenter Roeck wrote:
>> If a chip only provides a single regulator, it should be named 'vout'
>> and not 'vout0'. Declare regulator using PMBUS_REGULATOR_ONE() to make
>> that happen.
>>
> 
> Hi Guenter,
> 
> This will necessitate a DTS update on at least one platform to maintain compatibility (Delta ahe50dc BMC, [1]).  I'm not sure offhand if there are process/policy rules about mixing code changes and device-tree changes in the same commit, but changing either one without the other would break things.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts?id=8d3dea210042f54b952b481838c1e7dfc4ec751d#n21
> 
> 

Sigh. Agreed, especially since changing the dts file in the kernel
won't change the dtb files on actual hardware.

I really have no good solution for this. We (Well, I) didn't realize that
there are regulator naming conventions/restrictions when we introduced
regulator support into PMBus drivers. My bad. Let's see what others say.

Guenter

