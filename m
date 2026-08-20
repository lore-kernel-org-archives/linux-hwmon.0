Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6653C1414
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211650; cv=none; b=qL6eowHolcXQXR6ZLtafWI2k9lr6KkXG9mFwgm7Wy0B2bv8n8MH7rX4dcJZqThiJA1LFzr3GwgYfNGvSfGmxqq9iqyte5pupGpJWWuBpPWPuAQYFLZ8Jp6OszVGkhUiEex+LLXAVg/Dc4hIQ+B7pBJ8ADBfbA3yMa+tEKTte2eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211650; c=relaxed/simple;
	bh=MapOTuwbJCCiUZFtCGgs2M9xTj7+mwKoeNjEtUvxTk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+Y9pl136TM70e1ghlIDu73bJbOdjp1JJu4iB5xkquGP9uF15F+JotdCqExE8CkEXx9Ah7Q9qZ5ivM2x5nPwiY32LdJXVFhSv0bgz6V7TfERo6+7hMptiQ4H/uYY1AEJ1FADPGJ3lvn/Xh79Kc1HMcTPRpxrZ8+t1tIhIzpIPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf9506704fso886073e0c.2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 00:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211647; x=1787816447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdPpwGypGBUsvrsSvDXIguPPL189yxwSySBc8xM9coA=;
        b=B5KR0ekStcFIaJmy9YOSQw8OZPlp7X8EyUKDOgQvD+iueYPk02ZizfWpupUiZrGAZ1
         ZqkUvUayQ7X6hGQ4mdJMkpfmkVmhzJddopzWCbDJap8Q52shzh+xb7c24HnofwPKVmsf
         06nYtOtc0xWCXd5ulwVfxkEUZyNxBrOx8HgCZbdn++olsMn99nWIQ0TLtBF8+hMVOVSP
         +SyPFrSfSKwgpNnWZfXRJsf0vP7yR6wj/KRqhxhzZIzHI3A1GaNeCMwBhjphSUUEWJ9R
         9obM0GEsS7Wei8YXtEc3Su4QWtSI18fdSezf+vSVLtVui1quCquP+NmThBpcqW2KUL8C
         Nvbg==
X-Forwarded-Encrypted: i=1; AHgh+RoF9sOQzsF/Nx4zEitgB3Ioe8phos++54EHqfqHjophOmpAUv15ccH4qgHcS5pXoqrLSfjbm1lqRVCPhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsMwZzSn9sgHk/VoN6/jx0N/yXiESL9mxYU4rw9ENR9Hou7D2
	Vs90Q8yNrlj1pUkhm0rAKRIubEBojASRTHgbvgAf5bkcbB/LWxZQoO1bXVY9Guet
X-Gm-Gg: AR+sD12hLNeM1xRU68rByoTiPLB7LrE30Pt6f64T9x81NEvmqOJ/Q5VkQZArqIT6qn/
	7JXthCKtCQ4EOti/sSB5IWAgCM/rEyo7TDLJ1oYh3gB5D4//6bQ/8wr/Qd+HKRyMrwYPf+Lg+18
	XOz8lEAjVkSbekqil1nm0BJrZC/MaWGvGctZqToVqZxTeLYqbCNEif8/+QlY6tHC5hF2F7mYpAy
	0KThIKwhLLx/VWMZgxzzOdznJ9hqOPWOFEx9LJpi9pIczy3hl6hbRy3lsxKcre3yltdKWsaayWH
	dl+XjN2xgfkBPeOqXnxCQEr0sKAaqhej8Quk4GPuXoiPJEtYZMmfXIpRmi0TBsBPWMQVdIAbXHu
	jAj+rGlIPKjBzOtp7jf/+2D+h8dJQ1FP+xNtTZ5MH590SxcXp91qybIlkCB0+5grp1u3oS1dUaC
	oTrZ4QxIrKFSu9brubYEjQQx+H5dE6jtrlUa3zF+al8doE9haep+JBUd88qyhX+gGDvjfD1Wr8A
	Au62SYu37bgr7vqNIICwy+FO2ln841YGgFCe96O
X-Received: by 2002:a05:6122:3a0e:b0:5bf:b879:15c0 with SMTP id 71dfb90a1353d-5c5e3dd6ad4mr3973455e0c.5.1787211647414;
        Thu, 20 Aug 2026 00:40:47 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e5b2043sm4938602241.0.2026.08.20.00.40.46
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso826186e0c.1
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr4GUR2q13VZDxUXyCrirgUCEPBC6MnoTiXXC6AsiVMmDIVLHjhJ3pjhtbAq6PN+uR8Oq1R6PHR4yB83Q==@vger.kernel.org
X-Received: by 2002:a05:6122:882:b0:5bd:86ac:a847 with SMTP id
 71dfb90a1353d-5c5e3df88c4mr4331225e0c.6.1787211646157; Thu, 20 Aug 2026
 00:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787165329.git.geert+renesas@glider.be> <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
 <20260819191316.8F2F21F000E9@smtp.kernel.org>
In-Reply-To: <20260819191316.8F2F21F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 09:40:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
X-Gm-Features: AcwNN1Xf-k2z34g_6wcrswrRilyDIcooOAsIPdAyo4-A___PZ7FNnn6TGkqYEkE
Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	neil.armstrong@linaro.org, linux-hwmon@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Wed, 19 Aug 2026 at 21:13, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix for uninitialized stack variables: `struct clk_pa=
rent_data parent_data` remains uninitialized on the stack, leading to a ker=
nel crash during clock registration.
> --
>
> --- Patch [4]: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure cl=
k_init_data is fully initialized ---
> commit 99e024a77f5bce5921d3c6b46054263aa450610d
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> iio: frequency: adf4377: Make sure clk_init_data is fully initialized
>
> This commit initializes the clk_init_data structure in
> adf4377_clk_register() to zero. This prevents crashes caused by
> uninitialized fields like parent_names when CONFIG_INIT_STACK_ALL_PATTERN
> or CONFIG_INIT_STACK_NONE is enabled.
>
> > diff --git a/drivers/iio/frequency/adf4377.c b/drivers/iio/frequency/ad=
f4377.c
> > --- a/drivers/iio/frequency/adf4377.c
> > +++ b/drivers/iio/frequency/adf4377.c
> > @@ -999,7 +999,7 @@ static int adf4377_clk_register(struct adf4377_stat=
e *st)
> >  {
> >       struct spi_device *spi =3D st->spi;
> >       struct device *dev =3D &spi->dev;
> > -     struct clk_init_data init;
> > +     struct clk_init_data init =3D {};
> >       struct clk_parent_data parent_data;
>
> [Severity: High]
> This is a pre-existing issue, but does this struct clk_parent_data also
> need to be zero-initialized?
>
> Only fw_name is explicitly assigned below, leaving name, hw, and index
> populated with stack garbage. When adf4377_clk_register() passes this to
> the clock framework, clk_core_populate_parent_map() will read
> parent_data.name and pass it to clk_cpy_name(), which ultimately calls
> strlen() and can cause a page fault during probe.

Yes, parent_data has the same issue.
As Jonathan will rebase against rc1 anyway, I will send a v2.
Thanks!

>
> [ ... ]
>
> >       parent_data.fw_name =3D "ref_in";
> >
> >       init.ops =3D &adf4377_clk_ops;
> >       init.parent_data =3D &parent_data;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.=
git.geert+renesas@glider.be?part=3D4

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
