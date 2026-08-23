Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C853033EC
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508991; cv=none; b=lpqPYPzaKn4WrjlVvoJc/GLu56VlS/Tz6ADXpVKJZdbVrRmrDO+6BZVgpZOXMpcVfIGSeOm5jn3OubUkL7Jbkzgam9hAlZSKs1PqQlkGjaGHNw9NBVHz2CdbwApiKJKTA1b5gOjLySF6i9e7z2HLSPDtx9ie3aodIO3Gll5yNcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508991; c=relaxed/simple;
	bh=LpxMiqBeM9DqdWGKvg6p3ohK3X1JMmpAnTcT9fKnb1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Qp1b7eIUPP51CM5fxwOVh3exmsKHBZy6DqIaWLOshnOVTE2oOnxH1PYgVJ+3x2mkBDCMm/R7/9BKmOpFntYdQG0Mzi2RqA5KfYEDrIuQZoCcw62k7B1EnMVmb/m5AbC/oKXQWpN7sasoMkqc7BbvdxNTPv3IuDw1mmDMjK/jyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlndrSAK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlndrSAK"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c16794450aeso389887666b.2
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787508988; x=1788113788; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=isdF4JSpsa/RqqbLXwBpHx2medr6i9gKnOCHIoCrxLE=;
        b=TlndrSAK6pgH0K+EDAC01KV2RlKc3YGqEbUNlUgSWBUp43enh77hDtc01MFzu5KfHI
         uSZr1r2pPC3qZEwbdAN5MvEBXIj8OmDYqn/Vj/3hchAwn3y6PPlGGpRbd8bm3gUqUu+G
         xpjRlAjifNpYazj+3D/rY5jkH3o4ygJbAzhpQkD51KXLXUX0jYAKWIlUhR7H1+Hx03qU
         OsezXRKXEJIawX0byfm22s8/8e7YoFhfphB8dRpoIceHO5Ng4Qdfp0LW9eriLVKMHnW/
         n1ydJXGt4KC6i3SMtA8QKtWOk5XGEYEn8wjuoZRLjEn2XxB1RBARe1WcQ2Kv8AO28o2A
         S5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787508988; x=1788113788;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isdF4JSpsa/RqqbLXwBpHx2medr6i9gKnOCHIoCrxLE=;
        b=Q8nS0KTzoBSoz4sdxL0JgN9lS2OOGq7eeBPbylCr6xInRYwPt6mqc9867h7tiSDeoe
         H1LDNN9UsACd0z0N6Xr2Aw627XQimJfuSVYrVsnHOmaynXuVHSdJpVPLEvHR6SmiYibM
         HJ/p+NFucEiKyIx5JN4kdUAxmK1UTqjiVP0ste07ujHvySHvsXnFtItTy2abdWDsnKZd
         4H1XyNyQu+pC09gdXJGHm2PM5tAPjFgMhkyq+0nI4++v82ZGiB1wCmYZa69LmPfIHcci
         So8RxPLPhMymr8P/Hfc50ZrzsZMQoGUK2ea34G5sPT3YiIeqt924DFkknKMWuRLmwiOP
         fdgA==
X-Gm-Message-State: AFuF++nLrf6jdY4Ta0szqp0Z4zwMXV8aH1nM5PJyR+0wRQ0V5yeUsKSy
	LG6LSsTUeKaL+SHC5ogq/CNQHcjTeuiNRSpHZDF2pcuyNTNwF7znTtSM
X-Gm-Gg: AR+sD10zoPjzwYTBmbOylOaCX/WDCvTk7z4PNpqdAhymOZYrquN6meJWyW2Vz8beKLO
	jW8eZ0FTqi1lUlRH9FvZDzYEoi3o4YKRgJOeLg6gLic1vDil/TsP7hqn1M9sNHHShNJF6QZA21v
	e0XzmNvUe7O7gSETUJLjt4bUXiXVZUY5MWgCO9SPeK5rTRrgCi6/g+mxDT1XEWZz0XG7WGSUEY1
	0f1rfZYJJxlK9OS/u4g5MBf5cgh/fKYDNqvw0B0IHG1YJCLXfHI0Mo66MAvgaXjTNzsEMsKIxPG
	E3U9fh01E6PYY099qxN+0RfwDxqOJ7J+MxQ/X+IBo2F7tWBcQyD4jKB3yegFE4iaze2S0b2bP9u
	fh4WEcrDcEG+CkC4LF3vYVkiVdaFo4kVLn+oWzsGb13Fe+3/XSB+oclmnlu3bxtm1XfBTib3ymf
	bxj+uMdpARSIAKSndoqaoExF+oLt/r8oC+w8nOwHIiUP9f7ezLO91omXqrwqMjs8dsIH5r8Zabu
	Q==
