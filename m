Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F363909A7
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787519661; cv=none; b=DGSz84NgQKZnp46LWHepqsSyN5MJzlfmiqr/snPDejRvQp51FRaAfJ2Uncw8o7W13rFOrHOVKaTmCh+9DUia5duhareiRV9OU4NvPQrXvEkJw8yBCKH0PWUoU2sMqHVjSpKfQOqAu6Qg97r1kVzSAgnu2MMZVbR0SF+ury03uIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787519661; c=relaxed/simple;
	bh=GQcYsu1xlSX8MURf2JcqINcpimmeh2G5PKGU8mSo66k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hHDfycIe0jkx9RGEhG7/okWuAW8fNntwftmhYUshqHbicbS3tNDhU1xRaRE4ZUbmM334exZILE1G8l6D3RvW8pFWRRy7JmjaYIXMGd89BUGYsF28xa6bxA6wSMJZdRyZx065pU6JjlTqpH1Tm3DgB2wgWjVoPIrXPhgrXGyjYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSBC7hAx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSBC7hAx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so768727366b.1
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787519658; x=1788124458; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GQcYsu1xlSX8MURf2JcqINcpimmeh2G5PKGU8mSo66k=;
        b=YSBC7hAxN4iuQ8FVNKT1gMorHbQ+dPtOj6kyjEG7sK0burO+Njeqp5Zwx/gHmnrHme
         id+zSy46MfnyqP8rKJZOYi2vv+7JyppIoHlbSQlA1/vbI1eCW7XAsmWqqM6vInXt+gSy
         eh5m5jnScfi/svvG3Nn7XvQgiJWxKQv1bRdJs6ki+qesM+ZELhCujseGckxNZJqo6bqI
         qkfm2mqYT6508d8ZZIT8R8GSqH7QAStZdTdkInlnkLeiDutP7CTcfOo2QyWSafPiMvPY
         Eb3hvHWg/mc9niBWVmm3uGal+kV9JKtDLsg1GdB8he3ydutNPEId9LNTWc2uY+nHRzm3
         u0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787519658; x=1788124458;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQcYsu1xlSX8MURf2JcqINcpimmeh2G5PKGU8mSo66k=;
        b=KZyoY3k31Y24zULCa4lu3cQDMWDXNuMIrM+30u77j0zY9Arpye4CQi6rUpMm//dTy8
         H5ZWAJ5danwj2MnFq7X7JZqlI8XP7fdmsmFHkIQHXXp7ik4DnlUvA01Tyg+2q4YOU3Po
         28yz4BCGgBJCzC6RJ9kAOuwscjTIIc5sU4ePZ6LYOqjnnoItyXhy7Oihh5u9LqsXVGII
         qyryYJEc7IkJUJrSfmryM8JvROvUwqtxBTuQtGhgxZ04fsDolnXWD1ULctKIoKGGxBzs
         UYabYBwq5cFo3x1vFT2efAJgcjvQlXn4DWdHCjcoaSC6a4BptT3oWvCXsalD70Rdw4Fq
         IEzg==
X-Gm-Message-State: AFuF++lkjr0T43EXTEuGX8g5lvCHJ6ZKpXnWoy8A5aRn4Js0t8Dzx6tt
	8um22rZZ6/s5YdpPUfCLYH7N7XCAO61iwzfw0F2sXOsuLM5wfvZFjXjegdpwfQ==
