Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F258348C79
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344988; cv=none; b=kb6/i+Eo20D90CwR5wOwurgHkLNo4Bh8l8X6vZTD1NPdn/KYMeBglY+vDSEWB8W/ExNP+Ext/GPIl4K/gwIc01nJx7/ZqsD1w8A9YL4C2EdgFlywK8A67kqhbq0uoIWszRo/FU0GX8wTX9I5ON2Edo8pt1Omd3lD5yxe2BHH/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344988; c=relaxed/simple;
	bh=pE3VPL5lxRww31WKz4yg2pwZbFS7UCfh7cXwEA7Dmjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J/R475JImYIHywrsVwsyIC7eNb9C5VkZFAGziEnQkpvYVv+by5MReJAA0npkhSEKLheTi60toV5jTFK8D0x+Wdj4HtXF2BPlatxsGt8zgMND58qUHNeJbVRZHNWwMW2LhgFFtMPwRU7JASRbcFwlzHaY85Iz8d6ORbEzYuLUSFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlkUN+Nb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlkUN+Nb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51691F000E9;
	Mon,  6 Jul 2026 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783344987;
	bh=Ae5WqmBFLQ0iruMACaMhqrwVtZH+2YLvCto2YCt0Hu4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=BlkUN+NbFLW/ew8OcaGYTssbS8Khl3ljacsHozRnJY7tAKfsDnoN38Lm5NnKAeQXX
	 V2d0nDW5ioaLlCntBIDYug8VbCPuwrco37fZ5Q/Lpn1ZVpuWd0KglSLe6C1zN5APaY
	 5kGBnf51r1Zz95JAKhUSc7hDlE3I47GtfurSLW/Kb4yiJqOk/jL+7Sl4hg1ISAIdlk
	 doJA4pfHyuXcW+1508NBs2JuAo89R12nohDHD7StOfpvnAn/UvhkXxUi6wv/cytBmc
	 aIkmzk0FK8KCNhRVXq+G/7uLzz9/U5lIe76vXnf0+nK5lxWM0Wh6BeC5x6rTa2CSzz
	 YqItZZwjgTIkw==
Message-ID: <cd6460b2-7f53-4ac6-8f68-172e7853f63f@kernel.org>
Date: Mon, 6 Jul 2026 08:36:26 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Content-Language: en-US
To: "NG, TZE YEE" <tze.yee.ng@altera.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <cover.1783062999.git.tze.yee.ng@altera.com>
 <af1e81827ba72ea901686619bd66dd810f3c8b02.1783062999.git.tze.yee.ng@altera.com>
 <20260703081925.C9CAB1F000E9@smtp.kernel.org>
 <24a16e2d-205c-4340-87c4-2fe5b57c4791@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <24a16e2d-205c-4340-87c4-2fe5b57c4791@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/26 03:36, NG, TZE YEE wrote:
> On 3/7/2026 4:19 pm, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] The async service layer is torn down before the child platform devices (HWMON and RSU) are unregistered, leading to a Use-After-Free and NULL pointer dereference if a concurrent async call is made.
>> --
>>
>> commit 2c6317a7aef89428e616ea8354fab157b27ff35f
>> Author: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> firmware: stratix10-svc: add async HWMON read commands and register socfpga-hwmon device
>>
>> Add asynchronous Stratix 10 service layer support for hardware monitor
>> temperature and voltage read commands. Register a socfpga-hwmon platform
>> device when hardware monitor support is enabled.
>>
>>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
>>> index c24ca5823078f..716b58f5a6170 100644
>>> --- a/drivers/firmware/stratix10-svc.c
>>> +++ b/drivers/firmware/stratix10-svc.c
>>
>> [ ... ]
>>
>>> @@ -2050,6 +2087,9 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
>>>    
>>>    	of_platform_depopulate(ctrl->dev);
>>>    
>>> +	if (svc->stratix10_svc_hwmon)
>>> +		platform_device_unregister(svc->stratix10_svc_hwmon);
>>> +
>>
>> [Severity: High]
>> This is a pre-existing issue, but does unregistering the child devices here
>> introduce a race condition with module removal?
>>
>> In stratix10_svc_drv_remove(), we tear down the async service layer before
>> the child devices are unregistered:
>>
>> 	stratix10_svc_async_exit(ctrl);
>> 	of_platform_depopulate(ctrl->dev);
>> 	if (svc->stratix10_svc_hwmon)
>> 		platform_device_unregister(svc->stratix10_svc_hwmon);
>>
>> If a sysfs read for the hwmon device (e.g., temp1_input) races with module
>> unload, could it proceed to stratix10_svc_async_send() because the device
>> is not yet unregistered?
>>
>> If so, it looks like stratix10_svc_async_send() will dereference the achan
>> structure that was already freed:
>>
>> 	ret = ida_alloc_max(&achan->job_id_pool, MAX_SDM_JOB_IDS,
>> 			    GFP_KERNEL);
>>
>> And later attempt a NULL pointer dereference, as actrl->invoke_fn was set
>> to NULL by stratix10_svc_async_exit():
>>
>> 	actrl->invoke_fn(actrl, &args, &res);
>>
>> Should the child platform devices be unregistered before
>> stratix10_svc_async_exit() is called?
>>
>>>    	platform_device_unregister(svc->stratix10_svc_rsu);
>>>    
>>>    	for (i = 0; i < SVC_NUM_CHANNEL; i++) {
>>
> 
> Hi,
> 
> Agreed with Sashiko's comment. In stratix10_svc_drv_remove(),
> stratix10_svc_async_exit() currently runs before the hwmon and RSU
> platform devices are unregistered. A concurrent sysfs read could still
> reach stratix10_svc_async_send() and use resources already torn down by
> stratix10_svc_async_exit().
> 
> This ordering predates the hwmon registration in this series; RSU
> follows the same pattern today. The fix would be to unregister child
> platform devices (and depopulate) before calling stratix10_svc_async_exit().
> 
> We can include that reorder in this series, or send it as a separate
> stratix10-svc fix.
> 

Please send that as a separate fix.

Thanks,
Dinh
