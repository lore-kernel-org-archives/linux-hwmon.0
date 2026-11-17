Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794949218;
	b=4i5h6D0Abs8zVtnMywRdCcRwSP5CElNw6g5X3yB8LU9G8zDiAzixHD7TXwwGqjdrLO+w
	 7ThdAeDuvnySb0WCpABsEdgaFg+Y0uJEhRxsz2L70pxlJvRXrrayKkOaiETqlAEmMiyou
	 UR2Y+hFEiSLTmY6gJUjmKaquQnTanvZb6TJ/UWYL+geHx5szmGWvPIY5Hcsfsz/RW2tOE
	 jjWAx8jIopZqKVo+Q9bWPeQbnvB7Rgy0JwSCKxKD/vr8GEkmubZX7AfjF6YfFOUPIs6oq
	 Y0TBB2PAQbS+XG/keqtN1i+3AaJXlAGBST25ajnW84vEXFSLIb+7re00oeNL4TrLrrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y1IyexCEBpXecunq+HBqfsAl28DmVt0NUB3ArARZ3Nw=;
	b=n84WI3UT/ip7bs1tjOYt7gLZph295ZC+owwdUU1NHH07X+kvZkXIHF1bjzINkZLO2g+A
	 cbajMV+G7EWwrKlVzgJaTq+7Z6I2o+hbJi2LmBISgCxAZ9+fqulEVgO9oUQHegy1/FRQ2
	 gDqogajDqbTK0/cp2OAsko5NuYuYxRrGBb+yaLkN+33b5CRhqSqmNtkAVQ0mDu90UaDOV
	 5eOFGF9VeS8h9neg6f9aX7NSzom7E/POtotszl8Qlj26FWUhWuZ1sEGqwey4mYT38YAxo
	 NOVzdcLUKRRikJow7V4YwNuIMFQaVkiCq2SgyfmNlB2312AJIRGSQE/LWaAiRqyT+mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bPd7mBF0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B9606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 21:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560B9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bPd7mBF0
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so303646a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 13:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794949215; cv=none;
        d=google.com; s=arc-20260327;
        b=LjX6W5IBGn3uxa5bv1pHM19+mbJpA2xXvlJJOkl/9PLNNKhAEA/OHYNq8wqhp7UeO/
         hM3Kb2PlL0P+filE9fIK/s8jnNUVhkFImli1A6CWYlkcZ3gDNudW9KFbBf33HQweSLge
         ZDgAJILdemtq0IesiUatWae9JggILRjZyIzSQ+BN4qTyHHOFCnYFM4U0Y77OwaAMU9zI
         l+dOTkNldSP8XqORahJLil1jv3QLioZo3zD8mSuJtUJMl4Ir6EaV1JH+LTZcYHnMgRHN
         pHfZHiPJACtUWz+XGhvZK/fDigdmWjiK9dDL6qjYM5Wlj5J8nYBbfZ/Gg5FoLzoiyMYj
         uS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1IyexCEBpXecunq+HBqfsAl28DmVt0NUB3ArARZ3Nw=;
        fh=nC0I4wn0OcGpMz8YIs3LGlCCHuA2nf4LCXUY7N6s9U4=;
        b=Yb9NdhHW0/4FJbOY6nb0Iu02NOOd8j2nh0QssDyfHdv03yhUvXV+4LLdfOk1Cc5mTi
         AATDoKse8sWGQ5DazorB9qXjIVGi5a8qozGEI3INENErolC+q76a6ynh5fqqY808WILs
         RR8/hxBKWI/0lFApSP6QXL0ouoUTgpfe5IyTfjh0qbXrwmnZaNEweRZjfq6OrF9fTKcI
         U1pduWhz6k8nh6HABT8bafvsUAsQo+2bLGlmrdoBWMOHFWTOTWoW0QbtWFmP9tbTZdoJ
         bkgB0YG7k2Ieqe2OvTjQ5F9TsPX8HhlicUfyszer/vQ6lF9H/dyoS97cwdnmAvGbFT2M
         TKPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949215; x=1795554015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y1IyexCEBpXecunq+HBqfsAl28DmVt0NUB3ArARZ3Nw=;
        b=bPd7mBF09vKy9xKaL9qV8g7VtOrxNwbhIaZ+92lpdMOxmDeDJmYXf8pxTRGUs8kVSG
         H3HgFbrhD2xy4iWZAgfO/8T+NIzkRSFwem2Vr5cCRxD7FWUL/XVHGqlxDtQ2Ro6I99WM
         TvaxFHdSe02T2/V8yfCGIT+kplV4xCBcgl2inw6erxdT/+Ogyog1RHcGzZCOsX3sq1rd
         H/vctSRFdlyCzW+sWn/kQB8G+A3+YgiAdJ6vXN5I/4FAICMYqv6jiZSyMu9uIqBacggQ
         /ktSwpvjbaJ7fA54hMb7j/aESCo28irrvFTtKop8cP6lgeOMxasP0encu5UOkskuJZh8
         +n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949215; x=1795554015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1IyexCEBpXecunq+HBqfsAl28DmVt0NUB3ArARZ3Nw=;
        b=1MYa1cdW0UKcIFQEb6ITFwev276bK0/bvXZkEALZb9WFVWW6BVdOZa2fPzPwSL7d7v
         2sDtZkGuQk+oG3yFtfPkSyjjLvsXG0N7RVDAdS9EN8ZwTFjSDsHa37mGEUG/nAHjtNkc
         nj0U/+GEhl061lnTj+K0ccGRdBw2qhI02Q5hn//yfrewkMjpZNKPc1bYeWNGXBy1aphz
         14bbrCLJ5dcwzQjEwtnHvdHas6Fo6cERjUAXuBLS80Y75+3vzi5YQJnsJGEkWOHx/Hxi
         KojYhBbAtgFe8G838E82c65Xs9VWEURuCS2KmqR1XrnWIxCCKHwxq0HcDEzMDGLNBlDs
         ZdQg==
