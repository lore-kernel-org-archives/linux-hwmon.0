Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3952BDC0A
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 19:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765915158; cv=none; b=A6lencsdVEUewIFeKxVVwP1hnVv2e0QxP4m1byQ82g5gfPGGcgz34eGrgDBdAJt2KzvOyRAJ5N3C+tYYcXtrBOl0TPuCkMhcUmXVmrJhhEgvkXdLVYFw97Bcml1Ib7OnKZDkOzEK57YEp7A02M8vL2tkS8UnuPpTIt+eyPinTAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765915158; c=relaxed/simple;
	bh=vz6zEIxg/+wl/MDvP+RvMv0qeimFFpWWQmNPdyV4ahQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVajPJ09Lk+4aEqHlzV5YVWhzxrYBdi/XGhnHn4PQX4yBXhtnYogV/WT5rFwAd5z4l2Vh/fh+dY2BxrbXrqvKQb4O01/gnOf2ViAxxYcrUcd/sRkBqNFl+IbCSLzpPpOqOuKX0jhdn4Sblz5OTs9TrpFbo+Lt6QcMd/qu2ZMuOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQkHgQ8r; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQkHgQ8r"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so55426075e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 11:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765915155; x=1766519955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjniS35+gFl94KgDPsESP+GSizMKZS5/qxbShY9gflU=;
        b=mQkHgQ8rCUqYWNQeWJT+spqbmbXpQXZBVbGCJeUWSHpIIPcLjCD4WKKtC8gq5X3V1h
         uPiB7fkh1u26HvOc8vP0tjZDG+gQ1gR9wTMPHbNV4zBRAbei19yhIG0FspKIuG3edPK0
         72/VM1hTUDRmIWXpjPpznytNY4UqOpmQIzRnuJTNADpvdQnHJgs6SgXGQuJsA6Sgqhxs
         zXqpHAPK7R5P+tZpGQWEYNg3Sz3YMI1g9UpKuOJMk7yQEFOBsLJQvZaCUvjWGEcJ4Are
         Fg2kSpbK3lzL89h7g+ICvVPL0tR3UUaUaT1nr57OdgNuQDNj8K+OUu9RuKEqu4L+p/RI
         XCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765915155; x=1766519955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjniS35+gFl94KgDPsESP+GSizMKZS5/qxbShY9gflU=;
        b=T6cTIbImR17Q5G+71uXedD03wMsFpRTcaqdNy4mVVj+LKAcT2Qsjtvm6zme7WD8drr
         8ghH82SgPh7LSVkmKbw6//Rdiewk8rPi+t+VN4XSNDz6pgrTrpKgn49cocK659uka+6v
         3PT9nnoQLU/OwP6mX1mVXAbihrkYocaowmyHfQnDqYKX1fCEvgS39H9oHeQyyD0Llv0n
         w+XYxfaFQ00Dho/PBPLnZzNAGiUJXurtoE7bh9zlYVeKeNIaB7C+yq1FdG0Qgx8rqgJB
         WEQrUjj+hR7/54fo9+5Pflt4fD2Nzv4p2p6iiUYiKpLGo4prVAHgP+KbOtYLn0DujR7R
         u1aA==
X-Forwarded-Encrypted: i=1; AJvYcCWx482K8DrmJuVYfTJeu+PpypGVZx16x3fTFs9KlFIPuT9DWXGU0R0zaq6YUBzl2qQ3kS43IeTX8NQ16Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZNOaiKHlI1kGu0drmFAJwm9W58x1x16/nOMp0Bl1fASHA01O
	zdMzwRA+ADp8jBUYql877oY5T23Lsw0gnPquMsiBgcmPatRpM56SCsP2
