Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C27391828
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320421; cv=none; b=AWT1COoZk7TM+/99NGs5Q8SSYQxlUGn4a6biZ/EXqiWiHel8PlNjOSmnBOdw7pGczByAcI2YDguWUkCYK8jpkZH6SdMglLIDm9p6BVlCtX/CiREMui1vbeFuuSkIC+coTpZPGt+eCNHoyVs8wWyolsh3oxhoGrxledxvfVInJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320421; c=relaxed/simple;
	bh=HfQpx+Yp4X0Ul6ISCVhuvlYVFaERcwwSVwlFA6Wtbxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjlH/9oozd9EMFMCnnOTaXLM039nO85UO1reoPz6d+emaprikMDr4Z2o7ubTSY1y2lCRSwOIC9bDANDqw/quK9o+Tj/5JKwuAQd+URCxPseQwt5a4BoMqutKAFkeJe/RmWilCU+EmJEL86qb8JXsJap6FkKXRUmGnWnFqPnYmbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVmg/jnj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVmg/jnj"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382ef647e20so981483a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320418; x=1787925218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWf5A9nKdhTbA9HjSWPkQSCWNCzvt11rK7T8WYgG60U=;
        b=UVmg/jnjeQRsLAU56IMngDsEOQ1D4wtNFAgBt2UlHIsqUCasku/YuiJ1v8mYTIoP+p
         8fQsOCkOtQPkWZk1xMBfIRCa8BPVvvWQNQ4TMgmTpuU6H38E6CgoAoeyqreMBVtnUk3V
         mMBi6VVxBI1ie0glW4sPmL062cwmHmP88XZva4t+8Jr1tpzOhQgoVqdaQSgp6jUprmt+
         6o903aYiIE7uRRKra3kBNYrLV0DsY8SqKE/JTYt+hrzz9uvx89l3P0rGjbI1jSF/owo/
         5aDqix4pf9xCRvFYUs9Bf0plliTm/0jpP7r9MBmLKz8oSMBFhXEsk6rLSXlsvIUF7/CS
         zgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320418; x=1787925218;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lWf5A9nKdhTbA9HjSWPkQSCWNCzvt11rK7T8WYgG60U=;
        b=LPek6e+t6COeJ+f14QOAHt2b5Ba0xOatiufxnU06mgijwcij7HRaFKGYSG90lxeRDV
         DKBZs+Hr7sEQUqb2/NtN0FFgzBCktfNsBFi2gDw1+pYv7sOhoVV5nfmwEnSBBGtrV1xt
         bgDzWB27Zihp4Y41vtum2Q2alVxVObhxvzTVizL1+XBEsbAYRsr/zHA4Z245phOttq+E
         6Agm9T30L1ysjf/SyN0U3fckRo3sAhuCS66aaph4SvtNNAAJ9k+lwVVfWlv4Tm5qGHN6
         pkENKAvvF1ZJEdmiaSev3/Rd7jWsPVnRUtKV17yaev1kiO+AAFgTjdy/zLpC0oxjBfxz
         TzSQ==
X-Gm-Message-State: AFuF++mP8Hhk4lValwcliKDW8o0vYoqhUWEcGXcSOP7kRmNH02XSpvcI
	QuUf2VOAwSFkEObJP96tpt7PBOBcxw7eKRaYiLWaQS1Rr/xWrlJFArs1/K0W/A==
X-Gm-Gg: AR+sD106Jt3UrbxCDtkWfLz3ug6oGlm9S3hz3uusCIANurOj/KRQkQVTT3pA602T2VB
	6a+dBlGql/DHIspKrRQfQXeeeeYwy/R0AWgfgBB8dY2TVwjNgr8jVVYCTyZpzTeRUBFPvZR5nQ0
	+rD6etdtljcObx9xqQMMvfsSLJeCUSRa8zMIaQPzWNyGN1HPlyYBzofGGaxfkajneyMmKaEqqpJ
	D8fyNHShRWsvEw/5/D1qLUyH+afjAMz+WETSM/Xyxygt5VXtKma07lVxDNDE+o9dmsOqhZQ4hLn
	7Q7c9HA6XnQ5scSZr1aD3GVCwt8IKHh+LX+ra8bfl9O/a6uhxPaM21Vexghlw2HKdoydKcLo6Je
	z8KuLHdkS4FxL4Jh2fkJD7nRntn/p7MYR5dW5FXsNXmNFtKBM0pwqi2r7MgLJSbs3VCd/wl+gAS
	R7zVP5dGDpxQb+GQk97EZwth67cePBaz2wX7qkTYHvto82GESNKUcLlzR7iJ61IC3B9+AXTUZKE
	/as7Sd3aEPC5Eu+83DRivA1LPdrp5pT17UtsQ==
