Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394671;
	b=apmlYTEqxucmzE6tfURX1avpNdobu5++HiuqEBS55g7Aix4vSogpJ/Mt7btg5L1T6aDl
	 p3deglXx6DaGhulxYKIBh5mLAxUH/4ANyQn1/30s12Z+zIN+FSTAh1Jhy1RkfnFAlh7od
	 vlI6BMFJYbO7P84ze9/BRCGf0e5L2AdL5jlRZTTKQOyPNLcm85zNeQYjtMovDvbXUeRSB
	 +bmKA1sso9Q/nnv6UMDEIS5A2TAzuKoGyjRfS4CTfjUbWuCnjV1icd3i1hWoimzsYnNpt
	 SI2cpgWhbhd9UVZkQTFaA22qSoDE8OZGkC8PmCH90OjHE1UdnkTAV253pGhszdSVPFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B/JodyxslCE0s5rZbktiNiCgYyceChxk1HoTgFEpDMM=;
	b=jiAoVF6Cp4JsHapHm/f6FrdA4+EQOwt6aVV8iYHj6l9inAEtVGOnTeRIJgwGLY3OJqFG
	 dl1vaAhBRDnMar+mCkmeIMMqiCks21KzT5esSrtEw0fOApzlbOBo/FgUbgJ2FQ7H397n+
	 t+/nUXNAV9ziCy56dyC8OgUHdvqk6o8JUrZEXFIZiC9fg233pCgH1yDhHZ5VzkJUJCbBP
	 eSzEIx6Kg8Z0bPw7VFifvzbIylXPzB3HkgKuhBVrIqnbUHoNKE8IuzJW0ncm7YhxkXv2z
	 0K5T9+PfdRhJXXWAYxNggCoTA7+O4V4pLyx2n93/z++t0rns/TlkCIoKTWnb9hpEUMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVNXTubb;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28906606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 10:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28906606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVNXTubb
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so23698495e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 02:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394669; x=1794999469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/JodyxslCE0s5rZbktiNiCgYyceChxk1HoTgFEpDMM=;
        b=hVNXTubbRWSUizyaWoIgKFgbFDKSBccwRfDJSNm8qsUoysuBP8H/F2nkF4RI92wber
         di7s/6CYiBlwknrPU+mDweQFkjcTxdimhkRIl5uSVBZRuMcVbl4SN8eBhwOReHSES/Pl
         jiaRAVgF9xk0KP91UmVe68XmNvA4wy6HWzLTDcgNQWaPWDs0s2Lme/uZYy1lkqK5K4Il
         VxMkub+CfETknI9c/M1xJ99LZOIyCsVQkFIbZnArUEK9cod+T38TwP714EB22efWpFFa
         GOEY05W1C3Wkzolepw6Lc+hXLBjvJkVDNHdGpXToDmXLaWARYFWhsHYsy6F3xngHfKFQ
         9kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394669; x=1794999469;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/JodyxslCE0s5rZbktiNiCgYyceChxk1HoTgFEpDMM=;
        b=SmIciKgY6e+R+C0AbTd/vG3ryaMEwS61DgzZGQi9GfD7Hh8nRzZ3Y8H3pFp4I5T6RG
         PMgG3tMXUsQrsOTo5k6mcgV/ppUmKFs5KPjhaB/dolMriOUw3iu0qLkE1CiPtY3V2WcX
         2Ky4B8h3iBtgwJH5KCy17MTPOYzdiipdRziHXgHp5XFdoCqAtocUuz2WNltRcyWx0AeN
         1ag2Z+axyffBpK9hREW2A9JzJJYDFY85DXOD20K5f+f2i0L0VwCxLWV35f8nm9nshlpv
         X6FC5nZg4/Xrw8AoPGElkfa2OEgynNIF+b0fFb9oqMYZBki44ETGnFW4UJwUQvlr81Cb
         Gt7g==
