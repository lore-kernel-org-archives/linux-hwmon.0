Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303377;
	b=B93IskqMv0fxJw2gl0lEpI049rWcOR4jv3AeAdsPLNR9MhXNrT2g/4u303ByYTuRA4+8
	 QU0wbXH106NKcXRejIDQLgXJiAHUQxGcSoQGdouyiTSQllBMsV2jcTAfhafRVyOXADtka
	 OEVOGUuMSr2VLghEzhhO89cVZ92GBPhK8ENQSTKf5ruZboYK8DJuxnci7c9NVu2LT5mZN
	 bXSx678Os1jwAlKLa+um2C5om4oivza0vbRCZcAFl9oygB25b+4wUNuHZ9OJUXvPtBIPr
	 T0i505Ln+239tzkxLhxVXuIaj3HyG1iwP9x2iLe/DIvFdSXADF2X0p0Wlsnd/KpJAvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iucbFFY9zAAhuHSoLktk3X2g9x2uMiv+kG1Kr5rpS+E=;
	b=QgNIbK9HJzohRc54wB4J0HyXz7+MAXmKmFjaoVR50QvljtBYCiJSIioRPxRNDegfDG99
	 D4jjX4Xf0546kJPNxdGBQMdTG1R0sEbNUe3cVNucNPFFIl5/ZU/eqiae9PEZ0BbR88Pkh
	 F7bayn4SCwQaD9lwk2ap12KNlIr7MRkSVjsWX199adQXhJvlSGleGCYfRMECE0EGlJQH7
	 fh/2FiPcz4pRTaUJeG0GzOnfudYOgTe5Jlmxx3BnMPN1U6LnX5TJzCSwUhNKhFRcb3YT3
	 x6tVc4RCGP9HDW/X6fzgzbIsvfTPKESaUHzVwiaSfoWpy3Knh17Xyws/IVoQ/Oyk/ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUlMKgJb;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA29606DA0E
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 09:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA29606DA0E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUlMKgJb
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491846221ffso1249957f8f.3
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 01:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303375; x=1794908175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iucbFFY9zAAhuHSoLktk3X2g9x2uMiv+kG1Kr5rpS+E=;
        b=lUlMKgJbwkULNr+U9YoG0ugtTDHq2B28v7SSuW/Yzh7kL87qP3PR26BfFeBboI+EKC
         VrVYwcq8BQZk2o/w3VdsncJBtzCLpdHVGC4O/qCg0ck811mB8bUeMjmuYkyr2VLnCLVw
         a9b/SEM1TIBbTIizg3kLnvPk3Nrs5nTdWttwC8lliiHiM18uCr3HspTra7d7iGok49Rg
         0lK2SyWHYVTRpBjOtSSVS4o66d2M5Cmo+33GWGs95RwweYq3U7pMojCfnD9KKTWJ6/ri
         AZCnWLc9U90GjSeiUytj8YL8ieYQU8oJfCCFFZwWB6k49y2rQO1YEuPUyxz4aZL7w1Ps
         3vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303375; x=1794908175;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iucbFFY9zAAhuHSoLktk3X2g9x2uMiv+kG1Kr5rpS+E=;
        b=Ewg6VBfxHsQOgZebH47HyWxDQyBqGWtA3jGvhaRnSIkV5Nv480uAqvKEjK+JjoWRVm
         uMksrHuxnmv8s5l/CV090H/IwMlaHnlR86hgKBVJ3q4Q6O8FrbExS/XfRq3/dWRIt8Cb
         QvWMCZo9FpQPZUaqDEzs7PupEGv0AeB9tFEezsFoSCBb1cS6Kp8RnLmJgYD+iBCLpo5W
         2gwjS5+fP3RnBp7xsFk2Aux9HlhtnrNHdmMlwtw21K9y4CMnFcVlHYz5GEAE9BPf4SvX
         SlTNmVjrGiEOINwHgkhXEPH6CFRhapOqfExLDEcI+V58v78CKdB5E5Yf+6ETswhNheTn
         f51g==