X-Received: by 2002:a17:90b:134c:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-395c385aea2mr13502305a91.15.1787320417970;
        Fri, 21 Aug 2026 06:53:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c467980bsm3312461a91.5.2026.08.21.06.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:53:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a0253a91-d8e2-41a6-8e54-3f564a757833@roeck-us.net>
Date: Fri, 21 Aug 2026 06:53:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: chipcap2: serialize access to low/high_alarm
 indicators
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260821-chipcap2_locks-v1-1-1d8ccabfc1b2@gmail.com>
 <20260821093706.D1EB11F000E9@smtp.kernel.org>
 <DKUJLMZSZJWP.UTXGLF6UTJ2N@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DKUJLMZSZJWP.UTXGLF6UTJ2N@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/26 03:16, Javier Carrasco wrote:
> Some extra homework, but the issues are real and I am open to tackle
> them all.
> 
> On Fri Aug 21, 2026 at 11:37 AM CEST, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>>
>> New issues:
>> - [Low] The driver implements custom locks for interrupt synchronization instead of using the hwmon subsystem's mandated locking API.
>>
>> Pre-existing issues:
>> - [High] The threaded interrupt handlers pass the wrong channel index to hwmon_notify_event(), causing the sysfs notification to fail silently.
>> - [High] Threaded IRQs are requested before the hwmon device is fully registered, leading to a Use-After-Free (UAF) during driver teardown.
>> - [High] The driver permanently times out on all measurements if the regulator is already enabled at boot or if a previous disable failed.
>> --
>>
>> --- Patch [1]: [PATCH] hwmon: chipcap2: serialize access to low/high_alarm indicators ---
>> commit f294324394a3b551fc4139386f0f74282d1fdb24
>> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>
>> hwmon: chipcap2: serialize access to low/high_alarm indicators
>>
>> This patch adds per-interrupt mutexes to protect low_alarm and high_alarm
>> accesses from threaded interrupt handlers and sysfs, fixing a potential race
>> condition that could lead to missed events.
>>
>> Link: https://lore.kernel.org/linux-hwmon/20260625162114.417EA1F000E9@smtp.kernel.org/
>>
>> Note: This review is provided in a free-form summary format without direct
>> inline patch quoting due to recitation restrictions.
>>
>> [Severity: Low]
>> Is it correct to introduce custom per-alarm mutexes for interrupt
>> synchronization here? Looking at the hwmon subsystem guidelines, drivers
>> should use the mandated locking API via hwmon_lock(dev) and hwmon_unlock(dev)
>> instead of defining and using custom locks like low_alarm_lock and
>> high_alarm_lock in struct cc2_rh_alarm_info and cc2_low_interrupt().
>>
> 
> I used two mutexes to decouple the alarms as they are independent, so
> actions taken for any of them is not delayed by the other. On the other
> hand, that delay will be very short, so I am open to use hwmon_lock(dev)
> if it is preferred in this case too.
> 

Please do. Introducing separate locks for low frequency events such as this one
is overkill.

>> [Severity: High]
>> This isn't a bug introduced by this patch, but does the threaded interrupt
>> handler pass the correct channel index to hwmon_notify_event()?
>>
>> In cc2_low_interrupt(), hwmon_notify_event() receives CC2_CHAN_HUMIDITY
>> (which is 1). The hwmon core adds this to the humidity base index (1),
>> looking for humidity2_min_alarm.
>>
>> However, the driver only registers one humidity channel (index 0), which is
>> created as humidity1_min_alarm. Will this cause the sysfs notification to
>> fail silently when an alarm fires?
>>
> 
> This is a real issue. I will remove the enum with the channel definition
> because it is only used here and pass 0 instead (there is only one
> humidity channel).
> 
>> [Severity: High]
>> This is a pre-existing issue, but is there a teardown ordering problem with
>> devres in cc2_probe()?
>>
>> The threaded IRQs are requested via cc2_request_ready_irq() before
>> devm_hwmon_device_register_with_info() is called. During devres unbind,
>> resources are released in LIFO order, meaning the hwmon device is
>> unregistered and freed while the IRQs are still active.
>>
>> Concurrent sysfs reads during unbind could re-enable process_irqs. If an
>> interrupt fires during this window, could it dereference the freed
>> cc2->hwmon pointer, resulting in a use-after-free?
>>
> 
> I will analyze this in more detail and get back with the results.
> 
>> [Severity: High]
>> This isn't a bug introduced by this patch, but does the driver permanently
>> time out on measurements if the regulator is already enabled?
>>
>> In cc2_enable(), if regulator_is_enabled() returns true (e.g., for an
>> always-on DT regulator), the function returns 0 immediately without setting
>> data->process_irqs = true.
>>
>> As a result, cc2_ready_interrupt() will ignore all interrupts, and the
>> measurement wait will unconditionally time out. Should data->process_irqs
>> be set even if the regulator is already enabled?
> 
> 
> I will analyze this in more detail and get back with the results.
> 
Thanks!

Guenter

