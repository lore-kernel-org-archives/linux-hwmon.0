Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60852459CF
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946939; cv=none; b=MLhjq4rNnhfwxv9H+yc7fHvCCR/hER4jaNUWrqoGRDsi7DLL9NheqzJ590oNGRnKmcH20EGYVrRSLJ7FOEa2wXXnRJ2pJS2+4+AgcFNH9R3NPr8LLPoWxCbdF18nvklorV7yao5CdZwe5W/KlfFenBhvA3/um1bZXkE8T9rwI2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946939; c=relaxed/simple;
	bh=BOXuS5EsiAx2w3q3Tmiu3AtfIWO3kJJSgwXsqAUM9So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VH2TlnIfajTGfjBjiBpuWuDKqECtp35X3v1DDCTFGA9zF/LPi1kFiVXYyodCFopWR5+vCQTR08sfdip0tWjLgqqltnDBDHwb6WjyyCt7L+9n+FnwenqImSvoWXyo6myWvZkOzTd1TrJalns1NiwbL8+gQ8KutoVgfCHbUp5V2O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn; spf=pass smtp.mailfrom=har.mn; dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b=KF6ZMQ4p; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=har.mn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b="KF6ZMQ4p"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f757134cdso6605746e87.2
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 05:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=har.mn; s=google; t=1736946935; x=1737551735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmyNJiePAreMHKNWfQczKQWPAA7N6RNkuZbx/Ny6id4=;
        b=KF6ZMQ4pMHFzxFd+O9Nqi+kbmLqDbwRpJAuvhrDVOmnndS2HjxY5UDAs54jYFGNzcV
         reIGBtrSbqbAqQ6EfCRfyfXL4yDmqFU+J9r7a7vxy4fEvIha0QD+o3bfmXWBBIvSENk2
         R4QxN6Rl2bVBrlx3qTHD/mR/0+4oMv3GfsJaEXkbVzoMtfBH1cHN987j1jYkxMAqkiNW
         I+SjbbnwLsPMgc8qr/hcbmYChWagm1cWudSLOtcy5bM4pxHJcC/egiJP7iDZZbuYf/Jd
         H3sLIGM6j7Qz6oT1juTOegGq+lRWDPbFnaVcFQ+qBGkUj68Gk8cFhQfy92lDEjXUei7B
         jHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946935; x=1737551735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmyNJiePAreMHKNWfQczKQWPAA7N6RNkuZbx/Ny6id4=;
        b=REAIv30P9SnvvuXaFhZhFUBark8IBh6Yec6UMNEw8s0gl/XNutn5hyh+ASy7J4EBx/
         IHU3PSbz8JQ86UdraE417/t01iZTq7vTyA//IeMdTrPJPybvyqqB77PosGM+BGFuehAC
         a5wmHsu5937zm4UjBRAeLFHGE4hPmK52lyxOWi4TobB20higjqyUm5KSbYZmc8TryrQA
         KaBOtDXNQDazoLGBw6gOqTAuCZ8sucdBCxc/4eqomPUpzZzyJ1r3oW9D0hDIrpxq234M
         hSdUdCj8ZRYDr4zOuAdWzqjk5s2VpKj3uBcmv7kzkrVjjGTYGVI+/FRJlL0zzHQtfrcF
         +4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVPn8u3O516yeEIxSF+6twz6EZVv5mI1yKNpwaDl41H2DY2ZjZ1/lo/YgYUW6V2/SX7HscadGtIBRhXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx83thnFvPTyIIQVy2B0QGAlc2LRlOnO3Ji6W2dbQsJAWR1609
	qZaUDJ92hWxwAC1ryDGlLZl4PVbbvjQ9CLW1RLudlziCBR/3XuK7np+Kdb01Jo0Svhmoz9Kx+wY
	=
X-Gm-Gg: ASbGncs85zojDErGrHwz/wRjialpXc3+/Knd+Oqn0TnBc3S1PAvcWZCs91DJ4yE+Gim
	vTYFt1XZZMwSFZtRRADUK5tb90XMufjgNo6vseLZAnzDnF8YlA+eQqEx6yXN7it1B13JJ8KIiuU
	UFjs1ufFU0M/9N8geqnQxfSUNYykSa6fcPSlArNDkpK/ocYYfaWcmUMxfIMBPR9Ean3nd0HXryF
	B9IFymawVw6VGbeb+yZAQ+G//RjHXXigTBVouG17nwbpNh3HsNXbJjyUs6x3QxJmt0x2N1yprIi
	JugxcKE=
