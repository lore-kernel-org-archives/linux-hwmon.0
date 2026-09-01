Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E13A8743
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256227; cv=pass; b=lVzlsGKOJYkSOEB3lValV7H0gH+EaXrqH9qYomNIpH6XcVZGKSW/d+RSNhWxXHq+B8CJx4QvbPfo7I5uiduKD7suikXhOvL7bbI545QoGs7sMIP/QY4lDk5vuvw+fLrb5ji+1Hy+oUcfnB6fheD6tQ88kRjZWeZaWyF8dNygNLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256227; c=relaxed/simple;
	bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuI6FcD6QPum7HX6tZzwQdZkbMHjRmeTTJy+AnMBsW+e/yblBVNoOekWpfEPY0aSKQJX10Dz2DIWNiZUfw5MBSivAHuPShDJNDcK861G9cmDKz0Lzcnr59uARTQEvBhnE+f8KD6FbnMB3VADpzCWaYlgrWZHTzX2g9RfHXDYtco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCO0uy8d; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCO0uy8d"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7dbcb505578so6915747b3.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 02:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788256225; cv=none;
        d=google.com; s=arc-20260327;
        b=hjGSQNNDmMfrA0NNDN0zjJCnymn10q5i4Gwoqj39FRTKCvu++o1eFmXP1uoK7Ks7ZV
         XowqRn92zQ33RaTUqNY3oCI8l7iaKrdVvH02CP/5rvZnmpSmPQ3OTTfnduPzhELnlsYW
         O9v6tWMhv44go4wYZZ6fFD5dNDDbA8zSCU0Tq8Qwhnkj4LIBqkDDULBBv7LKd8mTEn8E
         egwpQQtm/vbM0Xwg207G6Ydy9Y3pwWjTsHKAstIoeWAWwFrmkhbvzfB6V/J/X4g7QShG
         y7bp7Lv7/LBzb9KTAnwnbVIpQKUqcw94Uhp4ZgacNcJ/lGIPUAMuCLoyJSnSy0qHtnDZ
         qKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
        fh=vK5Gyj/TdOGeHTLq/IA96SSsOXI0WPtiDfAn4z2Mm7Q=;
        b=VbSHWYPCFvRWgy8lfpz+lsdPAS2oOLMHLMYQEaamE6H0s9xJI2ixsvkORJt1ILlq1d
         DEgmQde9RtLTx4JxJjdUOpCr5g/0dDAyKDLj1F5qJ3rS/rKBSfubFqenTeYqBseZP88a
         d3Q7BT+s6AYCF3cn4mRALrjnIYQhvzHSSyVlnplsyBhMednfoDZmpeTUVW7Ui3kuICeN
         owMJyeZolOmJgbj9IEPNAp4ndRABP6DeZ/fOGgU04NuCKD+fZX/4kAFcKaa1fXUdKYob
         P9CeNbnhSzRWM24SZIl+OZlQIx2MEYzB2CIXXLF8jYe7Mq+SypuE9kwyztGygOD5zhuZ
         wl4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256225; x=1788861025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
        b=QCO0uy8dBA3WaR0ZWi1yB/gk8l9ZbWC3mz2CFsWJ/CxrTmgfUPCwZ7XA0gTjWyBjvk
         2CYbS6ZmC8b+Ba+8owXRGxHFFfP06LHNGxmtlvttPDB5Rlvrextb5VFAsKLoyO/y9EQN
         KMgk7ZnOLA3weKAeJl7lTU4ZIw35JJ7mNSHtQ/wrNaLoeGvrwf2F7aeVDA84AFfgSIAk
         HQQfdLsomAt0ITrXMAlaYm+pNk2IlxZ5t33+AClAgt83FN8rz4nYV0blRgQ+eJWe62eT
         3258X5wK99lJ3No2+kdcNzVy6ldcE6US1MrI6cM2cB2ZBfy7SoQvZehfycv6dI3ejKvt
         wdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256225; x=1788861025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
        b=mao73Zdfbf3SERA2ekOjPXZIL9b0yz5zlRfu4SiW9cAGwfDcOY7idwUP3jrTfQ+rmY
         P8kUuR8NK+NBNU+3ZGkqtxxls5d3+ZwvYWUoeEI9cKSPNThLJgqgkhVz4Dx3K3RcntoQ
         pAko3nvWyh7jPYgtltDVqmMm0DO/XRfF1mNAQQY6sucx01HS1gCYEkySQmOwo0ktV29l
         G8pshf66+pFLXrcXUjhFQxMhUTTzybMYMh0MnaOnNm9bPxliTGZpMSEIXYPyTe+D0FCo
         0b7ivBDIZFXmgJZw0cM6C+NJ7hWjtziHGmjVUERdUqq1JUCh+G4caL0VZEPBi/uI8ugy
         8N9g==
