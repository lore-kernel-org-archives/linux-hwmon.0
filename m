Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAD35CB6E
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Jan 2026 22:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769120936; cv=none; b=kDU+VeqMN2Qv6IY3fPSysd2VLRNZKxDzWxY3+kklxA/1BiGFDQa7+66rs0WGps0Uk1xE8jZT83xzyezO0Jbvel9IK+2EjU0zhtu/8VSoT082AysZRiR8sTAaum9qimzs7bdSlCPrPF5ER9QtwbwicL1VdzeZecGA+Mxw1ohwGvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769120936; c=relaxed/simple;
	bh=Ww6JI24WyVKaOTnSpMAoDJHMfr4gWTESqJzmp7NwNMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xlmn00vac/Qq8jpVrOWWQiTB+wq0uFniXv+2Y7rhtYtU4eaSSwq8Wl8D15/mSnEecwRjG3iMCkKxtscmXxfV6zIHTcnwJ9afK0dkiBrBDlpadY5HmGmPSip7jiZhyon2OqECCvt+h3Y1YWimshVbp3ODMMdh2w1Y7CFdfTgHlNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XR/vtUUg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR/vtUUg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d67f1877so10699355ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jan 2026 14:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769120930; x=1769725730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kJ8Ptphxfx/s85nEV5mUoQB9MpWQ43/7kHR4HQJuZbs=;
        b=XR/vtUUg8eNKUPtotk/GdEduk4qSQ/LmaMRVPMeNi+LGUr/DctL6dTO71zNDjr2WgC
         ETePKHOPJYskIL9kJ/mKSh3VVwOrmUSoH/SL/yF4eL0mlNB2kMqMWtqPyrHTLU9yfr5e
         kcXmH2h+i5BXrMtmOsL8uSqjrZcJTVX/YlSt5h4mgqyTal1h0Ye459cZpYghyamBzJ/C
         VxRIWUZ7n4sL4aRx1UdaCWoIgR1yqBxsy3sGyIQSPDb3rHVpN/ga0lFOq7rpmo/tHNby
         91Dy/C7HaBlhQOltW2x6g37M2RawQjTt3jQXdpclQnD6xPJnTj80MjWT+J9qTJhTFXmh
         E82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769120930; x=1769725730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ8Ptphxfx/s85nEV5mUoQB9MpWQ43/7kHR4HQJuZbs=;
        b=Oqg8O4deoHivJmXRAXbkhgWIb7MI3YyIgSSfxUEY5V3mN92GkMjVkD7UciLw3UtaHp
         sF0VDEVTdiIx9fq9ysUxQC41gGETur7phizviRx+gT+5geVfMm//1FZSiT9/W3CIW4Ux
         D98+nsiVx2Kf1QlfdvsR8y0kec9aVjyIVs+85XobOuQJ0dEq4AFgiLLBOfV4tDEOxKP7
         2M7zlAeLw2A89LCtiJK6Ly1QziXy9xpKg7RYUevTsZKO2l62Ye3EUk9xjUO+dFN/M/kk
         z8qGxrvKnymetUri8hqnGDwcxugzw5q7WGUDmTyt5Xsnmi925SGw4vu8E2Vc3LYz+fzO
         DP2A==
X-Forwarded-Encrypted: i=1; AJvYcCUXKjugRfOgNo+EomhuK72LBN9VHRV+3ZmOK/N4UhyqIUntfFxeJ3Wrj8qytPp0QHibJXAXKz9cMu9/ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7NgrGRFcSKCAwW059UGLia+irzY3/18K1c4xtXaL2e9xrPXid
	Fy9vj2GrDWYM45nCAnto9ivaSjRrMHXNIkNy/x+/5btsKhZSB82HBG2b
X-Gm-Gg: AZuq6aJuiBwqI0J0UnBtCYJBifSf7WnBRDSNv+31oga6yhZHezGX4ciLvdALbl8+RYR
	4d8rcC6rZkaFemIEUG/MxP+JRglWnGs9CR+Wje0GpnUX7pAxcJEC1A8YDNs5vhj9pJW2Rd4xPxT
	yypwZn4wI8mwWNbxyI6AYgE1sHQaSaBTJI3MdG77zzRHSknpWGH4edUf2IzPOeIV+DMJTvZS2IR
	4i69E/kOzPlu06gRpKU5s/+OzbQBBGD/PH1LI/zGLx7XVfmrp4n+i+VsDhm/e5uwZFlROGjlpkc
	1f6BDA3n8TQYVz6A7RAkANZq+nNShqpL8HqAtERZsn8CWGzD32m+Z7h2FFrx9wrIffUwDDG7f9q
	/EIZgSq8emlNX5Vb35sF4mGl5duMzRnR1Odh/OlN5/BedsojSJW+vwta2JznSmhBqo5tUGAl6E4
	l91/nH85J5OfGLpJI7gEGwYd8kqk0jqWZJzou9wnIBxRxvHHO+UHmdrDdMNpLC
X-Received: by 2002:a17:902:d54f:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a7fe734034mr7899265ad.50.1769120929632;
        Thu, 22 Jan 2026 14:28:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3533521707asm3312569a91.8.2026.01.22.14.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 14:28:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d7f34e0f-e258-4fef-93eb-1ef0a3123d95@roeck-us.net>
Date: Thu, 22 Jan 2026 14:28:47 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acpi_power_meter: power*_average sysfs read hangs, mutex deadlock
 in hwmon_attr_show since v6.18.y
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Igor Raits <igor@gooddata.com>, Daniel Secik <daniel.secik@gooddata.com>,
 Zdenek Pesek <zdenek.pesek@gooddata.com>,
 Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0jSbGtRYkjqeuYaT3LXbeZ-xk_Gc0dbCpTZPc6nBD8eCQ@mail.gmail.com>
 <e03c8b69-e667-45b8-b82c-2cd4f1c96bdf@roeck-us.net>
 <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/22/26 12:42, Rafael J. Wysocki wrote:
> On Thu, Jan 22, 2026 at 8:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/22/26 10:55, Rafael J. Wysocki wrote:
>>> On Thu, Jan 22, 2026 at 7:21 PM Jaroslav Pulchart
>>> <jaroslav.pulchart@gooddata.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> after upgrading from kernel 6.17.y to 6.18.y we started to observe a regression
>>>> in the ACPI power meter hwmon interface. Reading power*_average sysfs
>>>> attributes blocks indefinitely and causes tasks to enter uninterruptible
>>>> sleep (D state).
>>>
>>> The most recent change in the acpi_power_meter driver was made in
>>> 6.15, so this is not a regression in that driver.
>>>
>>> Also, nothing suspicious is done in power1_average_min_show() and
>>> power1_average_min_store() AFAICS.
>>>
>>
>> I suspect a circular locking problem between the hwmon lock and the
>> resource lock. Unfortunately I don't immediately see it.
>>
>> Would it be possible to test this with a kernel which has lock debugging
>> enabled ? I'd test it myself but I don't have a system available
>> that supports the acpi power meter.
> 
> One problem I found in acpi_power_meter through code inspection is
> calling hwmon_device_unregister() under resource->lock in
> acpi_power_meter_notify(), which may be responsible for the observed
> symptoms, but then I'm not sure why it started to be visible after
> 6.18.
> 

I noticed that too. It is kind of broken; a driver should never do that.
The proper solution would have been to re-evaluate sensor visibility.
I have a patch series to add that capability to the hwmon core, but that
is untested so I never submitted it.

Anyway, I don't immediately see how that would trigger the problem.

Guenter