X-Google-Smtp-Source: AGHT+IG/Cim/7msFqgqDUMI5MItEMwXNVhS+QLHbnXecr0T2cVOoAZKvE7D6PgLUdguSeX92SiuKUQ==
X-Received: by 2002:a05:6512:4024:b0:540:3566:5760 with SMTP id 2adb3069b0e04-542847f9ea2mr9062174e87.35.1736946935136;
        Wed, 15 Jan 2025 05:15:35 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be5481asm2043322e87.79.2025.01.15.05.15.34
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 05:15:34 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so6764201e87.3
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2025 05:15:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLYtSVwuLxMKqIH5ST4RFQLUf4jxfhLO90vQBqy1kkzVR46Tb8r5BiCJvvzmVKfG1PomfRU2gFGy7IhQ==@vger.kernel.org
X-Received: by 2002:a05:6512:1388:b0:540:1e17:10eb with SMTP id
 2adb3069b0e04-54284811017mr9863336e87.48.1736946933754; Wed, 15 Jan 2025
 05:15:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114070704.2169064-1-russ@har.mn> <3205dece-2982-4602-bc72-a63d933f972e@roeck-us.net>
In-Reply-To: <3205dece-2982-4602-bc72-a63d933f972e@roeck-us.net>
From: Russell Harmon <russ@har.mn>
Date: Wed, 15 Jan 2025 05:15:07 -0800
X-Gmail-Original-Message-ID: <CA+zrezQ7nmCWOgeRTO026B0Mgq9QcbC0Nm8-isYHBMQiPcMCVQ@mail.gmail.com>
X-Gm-Features: AbW1kvZjHhsclMSG5IFY0mkcAXgxFCVp8BKnQ6BXtasYKRAYorRL9UvIsJATTy8
Message-ID: <CA+zrezQ7nmCWOgeRTO026B0Mgq9QcbC0Nm8-isYHBMQiPcMCVQ@mail.gmail.com>
Subject: Re: [PATCH] Increase drivetemp scsi command timeout to 10s.
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 3:40=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Mon, Jan 13, 2025 at 11:07:04PM -0800, Russell Harmon wrote:
> > There's at least one drive (MaxDigitalData OOS14000G) such that if it
> > receives a large amount of I/O while entering an idle power state will
> > first exit idle before responding, including causing SMART temperature
> > requests to be delayed.
> >
> > This causes the drivetemp request to exceed its timeout of 1 second.
> >
> > Example:
> >
> > Normal operation
> >
> > $ time cat /sys/class/hwmon/hwmon9/temp1_input
> > 28000
> > cat temp1_input  0.00s user 0.00s system 7% cpu 0.023 total
> > $ dd if=3D/dev/sdep of=3D/dev/null bs=3D1M iflag=3Ddirect  # Generate b=
ackground load
> > $ ./openSeaChest_PowerControl -d /dev/sdep --transitionPower idle_a
> > $ time cat /sys/class/hwmon/hwmon9/temp1_input
> > 0
> > cat temp1_input  0.00s user 0.00s system 0% cpu 3.154 total
> > $ dmesg -t
> > sd 11:0:1:0: attempting task abort!scmd(0x00000000ef8da38c), outstandin=
g for 2098 ms & timeout 1000 ms
> > sd 11:0:1:0: [sdep] tag#4639 CDB: ATA command pass through(16) 85 08 0e=
 00 d5 00 01 00 e0 00 4f 00 c2 00 b0 00
> > scsi target11:0:1: handle(0x0009), sas_address(0x4433221105000000), phy=
(5)
> > scsi target11:0:1: enclosure logical id(0x500062b202d7ea80), slot(6)
> > scsi target11:0:1: enclosure level(0x0000), connector name(     )
> > sd 11:0:1:0: task abort: SUCCESS scmd(0x00000000ef8da38c)
> > sd 11:0:1:0: Power-on or device reset occurred
> > $ time cat /sys/class/hwmon/hwmon9/temp1_input
> > 28000
> > cat /sys/class/hwmon/hwmon9/temp1_input  0.00s user 0.00s system 48% cp=
u 0.005 total
> >
>
> Please rebase on top of v6.13-rc7 and resend.
> When doing so, please drop test results (or send after "---".
> Also, the subject should start with "hwmon: (drivetemp) ..."

Sent. Thanks!