X-Forwarded-Encrypted: i=1; AL+hErGV1deQT0XjnDO75FdlsNQJiHP9mrANa0PMp28oYAhjNa3suo1i//wIAeCGS9iM+2g+G0T6T04eJ4v97g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4q0vqsFZG08scMGy+W61elZijpI0H2GX3gQLg6GdcQV4h60eZ
	tn+qRmg2Ou1WRHKkECRSMjd4uCY6X60LIdkCYk3csexM0rHU8ERNqwbiddqBKFZGeLTdaiZwIGq
	uWI/DvrB9r/SG8hHdOD9erf42hSjj/Xc=
X-Gm-Gg: AYBFou0EXvgt6gOVQaUeaCMG1PlXidjs3Skp0EpMk+mZT1bTVUoyGbEB9aidZopY31s
	wdaIVrNKIoZ4/mR0XGOXX7UjRqGJOjDzOHpyQbaRSaiL46u7Ctw7rwYYpxTk2AcfhbCTZioRdJk
	YBJTNN+/09+7vG3CvhtbbHtPzsVWeCB6iuz9lu/9SGyww6ccrjLZRVWFzbpxLKxHt1MlzJLRvQC
	zLEv3qnse7U14Me4oRpMgyhvZtHuEIdhS/K3/AxsdY50G8fLRWSKT5QbnIsjNGiK/gPjr0glWfd
	yy6jLmODRf4UnIbzY+GZWIIMp9WDyg3rVDWceDVbjmblldjVxfuUlF9u/YYsM5nP5rQvOeqgUET
	IxsRxhEAyDQRlZ2Oo+JBqTAuMbJQYcp+WYGn1nKyrf2gOIgiXKHm5y8Kqwa4wVyeyYsoniOTSgL
	chNlq0Nu08BbKgY3IEYp6QvfsW6x4iSzB+doTYGFKm5gKv
X-Received: by 2002:a05:6402:4490:b0:6b8:6d68:23dc with SMTP id
 4fb4d7f45d1cf-6b887f1c45dmr398218a12.7.1794949215239; Tue, 17 Nov 2026
 13:00:15 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com> <20261117-marvel-env-v3-6-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-6-0edc370fdca9@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 22:00:02 +0100
X-Gm-Features: AclHuK_dg5RA6XdxAKu7evfwXn3vGqGoQDK6LrHzreusXqJlS_bk_8Jj3r3eBDA
Message-ID: <CA+=Fv5QfE9k=BiuzWmnhptOwDFLsSdDXqP2ckHHy6pMpZpKffA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 7:13=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
> The SRM console describes each sensor as a packet in a power and
> environment node of its config tree (GCT), and fills in the readings
> when asked to refresh the node. The packet layout was taken from Tru64
> UNIX.
>
> The firmware gives each temperature, fan and voltage sensor a warning
> limit and a failure limit, and reports the sensor in the warning or
> failure state once its reading reaches one. Neither state means that the
> sensor is broken: a temperature past its failure limit is too high, not
> faulty. Power supplies are either working or failed, with the cause
> (AC, POK, overtemperature, fan) logged by the firmware.
>
> Export the sensors through hwmon. A temperature's warning and failure
> limits become max and crit, with max_alarm set in either state and
> crit_alarm in the failure state. A fan's warning limit becomes min, with
> min_alarm set in either state and fault in the failure state, which is
> when the firmware counts the fan as failed. A voltage exports its
> reading, with min_alarm or max_alarm set in either state and lcrit_alarm
> or crit_alarm in the failure state, depending on which side of its
> nominal voltage it reads. The console gives the nominal voltage and only
> one other limit, so the voltage limits are not exported. A power supply
> is a voltage channel with only a fault attribute.
>
> A refresh keeps the boot CPU in the console with interrupts disabled for
> up to 300 ms per node, so refresh a node at most once every 10 seconds.
> The hwmon core serializes the callbacks, which also
> serializes the refreshes.
>
> The console callback lives in core_marvel.o, which generic kernels
> built with ALPHA_LEGACY_START_ADDRESS leave out.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  Documentation/hwmon/index.rst      |   1 +
>  Documentation/hwmon/marvel-env.rst |  69 +++++
>  MAINTAINERS                        |   8 +
>  arch/alpha/include/asm/gct.h       |   2 +
>  drivers/hwmon/Kconfig              |  11 +
>  drivers/hwmon/Makefile             |   1 +
>  drivers/hwmon/marvel-env.c         | 597 +++++++++++++++++++++++++++++++=
++++++
>  7 files changed, 689 insertions(+)
>
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rs=
t
> index 199ca79621e9..b062ad1ff53f 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -157,6 +157,7 @@ Hardware Monitoring Kernel Drivers
>     ltc4286
>     lx1308
>     macsmc-hwmon
> +   marvel-env
>     max127
>     max15301
>     max16064
> diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/mar=
vel-env.rst
> new file mode 100644
> index 000000000000..02d5241749bc
> --- /dev/null
> +++ b/Documentation/hwmon/marvel-env.rst
> @@ -0,0 +1,69 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver marvel-env
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported systems:
> +
> +  * Marvel (EV7) AlphaServers: the GS1280, ES80 and ES47 families,
> +    booted from the SRM console
> +
> +Author: Matt Turner <mattst88@gmail.com>
> +
> +Description
> +-----------
> +
> +The management firmware of these machines monitors temperatures, fans,
> +voltages and power supplies, and the SRM console describes each sensor i=
n
> +its configuration tree (GCT). This driver asks the console to refresh th=
e
> +readings and exports them.
> +
> +The console has no sensor names, so the labels are built from the report=
ing
> +unit (such as ``CMM0`` or ``MBM/PBM``) and the sensor's position in that
> +unit. On systems with more than one drawer every label starts with the
> +cabinet and drawer numbers.
> +
> +A refresh keeps the boot CPU in the console with interrupts disabled for=
 up