X-Gm-Gg: AY/fxX6i+eiGPEpyMkzM7x/2VGpS+pU4EjR9HxUHT+f7JQknKsCnuBESsZLVD4gSnAU
	tTJCBIp2slEyjElVTJed8MTro/7uB48SwjnWN82oUKx5oz9ZzcociPAfqulAohBARgHDyZQ6umR
	hvonqROsCRUXDtYO6j0IVyV7ZbKVlXxpPfnFrN2b5vosHWGcRbsqjGy++7mzhF+TRN/X0Y1hQJJ
	H53Y9rrXprcj7wFk833feCf776bTEW95Shad4vIjeUcqfPc8ORiW78xzAZ5A5y+7F/w3jVK9QTz
	c9MHnlxM4WQ0VzxJSkOdWWPLgx2cRsrrFVcIibV77uJm9bKKs3f0GkMvBzHsO7y93FzkoOdtKml
	shdm4K+dQvWAn7kbxihOqnOOMh2Faejxeiy6aKPCqFULrmkt1tIo7Ek8sHJimEZHetXpgU78vKL
	evn5f/XRAYECJSFBKBWsdI1pAt1g0brdVVYwmELjuqb4ySnW3kLI5qORg3caV6J+Y=
X-Google-Smtp-Source: AGHT+IGkMCP0kONGgG89SYNUeIIN6orwCVUUHEl6uObTm3wydLwUSISgvgOvaVGUZQxtmSBHQ8CSsQ==
X-Received: by 2002:a05:600c:4595:b0:479:3a87:2092 with SMTP id 5b1f17b1804b1-47a8f9145edmr152180075e9.36.1765915154784;
        Tue, 16 Dec 2025 11:59:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade7c3fsm779077f8f.26.2025.12.16.11.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 11:59:14 -0800 (PST)
Date: Tue, 16 Dec 2025 19:59:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Ingo Molnar
 <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Denis
 Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
Message-ID: <20251216195912.0727cc0d@pumpkin>
In-Reply-To: <14EF14B1-8889-4037-8E7B-C8446299B1E9@zytor.com>
References: <20251126162018.5676-1-jgross@suse.com>
	<aT5vtaefuHwLVsqy@gmail.com>
	<bff8626d-161e-4470-9cbd-7bbda6852ec3@suse.com>
	<aUFjRDqbfWMsXvvS@gmail.com>
	<b969cff5-be11-4fd3-8356-95185ea5de4c@suse.com>
	<14EF14B1-8889-4037-8E7B-C8446299B1E9@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2025 07:32:09 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On December 16, 2025 5:55:54 AM PST, "J=C3=BCrgen Gro=C3=9F" <jgross@suse=
.com> wrote:
> >On 16.12.25 14:48, Ingo Molnar wrote: =20
> >>=20
> >> * J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
> >>  =20
> >>>> CPUs anymore. Should it cause any regressions, it's easy to bisect t=
o.
> >>>> There's been enough changes around all these facilities that the
> >>>> original timings are probably way off already, so we've just been
> >>>> cargo-cult porting these to newer kernels essentially. =20
> >>>=20
> >>> Fine with me.
> >>>=20
> >>> Which path to removal of io_delay would you (and others) prefer?
> >>>=20
> >>> 1. Ripping it out immediately. =20
> >>=20
> >> I'd just rip it out immediately, and see who complains. :-) =20
> >
> >I figured this might be a little bit too evil. :-)
> >
> >I've just sent V2 defaulting to have no delay, so anyone hit by that
> >can still fix it by applying the "io_delay" boot parameter.
> >
> >I'll do the ripping out for kernel 6.21 (or whatever it will be called).
> >
> >
> >Juergen =20
>=20
> Ok, I'm going to veto ripping it out from the real-mode init code,
> because I actually know why it is there :) ...

Pray tell.
One thing I can think of is the delay allows time for a level-sensitive
IRQ line to de-assert before an ISR exits.
Or, maybe more obscure, to avoid back to back accesses to some register
breaking the 'inter-cycle recovery time' for the device.
That was a good way to 'break' the Zilog SCC and the 8259 interrupt
controller (eg on any reference board with a '286 cpu).

	David

> and that code is pre-UEFI legacy these days anyway.
>=20
> Other places... I don't care :)
>=20

