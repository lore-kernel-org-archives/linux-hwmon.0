Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8644021D585
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 23:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348023; cv=none; b=ITN+hWPBxK4SlpRYMPwOZ5kJXf9BzvPlnZr5ra8p0MleFDLCx/W736lSzg5Iacxf0fp1W0Dug3ZySgIh2QilGDHCZJMSEk0Svlewz/PErPK4OF1SvbZNRmnoZwCUT8mmGC00yWPCs0T02dHmdzRSQoI5pqiBzX1UhIySeSrSjCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348023; c=relaxed/simple;
	bh=69HfDRJFl6Dq7m/Scdrdc6scaSsgqg3ekUl1KcbkDuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwKMscBeqSN3sfWmL50gU6bgk6bnE8PhynQmkD/tdnPO6jxkkfgnlJMP4IkBW3EjdW1Ry3YgzSVaEqTHojSKV+5vT44+awaJAaAWN/EfalAD7+9GPlNEjy6E4v5mQeYPx4WIy9UxOJU0QP6gykNcKFR0VHrI0R0mOVvEQeJyDUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qxyynpmd; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qxyynpmd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ae255ac8bdso3554000eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 15:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768348020; x=1768952820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0n7ZUyN7wG7rorWypXO+BgFDzlSJ8xSTeOpynkORotc=;
        b=Qxyynpmdq3Kgp70FiV9SDJWzlLKJbKtRWr+7uxDlghVS/sLlUoOr3MUNZ45+eW8Jzo
         rZHLfvHMpUGwW3vXtGz2RkQ+CsRK5XBtoCQWpoki+hGGJuyOKL768Ps9HNOQ/luXIS71
         1lkCuJEWq4FHLGb0q3KWKcxSbKcGE5QPlxmcBzoYoSaNypR8mkh+3YpwmugsqrDxWuk0
         tqu1lHeEaAjIA7hUEKKkd/C2Yv3plMcQycCYSOd0vUXdFOBSZxI9gsDe/rfY1TLCt2ZL
         NtK4FrNVpv8w4MFGgU0Bhi1Ie9VeImqnC6+JCcEW7QBk5v3hbYy1XNrlYwH7xs4IFMst
         BcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768348020; x=1768952820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0n7ZUyN7wG7rorWypXO+BgFDzlSJ8xSTeOpynkORotc=;
        b=iNmTbeBpS1+mv0qOn1r+giRlrmWMo5H5v2eNPSmg6lSnDUYqFs9ZwmHEXHZ4kk2Lew
         rIghkvamQiBDvcyqISl8br86yi69ItSYxmr/0vsUBIG3X9CKb2FEGxB44m7TRhFxVO+V
         9t6gfs2jEhC4KsPV1xVsd0cOwHZyRvdVjENkcB/UEOiyCikYg/OTf3la1b9ZSEflZU9P
         Pbqh0XtKpSljjy2umBdgGcXcNnAIb5HCh5KuEcF4TiAUigOrRP02gfu6Bfb6gAFUThyU
         TgV3JBd0KXSY7KjIEpwXR6beH99rRyxroWsZC/CEAYbh5wKy8vGdoGDHQz0Awl5kqdCk
         oTHw==
X-Gm-Message-State: AOJu0YyiUe92jLWeHhn/u4hBpvLzTjzxRAByt37DEVKD4VVBzDFIm3Lz
	BWaKtgxAOCRqIbZCyOUYt2nCMJO+bC+MPUs7iv2xfdTfcG2qgmeHWN2R
X-Gm-Gg: AY/fxX4DvFHdKr/AmCCQ7h6NXHLeBVl+a4y+FPLqu01YhSsIJuuFYa9xZC8R6LIhZaw
	gvnNAHKeptxdZQdLK4JnZSXkO2gN9Kdlq3sFeONSizaHnnVmNqPGCxW/dlxp9hOdM4iTaYIbxUs
	Gd0frV5plJKZMXrBSlM/aLdV4fNFBNLsiHKpF4LXduiRFRYgTWIKsGp5TuCWsPX2g7MFGIwLgEz
	kYJyRDtAYJFeb7R4CHuXk7S0zyTB1KEkD7jSrmAHRSZi+//85pv1dvJiRwt+GacQAnK+wEGZ1DO
	qdhS8xp049iU2m++sCV6fqLTQjwkyLf+4o+03uyqxZ+qD8tx0xX34l13OIDVwaJWqJFUr0RTLOA
	MWgwncB7DVlmzi7fJhpp7NY2GLzmscEV5vcj+G2yEYYNxpEtguPSU6+bT2ke0/f5Edxdglwq78T
	oKkhcFhemefx/eR2tsE/0hWwxWKWhSaB4J2TRTlLH6is6y1LoPo13vrgDoXKNU
X-Received: by 2002:a05:7300:fd12:b0:2b4:7c92:3f81 with SMTP id 5a478bee46e88-2b48ec3b971mr184087eec.0.1768348020363;
        Tue, 13 Jan 2026 15:47:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d57aasm17697824eec.30.2026.01.13.15.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 15:46:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net>
Date: Tue, 13 Jan 2026 15:46:58 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
 <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 11:15, TINSAE TADESSE wrote:
> On Mon, Jan 12, 2026 at 7:30 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/10/26 09:19, Tinsae Tadesse wrote:
>>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
>>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors during resume and allow
>>> register synchronization to be retried later.
>>>
>>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
>>> ---
>>>    drivers/hwmon/spd5118.c | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>> index 5da44571b6a0..ec9f14f6e0df 100644
>>> --- a/drivers/hwmon/spd5118.c
>>> +++ b/drivers/hwmon/spd5118.c
>>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>>>    {
>>>        struct spd5118_data *data = dev_get_drvdata(dev);
>>>        struct regmap *regmap = data->regmap;
>>> +     int ret;
>>>
>>>        regcache_cache_only(regmap, false);
>>> -     return regcache_sync(regmap);
>>> +     ret = regcache_sync(regmap);
>>> +     if(ret == -ENXIO || ret == -EIO) {
>>> +             dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\n", ret);
>>> +             return 0;
>>> +     }
>>> +     return ret;
>>>    }
>>>
>>>    static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
>>
>>
>> Based on the subsequent exchange, this is not the appropriate solution.
>> The problem is that the i2c controller suspends too early. It should suspend
>> later instead. Alternatively, this driver should suspend early, but it does
>> not look like respective PM operations are available.
>>
>> I would suggest to try replacing DEFINE_SIMPLE_DEV_PM_OPS() in drivers/i2c/busses/i2c-i801.c
>> with SET_LATE_SYSTEM_SLEEP_PM_OPS() or similar.
>>
>> Guenter
>>
> 
> Hi Guenter,
> 
> I tested changing the i801 SMBus controller to use
> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
> change, spd5118 resume failures (-ENXIO)
> still persist, suggesting PM ordering alone is insufficient and other
> firmware interactions are involved.

How about the problem in the suspend function ? Is that also still seen ?

Also, the subject talks about -EIO. Is that still seen ?

Either case, can you enable debug logs for the i801 driver ?
It should generate log entries when it reports errors.

Thanks,
Guenter