> +to 300 ms per unit, so a unit is refreshed at most once every 10 seconds=
.
> +
> +Sysfs entries
> +-------------
> +
> +The management firmware gives each temperature, fan and voltage sensor a
> +warning limit and a failure limit, and reports the sensor in the warning=
 or
> +failure state when its reading reaches the limit. Neither state means th=
at
> +the sensor is broken. Power supplies have no warning state and are repor=
ted
> +as voltage channels that only have a fault attribute.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +``temp[1-*]_input``         Temperature
> +``temp[1-*]_max``           Warning limit
> +``temp[1-*]_crit``          Failure limit
> +``temp[1-*]_max_alarm``     Temperature reached the warning limit
> +``temp[1-*]_crit_alarm``    Temperature reached the failure limit
> +``temp[1-*]_label``         Sensor label
> +
> +``fan[1-*]_input``          Fan speed
> +``fan[1-*]_min``            Warning limit
> +``fan[1-*]_min_alarm``      Fan speed dropped to the warning limit
> +``fan[1-*]_fault``          Fan speed dropped to the failure limit, and =
the
> +                            firmware counts the fan as failed
> +``fan[1-*]_label``          Fan label
> +
> +``in[0-*]_input``           Voltage
> +``in[0-*]_min_alarm``       Voltage is below the warning limit
> +``in[0-*]_max_alarm``       Voltage is above the warning limit
> +``in[0-*]_lcrit_alarm``     Voltage is below the failure limit
> +``in[0-*]_crit_alarm``      Voltage is above the failure limit
> +``in[0-*]_fault``           Power supply has failed
> +``in[0-*]_label``           Sensor or power supply label
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +The firmware checks a voltage against limits on both sides of the nomina=
l
> +voltage, but the console only describes the nominal voltage and one othe=
r
> +limit, so the voltage limits are not exported. Whether a voltage is too =
low
> +or too high comes from comparing it with the nominal voltage.
> +
> +Sensors that the console reports as unknown or not present when the driv=
er
> +loads are not exported. If a sensor becomes unknown later, reading its i=
nput,
> +alarm or fault attribute fails with ``-ENODATA``.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..09dee8fab9ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16100,6 +16100,14 @@ L:     linux-mips@vger.kernel.org
>  S:     Maintained
>  F:     arch/mips/boot/dts/img/pistachio*
>
> +MARVEL ALPHASERVER ENVIRONMENTAL SENSOR DRIVER
> +M:     Matt Turner <mattst88@gmail.com>
> +L:     linux-hwmon@vger.kernel.org
> +L:     linux-alpha@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/hwmon/marvel-env.rst
> +F:     drivers/hwmon/marvel-env.c
> +
>  MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
>  M:     Andrew Lunn <andrew@lunn.ch>
>  L:     netdev@vger.kernel.org
> diff --git a/arch/alpha/include/asm/gct.h b/arch/alpha/include/asm/gct.h
> index 2847449fb168..afa7ed870bd1 100644
> --- a/arch/alpha/include/asm/gct.h
> +++ b/arch/alpha/include/asm/gct.h
> @@ -43,11 +43,13 @@ typedef struct {
>   * node types
>   */
>  #define GCT_TYPE_HOSE                  0x0E
> +#define GCT_TYPE_PE                    0x13    /* power and environment =
*/
>
>  /*
>   * node subtypes
>   */
>  #define GCT_SUBTYPE_IO_PORT_MODULE     0x2C
> +#define GCT_SUBTYPE_PE_CABINET         0x3D    /* id holds an 8-bit cabi=
net */
>
>  #define GCT_NODE_PTR(off) ((gct6_node *)((char *)hwrpb +               \
>                                          hwrpb->frut_offset +           \
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a475..c0ce5591c82d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1255,6 +1255,17 @@ config SENSORS_MACSMC_HWMON
>           This driver can also be built as a module. If so, the module wi=
ll
>           be called macsmc-hwmon.
>
> +config SENSORS_MARVEL_ENV
> +       tristate "Marvel (EV7) AlphaServer environmental sensors"
> +       depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_=
ADDRESS)
> +       help
> +         If you say yes here you get support for the temperature, fan,
> +         voltage and power supply sensors of Marvel AlphaServers (the
> +         GS1280, ES80 and ES47), as described by the SRM console.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called marvel-env.
> +
>  config SENSORS_MAX1111
>         tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
>         depends on SPI_MASTER
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4c345ed7261..2b1b1850d641 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -157,6 +157,7 @@ obj-$(CONFIG_SENSORS_LTC4282)       +=3D ltc4282.o
>  obj-$(CONFIG_SENSORS_LTC4283)  +=3D ltc4283.o
>  obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) +=3D ltq-cputemp.o
>  obj-$(CONFIG_SENSORS_MACSMC_HWMON)     +=3D macsmc-hwmon.o
> +obj-$(CONFIG_SENSORS_MARVEL_ENV)       +=3D marvel-env.o
>  obj-$(CONFIG_SENSORS_MAX1111)  +=3D max1111.o
>  obj-$(CONFIG_SENSORS_MAX127)   +=3D max127.o
>  obj-$(CONFIG_SENSORS_MAX16065) +=3D max16065.o
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> new file mode 100644
> index 000000000000..25c0ecef8e1d
> --- /dev/null
> +++ b/drivers/hwmon/marvel-env.c
> @@ -0,0 +1,597 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Environmental sensors of Marvel (EV7) AlphaServers: the GS1280, ES80 =
and
> + * ES47 families.
> + *
> + * The SRM console describes every sensor in the config tree (GCT). Each=
 power
