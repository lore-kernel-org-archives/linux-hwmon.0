Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DCB15442A
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Apr 2025 02:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167099; cv=none; b=eLWct6/uaWMaeqlOMBuF2cwuq/aKXeogzx2jl7QhQnhPJzeVMqHh6v7hg0GaAcNZD/nJB2ztcpRblxTSuQqYX3zgYzk+FBOnsrmpEuhbq0w8e/GDqCioecL2VgqUpHvVDwdRHGhp9TElosZB8xWFeQfX+jQN9IPeb8u2QvX5G+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167099; c=relaxed/simple;
	bh=lT4g1I0dVOz0aF/0AXaVzztSopxyQziqhLneTK+JWBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxSuh0BTwfosPJrW9qc7SfwaJoHJmfpW+t08SGxGqrXA1U8sRp6prhEFYdC6OauojCDdmWnzR41hOHZZzANzxsgKpFiQq87nRnF1wuLdlE6FfxCmwprBTvR1FBoP3eWeQt4hA0OGXDS0VOM7vdi8tNuQ1hC2tGnJAsWU1oyZT2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juDfggWs; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juDfggWs"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso4980815a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Apr 2025 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744167097; x=1744771897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ThPw0WlLK+8gmiKxrkcqwMje23EM7ylwQZj6rY88408=;
        b=juDfggWsGqPyhLYgVNBkegW1+okwDdaGImu6wWSm6Yv/EN2F/m4vyWj1aoQCkXtgVC
         kIcrKm5il6+U4TH6DVrkaOnykRWtLQntS6MO+nm9yo5FK7wWcj11oQOvVlpL8ZhOzU0C
         BVh0G2sHxDFUymSKjVCxFW3g05atZhoEIhmwvdrgY3crLpKY2aPYyL7uAIxz32E0zN32
         wKHE9Le0ooLDfyrnc4weR+EvyDQDVkcbZZnPHjMKYLSSIJvcYOj8F9+9UWWdOiyagyYQ
         EG9Ciyby0mlQNws3LG4RnOCo3P765sbn1i26Bx4dkQ7mQP6vYsbQCx/qQQsbvdbVxF/H
         RbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744167097; x=1744771897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThPw0WlLK+8gmiKxrkcqwMje23EM7ylwQZj6rY88408=;
        b=ehyBBuJBbHG5cSvEAjmbkor0+aWBH8nMG4gJEloaejQIvGZ+4b/WDUMtfqnmwVbhwX
         o/uE4ENhVOzfzzEAOzBRV9q9Ttp0Ezng6pSwlrfBXWuA5BI4KZdInEtVdNo0tx67WIJ4
         t799xNmDPlAAVu6H0+qeqTnFizxKoI5dP/bnPn/OAhAgxgLJ3jODtuwaK5J2oNPytL7A
         FRwwDvlt1zJpCZekk3lg/EnQpWYcRd4Wpw6oiweUIexVKKKxDopF/N9SQlcfD4yAzc2F
         x1s/RcNY7JoE+uK6Zoc2xF4k3Qo7OHre2DVr3d4oOglANoW2DU6MsU7DOsenGpSXR0Ya
         W79w==
X-Forwarded-Encrypted: i=1; AJvYcCXZJIcnEClQtwmMI6MR+QT/yrs5MGYw+P78u5MpgCcBZAnST8YOshq/G9Zgs9yKOnROVrOYfiuK1CDJRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD2/mPHxkY+DZ7xcnd9UxKY5D+U8AS6FbPh7+fJgOFj5SFye7z
	kRBPvC37gNqgN589YGuaZaU0UiuDt9NSZDkOGU7s75EXFJt8HBRopwc3xQ==
X-Gm-Gg: ASbGnctqyOW7bR9Brn02Lu2W8FNKzqc19Buydx3WLDeenVDJtqKVMVFfDg4OptYJSFh
	bakV7Cch3LyiGO2nW9fsOhbKRmTm1vy/XlIg5ER19ypiVksxqmI4qJsisupXpfmedsM24tLOg1r
	ejayOcINsVWUcvUesNNI/EiKfGzh2ygipj8NkK0YL3VHi73CQPdqIGX+dGj3cuMZ/WMBj6mWRqo
	VYmgBh0yZhI5GrKiXqx4A22fHsp/vFmSjnNQDZOZ4TS89H92UkEEkr/3VaX2bUSZsfYyhSvOfXl
	9YJR9oSWpmYYpfczHFNrRpXFS/lob7e12BkcLUP1YzqBmTKDhc5rXD/Hnz00R+LMrHhj8WvjFc8
	Ea8HvqZsWK+LLKOx9fg==
