Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794302546;
	b=CKtrk/p169amjr3gO6+8Bv3FsuoCvriUvG0DEc2HIPkghC91AwOJCL/jL/ie812LXLMh
	 SH2ESYmGlvn8VQW1d77khNltwIRF8EV/zBuw+ouhxjvt1mzTmPlP56SzSnyJuWPcJg36p
	 WGxkWMzBKm1UnQX9suKWhxYTDyc8i/j56n5Oann4XhIoDppC3mF+rJMcV0gI4qP8+9MFk
	 U7oBkbM3GQqbj8p8C64hhIGJJhNtSz0bjcYywVcB8lc27BjMF7HpfNPeUTcM7UbJSFTL9
	 MPp/+K8voYhAdUfHg+nzArSwUOzi1AI56l6dsHhgMcALDMMnkGkvTobrDFefs8p1L5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=;
	b=lAEWuvzhcMRy1o1wAkdv7qrjRPtcNSQkvLf3rO0sJhnTo595n5E7RJXvl8wAK024WEg4
	 bYtVwN+fZ46egL//uatqblbIojg6+Yt+Y1kMdc+8PC19qiBjXvAXr0tMuSNCAYJMA5xIe
	 xfIdH271Dit3QpMwh+3AsPxzhzKNyLrM7hzH5eWo1tf38k5NNAqGOrzeU/DGhEWYjcAHY
	 Cf7VX7iFfkNm8yfc//vuQhzPeVaOtRwh9Oz8eLVdq4BO8hpKoZykh13jUsl9M/3OgEbkR
	 9NCCDFz+AGFPnTHiMYtHVN4j43m/rtpy6YJqsnJsBDX1/Th2Q9As8ikvWxalBcyhSgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NXR5MPOw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB6606E5AD
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 09:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAB6606E5AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NXR5MPOw
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso3869961a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 01:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794302544; cv=none;
        d=google.com; s=arc-20260327;
        b=LRdCQlA9nU6rHeilTQAwYHglXWVLp/rmHVda8Gmo0OT10M4SX5RTIwtmh7peyvMbUK
         Q8H6pJ6Q2EXJ1QEPqJCyXS8Z21uxfApxxj/zZoJBujU7V3Nf/bGY1xtb3vpfM9nKVfUw
         fhwebcPYRULpkN5Mro0yrtIKIzJgRsaoxnrplSbyUg550xrgIONZC5sWZqb8Sc9ZqhFg
         4+4z7UEyQ1Zg1SJhNjTyhS33BmB3RZz/fEPOSKii5EC2jqa+z5elAkek28AAvGPAaVWM
         vDLn8xQiyBIK+rXckw5jgUFyGExFZkl4AqjqAhcWLIdofBIuS7b6XVTeR6GAOMzQDg6I
         JA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=;
        fh=B/0HOqv+xNsFivTRDB7mn2ZeOPolQyb6m+tzkwTq6Q4=;
        b=rturt9bz9zRQMHv04ELi0vCWQFzzNKCN22gXb9Mnkd7jd37uI6qpRSdX2k+nlkZm04
         6tYHppKYvKMLQ4STghvLekVMDqNu3/9inqSHfAGjcGTvuoITTqPX3F+RYK0wg9ji6tLJ
         q+2yEvRUsHHa5fqushGAwjWbPN+1yGqaW3CxhVQjPe/zauhFXUcqhf/Sl1WviYVz7ucj
         X1bhjNFWUqZjtd2hU3SOKmUdpRuTMyEjrxbHmHzFEC5x3U0YAPxLrtS+r0GWmyiaoe51
         ZtQX3II6QYJCaw9ZdKVtnmN2LfpnEglw7yQJUaFsWtY1H+hz7ww8wdSi9zKKnPHtLoMU
         yRnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794302544; x=1794907344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=;
        b=NXR5MPOwdaMf6PEidfFMOtJrDo0++kwwclPaUhT8H6L4jLfdOKxwCWOx1beA+uc4ue
         ry/eza9Wdt3a+5ILzZTgJocL5sFs48rpDTJcWC0VYblo5HV0vytCkCur2C9urCyRCm6A
         m4qGgoCBLbVbGsdXG/i0BUKN9gRz8p9rAYcpnEMhmnxA6CXqutbvo3IKl1oYxcIgsQ8q
         vBlkX+mBKD4dNuxOqnCp++i6xusFxgUoB23EOk6PmiLJTEqEVsAZ1mK5kpbw/gQpIf1+
         E8VTPL8Q1rx35UO7soJTgEyg/jmib8sV7DVyBqvvydD2dJ5KKB9bYjGkOwjpvwsijzm3
         wnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302544; x=1794907344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2+SCNl1g+fUz/U7qKDHB1BkCucwWSgvxXfo/ANkBxE=;
        b=mz7mOln78kkOdSLz/OB5Ww5LRM+EK2t09nuRdABbp2AduQ5C31JWu949xeLkSFQBni
         DbTCZGizrYrkw4ka81EMb3aHNNcc40TpRoq+pPewNStHvMqvCq9H3sXhEr9wkWbfM8OJ
         FacM46CGQ8smnWUrl4no2vQCKjg3+NJf0Y6tg57Fy5Iip8qkJAByGmpnH7PEOixWl/uC
         Pn/JDtZnMpxoJGAt3+PF98HarYzvVVRlvhvwP3Td+s8z6YLy5crURicUQr0y2mhz3FXb
         5CWRuGW+GeM3OQctkHX3DlDuhMXo3m2w4/M5fx/Pt8hlKrwvZw7hyMScCBib6HNwprhS
         JrzQ==
