Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB53B79F
	for <linux-hwmon@vger.kernel.org>; Wed, 15 May 2024 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715754002; cv=none; b=n1DNK/xJ/yPyaqSX8kTuvFNdhpMubzdN/L7jJWwBsym6bN2lW+brU8BCdvrmOf2JZ0YO/CVaeMVuEzXaaYZP/NGtAS8qO99xmtr8Sl5XYwNCdBScibysmE4UdAk5YV/TRpnxfu2gOCYnX9eH6noXxPDQuFvSliSh9ag4hoXvlo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715754002; c=relaxed/simple;
	bh=UyrQgiGxpVTwgJtSrbHRBf9lE+OZP6cY2tzhDaA4YlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fykXg9Wv3p3iJK/0PUQ3TvJi+WszaB1mMIh/NXcQxL+3zqUOjqtmiI9nBAP4msuAEfDup41PPiQGIJqhTIUSPTbUOgnmvGPxa6qeKx2klfODp9XuwxtsaA5enGpTCzUutxppkQAszt53hweUdj9EoELTFNm3f4W5vWkdrQb6LyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=bkpscqxp; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="bkpscqxp"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7e1b887c488so158318339f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 May 2024 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715754000; x=1716358800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXBk01eAYtbUsAxjAP5iGYBzxJrtGgpchSjyGGop1NU=;
        b=bkpscqxpboI0T8i3xvZR8yiGwgMJq5IXEBKUfkc6jsgH2QQVDn7im6PXOqmyngrZme
         8Bt8ZQ7yCgADITlNp5E9aAXPY30MFlv/wP8X5Ef8eJKuw6L7ciFuhZn9i3OBqAcWlEmc
         2E8XdPuXfKvV8eouyH52hY/1aqpvJzYkuVm78idGZ8RQ58dvAtWWlKYP9urtSuzu+E8H
         9YG8H8wtfQRGmEbyiuM5xHfG5Kiv11hYLyVCvLlAsxRohktKfpcnPrJb0Md7TiOzNL4E
         5MlZxBcgPVxv6B3rl3dXFKecB1VdTs8teWzHZr+eLREVAeLceO395wiSrImmOjNe0K6W
         H9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715754000; x=1716358800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXBk01eAYtbUsAxjAP5iGYBzxJrtGgpchSjyGGop1NU=;
        b=w5UsWo58STSNTOIB0fkueDXFABcnp1KRWoImkG4f64yM3qNyntLsNsmg9wEAMkj77m
         sGvi53QkB02j+VbxpmBvm0n9yPGGoCs63h7T1rtWQTl9cefXe7193dbCu+wm6CZvLzXf
         DSpHb9U47iBFNl+RhWSYZA+Wdai5gpA9xOMMrZKj+Afcrk9waP5Eq/0HNUJVStFTikN9
         V1l4rolkiZ8jI5rPKAPwn2uBbGAcMLr0XDivTBSfv37ky0FkHoC/9wYSafC5rnZ/52SZ
         uo7zsF1utwaycDY0cE6mW7qfmYldsI2IjXM4lVJVYfvNIuiFBx53TFizpeudo9Eg10WF
         J1SA==
X-Forwarded-Encrypted: i=1; AJvYcCWU06jcQMb/Nd41R/EfQQupGKF5csfMQ8xXkRjhFfRivFCo5W+Yb1GQNmROOw/WfMKfHAndXacxOiOIzWVQrrDKnKEHiBAmhnH/AVc=
X-Gm-Message-State: AOJu0YyCbdKD+P8rszerevPa3ifDj8OR5xkDhFActKLLyxhL0SG12Xpq
	qLPAx72LBAfxCpcMihNkSOq2vdJvwjQ4+lcxpqZbCCZJQTUsi1ynqT/OPPtvJKKUpF2LTaBBRUf
	6xMLvY+dqcWhOhP3WmAzd78Uqqi33YYEZt4e3lQ==
X-Google-Smtp-Source: AGHT+IFkE8DQwyCj3o5jxhZZChCPfs/heM6LGJLIaFfgGkAUVO7wCCuZJPaCHqr48cEbTVMpVAMjeT1LwCMTCZfprkA=
X-Received: by 2002:a05:6e02:1a01:b0:36b:31d2:f148 with SMTP id
 e9e14a558f8ab-36cb7757227mr129234915ab.15.1715753999877; Tue, 14 May 2024
 23:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <IA1PR20MB4953F852CB7A9C5FE45E18EBBB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953F852CB7A9C5FE45E18EBBB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 May 2024 11:49:48 +0530
Message-ID: <CAAhSdy2uSAA4TLmCvjuLsZT26wJyCQ0L61m5vg3BbBCSvHxVqg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 6:48=E2=80=AFAM Inochi Amaoto <inochiama@outlook.com=
> wrote:
>
> Due to the design, Sophgo SG2042 use an external MCU to provide
> hardware information, thermal information and reset control.
>
> Add bindings for this monitor device.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042=
-hwmon-mcu.yaml
>
> diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-=
mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.=
yaml
> new file mode 100644
> index 000000000000..f0667ac41d75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yam=
l
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sophgo,sg2042-hwmon-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 onboard MCU support
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-hwmon-mcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#thermal-sensor-cells"
> +
> +allOf:
> +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hwmon@17 {
> +            compatible =3D "sophgo,sg2042-hwmon-mcu";
> +            reg =3D <0x17>;
> +            #thermal-sensor-cells =3D <1>;
> +        };
> +    };
> --
> 2.45.0
>
>
