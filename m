Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79933B975
	for <linux-hwmon@vger.kernel.org>; Sun,  3 May 2026 21:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777845519; cv=none; b=kcxX0J4+Wy7IARlkh890diXp9smz3XoNjdWWi1hxF4EY//N2GZJivjoqvn8ekfgxDmrDODLsZ8hAZKMrcKBfFZAQxlaVhOhXC7X/8u5Fk3NG3xuZsePK7gy7HBRJWFYwRkVz3tJmS9c3JqJ/z+LA9r7/vQSpAEOa5OtAQRj9c5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777845519; c=relaxed/simple;
	bh=Maox7+t8NYbjt6EnXlO/Q9KUidjJBEBnfV//ggzQK2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9I6O2WPeQMNfFTpw/AjIvE6u3wB4mW8ADy0beKo2ZHOwtFia16vDeKPOVdWpYy1oHoFuK3b3Hb+ZiQnWX76nN37wyXDBw9NB56jqS9xjOSS89opwM+3h95LgJ8+vYwsFeqf2FJuZ4rASpcjH7GLlKCOodLdW9uIulDwU+tUtt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpTagagm; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpTagagm"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4604303eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 03 May 2026 14:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777845518; x=1778450318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y+qT0aKFNqG2zA24Jwuons9yxF4ZZ55cZR8QOY69dXU=;
        b=kpTagagm0CfOIVBnc3/bBgSedkGrzrQN+IWNO0eM/4AGqBNTQs3D14Blr+G0krJ7uM
         LG1YWi7an1bys72ZxbEP+AmzCBYJY7Ci8XPLMKqRzne+3IQxLDWvq8hsfVs27vjkreBL
         6WJTkwzPaglPcyxSD7Dm2N02JXCKYAdWGQxBjLl9fIF6oaEKWwZ6svZrdTW2LK5c9BlC
         eoBhzGbvXaghM52ksS7c/ujuoptqRLqUSKgRRBzwuIkW5FEuw5R7aWGpuGD+M4WF4jtP
         hHgKWxVc+SjMWl+DxRafWdMBxgdWefYhgiv/cFwJZWA5wGLmoY9Q6Ma1uivMZmJW4H9B
         2vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777845518; x=1778450318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+qT0aKFNqG2zA24Jwuons9yxF4ZZ55cZR8QOY69dXU=;
        b=T8mr4z3+oNeoHtNv4EfRxK33pNd/mK4496qeEm3ieEV6pE0tzAhp/cbc0kEhGVzHUC
         BmRAUevYoDhZhGxWinbKNvs/pzNXzVXmyWxJYeAaewBes6L7dm3Z0BfLS1GudbYYeOIK
         5dKMOBLwlCdm9LClEipkdzCRR3bq70Ab8faNdmKg39523EYlmWwoj9o8QGrAIudCGGHi
         KbiLajOr3wF7Jz/Tbts9+tHjysqYoKkewCYqBnYfZri5xMAfntU6OSIJwibjbX2Up92f
         zWh1OuRGyhHLGm627nttg8mATWu4peIOpUXpjkfDtutyHs3laHGXUc89WJZmK/eHVAG4
         tRqg==
X-Forwarded-Encrypted: i=1; AFNElJ9PSIpLJIpP+F7pElue9Jvhl0RCd77Z7E1NBdh7QLapSGTN7bhS17hPkPyua9NoOw4zU9ei97GqNfciRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW2eAFfee1l6fqRJrTJm2rXS3bYKwODDa4343HYbPHgJmzcKcR
	7aHNNfFM9X/6D7X3YD1YXNNdGhBKcNFIdMQ/HQV7nkvlEum4YnGZEMP9
X-Gm-Gg: AeBDieuMSoMyJUIKRSRSYW7Km9wEJXz6sLf6f/ESPNc3gfFC8hdghw8OVwsE4W1EoSr
	3nV9ID9YSmeBL2qJ4u1WiM6Aj7Iz+lPj20YHQjE3un+xEmW2cBJauvE0LkgYh0wTMjbys7vLbSP
	PfcyUP9YFtde/Eq2Rex2scNqdeXQmdeyGu3OmEpMXJjwq2xKJ3m5p183nlV6MqicrXjOkdDdGsB
	11AUIyt0LdRHzcsCH5j+eOuCG/UBbvRwQWqvbHPS78hbKd7I1ypexjwZWTqwzjggCJmGqG/kK54
	3+u0DbGlQUiT28rSC7uPylBXE848QszJZEiykS+4IaTJw6nmblnfI0mLdXfThyBl+b5+z2Qe2gi
	mALwnCcTOJJJlBymasWlnnxCAkXTYcu4rWsEETWdTL+L/LAyRV5nlM+jN8EUMmMR0lyogPbl2P7
	rvbbkeQnK2G/IoVa1FArASC8hwk5aUKaVypWPv9udiGRfESf3qq+fMqBh/HMwi/hoNXhbBdQk1o
	vDLbhnFqpk=
X-Received: by 2002:a05:7300:2316:b0:2cb:4b8f:b2bd with SMTP id 5a478bee46e88-2efb7ad859bmr2794218eec.6.1777845517524;
        Sun, 03 May 2026 14:58:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm13657596eec.22.2026.05.03.14.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 14:58:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <da73d2a1-881c-4424-a83f-f494767c57ca@roeck-us.net>
Date: Sun, 3 May 2026 14:58:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] hwmon: add driver for ARCTIC Fan Controller
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>,
 linux-hwmon@vger.kernel.org
Cc: linux@weissschuh.net, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423091551.15080-1-aureo.serrano@arctic.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260423091551.15080-1-aureo.serrano@arctic.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/23/26 02:15, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller, a USB HID device
> (VID 0x3904, PID 0xF001) with 10 fan channels. Exposes fan speed in
> RPM (read-only) and PWM duty cycle (0-255, read/write) via sysfs.
> 
> The device pushes IN reports at ~1 Hz containing RPM readings. PWM is
> set via OUT reports; the device applies the new duty cycle and sends
> back a 2-byte ACK (Report ID 0x02). The driver waits up to 1 s for
> the ACK using a completion. Measured device latency: max ~563 ms over
> 500 iterations. PWM control is manual-only: the device never changes
> duty cycle autonomously.
> 
> raw_event() may run in hardirq context, so fan_rpm[] is protected by
> a spinlock with irq-save. pwm_duty[] is also protected by this spinlock
> because reset_resume() clears it outside the hwmon core lock. The OUT
> report buffer is built and write_pending is armed under the same lock so
> that no reset_resume() can race with the pwm_duty[] snapshot. priv->buf
> is exclusively accessed by write(), which the hwmon core serializes.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

I don't know why, but Sashiko failed to apply this patch.

https://sashiko.dev/#/patchset/20260423091551.15080-1-aureo.serrano%40arctic.de

Please rebase on top of mainline or linux-next and resend.

Thanks,
Guenter

