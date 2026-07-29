Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A7449B0D
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785351974; cv=pass; b=jt/ujJIspD9TPQIBlGyZ9NYMlj3XqtKqwv/mjrGrOrxcwBj+KGSK2TNgNqRKYicDhSWUxW8edqPeNrvW6NtKz/y+ei02GieVSmu9BY22uYp5FcWpoQopCKvnPU5RknmUctpgkqB/qoK/22mriVz2XuQPhWVn0bqPW/Ld/TRvbDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785351974; c=relaxed/simple;
	bh=wAdu72A3DEXoTjZcNRaRdihUUTgd1Kv+JghHO10IA+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rs1Ew76AbkA+JY4i3hHx2CSsindvmJ+3SQLAXVufbidy1m4jt99JdS646XMj9PH3F2HSSLydVfuzAqOnNbu/Yq41ytEVFWQ6H+9IsMsKG9nGLynWh/aVBZyk9zQaVO/tV1XNNrPuzeKWO4mNwv436aakiLOefg8sbBF2I9ijxjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XscG826k; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XscG826k"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so1935178a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 12:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785351969; cv=none;
        d=google.com; s=arc-20260327;
        b=aSocLymbmg58llb0x3JoJa/vOvHWluNJxUeM64L6pHVA01RYrGk4lKIZ8rPF0PCs0u
         YmDub41N9lQA+fyWsZRmh/vVI1AzZ+DLzxN2xwpcUNdnE9ZufCZsc2Enr1QCnEt4BRSA
         dxgRrBxOfAV+JleXq+VszChAjVSdobU7yiKfmMEIyNo3GoSd476U4gHFlJK92Ef2xiNe
         Dp0tU7Vqvi6ID/W1zRR59kWxSvJs2K0/UNAdtqWYHF7AKCd5HwjKkr/oPALcVFym71bq
         M4YiHqsC54t72m/4tgMy1Ir81PjenEObSgOdUKZDThqLaDzmEcHbS+m1+lSXMdN2QB9a
         KXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DZXBsryljzvRAdARemAvVq8vZ8/d5uAOMgvUJOrxQGo=;
        fh=qjQnNQMG44+fsyirlK6bGBCA440AguQMwhLDC/LhYts=;
        b=LOe88gqthaTzqiX/71Ou7GujQT3EsjIK/gWHZ3/SJvP2YzYPyOKcRU0LnrHxlq6ddv
         dsaEt1ervfUYlaanhOuYf/4YBL2NxuMHkCN09nQ/xEclmOUrLfl14qd53K0/P4iuRSEq
         pro7Yc/3wTdFCpqVWG61cMjz/AA+lrRGFhbuKmrXOBtDWv7De+XLdEpI7/Yeh/AM/ZnF
         oXWQNkkQDku56zQKVYTw1Chw5D3jTJKnftKw7y6zFraLpvKK3lz8CYZohqB8nDLrw0Kn
         +cp53vxvJ94YjE3KGhhv6YAAiBsgN4fS9OJqGOvPDP/Wwj79CjKKfjCU1SSP/NV4y0+p
         8vcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785351969; x=1785956769; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZXBsryljzvRAdARemAvVq8vZ8/d5uAOMgvUJOrxQGo=;
        b=XscG826kFPsTzf15VIzEtkWguGRxdeVLX7qphy039ovATEVGGy32IpTQ12b0OtZDQG
         /7Zkv/y+A7alqLq0ecD2i46Q3iCutF08vhukdOgck0J9AmGq8NMrPgD75c9VXFI1ekmp
         KRc3Z5RddKb0QEkRKQhFUgIlpAzT+hnWzmhk1Hf07vXiMKDMJddeyItDE1yfhN7sakbi
         GEe67LsJgguOS63Dwz2jlJPctXHujr6DXCJ361CQMu1syXlWMwumuNzroORgPuzxCGsI
         f/9jBQddDcWNbyg0wQvcltfYpKw/fih6E4z11rK0F3oY0FEQ1x0MjNnDD3aC+upqkzyg
         5Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351969; x=1785956769;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DZXBsryljzvRAdARemAvVq8vZ8/d5uAOMgvUJOrxQGo=;
        b=epgRUXxJpm1qLwSAK0h5t3KO7bdvVM7xn9NJVXOqcUo7kxZSaE5U2DcXKqGOCo6fNM
         YXSICmRCjNDwqLwJUhvwtm1R12g5ZXDioYXUuZwPvC7CXib5f+a2WPKjGcdQVIGHtTo6
         8goSVSJ62H1X+M/UN/2J1znMezGDzjBmPJ9g/IypAQRd+0LXFS9vgI9Q7aaHGDxYDcqV
         OSLNrKFTJgDQkdpMnbS2hb9lCEqyh5cpgAvHYkXJM9aDGp55kfXV3vm6pVQnDmyKWGbf
         gRQ8yKq9hufNUjVH3jJfUVgfvuln/rNG0wcvMV/ps5udzS9i6Q/y5oVLoADhxs5q5gEq
         oK5A==
