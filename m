Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E052557F
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707301401; cv=none; b=mwSjRkvoKJxokRhMWnGpm7jNmhduihkqqNGbSsy/6u3K+PoRHxXqykaMvM/Q2VziSNe+nq0BQUyt6VEW39ne9EiyE1bBuSJm4oPxwXXzEn9ApZ+lD+8MxjJTA1QVVKuq7vNLUnGPfI102AP1qAOzxYHUUJjvrRlocO9YlqrO+Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707301401; c=relaxed/simple;
	bh=FrOlWVigdfios+ot4lAhjYgtuZQtQwkBUKDJOV0Q2jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lX1zZBUjPr3kqKf3BqlA7QvEQ8dzZQYvIIoOH9/Ns0+Q2evl+87O4S7T7OS9wV6t5PTBbmTeBjtb77QMtpBhBZeGBpNGCpaOPjCIODv8jyLeOPx1QWfDGif/Af1pG7QTBk/tJ9Edc7kVSczhnd/tFZHpeAXKSFWM0h6u/0c17B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMIKzkzl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMIKzkzl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55fcceb5f34so424851a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 02:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707301396; x=1707906196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zw1ruZx2unb9nuA/FNQR+Ae4MknAVIUHaXnU1d2p4s0=;
        b=TMIKzkzlMkKrLxxnL0sehMsIP9xo5a+418qzbzhhtu1inOy8FKVAbY3NkDl5NEUBGq
         sU62UwknhI0I355+DSxo4PoKXgHA7nlAiYKITnLR6INU7j5Vi2kkgY8vxbJQRcErA1GX
         m1N6JtmPqeBnOdFWQWnqT7SYA5mZXVpfl9f5QWW7NFQwKdUaYUC50buVrSKeGOA3lSD9
         nWbpOe+/i41Uv5dizco3FMCUdwB8FxqPWOe4iF8ZSGoE1/Zlm892KucFV+RPAPm253ix
         2eQGsHqcgNbE7an8HwCiC9rDDFBMdaTeqvfrfy3lZBcIQXtyz4rmpFyALvgHsJOm5rRP
         /Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707301396; x=1707906196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zw1ruZx2unb9nuA/FNQR+Ae4MknAVIUHaXnU1d2p4s0=;
        b=YQwCGYed2cv3jfFSt9J7uLc2pherAb/7QWxiZ7HTmMTwlH6aLoU45Lmq1lYPegdAdu
         9Nakhi5K0UeS52lJwPAcY/QJBV9Nh16FFDJqw49RSxDpSJSUxS33FpDeN/RJe8BcQ6lD
         kddWYWUQ97ASLkszRVWe64o0DmW8SwqSu5FvT2aVcQzDzSm5wy/9qCzQN7KvcGK0qMuL
         pW31BCDaM6km0SkCCKKG9GJxlpJ26oiRNtntOZauV0woQvGrgBF46a/CjBeQ+urdoSK5
         Q89cdqJ5vA4nOqWZZFoh5voIRRwoN396kKieaEbe1UsJspobDyEXkKaconQapRS81Oar
         q2hw==
X-Gm-Message-State: AOJu0YyiPT5BXIw/ReTOnLtC3KQkiFoqCS1pcexRb1OIB8GN/VYrkhSt
	yio1h9SvrdIP+HCx/BhkCu7UVx2cFdTMCFMcrBEcM3KNkS7Vh8O+LHGU8DyDkn0=
X-Google-Smtp-Source: AGHT+IGyGjKITNmdcmRSs02HQthbl+yZHWQ62WLb//w/4bpw8mO0Rs79HtNi1PQYQ1xH1M1xgzs4CQ==
X-Received: by 2002:a05:6402:695:b0:560:9267:95af with SMTP id f21-20020a056402069500b00560926795afmr3326104edy.22.1707301396206;
        Wed, 07 Feb 2024 02:23:16 -0800 (PST)
Received: from [192.168.100.74] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id dk4-20020a0564021d8400b0056038077ffasm520361edb.38.2024.02.07.02.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 02:23:15 -0800 (PST)
Message-ID: <294e4634-89d4-415e-a723-b208d8770d7c@gmail.com>
Date: Wed, 7 Feb 2024 11:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: Add support for Amphenol ChipCap 2
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-hwmon@vger.kernel.org
References: <c61a90ff-7f63-4181-96fd-ca5a5029386d@moroto.mountain>
 <ca9be823-8b43-4f51-9bc0-8ee5de7df4a2@gmail.com>
 <563343c4-8893-44d8-a398-ea36a9cd396a@moroto.mountain>
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <563343c4-8893-44d8-a398-ea36a9cd396a@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07.02.24 11:16, Dan Carpenter wrote:
> On Wed, Feb 07, 2024 at 11:08:18AM +0100, Javier Carrasco wrote:
>>
>> The ret variable should be initialized to 0 because if no irqs are
>> defined, the function should not fail i.e. the driver supports that case.
>> That is probably the reason why I did not notice in my tests.
> 
> These days everyone has the GCC extension to automatically zero out
> stack variables so it wouldn't have shown up in testing.  It's still
> technically a bug, but I don't know how many people it would affect in
> real life (probably a small number).
> 
> regards,
> dan carpenter
> 
That is right, but because a small number is greater than zero, I am
glad that you found this issue now before the driver is released.

By the way, Smatch caught this while gcc, coccinelle and the language
server protocol I use did not... great tool.

Bests regards,
Javier Carrasco
