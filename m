Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78643E4A2
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278275; cv=none; b=QtL13AKpqj+WMkGm0hK8I8QX5cPRYyo8sTpdh97Iym9rZayPtHFk/pqM1tAFl0025Elr8xO5sfcBY+tAqhvgYXQDfGj+1iOm+bv3X2DdMxliEvyUnIgmDqDFEEutJ0Wia6WsA+W3JGqSjTrexeNcIzIIWv0N2j7M77JG8EYro34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278275; c=relaxed/simple;
	bh=SPxjbk3syKLQJpGXVirHS9eaBhpUnGzgnTwemZtfcfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNcBA6UpM/qnHouHloAQYMYcFmJ120tOC00QTthUQ9thKi/euyudsi4/dmygcGnzlLpRqYemjEHk2N8NMcIrU51rTaIwWUxhFK1zSmf3qw0sbxT0lLQG4uqP26xk05PPk4N0G/jz1fdKVf0SwKh0wZLfMakdTjwdwszayMDtTtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI2q37Rv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI2q37Rv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d94c868ea5so16333315ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278272; x=1788883072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztQ95l6pTVEVTFfgeTVyzBHaRv+xL0xZRDHyZYcBepU=;
        b=hI2q37RvRC3DFmr2ntiiMNLqOCYKErc+QtL83bVY8gJSaxNT+wRo4c6Rv8vObckdbP
         H4zRFeeMpAJIxPvpOMj1c5z6xFw9G6dig/TGVM2JgJ1Lx5u+LBO0UFa1XRSe/bVLmgqy
         9krxK1YV8+0AWWKY8zxVUJgE3VmzpGwhOJqW47EgbCq+gF4fi4euRu+axLd3Yq4kH6lX
         z3LF+KlrEiE0qwhBv1olRNDGaGChc/5f7TUwoS+Bl/KxAC2+/dXsqb6qlu1WScoIJn8Y
         P2SvlPz7oB4pM6wUzIH55imukd1HPXa8fX0SbxQi61ZMWJN+0hH2zc49Th8Atguohy+Z
         kPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278272; x=1788883072;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ztQ95l6pTVEVTFfgeTVyzBHaRv+xL0xZRDHyZYcBepU=;
        b=YijQ0spzzkraM+cz9XKaJd61Mqm7cuqhWQaaduHcW0z+4B0U0aK4IrinxZ1AZyO3ZT
         MMZ3snDB/LCzcCojnre/Y5l+IdxQYM3YPzU5vWxDsgbyqIcsEY4cSV9+FxLNV8Xcji8G
         /dCFP8r3rlX26sd/46VBnQ3ZRxr+PbqFQR/9OYCSl9mYeZEsy/pRz2FvSR6jznsVzXZh
         NU+CNyC5GlzMJVTuzLHqxlDQxuEwUdu4dtv88WKUrQ4DFmTFGHyRSzbo0+1jOH1Ly0j0
         AoP4KYd0Rt+QlG64S46oYGsHpenpeXFsQtwPI4zjMWyyJuiJ4qbt8oB+Hzcd/ta4gM7t
         qSzw==
X-Gm-Message-State: AFuF++l/PRyuYj6v/n27U2meCwa/4EI6k22d5w6mLYsQBe9kQxT13YLw
	nHLi/mDgCEuVPu2F/kQNYj7JFvXyQA575B3eG79GI3lTcMBJuD0DYbdt
X-Gm-Gg: AYBFou3qzWvpgWVcXhJFyPVJkPvgQj4929QeoEDP6e3V6hdG0GiU3nJO3mv0ofasEMJ
	MxNACt3+nKctjhdNuHnGZaXuXl3Ku0HwMNTW5O0ijF9bkinkinRsKrHFnsI7xzAI9slN/3uLp+N
	WdeCuK4YLL+0e5ErtXYQrEujR//hM4r9ogzYHsQ/eMOyFKU0oOt8KIhPX/HrSoUhwf5q3eJjT41
	kn/J+yS8BwGLTVWduvzMylyFThle8jNeSq095F/yq6WozxPGnOMt7naXbYwL54oLpksb6UaTnWC
	CNA8zCtMKSsRdyYeIzRsv1htq8J2+phAXGnoC5TaFOL+dneh77rEquKfgWMB9CKu3VOtzp+b1J5
	FSlxMbjJqi2qpYnrBf4/UDszFemoz3blRlSZTZE6nj0O2J2osEOMOezOowWr4/eYfEnctI0sKS6
	z6LmYlJyZEdgLhOD+fvl7lzW3ha3S8MELagBK9M3YD0eRKj8bx4IuEQZ2AUAFZV+IWUkZ5MBPLT
	/3Us2FCrEFL8Hus9fY36T2pTY3tXpWmHCcGxg==
