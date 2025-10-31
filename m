Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68926B764
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761875816; cv=none; b=OX+AF+DM7yleOdT0BRDC3ZJ53/5XKCejK6P7G28zkXgrXN5hO5pY9gt2Z2yO/ZTTiRNCud8clYl4Gbr4NMbKOg7Cr7TgEcecz1js9jl+E1QLjXcdEB7qCfbyLaDpYCn+y7Nx6vPnGb9dWTTyQWbNUowT6hvoJzfXxP5/GSIZjKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761875816; c=relaxed/simple;
	bh=CZTds3X6aLw+PBJT8jGzhmUg8shr79vJ9ejoYot3ZlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdR+KWND+qRSjVXYK1w2SfZ+CNNrXU5xqKpj04pW9/MWMokFFqUUcJiJFmVThSGPGMI1tmMAy11FRgloLH7SA49KS1PnTZo6I55dHkvrGayz/2bujPzF7Goev1SWTljxuxl0IhHZp6NS5y/nECmeYEdPy6Y/DLODxhUlB8j5qi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2GBhAG4; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2GBhAG4"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7f7835f4478so14037646d6.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Oct 2025 18:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761875814; x=1762480614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPm8hhAmizQjOcUpCPxb+6jnF/zsbuFZoDm6e8517P0=;
        b=Z2GBhAG4VhcpXutt27b2Ebwv7o+OqaJFRLv9ETTgAhQEi+XZkdqywVPGnGQuvqts/D
         lHrMtNzTFLiVe8FsbUmUzJzfxVue67cCrx8qsvP7MMGP73kyWsi7opaYkn3n+wY29S1k
         lhZEBsUR+B4f1iFMI3Dr62nlwZBQGOW6yBO3la9Waxd+iEkmvp+UqVraj3n1rJW7O8Ny
         kgXyKe3j0nUZPAJCPdlQM6PzUblMm3y4jZDEqZSNYF7zln2QwFJviRqah1kbzrDN6oOc
         rcf0G7XjReYjVEJ+JoXctgkg9tLQtkmnYZPHfHgnSKPB3l+uOUv/+Gp+v62ikXOAiCNW
         4B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761875814; x=1762480614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPm8hhAmizQjOcUpCPxb+6jnF/zsbuFZoDm6e8517P0=;
        b=UJmOMmRpqiHsKnTWRM5u+9Mg6OuSUHMIUjxbddqFRZWHA2ZQH2AE+d+uuByKv8VfbG
         iaj/j50ImXhR3h6TaCJQabqwIrmiSoTUT7Wg4VCEL5HVIzdgCu/ypIf8x/siznNS6Gad
         JgO6ngjRSXrQcEkBCmXK3ZP5AuxDHUTcTGIxdeIwlj6UlGnwkSwVMrxCugDsWcG/1pSI
         SXaFOBjGs6E1grZlxdNclb4SA8VCspv/dTVPtY44LIiegtluOawPGl3YXlxCoWZbIvGf
         YTkl5i5GB33RhpDZy/22dgIU2UF5p8lUEj/UP7Fb3RrAzfMciwUrsUsKvGSLlX3fYjkZ
         LrYw==
X-Forwarded-Encrypted: i=1; AJvYcCUfnmn+38mBC0zZ6e2RCFIeiOjWX88SeFlJxrwU+iYBI8xkaRYjADh8g0CTb7PON3cf8vrA+SPPa+pX8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgkz4jIvpAUmRlNTfZUxwN6PNuj2dAO3ZjboMEz2EBu8xlYpjK
	D9c+VKD0DXnt0CLcBiK2i4nhNYuY/2fWXazqKSzYU18/kDAZkQWVr0jj6tHip3hUOkxkZRX3HmR
	yu+2KJH7Z8EUrhxzvn2A48CP4Ubjx8YA=
X-Gm-Gg: ASbGnctJKyNKHWwbJqAFoYReOiHbXNH1tbJYbVNMR26uUtPOoUIWlzZz0GdkYv4kaAt
	mjW3HxSRpWd0tUqMK5UVfynVu3xhsbTNmdrSQ2ncbTWA4IWVYBsrru10e5/Bmcr9qP4g/ETsYZo
	5H6M7NNNMyx/HAFe8P5uT/B6M1hwKCLhJ/FaZgp28dQE8jWiwX4LKMqVHRtrEvGLnvG1U3wMA9n
	ZUNkSev4BkZSamtZWm5vVZWxkXvPjMOlR4GfdYp6SJybtCatd9lMwU9neKbbOSJSlD4kmu5
X-Google-Smtp-Source: AGHT+IGHRNW5ve9MfYrIumeQT60Oe/ZI51vPRQHltGYBjI9/W3Gf4lJ6TGxJq9jXE+9SVtlbRGsEi+oN5NDYG3LHztk=
X-Received: by 2002:a05:6214:1bc9:b0:87c:43f0:374a with SMTP id
 6a1803df08f44-8802f311f58mr22293466d6.29.1761875813700; Thu, 30 Oct 2025
 18:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030193955.107148-1-i@rong.moe> <20251030193955.107148-2-i@rong.moe>
In-Reply-To: <20251030193955.107148-2-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 30 Oct 2025 18:56:42 -0700
X-Gm-Features: AWmQ_bkH0rMtZc34Jno0rHVU5V9xM0sKsjwAUSR9O4U8i-gPZnLXJxpss0mop7A
Message-ID: <CAFqHKTn4tEqGpTpyaWEMUHvskRux1RHGxp89tWr1UeYgsnsV2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] platform/x86: lenovo-wmi-helpers: convert returned
 4B buffer into u32
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 12:40=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> The Windows WMI-ACPI driver converts all ACPI objects into a common
> buffer format, so returning a buffer with four bytes will look like an
> integer for WMI consumers under Windows.
>
> Therefore, some devices may simply implement the corresponding ACPI
> methods to always return a buffer. While lwmi_dev_evaluate_int() expects
> an integer (u32), convert returned 4-byte buffer into u32 to support
> these devices.
>
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Link: https://lore.kernel.org/r/f1787927-b655-4321-b9d9-bc12353c72db@gmx.=
de/
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - New patch (thanks Armin Wolf)
> ---
>  drivers/platform/x86/lenovo/wmi-helpers.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform=
/x86/lenovo/wmi-helpers.c
> index f6fef6296251e..f3bc92ac505ac 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> @@ -59,10 +59,25 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8=
 instance, u32 method_id,
>                 if (!ret_obj)
>                         return -ENODATA;
>
> -               if (ret_obj->type !=3D ACPI_TYPE_INTEGER)
> -                       return -ENXIO;
> +               switch (ret_obj->type) {
> +               /*
> +                * The ACPI method may simply return a 4-byte buffer when=
 a u32
> +                * integer is expected. This is valid on Windows as its W=
MI-ACPI
> +                * driver converts everything to a common buffer.
> +                */
> +               case ACPI_TYPE_BUFFER: {
> +                       if (ret_obj->buffer.length !=3D 4)
> +                               return -ENXIO;
>
> -               *retval =3D (u32)ret_obj->integer.value;
> +                       *retval =3D *((u32 *)ret_obj->buffer.pointer);
> +                       return 0;
> +               }
> +               case ACPI_TYPE_INTEGER:
> +                       *retval =3D (u32)ret_obj->integer.value;
> +                       return 0;
> +               default:
> +                       return -ENXIO;
> +               }
>         }
>
>         return 0;
> --
> 2.51.0
>

Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Thanks,
Derek
