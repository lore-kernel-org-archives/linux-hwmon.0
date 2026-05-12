Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897084A1387
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575361; cv=none; b=c4iQInMUELMOLAJRrYSWbhlA+I9flWmV8s657zUIidfV8TYqn68Tz5s2EIY6DzlVuBbfrhS6Rez3inxQGrac6tKMhrCvxvX/0yPWW/DylP3Y9ZwZ8REwj23kb3a+2xln13Y76/YUK+NSmTR8BuP6Enlze9dTEr9SfREO28mUET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575361; c=relaxed/simple;
	bh=lq+/2jh4vsMC5QGD+Xb1leAx79zaNi8OYDy5lVugXcI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=VJ+DFPqSc5MLZ4G9wymrGZlDyj1xdxTqrNXxZz6/uQ5hKvbjbxSG2N+0rJriteu0Evz9YCt4gAddSQBCjIF+8DTBl2ucoel/JVmb0mI3FHhemWJbIe8BowCt2fQDAodYD3w6uQrElKsijeam2ZdE0VBhLj82QTA77kXbzDzgiUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Chir+hrS; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Chir+hrS"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3817147eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778575349; x=1779180149; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nV86GhwDOWsGDhN/ru26Dzx9121SYap+YK8888DQW0=;
        b=Chir+hrS9TP70zVAvS5qPyQpKVk+jC0Wrs6RwhSfUCW1QiSbziK2cSxmYSxNbvr9SI
         +OtcsVSpQkLy9do0k30yTTnvblGZ0lHzn8E4dOKP/7n0RzrSxj71RFB6nLdzIleiUW5s
         945rqUdSQ38n29coKO+Tu9RVWAYRAsOLVXs4vokjqn3jERFCx+dp1fhWKWBavjQKLYjS
         LktxissiRM7mVxYbfPjK7HWC80fZstQw4Q3SfCANXF7j7mminUvec4Vn7frjZq2wTUwh
         dV4ezlumB27Wsw9yo6zMtwOCQ79qhqSHvS6lvVybMSMuV4bfvRoZfjw8VKqIyXPKKn4Q
         +PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575349; x=1779180149;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nV86GhwDOWsGDhN/ru26Dzx9121SYap+YK8888DQW0=;
        b=imN3ec9HBs8afiq1ZcEufuktB7Ovi7JiT39aB451L6zMmiUKJzpC1TOVz62xZK6JiZ
         CoqtiUlVE0bf9IAKrFGGusHMR7ML1pyQ7vt54nHvGB3GgmS6cvneTRind1BSSomw2Ru3
         Y2EAVNszYDSPv4XnBWDbPbYnYD2I2/HLLh9wAHdroxGtstxEGrITCMsN7x/kfLa4Zb4j
         71Wfk1SZvti7i3vd8JdsOo31Bou6an0XcrxCI3Vxhv37d0zrNdScedyJldTwhZRHoCrj
         kRSr2Su8S5grlrvRmal+4sU4lKTG0JDBsJOI1lozk2Q+ECeiywyUwupTHaz5fCIGM3BD
         2v8A==
X-Gm-Message-State: AOJu0Ywsx6H8z5HMX2QV92gxY+54uAQu5V9EG3D/SWolnVLcuRYafHvV
	m5+NjODFCeGyORGWKUZQ4v0fjr4U/2Pm48F6gL1ihU6wWL/WMdCKD8De2kTW7Xh2l2Osfzq6X3X
	GnomFg+8=
X-Gm-Gg: Acq92OEXyKsnqFq8fXORgusW/hW4Q/KlfUA11pu3StVKFZiyPvy6IPEXQ2EWc0fsV04
	2sWFZtDLx8bjw1A4KieF5Bd67zMcD1/voILex50tWSR46ZW4wn7ofra7TWs9Y/qQ6wA0kk2t1wp
	Wf1J9tRS2DmVpqN+Z5G2Id9pWMF8azf8JzIgwBweoZpI48i32/+lXSIHke3wz99+vcaRm0+smxD
	llVY+Pwbd+KdVcO4hQvb1eH1TvXVBeuJi9RXJVyKlYv3pFiZ9f2ozPpoY6NNCLpcMyPHCIcv+ue
	f2woL0qe0gaDpgdyaV8v0AZ3vaWNROGj+VKIplA4D37K0CyfL9mimwOEOiqkSUWUc+8ZacjA3A3
	VsOU8B1dTb9jk+6AaHi/PxTKP1GeAur4arbTCLl+dx0/EkvaJF02Z2iQNOszc9IIdwwAN0SnqY4
	2WKdTs4TOx5P4plVSyI98821M=
