Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D703101C0
	for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2026 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778103223; cv=none; b=o0m0qu9gDIcOejQX4kYoJCG4gwnwhB5A/B3TflZM0VzraTOa1AACb/jPS4u2/RWH37ydc/ncWGaKKNZKGg7c4h5NpUuc7gBJH+EuFkvh+Xcc8qZ275D2/FuX0/qd6c8g9xkXxUHpBlk2FPkEactnqdybGanB0V6cDZvJJjFYvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778103223; c=relaxed/simple;
	bh=dMbIrheGNaYAV85OtW9Wo1+9kXfiK3PIpOkc3nPKbjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eDT+PYuka2gCfLsWiGQtNS4gfqD1VzGOWaCA8+9bEKCTAEsshgWFlk1ViIaJ/goiocvLwyS2ZDg0L3WwZV1SqEu5qF9M6VdGli+0yUzgr+Mt53aK8rIZjDjxFUJuEOlOxEhPAtT2Wl+5GZ7GYGA052IxWZABy3zDCTL+vinXh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDWPJr1T; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDWPJr1T"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so1693695e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2026 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778103219; x=1778708019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=speIVgikBPZKEXmmEFMgnIv3hnOiW/sq98R/NbvvuMM=;
        b=GDWPJr1TG8/NeMbiWsifSzeZ8k0Q18NgWGOggCXeH6XoATbs76diwaw6k0iRxlApAx
         r+8ZOLNoDlZRYSa8nsEHFmJDC6C7e4d2/+Q8V4ZBQIKTfQqhHOuUD7oMCbrvHRQLVF9M
         6hrBlEavA3Gqx2uKYhTkCUksIWO+eNZZunn6urTIZs/o58qJtdn1YBSMHqxA6/b4Itds
         X1yozmmMKjOle2cxxu0t1tvWmVJgdvTM+s7cRAjG2p9i+JL4i7JGYzkH0ED2rFiqGncD
         zflf8N/AqVcUmGwxfRHko1T4DaGai3CPxmyTG0AezeUJIRfOQOKDIdc/Y9g5MynPYINn
         LRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778103219; x=1778708019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=speIVgikBPZKEXmmEFMgnIv3hnOiW/sq98R/NbvvuMM=;
        b=iU/xNpYNsSKYS7ipWEhmzXuVrmO4zEsqDEz5x5p6IhmNEVJonp7XnBeCvXGqWOgoQ6
         XXtS1u7AF5oJF2qQOkeU4FD7jakS52+GNzjRH4pvVzwl8Y85ujJnxntalMjimSmz/act
         uIBdyknb+rJTeznxOgjN+k/fbCMSGjtj1rtaNP5SHufEI8C0Ysl8jZta5hCQ6+q/ty3g
         qUfUbUISiZcFmfFv3FpFC8X8IIA+d6XwuUh7ig2UXyfUu+O0h3OBGV8b3Qr0pCJ0tea5
         SHaGSc8MsgvQEOlhY21RZybFIz3Ytlju/ZJsi9wHnNHOMvnNd4sSszLDwUC5cUyUJ8lb
         F1ig==
X-Forwarded-Encrypted: i=1; AFNElJ+2I8XPC5jLv0N/5DobLgrtGscD3tTXamcxzzUTrmBwrDcl9qU1V3JovtI6zt0mU8RQacM1iVXBwUMDiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlui0t0VIotKC5QvvLyEsSZdNVepXSfjkuBmPMnDuJpHMXPqk/
	mGdSI6z5DkTqySUWkyCsG4Ytw9sFcXx/1JORamFaAhd9aO9wB2tiqWGL
