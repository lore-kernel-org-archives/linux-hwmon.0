Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA429C33F
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Aug 2026 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786313022; cv=pass; b=EgbZDW8q8Qd2kAVHrQGRivNG6/3t3K+Iy9Kw5GmrZDjwEdeg5BT+koAzjgohgoAsLQxef8WdtztpL8vUL/LNZlhuQ2Mpw7kuvVohFxEUwzUpPFSlXAIuT8m+EUVQ5khmu2Ry5sHMSsQIvpe/4vXn690+e/p88Pto+3CvF4WOYmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786313022; c=relaxed/simple;
	bh=CPHfGfkaCSGgjaBSKrUW4qz8yrb9iYWrMlzI0Ob64gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie/zX4eGdNsr3QNlU7sZE9a5BqWqCSBHFO01f9me31UiIyeD2tlGl8jqT3e9gAIr9daJ/XggrMGJfZqH8Oqx0NAX33BwKfOTJQojnCvf+opqU7Y3M4LhDE9vbgN7vfHbG5HuJgophtSmzyru54uSXWdKtaTf0eggFtxZP/ngvu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=DaNiv2pO; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="DaNiv2pO"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1712a04ddaso185450766b.2
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 15:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786313019; cv=none;
        d=google.com; s=arc-20260327;
        b=GsEr8KOG63hWg6fFqJ8gioNpm+KVCqUKqF0+IVMB+zzDADC4Ck5BugS0Mzjt83UKcV
         L5kZ45yQId1SPTbSuTn2htKgNPPO9S44Bho5qTaen9htQigPqxKsfZNOQHk6g4eOeQIQ
         ZkU6jw8euDygIlgV5rtqFwBhy/UEVzfe0b48HEsxmNh7aXpvO4QKniOsuVgLjXLcOYSY
         Y2o2FtkG9/C3YwagWoF44WAOI0YT17bZqUP1F+sm/zbqsNbobdCgYpMTRsXLnR+/O4pa
         fyJ1RXVu9tZIsZxy1HgKxxCq88BLYW28K9KfYtlm7bzPzEFjPB8ObE1N8VQ0YLMqnSXP
         QkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJZgdGodB9xpTx/XpDx/EqQapI+4V0XVrr+TtqnTcGs=;
        fh=8ro+NKhduAxQV5juS8sn4bd70BE3K6zFjGfqAcJKGIE=;
        b=hhtttEwa3X7cgb1yjqQK3anQbMBZ8IL2Q3/AzA6KFod7FV+Ub+vCj11wFPSpKUHQI3
         RGvbKfWln4tQkLSi4Y/P1dUQC8bYOujcD0HxhfEXywXyqz9LizTiyrLj5k2bfPBVu0X+
         auzSkCjdVEYqMVJCaeBLmmtH43tZyKnGfa5rPBs2RGRBT3KnyQUrOyqGtUfhSF2Qnecf
         0KkMCzqUnEDDsbbgwzbxaLIy8IViyTfANZ+RLBG6x0cshwBGt14G5fPrUh+qhJ8QruxH
         5PRiongU86FT920YdWB+isAdEQm9+2JH2PtxADBayCtEk0B4AcCSupeB9/oawjUL73+1
         FICQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786313019; x=1786917819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GJZgdGodB9xpTx/XpDx/EqQapI+4V0XVrr+TtqnTcGs=;
        b=DaNiv2pOzEHESF6DZ1JPyqfw5bpuGllV6YUW0aW+X8Po5yoInRRpp7Vly4LMRn7F7C
         ju3jY8Ge0fmGYcrLqCzu9ytOO2ycU51DYSZXGPDpFYbjsiJZVG/H6WM25hJSvWreceDc
         MAWsjLEjYGR0ULckrmqksuSHbqFBAz8LQVYgKq9svMHyAxz2mY3X5hjIS/tTdur2T0QV
         tHZAXtt7V2F4e5j4+zcCQxGXopq8OA2imtY0Ryya2B7p9qxnK6oxhJnPb45GWNvFp+My
         KiX4eOhBgyBG1rTeOBWL4ozzpZmhTxWNvdW8vCwCWru3226yU3oCBXYi/jLVgA7ucEg2
         6X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786313019; x=1786917819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJZgdGodB9xpTx/XpDx/EqQapI+4V0XVrr+TtqnTcGs=;
        b=e13irDXaENBnH0GjJSM+Q9yO1Uji8GnMKw1OCYV8xO1b/zAXXAccpemy6AnTBi4qOz
         OLpQqEzP0JwA2U6IL8IlCbsa9iWHHCVTJWrbB+5AQD72y+kRV22huESQ4OeJOyBPTs6w
         usXB7m2/U3XxrtGTV0/JsU/WEN4VF8+TcoO1/8lIVLBk58iEFUl4WpNhYPcWxLjGjFT3
         LrUKLZ9zgrZFRaJwzaMl1b8OVhjAeZTBZwvBhQ6K7lo8MhvtmWSVSVyGajq4vv05Oo4v
         2jfLOTT5I54FSE0Jws/l0H0gTHhMklfwnPMqcLOd31VTXARkRVf47lmGhU0jleBtJAGC
         KDkg==