X-Forwarded-Encrypted: i=1; AL+hErEpgONPap7stB7euFXrEKbCyq497LmrktzNkkhcc5VgknFUqSunMPUZcQtpkloKR4CSRGfRSVKEye24tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8epJV0q0U5VLIdSxfP0ZyfD8DNIN29Pzses40dip227By+TWEC
	F2H7gTPdteFfTVvIh/Ada5CxM0TXHHJem5Ngq4lnvw+KEirgQKqYOh9/JcN7wIp1jc6CFfxY6Lc
	4vU+bhMmP7JVNnXjputpvONX6P5GvCdXeHpklKg7AVQ==
X-Gm-Gg: AYBFou2kHBGv5VWeHxNqvQuLFoeou/XiJNATBo/qjQO9UiFxsDul5sr2sqVJ9XFgX7v
	luxx7NRulyeK19lBJp41ej88tgHatklM+UW5Zt0OVlL3Q9XtjCYIU5cCsRVESmyugzoLczPJ9zH
	vWU2dKhS3g3hTfDi+ZeLq8UTGjsO6HJKtKuXjJT7tHNX9CBwinZtKBVhSlBlfo0tCXceJXX30Ac
	wV2upTnSHbksZhZ82PrYYRxLlHLP8s+guDVxiFAXoc7Dj30Vz9iIicjHtJI3fI9rdeRXJZLwUwn
	A/a9MtQQyc6b1PKXJttSalxuEItnngfZGGPFa8+Twu44X3KNmATul5X47bnXbFi7fcDrzoqgIV9
	6abOmLeP6Ys7txH2EYZr/ufjYzOBpNKZcR4njW2unxK0tID/5Hd67GPrWtfHTEO/ok/9Fq0HE/J
	Gs1D+g3byzMCgkX6DXDw==
X-Received: by 2002:aa7:d691:0:b0:6b4:206d:724b with SMTP id
 4fb4d7f45d1cf-6b7564be0dbmr1242231a12.7.1794302544016; Tue, 10 Nov 2026
 01:22:24 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-3-robert.marko@sartura.hr> <e189dcb8-1cbd-4629-85dc-1b73243806fd@roeck-us.net>
