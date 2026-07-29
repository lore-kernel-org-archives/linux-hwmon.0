Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770D42DF138
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290928; cv=none; b=DmKrSouFifhyPxDT2bjcrs9+vfuT/WBjhEBOiMXAf8Tw5oQP6hFknW67rjIL0hdUZ58bBQzH8sKK+59HqvLK5Qe/XVYsfedRrkUgtkbJyU3O+rppINvPD2Ij9L5XL42corCZ9aSLkLgwYNJGaQ5zLZC/TMJGPaP6oFLHj2FDNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290928; c=relaxed/simple;
	bh=roYhyZV8X4uM/O+75tBihxvmxW4jnEm0s3TSZL3MJOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndWXeKE4a5MekQTeMhTevciT8T3NJTYOJV/As1WRelrfcP9qwJBa6Hmfq5QNg/0RHbO1uQYO9+qJvg3615Rb7De8KEiG4FkuWrjOwW4nNIl/W3BMnba4vKvi6UpEYDWBkLZHfX0FS5LIhJ/fbJWm9EC7KMww44Vu6ANz6vm8fAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ad65iZVY; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ad65iZVY"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9063b380982so4585066d6.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 19:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290925; x=1785895725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8G4pIhNG8aXKSlvoYcB/w186WkTgZyB4Tj6gt5d/Gtw=;
        b=ad65iZVYEfcnzTzux+tFtRPzH+LbJqo+OX+dkCCJnYjc+6M+cuxUxM3hk9YeidmUSk
         yI22BSDzVUgDh50xBW95zDSxJsV2jjCHQsrYv9UQqUrfCz6E2vhtmW5TLnmCAkSFmlYD
         85AjMSyt4eTzz4Sf0KVM1b2rKlzCirgsYNnL1mW6k9A6NkwH3d4PqKgAcRv33eQuzulz
         mj7VKL04IU3XsaAH2GDx2kTLmshI/TVxPUqtATjo9pPw0hUf5VLyJZduOjp5gSNovYWX
         fen7nR9+xkINcre8jd0UQbf0td8sVTHMgIfxlGOgkgUwN2ds2zc3C9biSIptvmtFsJfH
         g5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290925; x=1785895725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G4pIhNG8aXKSlvoYcB/w186WkTgZyB4Tj6gt5d/Gtw=;
        b=JJAZ/aHY28Cem0J8HtNPm6DP9JQl32Fjhw4CIrO4QJvhl70dHf+0BJXvv5GrwOxvnC
         oEgLjzKr5f3XF5A7yFBEt8muhxYYX9KW6oReGCLLt6/1honc48Mzp3GALjvHcSaW68ip
         LumJo9Rbcr2mIwj1orv9iPepk7A5oEq92CdmKU2U34qW7Q1tujEp3O6JK/5tosB31XEI
         1YbiJLWwyclV6E3/SbAcVzGD7Pr4yYCorPVUdAu7fxScAK2m4h8vWfqRuFPnANO8IlrR
         TVARpUaqv4FVWkO44bvKtUKlO/FNUdlj/16ARK3V5T0jZXoijbBCaMGFcDRVTFGdMgVP
         lclw==
X-Forwarded-Encrypted: i=1; AHgh+RqsbVcbxO76Ht4jFQaOHF6nsONwOA9BJxJhMoeCH+pwq/FLh2wPtyTl0O3/Y/yz3uwPVrowvSWBkeZ/zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFpiUTkl2/atw46+XR2zRheAkwvxrYVXROPqA2nSpu0RVyKJ4Z
	wBKVivcLTy/hXa+orkhw1RIPufupMe3UYnfxgCNzqmkI4eUGqIcK0PAjaoL2xOn14ms=
X-Gm-Gg: AR+sD13qj/+WSoyPai984qYn4IY5wStf+0sxil3rE3Z5Bn9h8aoEo57wHWphMGM8mAG
	vRx3iIDriCE72IJlnmMBNRVDPUBXZaBUuHj+A0CEnlCKuDY4oGblWx/Wa6pNOIesMkmkGWBeolM
	mdm4v6lRM8OwwtKlOud1e/1H47E0AmDN+nOWZidBoyFkm3nkV9IVsNBijAaxh9j9HBbyrS0N8ye
	3x4ui9V1dHn4a3MxFhWwu5E1/BGciA9rvQZgfuqLnM+dfLW97C1tkd7mPC1GGByTRIdsiIWPlom
	U7/Aa5pyLmQ91JaI91i4tvTs96ckLMlH0EMs9JvW5AxBkIKI4K0FU3b/mfeVRjeIfAZaQl5tQNs
	NOHXvA/EscfNxEm4A0LNk/s6kPwliRBEkRi2xtecezSVnMpmQI0N/cayAeF3K7YbfODZHLobO0m
	TI+1yTCRuLrBasDlI7xgHYpW0RHNWECGUYkMY6ZXliMRxBZ6SBuMUsYNnrgMOQcurfBQtPo5T12
	ly2a65MbyHFqLycYn6b9pSeRaPMCKTS0Q4B9FE8fyqGqus=
X-Received: by 2002:a05:6214:29eb:b0:907:c234:809c with SMTP id 6a1803df08f44-90817378090mr52884706d6.65.1785290925173;
        Tue, 28 Jul 2026 19:08:45 -0700 (PDT)
Received: from [192.168.60.4] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081db0ddd5sm13656026d6.0.2026.07.28.19.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 19:08:44 -0700 (PDT)
Message-ID: <a7ee7c9b-8d23-48ec-97ff-c0b9bcf3bb63@gmail.com>
Date: Wed, 29 Jul 2026 10:08:32 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
 <20260718185704.3466-1-alexyeo362@gmail.com>
 <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
 <531e3c48-bb61-4741-8fe7-a2dbc213eb1e@roeck-us.net>
 <84b521b8-112b-4fed-ab82-e1e16d770e66@gmail.com>
 <635a0d22-8565-4c62-94d5-2cbaff308558@roeck-us.net>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <635a0d22-8565-4c62-94d5-2cbaff308558@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/07/22 8:00 AM, Guenter Roeck wrote:
> 
> I for my part would like to understand why hwmon_lock() / hwmon_unlock()
> (or the hwmon_lock guard) are not sufficient. You suggest above that they
> are not sufficient and that you need the additional pwm_fan_lock, but you
> don't really explain the reason. You do explain that you need to lock the
> thermal access functions, and I agree, but you do not explain why the hwmon
> subsystem lock functions can not be used. It would be important to
> understand why that is the case because those functions exist for exactly
> that purpose. If they are insufficient, it is important to understand why
> that is the case.
> 
> Thanks,
> Guenter
> 

I have reworked the code to use hwmon_lock() via guard. I have tested 
the code on my machine and it works as expected. As a result, hwmon is 
now the primary owner of the fan.

I will submit a v8 patch with more details.

Thanks
