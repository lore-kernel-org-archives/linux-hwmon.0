Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8660A418A58
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 22:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671822; cv=none; b=NxP++calFBRbaQQMTvTV/28xkoySXUyF80v0fz+sIIy5Y99ORWWSJD0n8WOM4Y+InfyolqWygrZk2sRFvL24Mc9qA+BgY7W3dBwEHIVOoVIXs8BaG1HfK8nvDGmrZzRj8xm93EuAti7RM3DCO4e+/wYeWQakAewv70hTKGfm0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671822; c=relaxed/simple;
	bh=zUPO0xW8EbcG6n05XKUjBFvNtTU1+ce31pPO4tifURQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVNvJ7QYzvtqKxhJVGVew2EaseOI3FrR0//RtsF6aId8MBdn2jwPGMhitTPw2XA9TzX+WQXwcmKG2Gu9zGEW19xB/Kc1hQnDnbUkGafrI4L+ZOAZeMp9XBwAcTftfit4lDmOaPLQ1wSdNizygsyUZ4L+tlnVCH9t2bHHYC1YYXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3TrD2Ix; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3TrD2Ix"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7396940aebcso5695185137.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784671819; x=1785276619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdIwiKXskzBc9nnshg1SjXod+Z/w7Wh/7DOz3DcaCJ8=;
        b=i3TrD2IxwzY8KyQFBRM/2Ei5ZcnffFtwCyF/B/nT46LpMVyEV3A59iF5wwa+bn05Q+
         j1iQRhdIwNJCYLrDfNnv1kLa36MD2IiRGFJKY6a/ivwlyQ1vgKVO4bPT/OINtEqZzb56
         7Ip7YjDHYGmJtLjy7uZIMYVwq8A9/pCkoLw7MYvUIzDmaf0zulOfMDml5jbBc04ASoaH
         50UJd6t2BulAoZ4jeV9ND6BLVCBkIK5AOv4CthC9ttCSPc7v7DlGHg9MlUBzv0NfdJo4
         C3ppvjd1fxXqGdDjTnNSHSj4wyzixnFagGvBcjrjpBeHPpEynZO1seQqtH4nim10hP+0
         urbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671819; x=1785276619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdIwiKXskzBc9nnshg1SjXod+Z/w7Wh/7DOz3DcaCJ8=;
        b=m9AW1zDU0IwVK5fmMpsgjE0zLL31XIH0Q+t8eSOpBm88V+/mgfg0DLoznyXVg+Z04W
         HO7cjEo4vyLV0bGFd3YzyOsFGoVOAD0XUJAKpe/i9qRFljwX/BhsAqEhSNYS/BNbr/lc
         VYLHvpuy3pz32ml4S8HnIKMRnKHQhOK5sh+20Hie7hrGYmqHYdzzDPqae17zVw9eLn2p
         LoEyNWvw5b3lBRQtNtRtQIW3NAGSziI1ptvDwM8ZIRvwqtZkZQzm2sm1PPkhk3hZKNu+
         sxDBqJsn/NbAmuoRpvIE9EoqJ/H05KYIY5QidRK1wb0Iox3XHizXf1/BxquHzjvaCHHh
         UfFw==
X-Forwarded-Encrypted: i=1; AHgh+RrIIYG0eB3ZrwYI1NWGkIaA1IKjiBPJ1k1Hl4+1JdROspLHmd6YPipYB+Ple80KB/1gOC4q3pIxae1q3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYeSH7rSh61Sa+JUMknd2gKr4e1D1im5miLH4vhdkTlr5gg2iF
	dYMPr5GLjdVZsT038nbHFyUUaDkMeWK5SiJ7i+46L/wuihIkkUhPnNN7gyz9JdSShrc=
X-Gm-Gg: AR+sD114urk83RjMmO3N1uef1zLUD0I/cUcjkxOA8+icHN9OIxwb/poQXt+TD7yCCMs
	gXutNNOosGEnsE3DAzLFdnBf6ojunVRSFYbUaIYTCeg4YJlsDAJQ4HjmuLa+5TAhlWbyJz7zKw3
	LM5DCq+cACO7dNlmaIcDdCVe88EU035e7WXct9Smv0N1iYN+Ayw4r3JUHPJgu6FEJea+0767paq
	MZwm0Id6c9nV34suylH414WhXnSbKzsNbvMYh44BRYDnB58IDs/OZ+RvjPJY2vtyZh36X/UPoO+
	TqtaCruAoePBs6QHceID5eeD1MBW1YAi2P/cexxpBZXeXNbbzb3NujkRoRudPJdaeG2m+nRsSl9
	LieIw4Hxk9RBGipbgNSIPT4HnMeudxaFVxwLz6LQdVyMAr/L4VnmSLJzLSHkPsc85ILnOIO0Hc5
	piYZCEm19XFDu7gA9dlQRFedwZDVV2+nwnG626+SZd9aOThcI21g==