X-Forwarded-Encrypted: i=1; AL+hErF5xzcyCTpDfqMwLAJNFn0vYumHnS3UzEiOXSFTT/3SJpf9zR0ZAZwHWubBZM/MvSRLcJMvF3fu+kX1zw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wPlxvOoGzQ7Xw/s9BOQbd4uK3+OrRV8ULYzoBqw3LCp5vpM+n
	Sm0GTM1HRiuAxvyVuk6YM7P3dR1hijos5NUU4QrS5c+G3zBCHcItYrkh
X-Gm-Gg: AYBFou0NQUp4t7vaN2Xq3Q/AfdtaVaRNedrjoxL79y3/Kqh+I34j4ccBZeg3FdDbwjM
	gCzTYp7IGvoL3nWRbMn9wt3XZfsV+cA9KQfJpYLq408tzBJKMNcQVhUW9r1Oz+buhhitDl9B1RS
	qat0eSOPQ5wOneoWqV+67fNxRleFW70c3HzdgURSGE4Ui43sDh7lU3gwDLDI4IMfbp1+vXzpcZX
	5KnrarJddFqDlc5ZfHFxTRNlr/eoXJ+uioh3bjxS23otgDTRi80wO5aVj/ip47h4SnXhuhargh+
	P6OkbvUmBgFosnqLVrzA60IuOFElZIA6GS/wXLotJFF0fI8zBmSElglqI2j0EjsyQsEzD+lhZ7R
	gYFpam3AzBAlG26LiIs5cp8Khuw0q+5A9fJdFqxHeCoM6YOdjMlcuLcxOBrfGFLOFdMUyKcuQ7k
	nyQxSRU23c1cKnNLy9UxN6sSJW3rKzHzycmHE+iTnl+ej20Ta6WoLz6hjmiiZlh7IwAEBPuiic3
	12LLQDBuytGgTTd3h+MCWZce+gtk+AKLjhKxWWp2W72w2tntqmc3wkbaC4t8YEfpnpBiyPmuVOK
	jNhtFcQRqOOMFbk2HDXp5cQyxFAv7PWh2utCUebdsTHJlZbLgJkT36iNxwcQB1vx4cpTmd4hojq
	lANo+XEzLuXE=
X-Received: by 2002:a05:600c:1d28:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4ba0939db75mr37798895e9.29.1794394669238;
        Wed, 11 Nov 2026 02:57:49 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950f3casm31107125e9.3.2026.11.11.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:57:46 -0800 (PST)
Date: Wed, 11 Nov 2026 10:57:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp fan control times before
 rounding
Message-ID: <20261111105745.5b3b6a40@pumpkin>
In-Reply-To: <20261111033954.12468-1-zhujun2@cmss.chinamobile.com>
References: <20261111033954.12468-1-zhujun2@cmss.chinamobile.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 11:39:54 +0800
Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:

> store_fan_time() accepts an unsigned long, but step_time_to_reg()
> narrows it to unsigned int and adds the rounding adjustment before
> clamping. For example, 4294967295 ms wraps and selects register 1
> instead of 255 in either mode.
> 
> Preserve the input width and clamp to the maximum duration for the
> selected mode before rounding.
> 
> Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan control")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/hwmon/nct6775-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 6e97e4f08b90..76b2c9551a1c 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -949,8 +949,9 @@ static unsigned int step_time_from_reg(u8 reg, u8 mode)
>  	return mode ? 400 * reg : 100 * reg;
>  }
>  
> -static u8 step_time_to_reg(unsigned int msec, u8 mode)
> +static u8 step_time_to_reg(unsigned long msec, u8 mode)
>  {
> +	msec = min(msec, 255UL * (mode ? 400 : 100));
>  	return clamp_val((mode ? (msec + 200) / 400 :
>  					(msec + 50) / 100), 1, 255);

Just do most of the division before doing the add:
	return clamp((msec / (mode ? 200 : 50) + 1) / 2, 1, 255);

(It should never have been clamp_val(), the correct change was 1u, 255u.
Not needed any more.)

David

>  }

