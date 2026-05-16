Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E92F1C5D72
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935635; cv=none; b=FVGZxvVExyL3VGMxUQRTmiFLhSpr7+LXBfJW1PnW3or9qTHdVAw1kycZTe4ov+iv5yKjR89fIsQAWPZLj4YMZ1/vgYdF/TvJ9eWUtoVJVVVbjMa7iPHfevZgCt9qvfjgLapIHgS/tVvIdA0FyJdZjPyKhNU77gBF7vAl0fMTHOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935635; c=relaxed/simple;
	bh=u5E+6495qwAab8AdLvQl+fhDoAIZRmQq75b5JIvJogI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5rxjPdTUMPHSh0ujIOwZr9gxs8ygS2GbGItbplZvVhykiFtcluqb2mwcNdBptGWlf8RrV6Y2sq4a01BQ0j0iCKjoyqik0NYVEatkolDJy2QOGm3m/7dLCDiHu6Vj17+9SV3eOwvcgmrCW/8KfmxnqP2d7/g7WcghR9Y9HUET0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jj1M4df8; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj1M4df8"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0ad52830cso901646eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778935633; x=1779540433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y7/BXl8TUdydP7vWkzFvQYhylqNFOaeX+JXDN6PSOjM=;
        b=Jj1M4df8aElIz6vaKsjpAZbA9BdOW0nPXNWkmhHzJKCU7TvAGI+d0BJPyKKlEh0cHv
         3wmXk1pmoYt/cv7+HxmdIHOkBVPgrRPevPRs76Zxl26N1absBRsQjYoGP2vd2tY+bP8v
         LJ2DoGdgZtpVP3UMCV+iwb+j/GpyiIKLV5dS4Lbcp9AilNmLK/8+JccPNwympplMmMxq
         3KxD7nhKeKsmXVIBrTRrQKDYtSOu/rtCcW0x+dqkNEFsKKlKWdsoNq6BbLsQJ5qI4+EP
         nAJ6uoef5SVy1mPeJkACbYBC7E9pvv2iH9JO5XyLCcgcDY462duGC6SGSTURxeKm7RCp
         kEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778935633; x=1779540433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7/BXl8TUdydP7vWkzFvQYhylqNFOaeX+JXDN6PSOjM=;
        b=W7seXJg9CFiwAM8xcFMS6FUlLzrQVCWu44ezrNuTF1TmSR21/1jmPDzpFe0+V9FhNn
         9AT9qY8S5z7i11xG6kcfuiJJGZPM+lztrDxgxM8w9OnL5J9CbL9hDCLSQWmjzbltGTYV
         MhgOeDkkVxdZ62bIv8TXmfyqFbOq43RBW0TV0+xIjRUJ7VX491xitTJpL6XG7Wucc7zE
         1+AMtnuWuIsVydIDga+BjLQ4lCPYryEIDUzKDPENv2ek3jdcV92nHA0BD02TyBNz4SEU
         F2V4udScYyLIBFwoKeXEepyi53QKcKrhEvQrf+xcMQn/TbxCuO7ni5vcGyvsEfKbcs5W
         CxUQ==
X-Gm-Message-State: AOJu0Yyfuqv6tWfxLpRzAskzMqsahi2quG9dMk/0iW/C7gE6XIfknzdI
	kr3lt/Ndj7QtJPti3Z+byUkLP10r/+X5lZ7j0GCRPzUG/bUAEXmRVXa3
X-Gm-Gg: Acq92OHUt/Azh0mhqmW3BOLNTrPBgHavuAaQn9wBrKxOQ0SDhs3NS/XsdAkgR6xkY8Q
	JNN1/ZdtXIG2gqIRH0TIRLePJ6lBQo56ZADSwSqcJv8r0ix18QOQi/xJ5MLegLgeCeUWegwviim
	UdyRuf6flutd8ECDDvlH6jZyOVPS+9AUmDrU2E3fMW7flG6d2aWg/aPXNl65OgarE9bSxA2rvhp
	Hgtp1VwQ8BJe3PGtAvUd70NBUEQZkFGLlqJfPk/O5hFFnXqJrt+BZ7uXdKAXB5cOOnQzar5Ev6t
	3lwOYtff48TJHVJTQcfsLfYUdV2mTY1hA1+/rtvR7WbFvzgmC+TFc+5k5may6bRhtrEB/YFHfcs
	IdMS+WZGlsjhgeEKGML6YV0w/31UgOHuxXxsxwfKJvvda+nz1hvrabhbwrjHk7U94/PbJsZLGZ9
	axLxB/x8nDNqpiD7IBZxwVhKjck9lzkJ1/6h/wZ0EvRU6vRgJ3/pzSSkdBx5gF44zcnO2wCLLW
