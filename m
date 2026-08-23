Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0D3A6F0B
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787512434; cv=none; b=PgSR2dkE5GugkQxuj2aytndfEN6EWJWCKVvpzvKGqvNXAiZqLx87eitKa12EjgJhbD0QcU0kvSHHoQf4p7qqdMkal5h0Xrk0YH2QgdXO7v6kDHohDPRdXal3BG9809uCVKxRHHpshgSuJ/HYhPCscmFpKFZ8sFVejYhrtgS1p6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787512434; c=relaxed/simple;
	bh=RUCdRD+F2hfKWop8FFARd8OQ8pxjCkmsU51SpNBriK0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=E2kcKMmiOe+37sDRl6zrXOs/Gi0zb6J9WFT1xhY0eUyiHPjZ/5aja4d/nTjEZgD7DEo6OLkLNqeb+zLOsBgHtNCgqmskYHQakAHw5rKLiJpTTxwbdjxLUVYvxggwIP3VAY1oWi17/rxX9B/cQjr9J4oM1LKE9EOWi97qbqi3X94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6+HvjIT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6+HvjIT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c214e625259so383588966b.2
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787512431; x=1788117231; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pkLL5tSQoo6g960xsy4UG6PqyOzqxFK3fRwDP/G23bE=;
        b=n6+HvjITv/KuybgELSObZJRhdcBZB6F7NyMh0+O7lBupFm03LJUXIYyBKpWN6stkF3
         lP46sCTT0bzQ9/dS9zuH/4a3IBRb04g6Dctwh9QkAO1Ny9a6QX03JBc1sjjNhJhghX0V
         46pBBusEBuydr9rU8QZY0fAEms/h3IQExUHqNqsnkiz2k9lwif/dVYbD07wkOH7IdViq
         F2lIG/JUUzv2Dc/rTOGPDUzDqTHGexxawkLanmNCn/sr6Ulba49kTbaSpyn9hb/egDO9
         4NRCkSiriKZwIHaLFtHGPC6/cBkzZqNmV/puJ9V9tv15S/kSspfDUHcNxlU/bWfz8Cyt
         W5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787512431; x=1788117231;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkLL5tSQoo6g960xsy4UG6PqyOzqxFK3fRwDP/G23bE=;
        b=Lj8ESB9tDfiDIK5rULgkZ7gXbHVSoHGRdd7LCesL/tM9zZZWa1NxJCfr9q17U+rrG7
         DoKrRqdnEBNXvZRGN+OLSQqg/V9xjWZMlFu3JghH72vmC8NuHjr8g9c5VhWaVqG/90GG
         Gbbzr/dOzSc07BsZ78zvp7RpnJO4W6m3Sje1aGX1sfSz5w9HTrSjsrWDz5mYuaQcPwUI
         LBOlrI6GIRYQAkSkcVrMOry6vUOQ99pPtEbVU9DVvU5ljYVhtjl1I/lhyjlweM7GsB+J
         fZKJVZ8eGBktpMUmHEzQWXiqdA/Nvqrt7A8encSrkiIF1ZImd0rs377ocebYEbgBg4j9
         HMtA==
X-Gm-Message-State: AFuF++kS7zI4grcOPxnpuHNjrVBm7CQ96J/QOzPjTdibmJV0kedP8LnR
	l19OueR8x90c9AlYhgkfrmjkh8srBTUI237PpPlYK/gKPxUn1eM4o+X6
X-Gm-Gg: AR+sD11co/wb59kPGfIurr1EPI2FqRnIV96/FaBm4rz33q0jFJEYXLHiFDPgvueL+mQ
	NMfGI6Y5KVK3AsPkaZtU6xOCNql1E605/FDm+RyHmJ3i1TFSvWz7wkuRls+eeK16Tj8uAHoEwaA
	e3MQOGlj5QJwY1aoiNUPaA1yT7lIuWFr7TqTyGcJ8Bl5RWpachMauMzNyXY+aIaw2Ywsy8rzS3X
	Djy5HYTsFUjJLFjGQU68TqMCaJNSXSegX5evs4yjdEojkkj93fwoNVvb3fT1Bkc0dymmdteefRk
	4z/RCU+KZdz6oh43JqzXbV/yhrGpkxS2XeUBu05LLvCOiuQA4ZfC6ZLiX/8JF/ejCrVrN7e7hHA
	eGfL8CRNe+fRYuzZk8EG7cKzBC73LfEFFLqf4m8dGfIf/vwAWN9orTsPUZ48y8PVP9BpMoGc/aW
	5PR0PHgZm/gahB1A9lm2A0mUC2zo5C6+i5PI40mFxAOXLJ4HpTf/XJe9C0Z0Hyq4Qd1itNcHBrO
	g==
X-Received: by 2002:a17:907:e901:b0:c16:769b:9838 with SMTP id a640c23a62f3a-c246a2eba8amr2347373566b.5.1787512430770;
        Sun, 23 Aug 2026 12:13:50 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:9d58:e892:a563:60d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b5aasm871597666b.4.2026.08.23.12.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 12:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 21:13:48 +0200
Message-Id: <DKWK9T9Q2SCG.2UFCWWHE7AAGD@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: chipcap2: enable IRQ processing when
 regulator is already enabled
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-3-6a26c8e9e2fc@gmail.com>
 <20260823181143.F32B11F000E9@smtp.kernel.org>