> + * and environment (P&E) node may carry a list of environmental packets:
> + * temperature and voltage sensors, fans and power supplies. The console=
 fills
> + * in the readings when asked to refresh the node. The packet layout was
> + * taken from Tru64 UNIX.
> + *
> + * The management firmware gives each temperature, voltage and fan senso=
r a
> + * warning limit and a failure limit, and puts the sensor in the warning=
 or
> + * failure state when its reading reaches the limit. Neither state means=
 that
> + * the sensor itself is broken. A power supply has no warning state; it =
is
> + * either working or failed.
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
> +#include <asm/gct.h>
> +#include <asm/marvel_env.h>
> +
> +#define DRVNAME "marvel_env"
> +
> +#define GCT_FLAGS_REQUIRED     BIT(9)
> +#define GCT_FLAGS_EXCLUDED     (BIT(2) | BIT(7) | BIT(12) | BIT(14))
> +
> +/* Header of a P&E node's packet list, at hd_extension. */
> +#define ENV_HDR_COUNT          0x10
> +#define ENV_HDR_FIRST          0x14
> +#define ENV_HDR_SIZE           0x18
> +
> +/* Packet types. */
> +#define ENV_PKT_POWER_SUPPLY   0x08
> +#define ENV_PKT_FAN            0x09
> +#define ENV_PKT_SENSOR         0x2a
> +
> +/*
> + * Sensor packet: kind, status, reading, and two limits. Temperatures ar=
e in
> + * tenths of a degree Celsius, voltages in millivolts. For a temperature=
 the
> + * two values are the warning and failure limits. For a voltage they are=
 the
> + * nominal voltage and an upper limit; the firmware checks a voltage aga=
inst
> + * a window on both sides of the nominal voltage, so neither is exported=
.
> + */
> +#define SENSOR_KIND            0x28
> +#define SENSOR_STATUS          0x2c
> +#define SENSOR_VALUE           0x30
> +#define SENSOR_WARN            0x34
> +#define SENSOR_FAIL            0x38
> +#define SENSOR_NOMINAL         SENSOR_WARN     /* of a voltage */
> +#define SENSOR_SIZE            0x3c
> +
> +#define SENSOR_KIND_THERMAL    2
> +#define SENSOR_KIND_VOLT_FIRST 3
> +#define SENSOR_KIND_VOLT_LAST  5
> +
> +/* Fan packet: status, rpm, low warning limit, low failure limit. */
> +#define FAN_STATUS             0x24
> +#define FAN_VALUE              0x28
> +#define FAN_WARN               0x2c
> +#define FAN_SIZE               0x34
> +
> +/* Power supply packet: status. */
> +#define PS_STATUS              0x24
> +#define PS_SIZE                        0x28
> +
> +/* Status values, in the low byte of the status word. */
> +#define ENV_OK                 0
> +#define ENV_WARNING            1       /* reading reached the warning li=
mit */
> +#define ENV_FAILURE            2       /* reading reached the failure li=
mit */
> +#define ENV_UNKNOWN            0xfe
> +#define ENV_NOT_PRESENT                0xff
> +
> +/* Console status of a refresh that Tru64 also treats as success. */
> +#define CFGTREE_STATUS_OK2     (-0x4a)
> +
> +/* A refresh blocks the boot CPU for up to 300 ms, so limit how often. *=
/
> +#define REFRESH_INTERVAL       (10 * HZ)
> +
> +struct marvel_env_node {
> +       gct6_node *node;
> +       unsigned long offset;           /* from the start of the GCT */
> +       unsigned long last_refresh;
> +       bool valid;
> +       unsigned int cabinet, drawer, pe;
> +};
> +
> +struct marvel_env_chan {
> +       struct marvel_env_node *node;
> +       unsigned int pkt;               /* packet offset in the node */
> +       bool ps;                        /* power supply, as an in channel=
 */
> +       bool present;                   /* known when the driver loaded *=
/
> +       char label[32];
> +};
> +
> +struct marvel_env_data {
> +       struct device *dev;
> +       struct marvel_env_node *nodes;
> +       unsigned int nr_nodes, max_nodes;
> +       struct marvel_env_chan *chans[hwmon_max];
> +       unsigned int nr_chans[hwmon_max], max_chans[hwmon_max];
> +       bool multi_drawer;              /* label with cabinet and drawer =
*/
> +};
> +
> +static const char * const pe_names[] =3D {
> +       [0x09] =3D "MBM",
> +       [0x0a] =3D "MBM/PBM",
> +       [0x0c] =3D "PS",
> +       [0x0d] =3D "FAN",
> +       [0x0f] =3D "CMM0", [0x10] =3D "CMM1", [0x11] =3D "CMM2", [0x12] =
=3D "CMM3",
> +       [0x14] =3D "VRM0", [0x15] =3D "VRM1", [0x16] =3D "VRM2", [0x17] =
=3D "VRM3",
> +       [0x19] =3D "PBM",
> +       [0x1a] =3D "XSHELF",
> +       [0x1b] =3D "PCIPS",
> +       [0x1c] =3D "PCIFANS",
> +};
> +
> +/* The sensor types the driver exports. */
> +static const enum hwmon_sensor_types marvel_env_types[] =3D {
> +       hwmon_temp, hwmon_fan, hwmon_in,
> +};
> +
> +/* The attributes that report the state of a channel. */
> +static const u32 marvel_env_alarm_attrs[hwmon_max] =3D {
> +       [hwmon_temp] =3D HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
> +       [hwmon_fan] =3D HWMON_F_MIN_ALARM | HWMON_F_FAULT,
> +       [hwmon_in] =3D HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM |
> +                    HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM | HWMON_I_F=
AULT,
> +};
> +
> +static inline u32 env_rd(struct marvel_env_node *n, unsigned int off)
> +{
> +       return *(u32 *)((char *)n->node + off);
> +}
> +
> +static bool env_status_valid(u8 status)
> +{
> +       return status !=3D ENV_UNKNOWN && status !=3D ENV_NOT_PRESENT;
> +}
> +
> +static u8 marvel_env_status(enum hwmon_sensor_types type,
> +                           const struct marvel_env_chan *c)
> +{
> +       unsigned int off;
> +
> +       if (type =3D=3D hwmon_fan)
> +               off =3D FAN_STATUS;
> +       else if (c->ps)
> +               off =3D PS_STATUS;
> +       else
> +               off =3D SENSOR_STATUS;
> +       return env_rd(c->node, c->pkt + off) & 0xff;
> +}
> +
> +/*
> + * The alarm attributes that are set in @status. A reading past the fail=
ure
> + * limit is also past the warning limit, so it sets both alarms. A fan b=
elow
> + * its failure limit is one the firmware counts as failed. A voltage out=
side
> + * its limits is too low or too high depending on which side of the nomi=
nal
> + * voltage it reads.
> + */
> +static u32 marvel_env_alarms(enum hwmon_sensor_types type,
> +                            const struct marvel_env_chan *c, u8 status)
> +{
> +       switch (type) {
> +       case hwmon_temp:
> +               if (status =3D=3D ENV_FAILURE)
> +                       return HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
> +               if (status =3D=3D ENV_WARNING)
> +                       return HWMON_T_MAX_ALARM;
> +               break;
> +       case hwmon_fan:
> +               if (status =3D=3D ENV_FAILURE)
> +                       return HWMON_F_MIN_ALARM | HWMON_F_FAULT;
> +               if (status =3D=3D ENV_WARNING)
> +                       return HWMON_F_MIN_ALARM;
> +               break;
> +       case hwmon_in:
> +               if (c->ps)
> +                       return status =3D=3D ENV_FAILURE ? HWMON_I_FAULT =
: 0;
> +               if (status !=3D ENV_WARNING && status !=3D ENV_FAILURE)
> +                       break;
> +               if ((s32)env_rd(c->node, c->pkt + SENSOR_VALUE) <
> +                   (s32)env_rd(c->node, c->pkt + SENSOR_NOMINAL)) {
> +                       if (status =3D=3D ENV_FAILURE)
> +                               return HWMON_I_MIN_ALARM | HWMON_I_LCRIT_=
ALARM;
> +                       return HWMON_I_MIN_ALARM;
> +               }
> +               if (status =3D=3D ENV_FAILURE)
> +                       return HWMON_I_MAX_ALARM | HWMON_I_CRIT_ALARM;
> +               return HWMON_I_MAX_ALARM;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static inline gct6_node *gct_node(gct6_handle h)
> +{
> +       return GCT_NODE_PTR(h);
> +}
> +
> +/* Cabinet and drawer come from the P&E node's parent. */
> +static void marvel_env_keys(struct marvel_env_node *n)
> +{
> +       gct6_node *parent =3D n->node->parent ? gct_node(n->node->parent)=
 : NULL;
> +
> +       n->pe =3D n->node->id & 0xff;
> +       if (!parent)
> +               return;
> +       if (parent->type =3D=3D GCT_TYPE_PE && parent->subtype =3D=3D GCT=
_SUBTYPE_PE_CABINET)
> +               n->cabinet =3D (parent->id >> 48) & 0xff;
> +       else
> +               n->cabinet =3D (parent->id >> 48) & 0x3f;
> +       n->drawer =3D (parent->id >> 32) & 0xff;
> +}
> +
> +static int marvel_env_refresh(struct marvel_env_data *data,
> +                             struct marvel_env_node *n)
> +{
> +       long status;
> +
> +       if (n->valid &&
> +           time_before(jiffies, n->last_refresh + REFRESH_INTERVAL))
> +               return 0;
> +
> +       status =3D marvel_cfgtree_partial_update(n->offset);
> +       if (status !=3D 1 && status !=3D CFGTREE_STATUS_OK2) {
> +               dev_warn_ratelimited(data->dev,
> +                                    "refresh of GCT node %#lx failed: %l=
d\n",
> +                                    n->offset, status);
> +               return -EIO;
> +       }
> +       n->last_refresh =3D jiffies;
> +       n->valid =3D true;
> +       return 0;
> +}
> +
> +/* The hwmon type of a packet, or hwmon_max to skip it. */
> +static enum hwmon_sensor_types marvel_env_pkt_type(struct marvel_env_nod=
e *n,
> +                                                  unsigned int pkt,
> +                                                  unsigned int type)
> +{
> +       unsigned int len =3D env_rd(n, pkt) & 0xffff;
> +       u32 kind;
> +
> +       switch (type) {
> +       case ENV_PKT_SENSOR:
> +               if (len < SENSOR_SIZE)
> +                       break;
> +               kind =3D env_rd(n, pkt + SENSOR_KIND);
> +               if (kind =3D=3D SENSOR_KIND_THERMAL)
> +                       return hwmon_temp;
> +               if (kind >=3D SENSOR_KIND_VOLT_FIRST && kind <=3D SENSOR_=
KIND_VOLT_LAST)
> +                       return hwmon_in;
> +               break;
> +       case ENV_PKT_FAN:
> +               if (len >=3D FAN_SIZE)
> +                       return hwmon_fan;
> +               break;
> +       case ENV_PKT_POWER_SUPPLY:
> +               if (len >=3D PS_SIZE)
> +                       return hwmon_in;
> +               break;
> +       }
> +       return hwmon_max;
> +}
> +
> +static void marvel_env_add_chan(struct marvel_env_data *data,
> +                               struct marvel_env_node *n, unsigned int p=
kt,
> +                               enum hwmon_sensor_types type, bool ps,
> +                               unsigned int index)
> +{
> +       static const char * const names[hwmon_max] =3D {
> +               [hwmon_temp] =3D "Temp", [hwmon_fan] =3D "Fan", [hwmon_in=
] =3D "Volt",
> +       };
> +       const char *what =3D ps ? "PS" : names[type];
> +       struct marvel_env_chan *c;
> +       const char *pe =3D NULL;
> +       size_t len =3D 0;
> +       u8 status;
> +
> +       c =3D &data->chans[type][data->nr_chans[type]++];
> +       c->node =3D n;
> +       c->pkt =3D pkt;
> +       c->ps =3D ps;
> +       status =3D marvel_env_status(type, c);
> +       c->present =3D env_status_valid(status);
> +
> +       if (data->multi_drawer)
> +               len =3D scnprintf(c->label, sizeof(c->label), "Cab%u Dra%=
u ",
> +                               n->cabinet, n->drawer);
> +
> +       if (n->pe < ARRAY_SIZE(pe_names))
> +               pe =3D pe_names[n->pe];
> +       if (pe && !strncasecmp(pe, what, strlen(what)))
> +               scnprintf(c->label + len, sizeof(c->label) - len, "%s %u"=
,
> +                         pe, index);
> +       else if (pe)
> +               scnprintf(c->label + len, sizeof(c->label) - len, "%s %s =
%u",
> +                         pe, what, index);
> +       else
> +               scnprintf(c->label + len, sizeof(c->label) - len, "PE%u %=
s %u",
> +                         n->pe, what, index);
> +}
> +
> +/*
> + * Walk a P&E node's packets, counting them, or adding them when @add. A=
s
> + * Tru64 does, visit count + 1 packets and number sensors from their
> + * position minus one.
> + */
> +static void marvel_env_walk(struct marvel_env_data *data,
> +                           struct marvel_env_node *n, bool add)
> +{
> +       unsigned int size =3D n->node->size;
> +       unsigned int hdr =3D n->node->hd_extension;
> +       unsigned int count, pkt, i;
> +
> +       if (!hdr || hdr + ENV_HDR_SIZE > size)
> +               return;
> +       count =3D env_rd(n, hdr + ENV_HDR_COUNT);
> +       pkt =3D env_rd(n, hdr + ENV_HDR_FIRST);
> +
> +       for (i =3D 0; i <=3D count; i++) {
> +               enum hwmon_sensor_types type;
> +               unsigned int len, pkt_type;
> +
> +               if (pkt < 8 || pkt + 8 > size)
> +                       break;
> +               len =3D env_rd(n, pkt) & 0xffff;
> +               pkt_type =3D env_rd(n, pkt + 4) & 0xffff;
> +               if (len < 8 || pkt + len > size)
> +                       break;
> +
> +               type =3D marvel_env_pkt_type(n, pkt, pkt_type);
> +               if (type !=3D hwmon_max && add &&
> +                   data->nr_chans[type] < data->max_chans[type])
> +                       marvel_env_add_chan(data, n, pkt, type,
> +                                           pkt_type =3D=3D ENV_PKT_POWER=
_SUPPLY,
> +                                           pkt_type =3D=3D ENV_PKT_SENSO=
R && i ?
> +                                           i - 1 : i);
> +               else if (type !=3D hwmon_max && !add)
> +                       data->nr_chans[type]++;
> +               pkt +=3D len;
> +       }
> +}
> +
> +/* Collect the P&E nodes with an environmental packet list. */
> +static void marvel_env_find_nodes(struct marvel_env_data *data,
> +                                 gct6_node *node, bool record)
> +{
> +       for (; node; node =3D node->next ? gct_node(node->next) : NULL) {
> +               if (node->magic !=3D GCT_NODE_MAGIC)
> +                       return;
> +               if (node->type =3D=3D GCT_TYPE_PE && node->hd_extension &=
&
> +                   (node->flags & GCT_FLAGS_REQUIRED) &&
> +                   !(node->flags & GCT_FLAGS_EXCLUDED)) {
> +                       if (record) {
> +                               struct marvel_env_node *n;
> +
> +                               if (data->nr_nodes =3D=3D data->max_nodes=
)
> +                                       return;
> +                               n =3D &data->nodes[data->nr_nodes];
> +
> +                               n->node =3D node;
> +                               n->offset =3D (char *)node - (char *)gct_=
node(0);
> +                               marvel_env_keys(n);
> +                       }
> +                       data->nr_nodes++;
> +               }
> +               if (node->child)
> +                       marvel_env_find_nodes(data, gct_node(node->child)=
,
> +                                             record);
> +       }
> +}
> +
> +static umode_t marvel_env_is_visible(const void *drvdata,
> +                                    enum hwmon_sensor_types type,
> +                                    u32 attr, int channel)
> +{
> +       const struct marvel_env_data *data =3D drvdata;
> +
> +       /* Hide sensors that are absent when the driver loads. */
> +       return data->chans[type][channel].present ? 0444 : 0;
> +}
> +
> +/* Called with the hwmon device lock held, which serializes refreshes. *=
/
> +static int marvel_env_read(struct device *dev, enum hwmon_sensor_types t=
ype,
> +                          u32 attr, int channel, long *val)
> +{
> +       struct marvel_env_data *data =3D dev_get_drvdata(dev);
> +       struct marvel_env_chan *c;
> +       struct marvel_env_node *n;
> +       unsigned int pkt;
> +       u8 status;
> +       int ret;
> +
> +       c =3D &data->chans[type][channel];
> +       n =3D c->node;
> +       pkt =3D c->pkt;
> +
> +       ret =3D marvel_env_refresh(data, n);
> +       if (ret)
> +               return ret;
> +       status =3D marvel_env_status(type, c);
> +
> +       switch (type) {
> +       case hwmon_temp:
> +               switch (attr) {
> +               case hwmon_temp_max:
> +                       *val =3D (s32)env_rd(n, pkt + SENSOR_WARN) * 100L=
;
> +                       return 0;
> +               case hwmon_temp_crit:
> +                       *val =3D (s32)env_rd(n, pkt + SENSOR_FAIL) * 100L=
;
> +                       return 0;
> +               }
> +               break;
> +       case hwmon_fan:
> +               if (attr =3D=3D hwmon_fan_min) {
> +                       *val =3D env_rd(n, pkt + FAN_WARN);
> +                       return 0;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       if (!env_status_valid(status))
> +               return -ENODATA;
> +
> +       if (marvel_env_alarm_attrs[type] & BIT(attr)) {
> +               *val =3D !!(marvel_env_alarms(type, c, status) & BIT(attr=
));
> +               return 0;
> +       }
> +
> +       switch (type) {
> +       case hwmon_temp:
> +               if (attr !=3D hwmon_temp_input)
> +                       break;
> +               *val =3D (s32)env_rd(n, pkt + SENSOR_VALUE) * 100L;
> +               return 0;
> +       case hwmon_fan:
> +               if (attr !=3D hwmon_fan_input)
> +                       break;
> +               *val =3D env_rd(n, pkt + FAN_VALUE);
> +               return 0;
> +       case hwmon_in:
> +               if (attr !=3D hwmon_in_input)
> +                       break;
> +               *val =3D (s32)env_rd(n, pkt + SENSOR_VALUE);
> +               return 0;
> +       default:
> +               break;
> +       }
> +       return -EOPNOTSUPP;
> +}
> +
> +static int marvel_env_read_string(struct device *dev,
> +                                 enum hwmon_sensor_types type, u32 attr,
> +                                 int channel, const char **str)
> +{
> +       struct marvel_env_data *data =3D dev_get_drvdata(dev);
> +
> +       *str =3D data->chans[type][channel].label;
> +       return 0;
> +}
> +
> +static const struct hwmon_ops marvel_env_ops =3D {
> +       .is_visible =3D marvel_env_is_visible,
> +       .read =3D marvel_env_read,
> +       .read_string =3D marvel_env_read_string,
> +};
> +
> +static u32 marvel_env_config(enum hwmon_sensor_types type,
> +                            const struct marvel_env_chan *c)
> +{
> +       switch (type) {
> +       case hwmon_temp:
> +               return HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> +                      HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_L=
ABEL;
> +       case hwmon_fan:
> +               return HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MIN_ALARM |
> +                      HWMON_F_FAULT | HWMON_F_LABEL;
> +       case hwmon_in:
> +               if (c->ps)
> +                       return HWMON_I_FAULT | HWMON_I_LABEL;
> +               return HWMON_I_INPUT | HWMON_I_MIN_ALARM | HWMON_I_MAX_AL=
ARM |
> +                      HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM | HWMON_I=
_LABEL;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int marvel_env_probe(struct platform_device *pdev)
> +{
> +       u32 *config[hwmon_max] =3D { };
> +       struct device *dev =3D &pdev->dev;
> +       const struct hwmon_channel_info **info;
> +       struct marvel_env_data *data;
> +       struct hwmon_chip_info *chip;
> +       struct device *hwmon;
> +       unsigned int i, k, nr_info =3D 0;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +       data->dev =3D dev;
> +
> +       marvel_env_find_nodes(data, gct_node(0), false);
> +       if (!data->nr_nodes)
> +               return -ENODEV;
> +       data->nodes =3D devm_kcalloc(dev, data->nr_nodes, sizeof(*data->n=
odes),
> +                                  GFP_KERNEL);
> +       if (!data->nodes)
> +               return -ENOMEM;
> +       data->max_nodes =3D data->nr_nodes;
> +       data->nr_nodes =3D 0;
> +       marvel_env_find_nodes(data, gct_node(0), true);
> +
> +       /* Label with cabinet and drawer if any unit is outside 0/0. */
> +       for (i =3D 0; i < data->nr_nodes; i++)
> +               if (data->nodes[i].cabinet || data->nodes[i].drawer)
> +                       data->multi_drawer =3D true;
> +
> +       for (i =3D 0; i < data->nr_nodes; i++) {
> +               marvel_env_refresh(data, &data->nodes[i]);
> +               marvel_env_walk(data, &data->nodes[i], false);
> +       }
> +
> +       info =3D devm_kcalloc(dev, ARRAY_SIZE(marvel_env_types) + 1,
> +                           sizeof(*info), GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_types[k];
> +               struct hwmon_channel_info *ci;
> +
> +               if (!data->nr_chans[type])
> +                       continue;
> +               data->chans[type] =3D devm_kcalloc(dev, data->nr_chans[ty=
pe],
> +                                                sizeof(*data->chans[type=
]),
> +                                                GFP_KERNEL);
> +               ci =3D devm_kzalloc(dev, sizeof(*ci), GFP_KERNEL);
> +               config[type] =3D devm_kcalloc(dev, data->nr_chans[type] +=
 1,
> +                                           sizeof(*config[type]), GFP_KE=
RNEL);
> +               if (!data->chans[type] || !ci || !config[type])
> +                       return -ENOMEM;
> +               ci->type =3D type;
> +               ci->config =3D config[type];
> +               info[nr_info++] =3D ci;
> +               data->max_chans[type] =3D data->nr_chans[type];
> +               data->nr_chans[type] =3D 0;
> +       }
> +       if (nr_info =3D=3D 1)
> +               return -ENODEV;
> +

With the chip channel gone, nr_info counts only the sensor types, so
this now rejects a system that reports exactly one type. One that
reports none gets past it and fails later with -EINVAL, since
__hwmon_create_attrs() refuses zero attributes. This should be
!nr_info, I think?


> +       for (i =3D 0; i < data->nr_nodes; i++)
> +               marvel_env_walk(data, &data->nodes[i], true);
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_types[k];
> +
> +               for (i =3D 0; i < data->nr_chans[type]; i++)
> +                       config[type][i] =3D marvel_env_config(type,
> +                                                           &data->chans[=
type][i]);
> +       }
> +
> +       chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +       chip->ops =3D &marvel_env_ops;
> +       chip->info =3D info;
> +
> +       hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME, data=
, chip,
> +                                                    NULL);
> +       return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static struct platform_driver marvel_env_driver =3D {
> +       .driver =3D {
> +               .name =3D DRVNAME,
> +       },
> +       .probe =3D marvel_env_probe,
> +};
> +module_platform_driver(marvel_env_driver);
> +
> +MODULE_ALIAS("platform:" DRVNAME);
> +MODULE_DESCRIPTION("Marvel (EV7) AlphaServer environmental sensors");
> +MODULE_LICENSE("GPL");
>
> --
> 2.56.1
>

Magnus