X-Received: by 2002:a05:7300:324b:b0:2f3:5d44:eeba with SMTP id 5a478bee46e88-2ff93d089efmr1476347eec.6.1778575348498;
        Tue, 12 May 2026 01:42:28 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm16695078eec.13.2026.05.12.01.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 01:42:27 -0700
Message-Id: <DIGKCAWMW65P.1GSNT49V8KH98@nexthop.ai>
Subject: Re: [PATCH RESEND v2 4/5] hwmon: (pmbus/adm1266) replace probe-time
 RTC seed with rtc_class device
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-4-7a6d34f0de5d@nexthop.ai>
 <20260512033233.6868FC2BCB0@smtp.kernel.org>
In-Reply-To: <20260512033233.6868FC2BCB0@smtp.kernel.org>

On Mon May 11, 2026 at 8:32 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Missing locking in RTC callbacks causes race condition with PMBu=
s transactions.
> - [Medium] Premature exposure of the RTC device before hardware initializ=
ation is complete.
> --
>
> commit 20e4a34f4a236495f598a1957552fb4fea44b3d3
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
>     hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class dev=
ice
>
> This commit replaces the probe-time RTC seeding with an rtc_class device
> backed by SET_RTC. This allows userspace tooling to drive the re-sync aga=
inst
> /dev/rtcN once it trusts the system clock.
>
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266=
.c
>> index 99e92a8365fb7..0dfb02db86837 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
> [ ... ]
>> +static int adm1266_rtc_read_time(struct device *dev, struct rtc_time *t=
m)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
>> +	u32 secs;
>> +	int ret;
>> +	int i;
>> =20
>> -	memset(write_buf, 0, sizeof(write_buf));
>> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);
>
> Since this RTC device is exposed to userspace, can this callback be invok=
ed
> concurrently with hwmon sysfs attributes managed by the PMBus core?
>
> The PMBus core uses pmbus_lock to serialize multi-step sequences. If an R=
TC
> I2C transaction interleaves in the middle of a PMBus sequence, can it dis=
rupt
> the device's internal state machine or cause unpredictable behavior?
>
> Should this callback acquire pmbus_lock(client) (or its interruptible
> variant) around the I2C transfer to prevent a race condition?
>
>> +	if (ret < 0)
>> +		return ret;
> [ ... ]
>> +static int adm1266_rtc_set_time(struct device *dev, struct rtc_time *tm=
)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +
>> +	return adm1266_write_rtc(client, rtc_tm_to_time64(tm));
>> +}
>
> Does this callback also need to acquire pmbus_lock(client) around the I2C
> transfer to prevent concurrent access with PMBus transactions?
>
> [ ... ]

Agreed. In v3 both callbacks wrap their I2C transfer in
pmbus_lock_interruptible() / pmbus_unlock(). adm1266_write_rtc() is
no longer reachable from probe (the probe-time SET_RTC seed is what
this patch removes), so the new lock acquisition is purely on the
userspace path and a signal can interrupt a contended wait cleanly.

>> @@ -553,7 +603,7 @@ static int adm1266_probe(struct i2c_client *client)
>>  	if (ret < 0)
>>  		return ret;
>> =20
>> -	ret =3D adm1266_set_rtc(data);
>> +	ret =3D adm1266_register_rtc(data);
>>  	if (ret < 0)
>>  		return ret;
>
> By registering the RTC device here, is the /dev/rtcX interface exposed to
> userspace before pmbus_do_probe() completes the hardware discovery and
> initialization sequence?
>
> If a userspace process immediately opens the RTC device and issues read/w=
rite
> commands, can the resulting I2C traffic interleave with the driver's
> initial setup?
>
> Should adm1266_register_rtc() be called at the end of the probe function,
> after pmbus_do_probe() succeeds, to ensure the device is fully initialize=
d
> before it is accessed externally?

The ordering follows the existing pattern for the GPIO and nvmem
registrations in this driver. None of the three registration helpers
performs I2C at registration time =E2=80=94 devm_{gpiochip,nvmem,rtc}_*()
only install callbacks that fire later when userspace touches the
interface. With the v3 locking in place, any userspace RTC access
that lands during pmbus_do_probe() will serialise on
pmbus_lock_interruptible() against the core's PAGE+register
sequences rather than interleave with them, so the
window-without-protection that the original concern describes is
closed by the locking change.

I would prefer to leave the registration ordering as-is for
consistency with the GPIO and nvmem paths, but I am happy to move
all three after pmbus_do_probe() if you would rather have a stricter
"nothing visible to userspace until probe is done" invariant across
the driver. Happy to do that in a follow-up if so.

Best regards,
Abdurrahman