In-Reply-To: <20260823181143.F32B11F000E9@smtp.kernel.org>

On Sun Aug 23, 2026 at 8:11 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Bypassing `regulator_enable()` but calling `regulator_disable()`=
 leads to unbalanced operations and kernel WARNs.
> - [High] Incorrect endianness conversion for I2C SMBus word write corrupt=
s data on Big Endian architectures.
> - [Medium] `regulator_is_enabled()` can return negative error codes, whic=
h are improperly evaluated as true.
> - [Medium] The early return path skips clearing pending completions, pote=
ntially causing stale reads.
> - [Medium] Alarm configuration (command mode) fails unconditionally with =
timeouts if the regulator is always-on.
> - [Low] `try_wait_for_completion()` is improperly used to reset the compl=
etion structure.
> --
>
> --- Patch [3]: [PATCH v2 3/4] hwmon: chipcap2: enable IRQ processing when=
 regulator is already enabled ---
> commit d7e6228cb08396bc9407928fe3b3e28aa4aaf084
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> hwmon: chipcap2: enable IRQ processing when regulator is already enabled
>
> cc2_enable() returns early when the regulator is already enabled.
> This can happen if a previous regulator_disable() failed or if the
> regulator was configured as always-on.
>
>> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
>> --- a/drivers/hwmon/chipcap2.c
>> +++ b/drivers/hwmon/chipcap2.c
>> @@ -119,8 +119,10 @@ static int cc2_enable(struct cc2_data *data)
>>  	int ret;
>>
>>  	/* exclusive regulator, check in case a disable failed */
>> -	if (regulator_is_enabled(data->regulator))
>> +	if (regulator_is_enabled(data->regulator)) {
>
> [Severity: Medium]
> This is a pre-existing issue, but regulator_is_enabled() can return negat=
ive
> error codes. Does this condition in cc2_enable() evaluate to true for neg=
ative
> error codes like -EINVAL, incorrectly bypassing the enable sequence?
>
> Similarly, in cc2_disable(), this check incorrectly tries to disable the
> regulator if its state check failed.
>
> [Severity: High]
> This is a pre-existing issue, but returning early here bypasses taking a
> software reference via regulator_enable() if the regulator is physically
> enabled.
>
> If the regulator is physically always-on (e.g., fixed-regulator),
> regulator_is_enabled() returns 1, and cc2_enable() skips regulator_enable=
().
> Then cc2_disable() calls regulator_disable() without a matching enable,
> triggering a kernel WARN because the consumer's enable_count is 0.
>
> Should this code ensure regulator_enable() is always called to maintain
> balance?
>

I will add this to V3 to keep the balance in all cases. The problem with
setting the always-on attribute to the dedicated regulator that this
device requires deceives its original purpose. The driver could try to
find out in the probe() if disabling the regulator is not possible, and
then skip any operations on the alarms because it won't be possible to
set the associated registers. That would be a major modification that
would require its own series to address a very unlikely scenario. I will
not include that in this series.

> [Severity: Medium]
> This is a pre-existing issue, but does the command mode retry logic in
> cc2_command_mode_start() fundamentally assume regulator_disable() guarant=
ees a
> physical power cycle?
>
> cc2_command_mode_start() calls cc2_disable() followed by an msleep() to p=
ower
> cycle the device. If the regulator is always-on, power is never physicall=
y
> removed, the 10ms startup window is permanently missed, and the START_CM
> command is ignored, causing alarm configuration to fail with -ETIMEDOUT.
>

This will be fixed as well.

>> +		data->process_irqs =3D true;
>>  		return 0;
>
> [Severity: Medium]
> This is a pre-existing issue, but does this early return skip clearing th=
e
> pending completion?
>
> If a late interrupt from a prior timeout leaves data->complete.done > 0, =
and
> the regulator is already enabled, the early return in cc2_enable() bypass=
es
> the reset.
>
> Subsequently, the wait in cc2_read_measurement():
>
> ret =3D wait_for_completion_timeout(&data->complete, timeout);
>
> will succeed immediately, potentially fetching stale data prematurely bef=
ore
> the sensor finishes its measurement, returning -EBUSY.
>
>> +	}
>>
>>  	/* clear any pending completion */
>>  	try_wait_for_completion(&data->complete);
>
> [Severity: Low]
> This is a pre-existing issue, but is try_wait_for_completion() improperly=
 used
> to reset the completion structure?
>
> try_wait_for_completion() only decrements the done counter by 1. If multi=
ple
> interrupts occurred, done might be > 1, so the next wait could succeed
> immediately.
>
> Should this use reinit_completion() instead?
>

I will take a look at this issue alongside the other regulator-related
stuff.

> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but does the combination of cpu_to_be16s() =
and
> i2c_smbus_write_word_data() in cc2_write_reg() write swapped byte sequenc=
es on
> Big Endian platforms?
>
> On Big Endian systems, cpu_to_be16s() is a no-op. i2c_smbus_write_word_da=
ta()
> mathematically sends the least significant 8 bits first. Thus, on Big End=
ian,
> the original LSB is sent first, whereas the sensor expects MSB first,
> which corrupts the alarm threshold configuration.

This has been reported before.

Best regards,
Javier