In-Reply-To: <e189dcb8-1cbd-4629-85dc-1b73243806fd@roeck-us.net>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Nov 2026 10:22:12 +0100
X-Gm-Features: AclHuK9j1ZB9DgxmBU3BCdoMkXb15eczBUGWQkCKPQtctapS4pYm4i7sf3JyTXQ
Message-ID: <CA+HBbNHWVEJb+YHt1FLHSihO++6=kKEeOnazX_58cMUSbMfwQA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hwmon: sparx5: add LAN969x fan monitoring support
To: Guenter Roeck <linux@roeck-us.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:51=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Mon, Nov 09, 2026 at 02:35:07PM +0100, Robert Marko wrote:
> > LAN969x has a fan controller with a tachometer in a register block
> > separate from its Sparx5-compatible temperature sensor. Match the fan
> > node independently and expose fan1_input on its own hwmon device.
> >
> > Read the optional pulses-per-revolution property from the fan child.
> > Preserve the temperature-only behavior of existing device trees.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> I don't see the point of keeping this as single driver with two completel=
y
> different sets of functionality. If you want to have two instances, pleas=
e
> make it separate drivers.

In v1 it was the same instance but then DT maintainers pointed out
that it should be different nodes at least.

I will split it into a separate driver in v3.

Regards,
Robert

