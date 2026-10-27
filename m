Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093025;
	b=q2DBbHGNvndRR07p+2Ctxs4MIBQg4XPHWtVhCS9ruIPJ55hZOzEqz5mRfL3dJ/S7o/JY
	 F+kSq5zZNZTaX5SSNhMq3iVj2FL+C4QFJ6yaaEBwr/7fy5YpDowXEyla7hbR75M3ySzDj
	 z01u82qSEqKoihMYA+g/7az7BGZOc4/60nnlCRCEzgDctr6C8x+bE4fRO3iB8ebqiaM08
	 L+7UkkyhbGftLTo6Ya2llzBbXxvpE3+KBN6Uv6wiPJowYNBCjoX+ia3SixLy+eiryDkbk
	 jcDRAsBSYeuD5nMItWjluKxrgs+mt2UuSAVblm/rjwK3N1kIMxrAgjG++CFdctpyW4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
	b=zrlaiUx9CGkgNMJdqqwzZJ5DutiST4VYSXppEmtjV+i0vy072ZAz9MGcedZ0AUVpQhZR
	 wzOP5Z0w+auT1erGiY2Gh2YnsMn/k+oGYFJmXEwUSupVJHcWznbDrmPJJXS6DWI+/x6v3
	 WEGBs/frf+Il8APRbpJXUCVCAWZAcmFdJDmxQgL3Ip9N1A1H1NFWAS/GmZLBV97HpbpWr
	 g0Tt0r/NV9CiZgaDZ9+HrhHfy0XRB60Tf2TLiSW9xzMY9vb/vy2Plag1E7KdhuBYdY/vy
	 02rV5qQqt48Fk6VdAC8zcwT+jEAx0CAXVeqaNUU6GJ7Wxk4rJPD61F4PrL9PGx5eQuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gs1hjsad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0BE606A337
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 09:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E0BE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gs1hjsad
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso1282068b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 02:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793093025; cv=none;
        d=google.com; s=arc-20260327;
        b=r6ze9B8B6KguDnTqW6MfKyH2G006NBYSjQI24S1Z49tJHaTmTQKA81tT0TGefVDgqQ
         1s8LdurZ/GSVUdbzpPcSpAGX+FA2VvzS5GL31GnKpyOwE3AFgvAxA/aR4z0sDeqt02X1
         gokjTKaMPX/ICeYBGRL5GfHrLdipLNMQ/dK1WohPsY4Gd+6DHisaxolUrzWWWKPLVSaq
         DR8JpZCESU2F9fwl8RgynjuzEEKO/XxeDbbOmJCjO9vdWpasj20HXgYb3pCehdtdOLGy
         UY3upXQXIIPK1r8K07dkLQHHmJYp7TBWX1HJqo9hhnrGVaHeZkHm/o9herFsc4ekgKPo
         PDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
        fh=2wgHDEpRJ5Snc2NW+vxGVR5nKmzqprjDgn6/CmuQFxc=;
        b=mzklrQ+2bB9i3lNZE2qj2r426xrE0ptseEKN7sQtfgmPBI8agsOSk1JH1CmTe/fMUs
         smbeceRIuDm8mATzG7ckTdPcv8MOXUSeP6B5rqzVashvsTA1i5eL++tfovwqGHlWwTVq
         NL6s0XvH2tK5k7th9prj3pQR79bCXro+kDvN863pZM7/tiMPUAhjGgHlSt0SLXWymGHX
         EG9RN7GqVoCz6CqdhqFwzKvgYIBOcK0hinIyB8rfVPz0l5Q05un/8gvp6oCVSBE297cu
         w6Y+wosthf2SZnsEhDjPcSeKxmZk9Vlnq3os1He3cGohIFiQPrXy6F2FuZiZCstIHtvt
         TJjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093025; x=1793697825; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
        b=Gs1hjsadhhTrOMc6iSu4+8C6/UqhNf5aVe2ySfU5CC8jEZy6gmQOa2Gj97TPqyElEx
         436p7r643883lPt4v8gBeVwOqtS3e+w2OLMGYQ7fDpyGD7toTgXSF0E8THZkxLoJh/3E
         ciiEMBSNlWoqtRxIVYIrDetzHzvn1vahQQ8kKzjixIbmOLzI2tbWIF4zUMgAS87XAkiG
         qhqUEFOcbLLI6O4nYuNvVJd/+0q3SgtXjI3NU77jD7XegOnXr9ZeEitVxOOVgDIpcVTg
         9d3XkRg+pP1X5G/+6o+6uKIKHreniXuaBRGteaCuC7aMkjBb2v1tr6bVjqlrs/290nRW
         4wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093025; x=1793697825;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jACJZEOy9s3Wl+8/QWDpBdu4SymQx/EotUdFAbYztU=;
        b=vkgmKqr1w18A9u2kPtWZhAnl2WfhmrHEkT4peu6YMt0zMbhcRVxkZ4m61PsLlQPtRS
         wfU2AyRxwJcOY1FafvaaKOPcYuNWO1emjVS+XGVW3ko90A5Iz4OfmaFb+xmMHihlXnI0
         cl8kI1hCnV3TVD6UHKhrwIK+wqm2ZKk09kdubQOxTecEL6NZakmtOtLis01/JCaOPclz
         rJSFz3l8Bq25ZR3IiNTfI9caUWwAKrkYXzm7DJe7wXVO1g3U/rSgbYO6v3U4uBkeh/2z
         vmuuhkgmGXDhz39Suu2yjVMqOKiM7k+qP8j9sYg4y/qLpDcvNNV0DLHGGlRAZFw3rJVp
         FwAA==
