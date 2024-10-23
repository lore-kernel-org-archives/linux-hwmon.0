Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CA73451;
	Wed, 23 Oct 2024 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668893; cv=none; b=bJL3BmmAu22vaM5fc4zbOc2qrbG37m3JXULO1YDUd386k0yGK2UTrOKr6h06ov4AJdRT/C+8ylmNX11d8ikuYqkZHFqu0pC6SZfrXjAgXFmS1FUdwkgQk032ckqSM5H6qyCRzsX2ebMXDNYra6d5M+8FWszMfU2uZA/oTF60IBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668893; c=relaxed/simple;
	bh=gYA7V2+luJ68VKlU8tWJhrphluX80vBq3147GQw76UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9+Ze51yw50ZEeljULNDwC61zeBoGMWZsLK9MXOrXa3WXyRWHH+A3Z94lLQFc8nrCX07tddlEgmQNBLtCifXVq8GS4AhZvT8y6AomU+a6OMmqoJ6ussE/co017Z41ZPbjkPIVRM1QYwjoewFZb/EUJ9TE9YwZlS4NJEhMGZgFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso6629544276.2;
        Wed, 23 Oct 2024 00:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729668889; x=1730273689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+lpt1WfOqRv7Qh2HfusVj5G6gjAIEYeAicEYOrMhQQ=;
        b=ODpGK3N4Tb7lVAipv+ADPbRbez9TFomTTnOszORr20JzZ8zvueatTGGi+CBY8bBj73
         lmVIM0hziNP8Ztq1lpp8rtsUgeofpElx0qg/XLkk/SpZsyNsEp6lTtrgO0jEflDXrHuD
         d9hTQDoob83Pb3cePRpXp+st9ge/bvcnKVIqtPr0MCsNlP22T0IH73it4mNPR7f5V4gr
         Vo4P91H5fBcEvJsU49MjJ1ls8+NtPlaM36kfmMLSsIKF2wMMGS1nVVMbzUvBb0EjXpUS
         pvzLwPcd8zYIQ3vcQGkreVk8hFXY87Oc/od4knUTIYmJHfj0tmjZmRzjDMa2+8vJ+xHJ
         sSsw==
X-Forwarded-Encrypted: i=1; AJvYcCV5NInGMRl+Qn8Y1roafXLB8VE+w3oHjtQxUJeuyrqyvCzMdyClIIhEVaHE1WSaO01DFr7ikUc+zCJ+@vger.kernel.org, AJvYcCWM4LehkQHR7Mmui2ntGrIQjDUKi2ZESzw+i77HfsX3NiaE8uVWiytYh7P4yJSoe23gJkWcHAgwndcY@vger.kernel.org, AJvYcCWgPv2X8B6fj0IYKY5xvPL7g2rQaZAo4q003r2Ie+Fe/kgzyznoLxPQTvQQIo5Mr4Ihu8xKzoPVBuQpZx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/68aRh7VTSpw1f+PPnbLtC9kx5ffCozU4gvDh8yuytWzluGj
	XUg3XkS8sbyt+ZnSJC/5DCWNeYiAh9+M4VLL5GY3nYO0VJVwq6ReaLfPrRQA
X-Google-Smtp-Source: AGHT+IGwPKw0ZTzqr4OgkjLrlhFHtEu644ezGQSn2clvcZhdfN2zbZ3ugleGuhACKDzdMyhwAmh+3A==
X-Received: by 2002:a05:690c:660c:b0:6dd:cdd7:ce5a with SMTP id 00721157ae682-6e7f0e14dc2mr16288047b3.18.1729668889384;
        Wed, 23 Oct 2024 00:34:49 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d13172sm14037487b3.125.2024.10.23.00.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 00:34:48 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e390d9ad1dso59445267b3.3;
        Wed, 23 Oct 2024 00:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+qAI71U8tiIRJvoMD8XDsM6V8hR2m7C9MTpbIMJNzj5/fCZj1f7wBmTnOX+8Az6AH0KdIsedgQO6I@vger.kernel.org, AJvYcCVx8c2inyl5cpHOgD2w0Po80tUfwQj4aAj/zvbqy9aNjC8gebYKWY2hLjhaYffzb54MF6WmEg0K1FxY@vger.kernel.org, AJvYcCW3pZ9GY1/4+bkTo3lJh13brlTr0L1PE76SMfG4PxvreKdC/cvg5FyEYWUwSNUYvASYkXv8rqHITCFya/M=@vger.kernel.org
X-Received: by 2002:a05:690c:7090:b0:6e2:b263:104a with SMTP id
 00721157ae682-6e7f0e30c6amr19119317b3.23.1729668888670; Wed, 23 Oct 2024
 00:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729646466.git.grantpeltier93@gmail.com> <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
In-Reply-To: <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 09:34:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeqGvUZmTpo18oaOzYz1TEg97OuXyUSy9YJxmrWQWMBw@mail.gmail.com>
Message-ID: <CAMuHMdWeqGvUZmTpo18oaOzYz1TEg97OuXyUSy9YJxmrWQWMBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, linux@roeck-us.net, magnus.damm@gmail.com, 
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Wed, Oct 23, 2024 at 3:58=E2=80=AFAM Grant Peltier <grantpeltier93@gmail=
.com> wrote:
> Some applications require Vout to be higher than the detectable voltage
> range of the Vsense pin for a given rail. In such applications, a voltage
> divider may be placed between Vout and the Vsense pin, but this results
> in erroneous telemetry being read back from the part. This change adds
> support for a voltage divider to be defined in the devicetree for a (or
> multiple) specific rail(s) for a supported digital multiphase device and
> for the applicable Vout telemetry to be scaled based on the voltage
> divider configuration.
>
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>