X-Forwarded-Encrypted: i=1; AHgh+RqGeapUQK/AK/UB9phvJ1iY2Hl7B7KVn4UMSnJZ12KRXXKsUm4Q+pIktSxaXvtkXKeIhZHVh/0QjTDdng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbJMptfu422wktUEgaQZIyE9+Bbd2ooGMWXsji+NUP6l/dxWMG
	dOd2/7EBKXEoMcpccm/+2joJJVEaggfVGeUDD0TJnMjtjrpJw683bivgipQOsep5W/g4x2cwnRv
	264Cdr6dCBllXzy/5jGgHuDGYB/MANDM=
X-Gm-Gg: AR+sD10ukGP3Od8EKw3k+9BHb6Hvs72GCbeCRt13+nsurYuCPMEku0+ZedakviQOuPI
	fOZEpeCH5gG7XG3bA0DisGTUNcbkv1a98Oxqi4qxgUIziNgnQClKvXQVxzdhfKPEWZErwddNSI5
	uouJYisIhRF96rWDWoXg4bIBY8vYYH1Bioko47eQDgxWhBG/to/G20pWLQc0oM5KKvXJ9rmHboi
	LDeBDBdZvJYUfSmCSnXajtUxY+OeAtjRIPKBx35M4Xk0dBlhMRkVytpnEbzekvI/TjFPHr17HDh
	UC+hMwfrmaWUm6DgGaPC/bp5cSRGpqePgjDu6ypc+zVmm6xNZPpZwnwqSx7qNE6+MnRIugtVXUz
	Tsg==
X-Received: by 2002:a17:907:a0d1:b0:c1c:4c91:c24d with SMTP id
 a640c23a62f3a-c1f7248682emr457131166b.57.1785351968958; Wed, 29 Jul 2026
 12:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
 <12dfeaae-f806-4adc-95f1-97fe10ef748e@roeck-us.net> <amnoV4Vlxmc5QgVC@monoceros>
 <e535a9c5-28a5-470c-be21-95e1812e5e01@roeck-us.net>
In-Reply-To: <e535a9c5-28a5-470c-be21-95e1812e5e01@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 16:05:56 -0300
X-Gm-Features: AUfX_myK09lnBqf8bijuFVi6yJ4owlE81-Hh3AUMgJGBEnXoh0IbuXXrjswABFA
Message-ID: <CAJq09z5diKf9HpJ0B_7tyo2-2wPfojyG4pRY1qhRQ3fzx0Gr4A@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v4 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter, Uwe,

Thank you both for the detailed reviews. I hope I'll address all the
points discussed in the next version.

> >> No, I won't accept this. It has to be either or. A pwm channel modeled as pwm
> >> subsystem channel must not be visible via hwmon attributes.
> >
> > I didn't look in detail, but maybe my red line is a bit more lax. IMHO
> > it's not OK to be able to modify a setting that results from pushing
> > hwmon knobs using PWM operations or vice-versa. Switching between
> > exclusive use at runtime is IMHO ok.
> >
> It is my call to make, and my call is either-or to avoid confusion.