X-Gm-Gg: AeBDiesYUCExjTsld493ff2ivAqNrkYnO11qnKuDIKrmV1N2FS02nR2YaQaNyYzEerD
	NVMe/emUnQcRNO8E98Gbu7jdOxKIfbHcCQkDmxbsX/R1HNRniQHPCR2pWr4YY6VUhVSMhV24XkE
	aJKoEs2H5SHUVCsGo8k6/k/pnUf1nT5+QgGpLsBJYNtSqiBb/fdU8ZSPCMbHqqfIVn9a98U85QF
	rLKVBUQMNitB2m7Maf07M8xiAjeqkzGPRi0GpR4Yot8Ytl/4PVPICE+0BekwrTgLaQ8u0Om87j5
	zS8a3D7QnbcbPOWZ+fzBCK/2F3SSPAdPxbIAv9OCqsUHpH1r+bwFBk/651wBQXa7p/InwWsLX/G
	yvgqMZd6lgE0qT4vgS6g9xFOlhWUFBwXPi4ojt19fd6z66ko+44Xan0/cI1KOGNTJOuGRLh26ZG
	7JyPg5Z4uUX0jkTGPbjnukGvJy7jQrSZ23fsyyvbIeyRok9w==
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr95182205e9.10.1778103218791;
        Wed, 06 May 2026 14:33:38 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b213asm25243965e9.2.2026.05.06.14.33.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 14:33:38 -0700 (PDT)
Date: Wed, 6 May 2026 23:33:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mario
 Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
Message-ID: <20260506233332.664f220c.michal.pecio@gmail.com>
In-Reply-To: <2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu,  7 May 2026 05:40:34 +0900, Jihong Min wrote:
> AMD PROM21 xHCI controllers expose an 8-bit temperature value

I think this commit message and certainly the Kconfig help text should
include full name of the chip and perhaps its official marketing names
too, so that people better understand what hardware is supported.

So: "AMD Promontory 21 chipset" and "AM5 6xx/8xx series chipsets", or
whatever they are called by AMD and motherboard vendors.

> through a vendor-specific index/data register pair in the xHCI PCI
> MMIO BAR region. Add an auxiliary hwmon driver for AMD 1022:43fd
> controllers and bind it to the xhci_pci.hwmon auxiliary device
> created by xhci-pci.
>=20
> The read path verifies the parent PCI function and uses the
> initialized xHCI HCD MMIO mapping. The vendor index register is at
> byte offset 0x3000 from the xHCI MMIO BAR base and the vendor data
> register is at byte offset 0x3008. The driver writes register selector
> 0x0001e520 to the index register, reads the raw temperature value from
> the low 8 bits of the data register, and restores the previous index
> before returning. Expose temp1_input and an xHCI label through hwmon.
>=20
> Register the hwmon device under the parent PCI function so userspace
> reports it as a PCI adapter, while the auxiliary driver still owns the
> hwmon lifetime and unregisters it from the auxiliary remove path.
>=20
> No public AMD reference is available for this value.

Is there any documentation of the index/data registers themselves?

Any potential danger that something else (FW? SMM?) uses them too?

> The conversion formula is derived from observed temperature readings:
>=20
>   temp[C] =3D raw * 0.9066 - 78.624

Could make sense to describe methodology, particularly in case some
people would come and question the formula.

How was actual chip temperature measured?
Was the output compared with any other (Windows?) utilities?

People will be comparing these results and possibly trying to draw
some conclusions, like OMG Linux runs this chip 8=C2=B0C hotter, should
I demand a full refund of my free Ubuntu download????!!!?

> The temperature register did not return a valid value while the xHCI
> PCI function was suspended in testing. Keep the existing behavior by
> default and allow temperature reads to wake the xHCI PCI device. Add an
> allow_pm_switch module parameter so users can disable that behavior;
> when disabled, reads do not wake the device and return -EAGAIN if it is
> suspended.

Is such behavior useful?

Maybe the driver could just disable runtime PM while it's loaded.

>=20
> Document the supported device, register access, conversion formula,
> module parameter, sysfs attributes, and sysfs lookup method.
>=20
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