X-Gm-Gg: AR+sD104K9uNghzXnNVnP1wYDM1IX2fUUOw1612+GhpB0Qn6tWN2qZVf3XSp6Hu1P3l
	hMhX3HbR1zRfQHLC1dbr3O1jrv4GRZG/lvqMS1ZjMm+oWRwrFCcESOpvCaHTH2mGMtk0XJPYbOV
	xyRzO4BPKhiTIOKOTflMlLAXT5TPz4NcxhkpV1mjS6k0aFneqDGst7mFoK7Y7/T6aKmC3n8NB3B
	Ql0Ln6KAP0VeWi3vHaEPRG1ae5WDfCKN6JhXV7UM+FlrPxTYxHeMHEZluZCdiJeb2loYJHez4cP
	T7MXES/5mz7CoAUvex1GIKl19tIW49E96xyeXCZWMm52nNbLZe7n66DiVLY6lsICj9jr9reHtE7
	ovs8zUI+DtOGTQyBxXTK7Xm4Ddzr6ps6P6FnHYGuJVpBvniKrdiAv+2zYaQzRR8SUSgT1xyEAG2
	PMdD1Cgviheylx6um5En0WzUpKFzPeajOUuP5Cuvfvx9KleklNXYy2Jw2LoIMoIb2KQg9nGLxrZ
	Ow=
X-Received: by 2002:a17:906:fe0e:b0:c15:c323:36e5 with SMTP id a640c23a62f3a-c244d7194bfmr2354385766b.10.1787519657837;
        Sun, 23 Aug 2026 14:14:17 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:3e57:222c:87c4:a243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e025158sm5483628a12.11.2026.08.23.14.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 14:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 23:14:14 +0200
Message-Id: <DKWMU0O7E1H1.3PISYTK05L7RJ@gmail.com>
Subject: Re: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering
Cc: <linux-hwmon@vger.kernel.org>
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 <sashiko-reviews@lists.linux.dev>, "Guenter Roeck" <linux@roeck-us.net>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-2-6a26c8e9e2fc@gmail.com>
 <20260823181259.AA12B1F000E9@smtp.kernel.org>
 <DKWJ6WKOYS9L.34QD4I0N2PJTU@gmail.com>
In-Reply-To: <DKWJ6WKOYS9L.34QD4I0N2PJTU@gmail.com>

On Sun Aug 23, 2026 at 8:22 PM CEST, Javier Carrasco wrote:
> On Sun Aug 23, 2026 at 8:12 PM CEST, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>>
>> New issues:
>> - [Medium] Registering the hwmon device before requesting IRQs exposes t=
he device to userspace before its resources are fully initialized, introduc=
ing a probe race.
>>
>> Pre-existing issues:
>> - [High] Incorrect endianness conversion on big-endian hosts for SMBus w=
ord writes results in writing LSB first instead of MSB first.
>> - [High] Dereferencing a potentially unaligned byte array pointer using =
`be16_to_cpup()` can cause kernel panics on architectures with strict memor=
y alignment requirements.
>> --
>>
>> --- Patch [2]: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering=
 ---
>> Note: The standard review format has been altered and direct code quotes=
 omitted to comply with recitation restrictions.
>>
>> commit 28a819427451e0b54e63443c10cc5e1979c146bb
>> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> hwmon: chipcap2: fix IRQ teardown ordering
>>
>> This commit separates IRQ discovery from IRQ registration in the chipcap=
2
>> driver. It ensures IRQs are requested after the hwmon device is register=
ed to
>> fix devres teardown ordering issues.
>>
>> [Severity: Medium]
>> In cc2_probe(), the hwmon device is now registered using
>> devm_hwmon_device_register_with_info() before cc2_request_irqs() is call=
ed.
>> Does exposing the sysfs attributes before the IRQs are requested create =
a probe
>> race?
>>
>> If userspace applications interact with the sysfs interface immediately =
after
>> registration, could the read fail with a -ETIMEDOUT error because the de=
vice
>> is waiting for an IRQ handler that has not yet been registered?
>>
>
> I am not sure what to do with this, as this patch was actually meant to
> avoid the opposite issue (IRQs still available when the hwmon device is
> not) which is worse because access to freed resources might arise.
>

Both issues can be fixed at once by registering the data ready IRQ
before the hwmon device because it does not need it.
I will update it for V3.

Best regards,
Javier


