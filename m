Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ADF29B78F
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787509385; cv=none; b=ckEt3sbpuUBdCsbbCANDBEF2M9M6EN954b0kkDMwmjMjTNbWgwFOOuWP1g8DUmFioLD6fFbM8oI5km/3nirQMyVbsa6FG9s0FJT1Pb5BYMraqLM4hsVII+TauT2rp4HJdikfnDFJTC4PPE3TZcGuWAbCAuZMS6NYGOk+RyHJWlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787509385; c=relaxed/simple;
	bh=udNXh6NgZF0uKZVEKkUf/YC4wURS+2sIWuE8rwgph9s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tECOfOn5cSib+uG8wnHAQrp+TmDq/4Q5X/eBb7HNHM+hZZYn7pzShKomzSp8WO7cdMzFvDhTbwzmLZuq1cLw0HC0haV44ySawnlyD+Isv2kuZuRnTRb/FRdKouCgUOFLKxL1vH+NuFb1vec6zYfGPqLOyY9kHCZTV7I5v3VlX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbZ5WDjl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbZ5WDjl"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2055573c8cso399226366b.3
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787509382; x=1788114182; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=udNXh6NgZF0uKZVEKkUf/YC4wURS+2sIWuE8rwgph9s=;
        b=YbZ5WDjlO5L8ygnxujWG98d+3eBGVjvKxdMtgK2JPQhS5vg9eqlXXdvQsD/7xHttCd
         Dd+oDogcmYGWrOzirOVfjkwWgqHIm95e5b/e6ZnCc8Z2dNlI7DLr9gtcN/1oqfdS4+DC
         YIXZCpUfq4wTP54Xeb/niTPsAo94WqVKWuWymJhKAWReKVW323Z7K7E8jFP/bL7F/eRu
         efl8JcKhgBRdd0kKLBzgN765L9q2X2aAt0L/3iRYgJYay3eMarXapJZh7jHJCq6a/xQ3
         poqfPvTpc1Ty024KiUEgXj9mJFXMMv7qbZvhWX5y4J2DBayZq1ACvVAwUa7qqBaw6Ovz
         QTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787509382; x=1788114182;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udNXh6NgZF0uKZVEKkUf/YC4wURS+2sIWuE8rwgph9s=;
        b=WvW4TKL0nr6AFG8p/cAHC7rqCwROFLQYvtxqUOHFhPLtjvc2K+PR0deZzeFTrNRJ5l
         2efW2nkC4aKf651HYL4+k1mKYh23w1XbJyWqSCFgsPa/hSWFARKeME68PqOC4W8ONfoH
         XdTytiP/d1PRXqZnf/ch4tWYsLnbv+fKWjb6R9I3UbVEPtBF/1BpwW0rHqsoTAv2zQ3v
         xoYtmzjse3YUgxDofDRoZIiQV1PXoXhQ2Bdgf2CEIbPS0nBM9nHKpY1HRVJgxakK363o
         GuYjkHfotwu/R6WkGSZDYbKR+mA3P666lT6QDLDaxf/0Zbd+vewEEXo0XxiLV+YaCchL
         Tf5A==
X-Gm-Message-State: AFuF++kbUMyfuV0OA4r7D+qzG5E3zmvfWZlnFciJjoVhrgTkabGx6vFb
	EyGPEofUDfYTD98KmMsQyvWILQav7p+RYnpguHFXP09HA8JeaiLKvyj0