X-Forwarded-Encrypted: i=1; AKwUvBwDTZjRIhxihXw+rHfkx1VUgY9iXHz9fY28dESw3eVaivP0Ul63DR2B+CRrf7b9gAsp+bOSPkbVH3BQpg==@vger.kernel.org
X-Gm-Message-State: AFuF++nGgh6kxy31pgzE/ZoOkELA4mVXo3Vbqc3t8+WEWKpBCJWilRw7
	yH4j0PkSJT9vS3x15z27l9b5CmNjra4f1rsTf72MTuvOozVSY4vCXiSAJISR4mnUx3LRjwDvoC+
	aK+6TzLz+pnCOXJ/aBVnhDsvzQ4dTyz5Z/4PL
X-Gm-Gg: AYBFou1EQKNT3tdvAMMjbZ36/9jMtvIdgezhlocJIv4Tqqtet00Cl52oLMf4IWcTFZr
	eh05Dq4rmeni1vNB3QpKt+75Dd8xsiVy0bMf9TzkLWxrHs1UNZww8hFudIq6jaTjXraezZ/uDOq
	uEGmFN9bu1jtn8xLjASMBp0yRpIywstwjG7tRnupho3BAqyi6l2lO5AGWuwXK835GHphVX1A7oI
	ac/y2gHN1zDuFhr2D1DBw0F/39YY3zHQc+N8sjiGxhP9Hbucz1LWB9yvGSm4IwzdXgAdbQQiCpE
	KSzaxyXi61TgGfoLWpKvTdhVIOUkTNuBaybP61XLaoQ=
X-Received: by 2002:a05:690c:e0c6:20b0:851:5445:ad5b with SMTP id
 00721157ae682-85d68a8eb63mr94625947b3.1.1788256224722; Tue, 01 Sep 2026
 02:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828105018.2392383-1-congnt264@gmail.com> <20260830150508.1475105-1-congnt264@gmail.com>
 <4242501b-82b2-4ced-82e8-ef4022aa7175@roeck-us.net>
In-Reply-To: <4242501b-82b2-4ced-82e8-ef4022aa7175@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Tue, 1 Sep 2026 16:50:13 +0700
X-Gm-Features: AcwNN1VbEABi07UQC48N4BYIyXzERVS7AP_hVPbnQhjzgZZzvI7mv7_9sPq3u2Q
Message-ID: <CAJpJ=Gv8rnzDEpkp1X6jHojDQeQr1TEdbApJqdQzcz4SyN=QWQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 10:22=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 8/30/26 08:05, Cong Nguyen wrote:
> > pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
> > that calls pm_runtime_disable() is only registered when control GPIOs
> > are present. Alarm-only fans never get it, so unbind warns about the
> > missing disable.
> >
> > Switch to devm_pm_runtime_enable(), registered before gpio_fan_stop()'s
> > devm action so LIFO teardown runs gpio_fan_stop() first. gpio_fan_stop(=
)
> > calls set_fan_speed(0) -> pm_runtime_put_sync(), which needs PM still
> > enabled to reach gpio_fan_runtime_suspend() and turn the regulator off;
> > registering enable after gpio_fan_stop() (as v1 did) reverses that orde=
r
> > and leaves the regulator on.
> >
> > Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Link: https://lore.kernel.org/r/b9792be3-fcd6-468c-9149-7e33640ee167@ro=
eck-us.net
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-4
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
>
> Another instance of a new patch version sent as reply to a previous
> version.
>
> It is against guidance in Documentation/process/submitting-patches.rst,
> yet it proliferates, and more and more people send new patch revisions
> this way. Where is this suggested ?

Fair, this was my mistake -- won't thread rerolls under the previous versio=
n
again. v3 just sent standalone.

>
> Thanks,
> Guenter
>