Thanks for your patch!

> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c

> @@ -170,6 +185,25 @@ static int raa_dmpvr2_read_word_data(struct i2c_clie=
nt *client, int page,
>                 ret =3D pmbus_read_word_data(client, page, phase,
>                                            RAA_DMPVR2_READ_VMON);
>                 break;
> +       case PMBUS_READ_POUT:
> +               /*
> +                * In cases where a voltage divider is attached to the ta=
rget
> +                * rail between Vout and the Vsense pin, both Vout and Po=
ut
> +                * should be scaled by the voltage divider scaling factor=
.
> +                * I.e. Vout =3D Vsense * (R1 + R2) / R2
> +                */
> +               fallthrough;
> +       case PMBUS_READ_VOUT:
> +               ret =3D pmbus_read_word_data(client, page, phase, reg);
> +               if (ret > 0 && data->channel[page].vout_voltage_divider[0=
]
> +                       && data->channel[page].vout_voltage_divider[1]) {
> +                       u64 temp =3D DIV_ROUND_CLOSEST_ULL((u64)ret *
> +                               (data->channel[page].vout_voltage_divider=
[0]
> +                               + data->channel[page].vout_voltage_divide=
r[1]),
> +                               data->channel[page].vout_voltage_divider[=
1]);

You are casting "ret" to u64 to force a 64-bit multiplication, as the
product may not fit in 32 bits. However, DIV_ROUND_CLOSEST_ULL()
does a 32-bit division on 32-bit platforms.  So this should use
DIV_U64_ROUND_CLOSEST() instead.
The sum of vout_voltage_divider[0] + vout_voltage_divider[1] might
not fit in 32 bits, so that should be changed to a 64-bit addition.
Unfortunately there is no rounding version of mul_u64_u32_div() yet,
so you have to open-code it.

> +                       ret =3D clamp_val(temp, 0, 0xffff);
> +               }
> +               break;
>         default:
>                 ret =3D -ENODATA;
>                 break;
> @@ -178,6 +212,50 @@ static int raa_dmpvr2_read_word_data(struct i2c_clie=
nt *client, int page,
>         return ret;
>  }
>
> +static int raa_dmpvr2_write_word_data(struct i2c_client *client, int pag=
e,
> +                                     int reg, u16 word)
> +{
> +       const struct pmbus_driver_info *info =3D pmbus_get_driver_info(cl=
ient);
> +       const struct isl68137_data *data =3D to_isl68137_data(info);
> +       int ret;
> +
> +       switch (reg) {
> +       case PMBUS_VOUT_MAX:
> +               /*
> +                * In cases where a voltage divider is attached to the ta=
rget
> +                * rail between Vout and the Vsense pin, Vout related PMB=
us
> +                * commands should be scaled based on the expected voltag=
e
> +                * at the Vsense pin.
> +                * I.e. Vsense =3D Vout * R2 / (R1 + R2)
> +                */
> +               fallthrough;
> +       case PMBUS_VOUT_MARGIN_HIGH:
> +               fallthrough;
> +       case PMBUS_VOUT_MARGIN_LOW:
> +               fallthrough;
> +       case PMBUS_VOUT_OV_FAULT_LIMIT:
> +               fallthrough;
> +       case PMBUS_VOUT_UV_FAULT_LIMIT:
> +               fallthrough;
> +       case PMBUS_VOUT_COMMAND:
> +               if (data->channel[page].vout_voltage_divider[0]
> +                       && data->channel[page].vout_voltage_divider[1]) {
> +                       u64 temp =3D DIV_ROUND_CLOSEST_ULL((u64)word *
> +                               data->channel[page].vout_voltage_divider[=
1],
> +                               (data->channel[page].vout_voltage_divider=
[0] +
> +                                data->channel[page].vout_voltage_divider=
[1]));

Similar comments, but here the sum is the divisor, so you have to use
a full 64-by-64 division, using DIV64_U64_ROUND_CLOSEST().

> +                       ret =3D clamp_val(temp, 0, 0xffff);
> +               } else {
> +                       ret =3D -ENODATA;
> +               }
> +               break;
> +       default:
> +               ret =3D -ENODATA;
> +               break;
> +       }
> +       return ret;
> +}
> +
>  static struct pmbus_driver_info raa_dmpvr_info =3D {
>         .pages =3D 3,
>         .format[PSC_VOLTAGE_IN] =3D direct,
> @@ -220,14 +298,67 @@ static struct pmbus_driver_info raa_dmpvr_info =3D =
{
>             | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
>  };
>
> +static int isl68137_probe_child_from_dt(struct device *dev,
> +                                       struct device_node *child,
> +                                       struct isl68137_data *data)
> +{
> +       u32 channel;
> +       int err;
> +
> +       err =3D of_property_read_u32(child, "reg", &channel);
> +       if (err) {
> +               dev_err(dev, "missing reg property of %pOFn\n", child);
> +               return err;
> +       }
> +       if (channel >=3D MAX_CHANNELS) {
> +               dev_err(dev, "invalid reg %d of %pOFn\n", channel, child)=
;
> +               return -EINVAL;
> +       }
> +
> +       of_property_read_u32_array(child, "renesas,vout-voltage-divider",
> +                               data->channel[channel].vout_voltage_divid=
er,
> +                               ARRAY_SIZE(data->channel[channel].vout_vo=
ltage_divider));

Shouldn't the return value be checked for errors different from -EINVAL?

> +
> +       return 0;
> +}

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
