Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931038551F
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778963; cv=none; b=YfZrsjW/HQAuwkbP5kpcqpd1i285VHVuZPh4VTQzbVmjulpFTwuGxYdr08QAGMaZBOz7cXtyxyi6GFM0mtfs4+D8LuHoIxwZQOHxP28SpzOLy6SSN3ulguwX/0ZAwy4JLgDeuSwICvuOMG5w+wEoFcuq6FKgnXfSpJKuWb6pkrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778963; c=relaxed/simple;
	bh=bqu2oeXykvVXrtl6W8cxQEReCOO2iASSdq4+Ii79tBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otcR21y7F3+rXwNWKlkE4UkrMtBX41MGKxCOVJEnaOH1igA3P5tZ+ZiXHhSX7X3b8um5yCJZkl0nS8Sj1r7L3FMRycm9wjpFls3dDMDRku5gKVq4KfT5i1XtAQcdIVHDgXRV8mZdt9bsf+AKEjMC1D8bd3EoEgXnhR+MBSfduQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKYmF/xN; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKYmF/xN"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0bcd8f194so4350795eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773778962; x=1774383762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0gykb+9p2pXiQe/gkOwplwhJHBFzZsDCqVbYdSMZ/7w=;
        b=EKYmF/xNxkE1HCK3+uzI0Q5xIqmw5NlChxXAt7vNwBxGHhISU5eoCygReakeriGDcE
         B9HdIjOTfndyrtO2CEeUUFwgAeGgiJkEjJ2YHwc9MGTegyiR28SyN8adbIZtz4STt+2a
         B20zkC+xjoUDOHfdGn6iU6KfQspOEvdFfVZjEr1UsabQswnwMNpAZV5yvPCyhdwnhjFC
         AqL2WiVVevGzJ9MOGhR9vR6zcSrfznUDyq4DhhKcX1GeIIw3vnB92Wl4x482u2FQnD0j
         9l4YGqeRgXGJzAbovGg8HmCfRVwVLTXf4yqvaC0oeqT3eRW1dN4K41l9e2diDOT+858D
         /W2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778962; x=1774383762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gykb+9p2pXiQe/gkOwplwhJHBFzZsDCqVbYdSMZ/7w=;
        b=pFyVqiXJwxIGpBoYxopTKLZ1c+07S4AuV2SB86NoDgDXItcy1GnVGWllZ+78rZIkzd
         XrqwdfqK8u67jKY4cwqQG2pB2/HuG9CtCKG7iI4gjaFk37pPuNCOhsE1dFdl/Anw8OJ2
         h1OtJOaAV7QbXBAYn0FNDC68lNEkt6QlnPjMzgPOb85U02rNfmDbNrs4egAyV4Xy0asP
         upkGHpU50iCfp7QriwZUAfJsqk4zldLGN2CDEEoALxflSnHAqKT/Dd+ITdZPP1pjy/Cz
         xEICKPxQ5o4gzCduZTEzjj5Tb90Qsw9Zoc4zaKHial+MJqzxADwX+J9hgQsAAD5mBBvr
         wI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDwhcCc9Ubj5hPFWPATyreabBIX+zMBAB180X8BiN7YFSFeYNU4xUV80nb2r63t02y4td/IRp6c/5UcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiGCD1MpmXp6JhVyo0NL7tUBJQTjVhXtOA9s3s+Tfu1Z3YrdYR
	0LKieS4MuURJesSocxcTbvgfn2m5nHV6geyPtf4GmZminLtGRV7FeFWM
X-Gm-Gg: ATEYQzxMF5FUGIsE931poGJ1qHkvkqZFcdYuUsZtgsJu3YzOCxf6nn/tgbOalPoulxv
	i1nZm7zPROK3/ejR92L0NEAWfp+HYCi18iE96KtqwIrxeJ6bm7HPAWC/zcA7qDBk7MBLi5+t3lT
	gP5NdCqOU72SvUCiU8C43wfDcHbrFOoqFG6UCztjdUA8mC7Zq+wC1j7s4oXQ08RLiyTyjfFTsxk
	S2rRafDIiNsP6qsRaC9vtmIw1oaqFZXa2/o5hx0hYUw+T3WoFcpnmCw7yFlEJQRRV9NMzLv05Sb
	+4wQ+IG7TpJfnJPVXmKYC8QnaeQOEEUnuBSZXP0yoW3d3B5jBxkiKAoFHtGZuCfdBefQWdRtx+K
	HWhqlah+SIpeMk1/eJbd/4jS0fIVBtaR82bqh85x6maH7Er1yX708faBSy7Rld43ozOfQpOdlT9
	h0VHSi7j1IB+JCBOCPUCvX7PfMFtWjFtoi02MkVipGGMMV1YgKRjsrouQDqrKvzsbAtMmhZf3Z
X-Received: by 2002:a05:7300:320b:b0:2ba:a60a:15e6 with SMTP id 5a478bee46e88-2c0e5062a64mr427155eec.16.1773778961508;
        Tue, 17 Mar 2026 13:22:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm770712eec.30.2026.03.17.13.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:22:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d491e41e-5a27-430e-b4b0-35b7e3867995@roeck-us.net>
Date: Tue, 17 Mar 2026 13:22:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Convert most Dell WMI drivers to use the new
 buffer-based API
To: Armin Wolf <W_Armin@gmx.de>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: soyer@irl.hu, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260314175249.16040-1-W_Armin@gmx.de>
 <502ea01b-e5e1-45a2-b5f8-ad236dc8f006@roeck-us.net>
 <52dabfaa-cb3c-4c2f-92a0-efaa175bf4be@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <52dabfaa-cb3c-4c2f-92a0-efaa175bf4be@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/26 13:11, Armin Wolf wrote:
> Am 17.03.26 um 16:52 schrieb Guenter Roeck:
> 
>> On 3/14/26 10:52, Armin Wolf wrote:
>>> The new buffer-based WMI API improves the compatibility between
>>> different ACPI firmware implementations by performing marshalling/
>>> unmarshalling of WMI buffers like the original Windows driver.
>>>
>>> Convert most Dell WMI drivers to use this new API. This also
>>> removes all ACPI-related code from those drivers because the
>>> new buffer-based WMI API uses abstract WMI buffer objects instead
>>> of ACPI objects.
>>>
>>> All drivers have been tested on a Dell Inspiron 3505 and appear
>>> to work normally.
>>>
>>> The last three patches contain some misc. cleanups for the WMI
>>> driver core itself. The most important change is a fix for modprobe
>>> to verify any WMI GUID strings from WMI drivers and convert them
>>> to uppercase if necessary. This should fix autoloading for WMI
>>> drivers that use WMI GUID strings with lowercase letters.
>>>
>>
>> The series doesn't give hints to maintainers if the patches should be
>> applied on a per-subsystem basis (i.e., are independent of each other)
>> or if they need to be applied together. I Acked the hwmon patch, assuming
>> that it will be applied through a common branch. If the patches are
>> supposed to be applied in subsystem branches, please let me know.
>>
>> Thanks,
>> Guenter 
> 
> I would prefer if the whole series was applied together on the platform drivers tree.
> 

Thanks for the clarification.

Guenter