X-Forwarded-Encrypted: i=1; AL+hErF4dyf7FNXWzImdWIK+Q335sleSW68v80sW3GP8osUbUkrw6CqxDVikoqpZNQ6EGqRz0RxS9H5j/EtTqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/isqOo5+AFkYW+URHwbcR0p/8vicTCA7JvO0n4d/QRrj3uCAWa
	liryqM6LlLFt+Mh9mzr+7by1IUOojAGoSbCVjyFGnNUdp9ZtWZtaiDQNA8+2Ro12
X-Gm-Gg: AYBFou1CmywrzZqmqwpiY3/iGqIr3jsVqn2tKpWZkAAyaSVXRR0U1SwtXaHFNT5S7GT
	2xHv4nE8LquqSPetMfvqgSec0vImYlUwNh8h8B0rwlsC3IYHASo0BRil4sFK876x/VQRMJ2zWhx
	6+GqWrl7qfIvrr4LxXZ45T9IMKojyahBEh1hY2+QI3JRYMvLKgDCTRRm3+EnM86+QvidDsmvdVv
	UxakSGnZcoJPT9Vg5P5gxRUB4TLLUyBNxDyybKCSwsxKW2UM8ThcXjL+d30H8CmDGs9txR717R2
	+a7YbZKmow5/5DcaAifWjpF26asyUA5iiJPHkwq0Vu5VFQyRqVM9w28JsAd+IWzqtEPVoLaGibe
	fQnW2jSKXbWouHk7+mMN+OkoSxQ30+7KV7LA6FW1wRD9iYV4wJC68pQcdTH5904OMVSVpHXqgFp
	7E8oerDmpO0oHgiZKGUmDsTHW0RwKvUW3e4glT7u+00Ug75bVyMZgu4T3YhamqhQkJtMAlkZbFo
	ZdV09AuKVssy4O5M66peoO572V1U/e9q3eZY6rZvO/Suf/i7LhxIFDUD5rt9SLYOfmSV9fLwHFh
	cOdMdq2X075eFmzoO6xj+MH2K9/3DuPWp4USI3Ch1Ss1Ut8xmrLv8Ynw3+F4sa4z3v8=
X-Received: by 2002:a05:6000:310e:b0:48e:932:af0b with SMTP id ffacd0b85a97d-4982fd3e055mr4320746f8f.32.1794303374605;
        Tue, 10 Nov 2026 01:36:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5c4sm3359512f8f.17.2026.11.10.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:36:14 -0800 (PST)
Date: Tue, 10 Nov 2026 09:36:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83l786ng) Clamp voltage limits before rounding
Message-ID: <20261110093613.52ed3861@pumpkin>
In-Reply-To: <20261109101916.17352-1-zhujun2@cmss.chinamobile.com>
References: <20261109101916.17352-1-zhujun2@cmss.chinamobile.com>
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

On Mon,  9 Nov 2026 18:19:16 +0800
Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:

> IN_TO_REG() adds 4 to an unrestricted unsigned long. Inputs close to
> ULONG_MAX wrap, so an excessive voltage limit can select register zero
> instead of 255.

I looked, it really doesn't matter.
The 'unrestricted unsigned long' comes from a write to a sysfs value.
Nothing will write a value that large unless they are trying to break
something, and they can just as well write "0".

David

> 
> Clamp to the 0..2040 mV register range before rounding to 8 mV units.
> 
> Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
> ---
> Validation: x86-64 and i386 driver objects built with W=1.
> Source-extracted boundary tests passed on both word sizes;
> the corresponding test fails on the base revision. I/O is mocked.
> No physical sensor or booted-kernel testing was available.
> OpenAI Codex assisted analysis, code, tests and changelog drafting.
> Please review and add your own Signed-off-by before submitting.
> 
>  drivers/hwmon/w83l786ng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
> index d16afda34e41..0cd545011e73 100644
> --- a/drivers/hwmon/w83l786ng.c
> +++ b/drivers/hwmon/w83l786ng.c
> @@ -101,7 +101,7 @@ static int temp_from_reg(int val)
>   * in mV as would be measured on the chip input pin, need to just
>   * multiply/divide by 8 to translate from/to register values.
>   */
> -#define IN_TO_REG(val)		(clamp_val((((val) + 4) / 8), 0, 255))
> +#define IN_TO_REG(val)		((clamp_val((val), 0, 2040) + 4) / 8)
>  #define IN_FROM_REG(val)	((val) * 8)
>  
>  #define DIV_FROM_REG(val)	(1 << (val))
> 
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