X-Received: by 2002:a17:90a:2ca2:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-398bee5663dmr20578507a91.24.1788278272360;
        Tue, 01 Sep 2026 08:57:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm6462843a91.2.2026.09.01.08.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:57:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5676f26f-72e5-47ff-882e-1eba979408bd@roeck-us.net>
Date: Tue, 1 Sep 2026 08:57:51 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
To: sashiko-reviews@lists.linux.dev, Cong Nguyen <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260901111903.660681-1-congnt264@gmail.com>
 <20260901113227.3694B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260901113227.3694B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 04:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> 
> New issues:
> - [High] Unbalanced pm_runtime_disable() on probe error paths permanently disables runtime PM.
> 
> Pre-existing issues:
> - [High] Failing to resume the device at the end of probe causes a usage count underflow during devm cleanup.
> - [High] A race condition between probe and sysfs writes can cause a double-increment of the runtime PM usage count, permanently blocking runtime suspend.
> - [High] Missing synchronize_irq() in runtime suspend callback for shared IRQ.
> - [High] Missing cancel_work_sync() for alarm_work leads to a Use-After-Free on driver unbind or probe failure.
> - [High] Unconditional IRQ_NONE return in a shared interrupt handler.

PM seems to be almost impossible to get right :-(.
I don't expect the other issues to be fixed as part of this patch,
but it should fix all the PM issues.

Thanks,
Guenter

> --
> 
> commit c1b61438a4a40096fe54d7b86037b9d5eebc1cae
> Author: Cong Nguyen <congnt264@gmail.com>
> 
> hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
> 
> pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
> that calls pm_runtime_disable() is only registered when control GPIOs
> are present. Alarm-only fans never get it, so unbind warns about the
> missing disable.
> 
> Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
> 
>> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
>> index 084828e1e2817..8b28f0d58c638 100644
>> --- a/drivers/hwmon/gpio-fan.c
>> +++ b/drivers/hwmon/gpio-fan.c
> [ ... ]
>> @@ -553,6 +556,17 @@ static int gpio_fan_probe(struct platform_device *pdev)
>>   		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
>>   				     "Failed to get fan-supply");
>>   
>> +	/*
>> +	 * Reserve this devm slot before gpio_fan_stop()'s so LIFO teardown
>> +	 * runs gpio_fan_stop() (needs PM enabled to disable the regulator)
>> +	 * first. pm_runtime_enable() itself still happens at its original
>> +	 * position below, so this doesn't change when PM actually becomes
>> +	 * enabled -- only where its eventual disable is queued.
>> +	 */
>> +	err = devm_add_action_or_reset(dev, gpio_fan_pm_runtime_disable, dev);
>> +	if (err)
>> +		return err;
> 
> [Severity: High]
> Does unconditionally registering devm_add_action_or_reset() early in the
> probe path cause an unbalanced pm_runtime_disable() on probe error paths?
> 
> If probe fails at any intermediate point (e.g., in fan_ctrl_init(),
> hwmon_device_register_with_groups(), or fan_alarm_init()), devm teardown will
> execute gpio_fan_pm_runtime_disable(). Since pm_runtime_enable() hasn't been
> reached yet, this incorrectly increments dev->power.disable_depth. On a
> subsequent probe attempt, pm_runtime_enable() will only decrement it to 1,
> leaving runtime PM permanently disabled.
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does failing to resume the device
> at the end of probe cause a usage count underflow during devm cleanup?
> 
> fan_ctrl_init() initializes fan_data->speed_index based on the hardware state.
> If the fan is active, speed_index > 0. gpio_fan_stop() is then queued as a devm
> action. If probe subsequently fails before the final pm_runtime_resume_and_get()
> succeeds, the devm cleanup runs gpio_fan_stop(), which calls set_fan_speed():
> 
> drivers/hwmon/gpio-fan.c:set_fan_speed() {
> 	...
> 	if (fan_data->speed_index > 0 && speed_index == 0) {
> 		int ret;
> 
> 		ret = pm_runtime_put_sync(fan_data->dev);
> 		if (ret < 0 && ret != -ENOSYS)
> 			return ret;
> 	}
> 	...
> }
> 
> Because speed_index > 0, set_fan_speed() drops a PM reference that was never
> actually acquired, pushing the usage count below zero.
> 
> [Severity: High]
> This is a pre-existing issue, but does a race condition between probe and
> sysfs writes cause a double-increment of the runtime PM usage count?
> 
> Sysfs attributes are exposed early by devm_hwmon_device_register_with_groups().
> Userspace can write to pwm1 right after probe calls pm_runtime_enable(). The
> sysfs handler acquires a PM reference and sets speed_index > 0.
> 
> The probe thread then checks the state:
> 
> drivers/hwmon/gpio-fan.c:gpio_fan_probe() {
> 	...
> 	/* If current GPIO state is active, mark RPM as active as well */
> 	if (fan_data->speed_index > 0) {
> 		int ret;
> 
> 		ret = pm_runtime_resume_and_get(&pdev->dev);
> 		if (ret)
> 			return ret;
> 	}
> 	...
> }
> 
> Since this check doesn't hold fan_data->lock, probe sees the new value and takes
> a second PM reference. When userspace later stops the fan, only one reference
> is dropped, permanently blocking runtime suspend.
> 
> [Severity: High]
> This is a pre-existing issue, but is synchronize_irq() missing in the runtime
> suspend callback for a shared IRQ?
> 
> The driver requests a shared interrupt for the alarm GPIO:
> 
> drivers/hwmon/gpio-fan.c:fan_alarm_init() {
> 	...
> 	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
> 				IRQF_SHARED, "GPIO fan alarm", fan_data);
> }
> 
> The PM subsystem guide mandates that drivers using IRQF_SHARED MUST call
> synchronize_irq() in their runtime suspend callback before powering down
> hardware.
> 
> Since this is missing, the IRQ handler could execute mid-flight while the
> regulator is being disabled in gpio_fan_runtime_suspend():
> 
> drivers/hwmon/gpio-fan.c:gpio_fan_runtime_suspend() {
> 	...
> 	if (fan_data->supply)
> 		ret = regulator_disable(fan_data->supply);
> 	...
> }
> 
> [Severity: High]
> This is a pre-existing issue, but does missing cancel_work_sync() for alarm_work
> lead to a use-after-free on driver unbind or probe failure?
> 
> The driver initializes fan_data->alarm_work and requests an interrupt to
> schedule it:
> 
> drivers/hwmon/gpio-fan.c:fan_alarm_init() {
> 	...
> 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
> 	...
> 	return devm_request_irq(dev, alarm_irq, ...);
> }
> 
> It fails to register a cleanup action to call cancel_work_sync(). During driver
> unbind or probe failure, devm_request_irq is unwound, which synchronizes with
> running handlers but does not cancel pending work. fan_data is then freed by
> devm. If an interrupt fired right before cleanup, the work executes
> asynchronously and dereferences the freed fan_data pointer.
> 
> [Severity: High]
> This is a pre-existing issue, but does the shared interrupt handler return an
> unconditional IRQ_NONE?
> 
> drivers/hwmon/gpio-fan.c:fan_alarm_irq_handler() {
> 	...
> 	schedule_work(&fan_data->alarm_work);
> 
> 	return IRQ_NONE;
> }
> 
> The driver requests an IRQF_SHARED interrupt. In its handler, it processes the
> event but unconditionally returns IRQ_NONE. When the kernel sees IRQ_NONE from
> all handlers on a shared line, it registers an unhandled interrupt. After enough
> unhandled interrupts, the kernel disables the IRQ line permanently, breaking all
> devices sharing it.
> 
>> +
>>   	/* Configure control GPIOs if available. */
>>   	if (fan_data->gpios && fan_data->num_gpios > 0) {
>>   		if (!fan_data->speed || fan_data->num_speed <= 1)
> 

