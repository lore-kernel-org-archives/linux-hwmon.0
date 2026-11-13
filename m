Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794533234;
	b=tqHB5TmQHlotY9112RvG8iWFCjwFD4soAbkVH30eL8i0gleAgMBt0Sup1etrS2LiFOdh
	 B4wd6Rs5VrhHQ8M2jg0vepp7qI9NxxxwoDEftXltyRO7nDigrHR9KBx0cxTFXqmg8gjoB
	 jTgjlM32/rk0gt4YRnhVfCcVEFg1way5Ey1wZVejphvSxrI+1vULhRJYg/bsqdQvGOc9E
	 jUwowmQe1LDQT7K5W4Vu0qupyDfz4DweElcRhJw2WIFgzhnaki40oys4TpZhSSUAkmlHK
	 m8JfAtBZAJXpfpqot+J8eKpyPmEKxrGrVia5zxmYoGRbTKyI8VaL+VtEAqZIFnCVkRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=PNVU441C08fdqPtRKv8FnttRbifJOT0o+PhRQECQRXk=;
	b=kPLjWzBA55wiCtz7WesEfTBOxhj3EOHn7qf9UHJKvGC0l4fEgTPNSL8ViFXHeOkjTsrS
	 vbolj8zGxZQGb1quDGg430MorrDupXcbYCvJV0StWmLnmWthkJCH1g2KTSG9Td4SjCtj0
	 dY6i/JXKbAXlPgFYc8TGYTyZm1PiSpR4okoPz6QRWDlgQ3DlJUMV1+JsODV4hj2JfSEAY
	 1ms3MxulQB4PtBaAxZdYHRs6asL71sqNX4y2GToshitePUt7ht2m2QlSqLMkbYwSPuSrO
	 R3k5LEZ+mulWm7FD9dBWODGIJmrv+n5kd6opnIdQ0klCYPTXssK37/O889Ely8EuzSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uS+RoLzf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB80606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 01:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB80606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uS+RoLzf
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67be7b9abc8so341831d50.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 17:27:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794533233; cv=none;
        d=google.com; s=arc-20260327;
        b=n0aQyYCPod7aIshiNA7yCE0aMXgEl4U7axgZyYIlftMtaou86lAWZAdo+sa9BC+zXt
         bkgbYqCKrzIdZ9sYq5cYtEoS3zQAmBfRoeOYJQxcGYHYPZg3o8rdsWvTGLoXujFydXcF
         vqnYoQYI509iFfRsjZcnUo9RMD/SJ8hZyX1rNfKKxeg4txirjgr2gpxXm9G58KSX+uHp
         WjlTQxW7MbVQJqV7DHzzg82J9BF12MP7sLftMR4qJFjPa/XHr4Q0rFmBYANosKp2QVl8
         7/29vz5jjTgxkA42UNcW+07zZJENtL8GicQFukBlNZGPy+4MoGoXiZ9rT11816jMdJoz
         sigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PNVU441C08fdqPtRKv8FnttRbifJOT0o+PhRQECQRXk=;
        fh=RMsWBsZ6SZ6r9IVm942FKhkB5XsUuU602NFjH0Mdz/0=;
        b=kkzc8r/9r7Yj31L5Vrq/Bu0GXblPEk8Gc1KzJt8B4BFs+tu5eAMYZ7spiE5Ott0MBU
         pPLgXbRAW2/Di6R9k5QGAbybBy9HvTmdkuryn4lkNO+rkbkIpaG12yB7KORKgsCXBYGD
         V+KP3+mhFSiNfrPUAaLa5ST8pac96s1AHIVlHnPBS6cV89GV/er1K1MBE9HlrpKh+XbB
         bUb28d3RTdlZ88XpWlrUpkoE0c6PycaQSZOxdT+LG92v4J+DeVGWrJ2fUCJG+PJXofA5
         UPyV2wcN2CkHgo7xLD5zCdvI7yp/kna0fd2aCHEgBzEut3h8B019/d6cg5Ur8M8xFCHZ
         vACA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533233; x=1795138033; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PNVU441C08fdqPtRKv8FnttRbifJOT0o+PhRQECQRXk=;
        b=uS+RoLzfEinp/LXeAKi6REEAVQh+EfrxkQi/XivGL1lzZuBEJdiz/FdGgx5ZXF0lch
         kqf7jjW/J8Sd6Vw01xN2RvOn+kIalrOBK6eF5FJ1JyX7brJ9+cOm0WK8wCvz87xZoBYr
         gOt8ziY1CzmC8gstRYxmoz4Mti8MFRsz62RWNYS63kcf3xDHZIuoEuAwzLOXuVT3uIT6
         l8ZKxo+uPogQud8ex/1ornHvoP4X75MjbyfPFyVIzi2VL9AxtqdIxf1UPxHlR3dJS4ZF
         9meR5PQZv4AUbjCJQjy9Gbq0/CC40pnt50Ascr/DJ4X2kaBWI7N9JNFI7LAGsmTwaiTi
         EFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533233; x=1795138033;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNVU441C08fdqPtRKv8FnttRbifJOT0o+PhRQECQRXk=;
        b=JS8CSfCbAS7hsWoUWXmg2kflNPDhVsDJ2+1ykD+hAj2OGvOJhgtifP9QPgrjYHgdjS
         smWYIYFF/5EP+KEnDkpW7jLMFaQRtUER0ZufDBt53HaQFr28osb4QsVWygD63mXYj1CX
         l+K7kNR03ziR3cvA0opcT/4MQXZBsdrXvBgspXJ3LCEAoAuDzRcDmB9vXmJZ7MJYp01T
         u09DfK1iqZM45oP9cSYaP2sqO5LR59yMG5grM+M5HTF2nYGS49SepPADNQ0KT4YR+B0B
         sO4KTEieRdrDwW9fEUlWpT3SIjtPZ5YSR/9z4XdYJotLEslXbLKYX0Y59x+dBV8VGnma
         UflA==