X-Received: by 2002:a05:6102:549e:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-74753467d9dmr7663554137.4.1784671819309;
        Tue, 21 Jul 2026 15:10:19 -0700 (PDT)
Received: from [192.168.60.4] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977441dc0basm644188241.10.2026.07.21.15.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:10:18 -0700 (PDT)
Message-ID: <bba0e7c6-e652-4dd8-a777-5e30dca810bf@gmail.com>
Date: Wed, 22 Jul 2026 06:10:10 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
 <20260718185704.3466-1-alexyeo362@gmail.com>
 <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2026/07/20 9:46 PM, Ilpo Järvinen wrote:
>>    *		- v0.1  start from toshiba_acpi driver written by John Belmonte
>>    */
>>   
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/printk.h>
>>   #include <linux/acpi.h>
>>   #include <linux/backlight.h>
>>   #include <linux/bits.h>
>> @@ -136,6 +139,14 @@
>>   #include <linux/types.h>
>>   #include <linux/uaccess.h>
>>   #include <acpi/video.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/thermal.h>
>> +#include <linux/dmi.h>
>> +#include <linux/errno.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/minmax.h>
> 
> Includes should be added in alphabetical order (per each subdirectory
> block).
> 

Will sort the headers alphabetically within their respective blocks.

>> +	{},
>>   };
>>   
>>   /*
>> @@ -415,7 +468,6 @@ static const struct backlight_ops pcc_backlight_ops = {
>>   	.update_status	= bl_set_status,
>>   };
>>   
>> -
>>   /* returns ACPI_SUCCESS if methods to control optical drive are present */
> 
> Unrelated change.
> 

Sorry about that. I have identified the issue to be my text editor 
config. I have fixed the issue on my end and I'll make sure to read the 
git diff line by line for the next submission.

>> +/* set OSPM fan mode */
>> +
>> +static int pcc_pwm_fan_mode_set(int pwm_mode)
>> +{
>> +	acpi_status status;
>> +
>> +	union acpi_object param[1];
>> +	struct acpi_object_list input;
> 
> Don't leave empty lines in between variable declarations. Please use
> reverse-xmas tree order when you can (when no internal dependencies
> between local var don't force your hand).
> 

I will go through and apply this to the entire patch.

>> +
>> +	param[0].type = ACPI_TYPE_INTEGER;
>> +	param[0].integer.value = pwm_mode;
>> +	input.count = 1; /* takes one arg */
> 
> Remove comment.
> 

Will do

>> +	input.pointer = param;
>> +
>> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &input,
>> +				      NULL);
>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("cannot set fan mode via SEFM\n");
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* read PWM fan speed */
> 
> This comments adds zero value over what the function name already tells
> us. Please don't add comments that state obvious things.
> 

Will do

>> +	/* get pwm speed */
>> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
>> +				      NULL, &buffer);
>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("failed to get pwm speed\n");
>> +		return -EIO;
>> +	}
>> +
>> +	union acpi_object *obj __free(kfree) = buffer.pointer;
>> +
>> +	/* the structure should have 3 values */
> 
> That's what can be easily read from the code. There's no need to comment
> trivialities like this.
> 

Will do

>> +
>> +static int pcc_pwm_fan_hwmon_mode_set(struct pcc_acpi *pcc, long val)
>> +{
>> +	switch (val) {
>> +	case HWMON_PCC_FAN_PWM_AUTO:
>> +		guard(mutex)(&pcc->pwm_fan_lock);
> 
> I'm not sure if clang is happy with how scoping is here so these should
> have {} around each case.
> 

Will add {} to each case

>> +
>> +static int pcc_pwm_fan_hwmon_write(struct device *dev,
>> +				   enum hwmon_sensor_types type, u32 attr,
>> +				   int channel, long val)
>> +{
>> +	struct pcc_acpi *pcc;
>> +
>> +	pcc = dev_get_drvdata(dev);
> 
> And this is where I started to check whether you've ignored my earlier
> feedback. Turns out you sent a new version without addressing the
> feedback I've given you (and IIRC, it's not the first time this has
> happened).
> 
> The next time this happens, I'll move this submission and its subsequent
> versions into a very low-priority bin to avoid wasting my time on it. So
> please triple check twice you've addressed every single comment I (or
> other potential reviewer) has given you on _any earlier version_ of the
> patch before even considering sending the next version. There's no hurry
> here, I won't be accepting half-baked patches so you'd just be wasting
> everyone's time by sending it over and over again with things unaddressed.
> 

I sincerely apologize about this. I have made the mistake of applying 
comments where it was pointed out instead of recognizing it as a pattern 
to be applied to the entire patch in addition to repeating mistakes 
pointed out in the previous replies.

I will go back to the very first version, cross-check every comment and 
check it against the entire patch before sending a v8.

Thank you
