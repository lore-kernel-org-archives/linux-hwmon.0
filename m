Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9A403E8A
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203792; cv=none; b=dK/scdq/3aGtg236M6oHovzYu/MHUxd1k3Ebg+5x6ENoZpkwCgZ1iN/BWOyEsByexEZgJfxSJWC9GjG29L0CAVaCZI0EeRwUuB4v/9aGTePtV0DkJm8FQVspnAf10y1P3WEC15ACY4A8lNToaAEJtjWI9xC5OCzFs0dGZdV9bi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203792; c=relaxed/simple;
	bh=zYiDoAQO2Oy4AQUxAHMTieQNFitOSxjQDqz8o8ANDYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaTMlQ24YwZ60UmQlylsv6aW7J7UuKcrJZ0V5l7JG/ryuL6QcQ5v0er4Y/EZeWwX29/4fmwxBP6EpfjFFu7BrxB78NjNaCTzK9OZDD+MWxdNXPEMl6n17ycl5vFR191CyZmWPRxDLkzU/iFxh7Uu+ks63/zY9xUs4wtP6aEbies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFl9kSMN; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFl9kSMN"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-135200bc7d2so9897365c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 08:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203789; x=1779808589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f5HsYuB95nz3GqSJZmQ/OT5b3WhcyqQVI32u0/zES9o=;
        b=MFl9kSMNYHRafgrWL+RnWQ6ygQApT6rFTyp5yUdjm/1ZqFnyHuL0ySV9bysye7pttC
         n6cm+Vi7x0SKkCGzr5DTWTiziAclLkszmfX76Eqmy7IfhAj3K1nRs4c9qf++TVy67chC
         0sDW1QllQCtyveax4TJPQlcM/hRamLnF6WW5UmSqII3fRxSPR8acauoPdSCvuoUt3Rkd
         lCWNjkTuVaUca6SfdXqghTM6VMFoBsXwdIIIh/iEwaloj/sNwVQqyxEQKjPiKDioBm+H
         huW4DzYKPy1bS2Xfn65wgbKg0DrHIUZF70m0Pfy25eDBMF7hsbFlHG2ZteIAPgSdld/p
         NYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203789; x=1779808589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5HsYuB95nz3GqSJZmQ/OT5b3WhcyqQVI32u0/zES9o=;
        b=DP+vJfyIRvXQknx/HNt7OfKDa3OZoZhiuZm3pu5euoe4mP7TLt+ejmbnNtut30DDm+
         scOcl7ctrXsik98YBL14Bo9uyo5Z+Y6CWrpdJ1ZOzouhG6rTlmFd0AVcfpGuaoLW3hiE
         AOSFujcoewgdTUYQHKLuTItJ+bOJMj9tyuFhGOM/g33WVi/J0dpl65mZ35bdpUNGx5g2
         7zuu+vX1QgbZVbxcv2+kz1S6ZCP61Fa2daLXGfm8Dd1epfP+2qbxQnDGBa94e+uLt4BG
         1FfZ24EjnFxMK8Qz0cA9DS0TmdApckMxgfv5Sb9HRKtUiEIWvFdbFbi4bIxLwUPET3kF
         YkmQ==
X-Gm-Message-State: AOJu0YxCd6IYqiJH4IibjLxnOJJ6Ky3ixv8KodCYGo2v29h/KHSTnRZ2
	tA/43hbJexAC22HAjrYZX4fy6O3gmwZlfdhL2sKGbRt/f2Tr0v6grBXW
X-Gm-Gg: Acq92OEHFDXi7q33Uc4tAgmnUX3zTO8WsfOGV+lTsDMPjKyhnc6dOnnR3pROR09JRgP
	5mPMfJBmti4W1RtVWg6QYeE5wfZjeRs6KFfVB5oG+o9KbgIYtS/V2MSb4eO6gtTwTP1QKYUb6+Y
	mALTyIL+IbYk5PmrU+7JQ3T8ehWJUC8VVMpISYdesQXf+xrTaRQfAjhbxttVUKaO58UmJEA2YZ1
	c68RnAhuo1T+V1/qlUb++rYLaQ+/tkzfOWmiftpZ/XA2NGDSQ0RH+KV73Ya4umcguJ6FrNjsF/f
	40Ja276aoD2WHghQAHIuuGAAyHKnKFnnA6vLHvpUDrTmwyU6GDASZSmprXiXTtxV9ep8PFRM1Ad
	/SWT4V0jaS7KTBfHChjmdhuoro97U59EsmiaOep1PHQz+In8KcLBkvcDwA9RWJyqUOByGf6Re2j
	fyQVeY+rDEW9pKgZQeFfkuE0iL2BpgVbdPXD+gcWaH/aBoOsvoTMuXrsCHHO+EYgCdUP64DW/FB
	8RrxMUA19y4EXkD//AxGw==
X-Received: by 2002:a05:7022:1e11:b0:12a:94ab:e20 with SMTP id a92af1059eb24-1350484e7ebmr9511463c88.20.1779203789318;
        Tue, 19 May 2026 08:16:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm1387359c88.14.2026.05.19.08.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:16:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d4ac610a-b34c-44aa-8e7e-b27092390c63@roeck-us.net>
Date: Tue, 19 May 2026 08:16:27 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (coretemp) Replace sprintf() with sysfs_emit() for
 sysfs show functions
To: Dongyang Jin <jindongyang@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519065220.2348524-1-jindongyang@kylinos.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260519065220.2348524-1-jindongyang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/26 23:52, Dongyang Jin wrote:
> Replace sprintf() with sysfs_emit() in sysfs show functions.  sysfs_emit()
> is preferred for formatting sysfs output because it provides safer bounds
> checking.  No functional changes.
> 
> Signed-off-by: Dongyang Jin <jindongyang@kylinos.cn>

I consider this a nuisance patch. Nothing is gained from it.
Can people please stop sending such patches ? It gets annoying,
and I don't have an endless amount of time to review it all.

If you make a functional change or fix bugs, cleanups are welcome.
Otherwise, I'll barely accept bare cleanup patches for drivers
using the with_info API. Otherwise please leave old drivers alone.

Thanks,
Guenter