X-Forwarded-Encrypted: i=1; AHgh+RofefklYB8RwYzoN5U7Gj7WbkVE505wztalAQnQQEzvGXl3B7+vp8nRxSP6zpn7T86W+lYfGiM33X72kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjzwsZFWA6h77spo6HQg6DHyruuLpDPuQq+x/p2AKB4w+xW/z
	c2s4j5wF1itWDV9LDMU8RPmgQRxQ/jp7qZRx2fck2ocs7eAU6TIIxTL4/5r9EbTUWHnLW/Z+vre
	Rn06kK8StBGRbYcXHo22Ji78rhTczHH5zKf3OhJWz/rYSl/4XEyTB6/mW8Q==
X-Gm-Gg: AR+sD12eupJyWzN7lXgdyzYZJbb5WHfO8/QKJb6ZnmseX0FwFoJ+ELFGYEPD9fR9ntz
	SKy+yK9KNx0/Ycv9iLm7+MPKummLUczjr8pF4l6KSXvZF4EGnhZa3CP3A0L8NkaHB9SWTxmpAIc
	qZjSitYjP6tKBJgioC5fdta298FYzHWtrLdbm3oK+tJ8heG/44HUM2JneByN+GT42+Q8cMnTemH
	HBncl3e3c+498RWAWLQhCPNxGtHpo6d+iJHNkN0I1l6b6dEEQzIYFdwSSzExUT5Y1J/qhlEfzRz
	u1sI0Z5puhLsO18y2xwr3NHb4D/8XOIyXC6JBuHFlL13Hw==
X-Received: by 2002:a17:907:d20:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c2039cc4dc5mr2009459366b.27.1786313018849; Sun, 09 Aug 2026
 15:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807000107.1786892-1-renari@arimil.com> <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org> <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com> <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net>
In-Reply-To: <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net>
From: Arimil <renari@arimil.com>
Date: Sun, 9 Aug 2026 18:03:28 -0400
X-Gm-Features: AUfX_mxR7CoQHsKtaqBhqcgOuh5IFOP1HuL442019kU021M_VbRDi23KORuklwM
Message-ID: <CADBHdQ3LhfunbnwCE2AYmWr5XwqSvJ8WGkQFW1G=GQv4dp=Ndw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The github mirror that hosts the same code here:
https://github.com/aleksamagicka/asus_rog_ryujin-hwmon

On Sun, Aug 9, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/9/26 13:23, Arimil wrote:
> > Sounds good, I'm very inexperienced with the kernel workflow (I didn't =
even know you could e-mail patches directly from git). All of the ids passe=
d into this should have that data, but a sanity check for an invalid id def=
initely can't hurt. I'll make a new series and open a PR to the drivers git=
hub repo with this change sometime this week.
> >
>
> What github repo ? The Linux kernel is not hosted at github.
> It is hosted at git.kernel.org.
>
> The workflow is described in Documentation/process/submitting-patches.rst
> I would suggest to look it up.
>
> Thanks,
> Guenter
>
> > On Sun, Aug 9, 2026 at 12:37=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et <mailto:linux@roeck-us.net>> wrote:
> >
> >     On 8/6/26 17:14, sashiko-bot@kernel.org <mailto:sashiko-bot@kernel.=
org> wrote:
> >      > Thank you for your contribution! Sashiko AI review found 5 poten=
tial issue(s) to consider:
> >      >
> >      > New issues:
> >      > - [High] Dynamic sysfs IDs (new_id) binding will cause a NULL po=
inter dereference because `id->driver_data` is unchecked.
> >      >
> >
> >     Looking at other drivers, this seems to be real. See wacom_probe().
> >     Please add that check.
> >
> >      > Pre-existing issues:
> >      > - [High] Missing bounds check on HID report size before accessin=
g payload offsets in `rog_ryujin_raw_event`, leading to an out-of-bounds re=
ad and information leak.
> >      > - [High] The `status_report_request_lock` fails to protect `rein=
it_completion()` from concurrent `complete_all()` calls in `rog_ryujin_raw_=
event`.
> >      > - [High] The device is exposed to HID raw events before its comp=
letions and locks are initialized, risking a NULL pointer dereference and k=
ernel crash.
> >      > - [High] The driver allocates a DMA buffer using `devm_kzalloc()=
`, which breaks cacheline alignment and causes memory corruption on non-coh=
erent DMA architectures.
> >      > --
> >      >
> >
> >     No need to fix as part of this series, though of course patches wou=
ld be appreciated.
> >
> >     Thanks,
> >     Guenter
> >
>