>
> Thanks,
> Guenter
>
> > ---
> > Changes in v2:
> > - Register fan and temperature monitoring as separate hwmon devices.
> > - Reject a present but malformed pulses-per-revolution property.
> >
> >  Documentation/hwmon/sparx5-temp.rst |   9 ++
> >  drivers/hwmon/Kconfig               |   7 +-
> >  drivers/hwmon/sparx5-temp.c         | 146 ++++++++++++++++++++++++----
> >  3 files changed, 139 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/=
sparx5-temp.rst
> > index 0140809089542..a053d12fbdbbb 100644
> > --- a/Documentation/hwmon/sparx5-temp.rst
> > +++ b/Documentation/hwmon/sparx5-temp.rst
> > @@ -15,6 +15,10 @@ Supported chips:
> >
> >  Author: Lars Povlsen <lars.povlsen@microchip.com>
> >
> > +The driver also supports the Microchip LAN969x temperature sensor and =
fan
> > +controller as separate devices. The fan controller uses the
> > +microchip,lan9691-fan compatible.
> > +
> >  Description
> >  -----------
> >
> > @@ -30,4 +34,9 @@ The following attributes are supported.
> >
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >  temp1_input          Die temperature (in millidegree Celsius.)
> > +fan1_input              Fan speed in RPM (LAN969x only).
>
> FWIW, this is misleading. One instance will support the temperature, a
> separate hwmon device will support the fan. Really, if you want to have
> two separate devices, make it two separate drivers.
>
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +The tachometer counts pulses over one-second intervals, independently =
of the
> > +PWM output. The fan child's pulses-per-revolution property specifies h=
ow many
> > +pulses represent one revolution; it defaults to two.
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 3ae676a56d95c..deb9eb82b8501 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -669,11 +669,12 @@ config SENSORS_I5K_AMB
> >         will be called i5k_amb.
> >
> >  config SENSORS_SPARX5
> > -     tristate "Sparx5 SoC temperature sensor"
> > +     tristate "Sparx5 and LAN969x SoC hardware monitoring"
> >       depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
> >       help
> > -       If you say yes here you get support for temperature monitoring
> > -       with the Microchip Sparx5 SoC.
> > +       If you say yes here you get support for temperature monitoring =
on
> > +       Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
> > +       LAN969x SoCs.
>
> Same here. Based on the description and the documentation, a user would n=
ot
> expect to get two separate hardware monitoring devices.
>
> >
> >         This driver can also be built as a module. If so, the module
> >         will be called sparx5-temp.
> > diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
> > index 0fd5c147f8167..1f197004780cc 100644
> > --- a/drivers/hwmon/sparx5-temp.c
> > +++ b/drivers/hwmon/sparx5-temp.c
> > @@ -9,8 +9,11 @@
> >  #include <linux/hwmon.h>
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> > +#include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >
> >  #define TEMP_CTRL            0
> >  #define TEMP_CFG             4
> > @@ -20,9 +23,26 @@
> >  #define  TEMP_STAT_VALID     BIT(12)
> >  #define  TEMP_STAT_TEMP              GENMASK(11, 0)
> >
> > +#define FAN_CFG                      0
> > +#define  FAN_CFG_GATE_ENA    BIT(2)
> > +#define  FAN_CFG_STAT_MODE   BIT(0)
> > +#define FAN_PWM_FREQ         4
> > +#define  FAN_PWM_FREQ_CYCLES GENMASK(27, 16)
> > +#define FAN_CNT                      8
> > +#define  FAN_CNT_DATA                GENMASK(15, 0)
> > +
> > +#define FAN_TACH_INTERVAL_HZ 100000
> > +
> > +struct s5_match_data {
> > +     bool is_fan;
> > +};
> > +
> >  struct s5_hwmon {
> >       void __iomem *base;
> > +     void __iomem *fan;
> >       struct clk *clk;
> > +     unsigned long clk_rate;
> > +     u32 pulses_per_revolution;
> >  };
> >
> >  static void s5_temp_enable(struct s5_hwmon *hwmon)
> > @@ -37,6 +57,24 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
> >       writel(val, hwmon->base + TEMP_CFG);
> >  }
> >
> > +static void s5_fan_enable(struct s5_hwmon *hwmon)
> > +{
> > +     u32 cycles, val;
> > +
> > +     cycles =3D DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_TACH_INTERVAL_H=
Z);
> > +     cycles =3D clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
> > +
> > +     val =3D readl(hwmon->fan + FAN_PWM_FREQ);
> > +     val &=3D ~FAN_PWM_FREQ_CYCLES;
> > +     val |=3D FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
> > +     writel(val, hwmon->fan + FAN_PWM_FREQ);
> > +
> > +     /* Count all tachometer pulses over one-second intervals. */
> > +     val =3D readl(hwmon->fan + FAN_CFG);
> > +     val &=3D ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
> > +     writel(val, hwmon->fan + FAN_CFG);
> > +}
> > +
> >  static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
> >  {
> >       int value;
> > @@ -62,6 +100,17 @@ static int s5_read_temp(struct s5_hwmon *hwmon, lon=
g *temp)
> >       return 0;
> >  }
> >
> > +static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
> > +{
> > +     u32 count;
> > +
> > +     count =3D readl_relaxed(hwmon->fan + FAN_CNT);
> > +     count =3D FIELD_GET(FAN_CNT_DATA, count);
> > +     *val =3D count * 60 / hwmon->pulses_per_revolution;
> > +
> > +     return 0;
> > +}
> > +
> >  static int s5_read(struct device *dev, enum hwmon_sensor_types type,
> >                  u32 attr, int channel, long *val)
> >  {
> > @@ -72,6 +121,10 @@ static int s5_read(struct device *dev, enum hwmon_s=
ensor_types type,
> >               if (attr =3D=3D hwmon_temp_input)
> >                       return s5_read_temp(hwmon, val);
> >               break;
> > +     case hwmon_fan:
> > +             if (attr =3D=3D hwmon_fan_input && hwmon->fan)
> > +                     return s5_read_fan(hwmon, val);
> > +             break;
> >       default:
> >               break;
> >       }
> > @@ -82,62 +135,115 @@ static int s5_read(struct device *dev, enum hwmon=
_sensor_types type,
> >  static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_type=
s type,
> >                            u32 attr, int channel)
> >  {
> > -     if (type !=3D hwmon_temp)
> > -             return 0;
> > +     const struct s5_hwmon *hwmon =3D _data;
> >
> > -     switch (attr) {
> > -     case hwmon_temp_input:
> > -             return 0444;
> > +     switch (type) {
> > +     case hwmon_temp:
> > +             return attr =3D=3D hwmon_temp_input ? 0444 : 0;
> > +     case hwmon_fan:
> > +             if (hwmon->fan && attr =3D=3D hwmon_fan_input)
> > +                     return 0444;
> > +             return 0;
> >       default:
> >               return 0;
> >       }
> >  }
> >
> > -static const struct hwmon_channel_info * const s5_info[] =3D {
> > +static const struct hwmon_channel_info * const s5_temp_info[] =3D {
> >       HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> >       HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> >       NULL
> >  };
> >
> > +static const struct hwmon_channel_info * const s5_fan_info[] =3D {
> > +     HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> > +     NULL
> > +};
> > +
> >  static const struct hwmon_ops s5_hwmon_ops =3D {
> >       .is_visible =3D s5_is_visible,
> >       .read =3D s5_read,
> >  };
> >
> > -static const struct hwmon_chip_info s5_chip_info =3D {
> > +static const struct hwmon_chip_info s5_temp_chip_info =3D {
> >       .ops =3D &s5_hwmon_ops,
> > -     .info =3D s5_info,
> > +     .info =3D s5_temp_info,
> > +};
> > +
> > +static const struct hwmon_chip_info s5_fan_chip_info =3D {
> > +     .ops =3D &s5_hwmon_ops,
> > +     .info =3D s5_fan_info,
> >  };
> >
> >  static int s5_temp_probe(struct platform_device *pdev)
> >  {
> > +     const struct s5_match_data *match_data;
> > +     struct device *dev =3D &pdev->dev;
> >       struct device *hwmon_dev;
> >       struct s5_hwmon *hwmon;
> > +     struct device_node *fan_np __free(device_node) =3D NULL;
> > +     void __iomem *base;
> > +     bool is_fan;
> > +     int ret;
> >
> > -     hwmon =3D devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
> > +     match_data =3D device_get_match_data(dev);
> > +     is_fan =3D match_data && match_data->is_fan;
> > +
> > +     hwmon =3D devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> >       if (!hwmon)
> >               return -ENOMEM;
> >
> > -     hwmon->base =3D devm_platform_ioremap_resource(pdev, 0);
> > -     if (IS_ERR(hwmon->base))
> > -             return PTR_ERR(hwmon->base);
> > +     base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(base))
> > +             return PTR_ERR(base);
> > +
> > +     if (is_fan) {
> > +             hwmon->fan =3D base;
> > +             hwmon->pulses_per_revolution =3D 2;
> > +             fan_np =3D of_get_available_child_by_name(dev->of_node, "=
fan");
> > +             if (fan_np &&
> > +                 of_property_present(fan_np, "pulses-per-revolution"))=
 {
> > +                     ret =3D of_property_read_u32(fan_np, "pulses-per-=
revolution",
> > +                                                &hwmon->pulses_per_rev=
olution);
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "invalid pulses-per-=
revolution\n");
> > +             }
> > +             if (!hwmon->pulses_per_revolution ||
> > +                 hwmon->pulses_per_revolution > 4)
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "invalid pulses-per-revoluti=
on\n");
> > +     } else {
> > +             hwmon->base =3D base;
> > +     }
> >
> > -     hwmon->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> > +     hwmon->clk =3D devm_clk_get_enabled(dev, NULL);
> >       if (IS_ERR(hwmon->clk))
> >               return PTR_ERR(hwmon->clk);
> > +     hwmon->clk_rate =3D clk_get_rate(hwmon->clk);
> >
> > -     s5_temp_enable(hwmon);
> > +     if (is_fan)
> > +             s5_fan_enable(hwmon);
> > +     else
> > +             s5_temp_enable(hwmon);
> >
> > -     hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> > -                                                      "s5_temp",
> > -                                                      hwmon,
> > -                                                      &s5_chip_info,
> > -                                                      NULL);
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> > +                                     is_fan ? "lan969x_fan" : "s5_temp=
", hwmon,
> > +                                     is_fan ? &s5_fan_chip_info :
> > +                                              &s5_temp_chip_info, NULL=
);
> >
> >       return PTR_ERR_OR_ZERO(hwmon_dev);
> >  }
> >
> > +static const struct s5_match_data lan969x_fan_match_data =3D {
> > +     .is_fan =3D true,
> > +};
> > +
> >  static const struct of_device_id s5_temp_match[] =3D {
> > +     {
> > +             .compatible =3D "microchip,lan9691-fan",
> > +             .data =3D &lan969x_fan_match_data,
> > +     },
> >       { .compatible =3D "microchip,sparx5-temp" },
> >       {},
> >  };
> > @@ -154,5 +260,5 @@ static struct platform_driver s5_temp_driver =3D {
> >  module_platform_driver(s5_temp_driver);
> >
> >  MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
> > -MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
> > +MODULE_DESCRIPTION("Sparx5 SoC hardware monitoring driver");
> >  MODULE_LICENSE("GPL");



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