X-Gm-Gg: AR+sD105bQJNIz64mz7cMPGp0DP1E7WmU4AeSFyjgW6Z1U/q9f/2lACwDtBwS1aWjsL
	dTgj0C8okSO8FWvTubDYJWKpljr28IT2I3csvT1HqD1Kq8kgSc13sUfOLxcKoamIBAm+axgoXlp
	PGH2vy0hmmyp3doJ7Dq/XVyJU4sI+4ZyFhmNyHuUCnABrSlJQjeRtEVHyjyougwYcXCAuAGRJWZ
	vC1hy2l/dVofNJabHgvvj2QNC/5GYITvocqyNk7b1kFksEeTvr4s1FbUDvUqKgY1uuACBn1mBy0
	WALZCyqKbubsncgIQt9G6UfTIThlOl/vkDDxO6i2oJUgV+YTCBlC168Rr8ke4OR6CO9FFO1yIEQ
	VkQFn8ZX9PKL+GbpLOKqRWbjXHf7UdNSB63WrtJUuVk4outAPtfPOjVv/iucxUmVH6fj+iResI/
	isyTUxLN6PvtpsJRFg84Z1r9mOR63wqFX9GDOiWtSimW9BNcN6RMjtGNQB0tfM2FgwmvBGFTn1b
	DnrppDm7mEb
X-Received: by 2002:a17:907:3c91:b0:c21:601:6501 with SMTP id a640c23a62f3a-c249272ab1amr1467360366b.20.1787509381576;
        Sun, 23 Aug 2026 11:23:01 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:9d58:e892:a563:60d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm831454766b.15.2026.08.23.11.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 11:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 20:22:59 +0200
Message-Id: <DKWJ6WKOYS9L.34QD4I0N2PJTU@gmail.com>
Subject: Re: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-2-6a26c8e9e2fc@gmail.com>
 <20260823181259.AA12B1F000E9@smtp.kernel.org>
In-Reply-To: <20260823181259.AA12B1F000E9@smtp.kernel.org>

On Sun Aug 23, 2026 at 8:12 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] Registering the hwmon device before requesting IRQs exposes th=
e device to userspace before its resources are fully initialized, introduci=
ng a probe race.
>
> Pre-existing issues:
> - [High] Incorrect endianness conversion on big-endian hosts for SMBus wo=
rd writes results in writing LSB first instead of MSB first.
> - [High] Dereferencing a potentially unaligned byte array pointer using `=
be16_to_cpup()` can cause kernel panics on architectures with strict memory=
 alignment requirements.
> --
>
> --- Patch [2]: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering =
---
> Note: The standard review format has been altered and direct code quotes =
omitted to comply with recitation restrictions.
>
> commit 28a819427451e0b54e63443c10cc5e1979c146bb
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> hwmon: chipcap2: fix IRQ teardown ordering
>
> This commit separates IRQ discovery from IRQ registration in the chipcap2
> driver. It ensures IRQs are requested after the hwmon device is registere=
d to
> fix devres teardown ordering issues.
>
> [Severity: Medium]
> In cc2_probe(), the hwmon device is now registered using
> devm_hwmon_device_register_with_info() before cc2_request_irqs() is calle=
d.
> Does exposing the sysfs attributes before the IRQs are requested create a=
 probe
> race?
>
> If userspace applications interact with the sysfs interface immediately a=
fter
> registration, could the read fail with a -ETIMEDOUT error because the dev=
ice
> is waiting for an IRQ handler that has not yet been registered?
>

I am not sure what to do with this, as this patch was actually meant to
avoid the opposite issue (IRQs still available when the hwmon device is
not) which is worse because access to freed resources might arise.

> [Severity: High]
> This is a pre-existing issue, but looking at cc2_write_reg(), the code ca=
lls
> cpu_to_be16s() on the value before passing it to i2c_smbus_write_word_dat=
a().
> Since the SMBus API internally expects a host-endian value and always tra=
nsmits
> the least significant byte first, does this logic cause big-endian hosts =
to
> transmit the bytes backwards instead of most significant byte first?
>

This issue was already mentioned in Sashiko's feedback for [1/4] and as
I said, I will take a look a it and send a new patch if it applies.

> [Severity: High]
> This isn't a bug introduced by this patch, but in cc2_read_reg() and
> cc2_data_fetch(), byte array pointers at odd offsets such as &buf[1] or s=
tack
> arrays are directly cast to __be16 * and passed to be16_to_cpup().
>
> Can these unaligned dereferences trigger kernel panics on CPU architectur=
es
> with strict memory alignment requirements? Would it be safer to use
> get_unaligned_be16() to read these values?

Same here.

Best regards,
Javier