X-Forwarded-Encrypted: i=1; AKwUvBxreWDnIMl6fhphRtRlkJldzTwMQPf3co8F7y5j2i0gXs3MPYRNmpNygQbOlxlXivtmeYveIL9chxYVrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcDE11CMBfXLURPlCqO5FYpur+7zZRIx7P4T78IMEx8MIamMC7
	GK/NV763IcSTFMRSoY3mG6KI0HWO2jh43tvIfQbZM+QVKbg1oPA66HHg5kA9s7fB52iT7B41V2V
	tFQ8XpZvRJSS3l1SSi/iS/q8GWcOsZGbvvA==
X-Gm-Gg: AYBFou2c46IGVdz+wUloaHm5H2jhpq3SHJIRBRfOW3mLpgroyGNJaUOCDLFZDzsuG7n
	pfezpz2FeCFBcX5QatdSAtTcpwqmwLvaip3wT45rAQS0SrHKrRa+Bw9UnZZZVrUDnH4q0jh7DFj
	TaFriESgh8FW3hPdn+dIYhNzc8Q+SxFw8ghruQO7CTB/N7AWoBOlX0LeCD0FJmPYDdJsW2TVzGc
	Cqd2/bAcV46ycXkGyLIcVITQDA39gNaTBKmNDLF1POe2d5q7JMlzahn5JgZo7o+KXNYFKqBe1Yt
	09kPWEjpJI5heWlYl2T0sHEi0vu0JqJMkNHt2IK+fJZScwy/IHt1Tw6TJtZjgv/Bfd4H3bBTtzg
	DP9AMgFnpOTdJ1wTUqOI4J75lYxic7JbFA+4vQlfaWJqXDIUsV6E7rZYm4NHnd0xT6JuzV/2+7L
	CH
X-Received: by 2002:a05:6a21:880a:b0:3e2:7e0c:134f with SMTP id
 adf61e73a8af0-3e7af80effcmr5634590637.3.1793093024830; Tue, 27 Oct 2026
 02:23:44 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net> <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 27 Oct 2026 10:23:33 +0100
X-Gm-Features: AclHuK8-pbrEOhB7S4T7aoKC56lROm_LkCCEjp9fGZ_EnNBKx3YVsCLkjoXmb1g
Message-ID: <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
To: remy@demangeot.net
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 26 Oct 2026 at 09:57, Remy Demangeot via B4 Relay
<devnull+remy.demangeot.net@kernel.org> wrote:
>
> From: Remy Demangeot <remy@demangeot.net>
>
> The MAXIMUS IX EXTREME has a second EC (firmware ID "RGE2-Z270-0109"),
> not handled by the ACPI EC driver, at I/O ports 0x68 (data) and 0x6c
> (command/status). It uses the standard EC protocol (0x80 read, 0x81
> write) and the same bank register (0xff).

I'm not fond of re-implementing EC access logic in this driver. I
believe the ec.c driver needs to be changed to allow us to simply
create another acpi_ec structure to operate the second EC.

Cheers,
Eugene