X-Received: by 2002:a05:7301:608a:b0:2be:833c:149d with SMTP id 5a478bee46e88-3039869d771mr3539199eec.28.1778935633103;
        Sat, 16 May 2026 05:47:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b1a79sm9586863eec.28.2026.05.16.05.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 05:47:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8a756afa-20d1-49a3-8cb1-7f8c62d5700e@roeck-us.net>
Date: Sat, 16 May 2026 05:47:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (coretemp) replace hardcoded core count with
 dynamic value
To: sashiko-reviews@lists.linux.dev, bakshansky.lists@gmail.com
Cc: linux-hwmon@vger.kernel.org
References: <20260516114253.5466-2-bakshansky.lists@gmail.com>
 <20260516121622.1E9DAC19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516121622.1E9DAC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 05:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] If `topology_num_cores_per_package()` evaluates to 0, an integer underflow occurs leading to an out-of-bounds write and kernel panic.
> - [High] Using the global `topology_num_cores_per_package()` limits the per-package array size, preventing sensor initialization on heterogeneous packages or during CPU hot-add.
> --
> 
> commit d686b3577dd2107e7452adf6a949cc0720d2213a
> Author: Roman Bakshansky <bakshansky.lists@gmail.com>
> 
> hwmon: (coretemp) replace hardcoded core count with dynamic value
> 
> This commit replaces the hardcoded limit of 512 cores per package with
> a dynamic value. It uses topology_num_cores_per_package() to allocate
> only the needed amount of memory for core_data.
> 
>> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
>> index 6a0d94711eadb..c722b1d8e4804 100644
>> --- a/drivers/hwmon/coretemp.c
>> +++ b/drivers/hwmon/coretemp.c
> 
> [ ... ]
> 
>> @@ -485,13 +484,7 @@ init_temp_data(struct platform_data *pdata, unsigned int cpu, int pkg_flag)
>>   	struct temp_data *tdata;
>>   
>>   	if (!pdata->core_data) {
>> -		/*
>> -		 * TODO:
>> -		 * The information of actual possible cores in a package is broken for now.
>> -		 * Will replace hardcoded NUM_REAL_CORES with actual per package core count
>> -		 * when this information becomes available.
>> -		 */
>> -		pdata->nr_cores = NUM_REAL_CORES;
>> +		pdata->nr_cores = topology_num_cores_per_package();
> 
> Since topology_num_cores_per_package() returns a global value that is set
> once during boot, could this prevent sensor initialization on heterogeneous
> packages or during CPU hot-add?
> 
> In asymmetric multi-package architectures where a secondary package has more
> cores than the primary, or when virtual CPUs are hot-added, pdata->nr_cores
> would be capped at the primary package's boot core count. When initializing
> extra cores, ida_alloc_max() would enforce this bound and return -ENOSPC,
> silently dropping temperature sensors for valid cores.
> 
> Additionally, could topology_num_cores_per_package() return 0 if the CPU
> topology is broken or misconfigured by a hypervisor?
> 

Per the submitter's statement, topology_num_cores_per_package() is stable.
Other use in the kernel suggests that it can not return 0 (that would
trigger a divide-by-zero crash), and other users seem to trust it.
Given that, I assume the concerns raised are not valid, and I am going
to apply this patch.

Thanks,
Guenter

>> +		pdata->core_data = kzalloc_objs(struct temp_data *,
>> +						pdata->nr_cores);
>>   		if (!pdata->core_data)
>>   			return NULL;
> 
> If pdata->nr_cores is 0, kzalloc_objs() will allocate 0 bytes and return the
> kernel's ZERO_SIZE_PTR instead of NULL, bypassing this error check.
> 
> Later in this function, the index is allocated:
> 
> 	} else {
> 		tdata->index = ida_alloc_max(&pdata->ida, pdata->nr_cores - 1, GFP_KERNEL);
> 
> If pdata->nr_cores is 0, the maximum bound (0 - 1) evaluates to -1, which
> implicitly casts to UINT_MAX. ida_alloc_max() would accept this large bound
> and return a valid index.
> 
> 		if (tdata->index < 0) {
> 			kfree(tdata);
> 			return NULL;
> 		}
> 		pdata->core_data[tdata->index] = tdata;
> 
> Could this result in an attempt to write to the ZERO_SIZE_PTR address,
> causing an unhandled page fault and kernel panic?
> 