X-Google-Smtp-Source: AGHT+IFM5dD6BomPG2evk7NHep6uA2CXVDskY05xMI9CEaJtPRxMKHv3Hc3O8QTtlXtUlzl81i8JSg==
X-Received: by 2002:a17:90a:dfc3:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-306dd3218f9mr1137606a91.2.1744167097448;
        Tue, 08 Apr 2025 19:51:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cccb95sm649005ad.242.2025.04.08.19.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 19:51:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <82d98804-e9b6-458e-bb39-3a48c10e9f70@roeck-us.net>
Date: Tue, 8 Apr 2025 19:51:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 13/13] drivers/hwmon/gpio-fan.c:250:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
To: kernel test robot <lkp@intel.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <202504091047.biuX8Kl2-lkp@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <202504091047.biuX8Kl2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Alexander,

On 4/8/25 19:11, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   d6b1492c9c2e7f2659b63a165ea45ab556c0df0c
> commit: d6b1492c9c2e7f2659b63a165ea45ab556c0df0c [13/13] hwmon: (gpio-fan) Add regulator support
> config: riscv-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091047.biuX8Kl2-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091047.biuX8Kl2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504091047.biuX8Kl2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/hwmon/gpio-fan.c:250:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>       250 |         if (val == 0)
>           |             ^~~~~~~~
>     drivers/hwmon/gpio-fan.c:255:9: note: uninitialized use occurs here
>       255 |         return ret ? ret : count;
>           |                ^~~
>     drivers/hwmon/gpio-fan.c:250:2: note: remove the 'if' if its condition is always true
>       250 |         if (val == 0)
>           |         ^~~~~~~~~~~~~
>       251 |                 ret = set_fan_speed(fan_data, fan_data->num_speed - 1);
>     drivers/hwmon/gpio-fan.c:237:9: note: initialize the variable 'ret' to silence this warning
>       237 |         int ret;
>           |                ^
>           |                 = 0
>     1 warning generated.
> 

I dropped the patch from linux-next. Please fix and make sure there are no
such problems before resubmitting.

Thanks,
Guenter
> 
> vim +250 drivers/hwmon/gpio-fan.c
> 
> d6fe1360f42e86 Simon Guinot       2010-10-22  230
> c490c63e9505a3 Julia Lawall       2016-12-22  231  static ssize_t pwm1_enable_store(struct device *dev,
> c490c63e9505a3 Julia Lawall       2016-12-22  232  				 struct device_attribute *attr,
> d6fe1360f42e86 Simon Guinot       2010-10-22  233  				 const char *buf, size_t count)
> d6fe1360f42e86 Simon Guinot       2010-10-22  234  {
> d6fe1360f42e86 Simon Guinot       2010-10-22  235  	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
> d6fe1360f42e86 Simon Guinot       2010-10-22  236  	unsigned long val;
> d6b1492c9c2e7f Alexander Stein    2025-04-08  237  	int ret;
> d6fe1360f42e86 Simon Guinot       2010-10-22  238
> 179c4fdb565dd2 Frans Meulenbroeks 2012-01-04  239  	if (kstrtoul(buf, 10, &val) || val > 1)
> d6fe1360f42e86 Simon Guinot       2010-10-22  240  		return -EINVAL;
> d6fe1360f42e86 Simon Guinot       2010-10-22  241
> d6fe1360f42e86 Simon Guinot       2010-10-22  242  	if (fan_data->pwm_enable == val)
> d6fe1360f42e86 Simon Guinot       2010-10-22  243  		return count;
> d6fe1360f42e86 Simon Guinot       2010-10-22  244
> d6fe1360f42e86 Simon Guinot       2010-10-22  245  	mutex_lock(&fan_data->lock);
> d6fe1360f42e86 Simon Guinot       2010-10-22  246
> d6fe1360f42e86 Simon Guinot       2010-10-22  247  	fan_data->pwm_enable = val;
> d6fe1360f42e86 Simon Guinot       2010-10-22  248
> d6fe1360f42e86 Simon Guinot       2010-10-22  249  	/* Disable manual control mode: set fan at full speed. */
> d6fe1360f42e86 Simon Guinot       2010-10-22 @250  	if (val == 0)
> d6b1492c9c2e7f Alexander Stein    2025-04-08  251  		ret = set_fan_speed(fan_data, fan_data->num_speed - 1);
> d6fe1360f42e86 Simon Guinot       2010-10-22  252
> d6fe1360f42e86 Simon Guinot       2010-10-22  253  	mutex_unlock(&fan_data->lock);
> d6fe1360f42e86 Simon Guinot       2010-10-22  254
> d6b1492c9c2e7f Alexander Stein    2025-04-08  255  	return ret ? ret : count;
> d6fe1360f42e86 Simon Guinot       2010-10-22  256  }
> d6fe1360f42e86 Simon Guinot       2010-10-22  257
> 
> :::::: The code at line 250 was first introduced by commit
> :::::: d6fe1360f42e86262153927986dea6502daff703 hwmon: add generic GPIO fan driver
> 
> :::::: TO: Simon Guinot <sguinot@lacie.com>
> :::::: CC: Guenter Roeck <guenter.roeck@ericsson.com>
> 