Guenter, I agree and followed your strict "either-or" directive. If
the device is bound via the PWM framework (i.e., #pwm-cells is present
in the DT), the driver completely hides all legacy hwmon PWM
attributes.

One implementation detail: currently, the driver hides the hwmon
attributes only if #pwm-cells is present and IS_REACHABLE(CONFIG_PWM)
is true. If the DTS has #pwm-cells but the PWM framework is disabled
in the kernel, it emits a dev_warn and falls back to exposing the
hwmon attributes. Please let me know if you would prefer to
unconditionally hide the hwmon attributes merely based on the presence
of the DT property, regardless of the CONFIG_PWM state.

> > +static int adt7470_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > +                                        struct pwm_device *pwm,
> > +                                        const struct pwm_waveform *wf,
> > +                                        void *_wfhw)
> > +{
> > +     struct adt7470_data *data = pwmchip_get_drvdata(chip);
> > +     struct adt7470_pwm_wfhw *wfhw = _wfhw;
> > +     u64 period_ns;
> > +
> > +     if (wf->duty_length_ns == 0) {
> > +             wfhw->val = 0;
> > +             return 0;
> > +     }
> > +
> > +     /*
> > +      * The PWM frequency (period) is a single chip-wide setting shared by
> > +      * all 4 channels, so it cannot be changed on a per-pwm_device basis
> > +      * through this API. The duty cycle is rounded against the currently
> > +      * configured hardware period rather than the period requested in
> > +      * @wf; round_waveform_fromhw() reports the actual resulting
> > +      * waveform back so the core/consumer can detect a mismatch.
> > +      */
> > +     period_ns = DIV_ROUND_CLOSEST(NSEC_PER_SEC, data->pwm_freq);
> > +     wfhw->val = min_t(u64,
> > +                       mul_u64_u64_div_u64(wf->duty_length_ns, ADT7470_PWM_MAX, period_ns),
> > +                       ADT7470_PWM_MAX);
>
> This is wrong. Please test your driver with PWM_DEBUG enabled, this
> should emit warnings.
>
> Here the right thing is (untested):
>
>         if (!wf->period_length_ns) {
>                 wfhw->val = 0;
>                 return 0;
>         }
>
>         actual_period = NSEC_PER_SEC / data->pwm_freq;
>
>         if (wf->duty_length_ns >= actual_period)
>                 val = ADT7470_PWM_MAX;
>         else
>                 val = mul_u64_u64_div_u64(wf->duty_length_ns, ADT7470_PWM_MAX, actual_period);
>
>         return (actual_period < wf->period_length_ns) ? 0 : 1;

Uwe, thank you for the waveform callbacks snippet. It was much
cleaner. I only had to make one small mathematical adjustment to the
actual_period calculation in tohw() to satisfy CONFIG_PWM_DEBUG.

When using a truncating division (NSEC_PER_SEC / data->pwm_freq), it
triggered a "Wrong rounding" error during testing:

pwm pwmchip0: Wrong rounding: requested 714285/714286 [+0], result
714286/714286 [+0]

For example, at 1400 Hz, the truncating division gives an
actual_period of 714285 ns. If the framework requests a duty cycle of
714285 ns and a period of 714286 ns, the evaluation (714285 * 255) /
714285 yields a register value of 255. When read back in fromhw()
(which correctly rounds the period up to 714286 ns), the resulting
duty cycle becomes 714286 ns. Since 714286 > 714285, CONFIG_PWM_DEBUG
rightfully complains about the duty cycle inflation.

To ensure the calculated register value is strictly rounded down, I
changed the actual_period denominator in tohw() to use
DIV_ROUND_UP_ULL(NSEC_PER_SEC, data->pwm_freq). Maximizing the
denominator guarantees the resulting duty cycle fraction never
inflates, effectively passing all strict debug checks.

Thanks again for the time and guidance.

Best regards,

Luiz