X-Received: by 2002:a17:906:100a:20b0:c16:8799:fcb4 with SMTP id a640c23a62f3a-c246a6a93fbmr1663128166b.19.1787508987743;
        Sun, 23 Aug 2026 11:16:27 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:9d58:e892:a563:60d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm877491966b.43.2026.08.23.11.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 11:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 20:16:25 +0200
Message-Id: <DKWJ1VMYAVW6.21J53768947YI@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 4/4] hwmon: chipcap2: serialize access to
 low/high_alarm indicators
Cc: <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-4-6a26c8e9e2fc@gmail.com>
 <20260823180616.1D53D1F000E9@smtp.kernel.org>
In-Reply-To: <20260823180616.1D53D1F000E9@smtp.kernel.org>

On Sun Aug 23, 2026 at 8:06 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `scoped_guard` macro is improperly terminated with a trailin=
g semicolon, resulting in an empty critical section that leaves the alarm s=
tate updates unprotected.
> --
>
> --- Patch [4]: [PATCH v2 4/4] hwmon: chipcap2: serialize access to low/hi=
gh_alarm indicators ---
> commit a0d28bd8208a1d69e597290c8ebb0fdf0731e68b
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> hwmon: chipcap2: serialize access to low/high_alarm indicators
>
> This commit attempts to serialize concurrent access to the hardware monit=
oring
> alarm indicators. It introduces scoped_guard usage within the threaded
> interrupt handlers to protect the low and high alarm state updates.
>
>> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
>> index 57d22d65612c2..0a56c55e93942 100644
>> --- a/drivers/hwmon/chipcap2.c
>> +++ b/drivers/hwmon/chipcap2.c
> [ ... ]
>> @@ -495,9 +495,11 @@ static irqreturn_t cc2_low_interrupt(int irq, void =
*data)
>>  	struct cc2_data *cc2 =3D data;
>>
>>  	if (cc2->process_irqs) {
>> +		scoped_guard(hwmon_lock, cc2->hwmon);
>
> [Severity: High]
> Does this trailing semicolon create an empty critical section?
>
> Because scoped_guard expands to a for loop, placing a semicolon immediate=
ly
> after it makes the loop body empty. This means the lock is acquired and
> immediately released.
>
> The subsequent assignment to cc2->rh_alarm.low_alarm executes entirely ou=
tside
> the lock, leaving the data race unmitigated. Should the assignment be wra=
pped
> in a compound block without the trailing semicolon?
>

This feedback is correct. The trailing semicolon is for guard() and not
scoped_guard(). I will fix that for V3.

>> +			cc2->rh_alarm.low_alarm =3D true;
>> +
>>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>>  				   hwmon_humidity_min_alarm, 0);
>> -		cc2->rh_alarm.low_alarm =3D true;
>>  	}
>>
>>  	return IRQ_HANDLED;
>> @@ -508,9 +510,11 @@ static irqreturn_t cc2_high_interrupt(int irq, void=
 *data)
>>  	struct cc2_data *cc2 =3D data;
>>
>>  	if (cc2->process_irqs) {
>> +		scoped_guard(hwmon_lock, cc2->hwmon);
>
> [Severity: High]
> Does the same empty critical section issue apply here for the high_alarm
> update?
>

Same here.

>> +			cc2->rh_alarm.high_alarm =3D true;
>> +
>>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>>  				   hwmon_humidity_max_alarm, 0);
>> -		cc2->rh_alarm.high_alarm =3D true;
>>  	}
>>
>>  	return IRQ_HANDLED;

Best regards,
Javier