X-Gm-Message-State: APuU4Z+eVgvkVEvcxXuqYUvsnE80lubQVPHm64txBBodMb4mGeH2+xtu
	cGtq0LNLAy3hQv2MesgP8aMvHwa0rQ9B9wnk3TbJ9fvbZ5ghpYHMQRN9AngggOswrrT2EXKZLrs
	kfubpeGDQ4+afpNTCYRYKmw8LTIuDCpBo9Q==
X-Gm-Gg: AYBFou2yZMsaXgiNCWo/nQ53GJcKC/QcEc6QcfshexKhEishxJrjuGrzxbYK47pIgYK
	U7ENLxw9q9FOfFk6TyFIj7kVqqChhZGqgQaFMEEBxOHyNxV/TSUxz5iGsYDQo5cZH2yf0joor9a
	bsZpu53LTzmbB3AMEeEC4qZFqklCgsqEmLAQ2jbAXDxtZoT09zpplBnUnWFbMExdzMVYu9jBfF2
	+nVr00e7+vsWxwwoeUqR4eckviC10guwuRfz9Nptha7h9WbvAghQktJOMCvmp2pjRY9RfGdDDAJ
	kq6Xc76gu8EpDa6ipCNP36i44mwiiHXERoYmDy7SCy7LAe7stHfobhhj3vPvjegN9/4oLbS8cQ9
	ujdjvG2p9EqY2B/C7hE9Rjf2cGKErJ3JfJjHnGw==
X-Received: by 2002:a05:690e:47c9:10b0:67b:f09e:da86 with SMTP id
 956f58d0204a3-67d8965a4fbmr549470d50.34.1794533232934; Thu, 12 Nov 2026
 17:27:12 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 12 Nov 2026 20:27:12 -0500
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Oscar P <niviuq@gmail.com>
Date: Thu, 12 Nov 2026 20:27:12 -0500
X-Gm-Features: AclHuK-eLi6QFP1ScZMsmCSI7JupQHwdGVEELmTttWL98qzhzKDKamI3y927pok
Message-ID: <CAHd3fE8xHMq4Eb7NsP+ofBzUch6AsTNfb7Fo5pU+qopiXZsM1Q@mail.gmail.com>
Subject: Razer PWM PC Fan Controller (1532:0f3c) - guidance on potential
 upstream hwmon support
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Guenter and hwmon maintainers,

I hope you don't mind me reaching out with a question regarding an
existing community driver.

I'm a Linux user interested in getting proper support for the Razer
PWM PC Fan Controller (USB HID, VID 1532:PID 0f3c), an eight-channel
fan controller that currently lacks an upstream Linux driver.

Some promising community work already exists:

- Original experimental driver:
  https://github.com/SlimRG/razer-pwm-pc-fan-hwmon
- Pull request addressing USB communication and stability issues:
  https://github.com/SlimRG/razer-pwm-pc-fan-hwmon/pull/3
- More recent fork with Bazzite/Fedora integration:
  https://github.com/ANeuen/razer-pwm-pc-fan-hwmon

The author of the last fork reports successful operation with
CoolerControl on Bazzite, including tests involving USB disconnection
and reconnection:

https://github.com/openrazer/openrazer/issues/1809#issuecomment-6838865434

The driver exposes fan RPM readings and PWM controls through the
standard Linux hwmon interface. However, earlier versions experienced
communication and stability problems, and the current implementation
still requires external kernel module compilation.

I am not the author of the driver, and I cannot claim that the
existing code is ready for upstream inclusion. My intention is simply
to help bring these efforts to the attention of people with the
appropriate kernel development experience.

Would a USB HID driver exposing standard hwmon attributes be a
suitable approach for upstream support of this device?

If so, could you suggest the most appropriate next steps for the
existing contributors, particularly regarding stability testing, error
recovery, PWM safety and preparation for an eventual upstream
submission?

Any technical guidance or pointers to interested developers would be
greatly appreciated.

Thank you very much for your time and for your continued work on Linux
hardware monitoring.

Best regards
