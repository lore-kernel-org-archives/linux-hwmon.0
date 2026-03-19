Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8D40DFA4
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905127; cv=pass; b=SToyJqn/4noue/tGH7MwjU4dg5Je2unTtsApTKQ0wdm5h8mg4Yjyvuz1hGFOLBc6ngkRuTj7ZkkOV6x7MQAlK/jbTmOHQTvGJmAL8W45kq94ip5pLm8bI8S2Lb+/meMFJnmb+fYJ61jPWsABgLuHiPH3tPWUNBnYsHabp+97t5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905127; c=relaxed/simple;
	bh=Ulpnr03mFLvLKusrbO73atFJEMh9LNrmQqNXlOezIe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKUyibP4cmhsQhY9hecFq6Z6d3OjVTiBydCy7JuOQrcZoSsnu58IMuz6sHICOxE+kU7rkmZPsnkk0jsKzInvTT2xmIQ5EdMS/hs4VfgHUrqogwb2oOhOoVkDEVroFim6+1UXHisnrWDZRNAdZkhpdPLB+1pL+Zba865BVROJn4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcVLwWY9; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcVLwWY9"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ca1ba0089so702684d50.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 00:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773905124; cv=none;
        d=google.com; s=arc-20240605;
        b=K1VHzmWR1qjw4VldAtmfmITLFJeq7fESb50E3ES5mPLOh7ajbDHAH/g7365mRDQ2zO
         /3HHnb5iXf5Th2r8t1O6HllTRjkwF1sB85vXWfPkCjjdgPVracr5VkNcbiWSlzpM7Oti
         wwT85bISflPKDf/tWHJdjykn1GWnKhl45jRGagwg5XiN4UHrDM2W4/rHzXzxfs0B+5R1
         dHsdSF7odHqEZji4wNJzxEV8dN2rOER/aTnOD46LECq+KUBtTofcQOh3WvHpwYcl/WEF
         g0OU0nPFBhA6Ku5hg+fTChjLuW5+sLoiH7Wy1eshts4BwPQ6J+dXTOBjmJ6VDgSryMbp
         3izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TluwqS4HKRFmCQc0rjx5guREKmOm0AKQPj8ePyZUfxA=;
        fh=eyzG4ellQQ8yGAT2M3u4KbSMCRIK9+OQb9lWVPtXqXo=;
        b=YzD+ztL3qcJZ+SmnqgOGZj2XxRgA4Ieri3pfjyp+ikAOgYydkMg3Em0jviCWHIW8Jy
         lBRIapI7X43oSctdpidtM73hK0GQMzcxupCdLt7IqFchUj+12oOIjWDkO5y4qhgjZb+m
         gB4KqZcR2dcAp4PoNy3oZZCuJw6gFxg7KrcKMolS91yC6KA0wHnxZlyC6poRzqi3CvOk
         oD3RGTzYNa6MifqLCX/9ttlDoab/64kMevOKN60GMyIYRqjyGrPQbvfsz2acClyU05oM
         h2gkGrKog7gPuZwjTUt3yvJMTcsFl7qgBiG8T1WIRLui5Zz0pDfXRlDzKvBDkVQqIR4I
         7KEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773905124; x=1774509924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TluwqS4HKRFmCQc0rjx5guREKmOm0AKQPj8ePyZUfxA=;
        b=JcVLwWY9Fj+mQA+hy+GUbvk/xDc1dJZZXnaQ7hmq/mAPJzd/lLkGpWBicYeGDKAgPS
         0GUGMk/zhSMj982j6Scs991DHFcj4qjWM4j5YY5tjGVL0SiX8f20yQsHaoFuA3pA2/TJ
         d4LBRH8WtDC4Q2cC4bI/o1yyz1/aPJmFKnFcx1/mZ4Za0KicaD/TVzvSryViG1oKHmE2
         kFYMtguBz00+LiEQ7q1AK/tnjn9i7QiOxqaweAP15K4YvIT+QawTO58k1qnlmElkeZR1
         Y+LinksAdKMpSgchw+i5J8vDvpKLNAiPjV21lNL7l+6gl9veaDbcF/JDde4s+ovHqps2
         Gggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773905124; x=1774509924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TluwqS4HKRFmCQc0rjx5guREKmOm0AKQPj8ePyZUfxA=;
        b=ReJ59RRyGJp9e7KVkf5E0JwHndFj0gutFv5lQbnksOIuNQq5av5xwlb34xn5KzDrB6
         ujDeZlMztbajvrNROcYh3L9x04UWeb9BKj1M81MmlmnhdDlqHHeE5/m0rrOr2HxgY5ln
         Jg/LYuHThYRpJz2ZjTho1P/AEq0Ns8Vqq8DRREe9U9a0BdX2dwYNLQpmrBpFWnQNx4IE
         eqYYdfRzz0rMbYZdcgq7qpMH2sXGHJXeSzethe5VPVeYIfbfDOeFO61zSYOT5GWKfG7M
         NAVbFcrfTfeGaOgE+SD6bQoN/DwVIMwXKLwQIVuoMRdfZkflp39jjDZlBjVjQyMhpS5B
         sUvg==
X-Gm-Message-State: AOJu0Yw7kOBwPU03J7UOqrPjfuNOg9viXQ2ynAvz0VLMa3347eT6mCGz
	fJVDOFqU5Z+DsTWSqQNx/kJGuHgSudDm98J+CaYPoe1M0eLuwvAxOf7S+w3c8b2xIPnTowrKPiM
	rUhXxMPQz1Bck09csr1J40UizFnBjjoY=
X-Gm-Gg: ATEYQzzvFivHlfdCl+/olpr/VDF4oQyy/VQ6LbMzMRI+KzMUfhPRuLZpezT53IEOqka
	W8NPvHKEM7p2uaUErzvQfjgy7HctaDBXe8fCNOdFLqbuqziySyQkFdHAsCbuQ+UH9tVQ4XiGasF
	vRR3zQ/X7mxwKWyDbQgFy0QnLxAx4YI7I6TwMkKFho+K2eiUvkQVnYa6jTTMW7JSzlNyEUenaLZ
	tVY9RuYtQR6mGt2lDi2nDO7RYuBFn9pBRyuR2lpyVNDx4XhBuyS4iHU3fuC93qQei2ayNG/ErnQ
	EtzzRmzq
X-Received: by 2002:a05:690e:d07:b0:64e:a36d:9290 with SMTP id
 956f58d0204a3-64ea36d96d4mr518597d50.27.1773905124365; Thu, 19 Mar 2026
 00:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318172518.91336-1-sergiomelas@gmail.com> <ba6bc890-b6b1-4035-872f-0b15281eaa05@roeck-us.net>
In-Reply-To: <ba6bc890-b6b1-4035-872f-0b15281eaa05@roeck-us.net>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Thu, 19 Mar 2026 08:25:12 +0100
X-Gm-Features: AaiRm51cSci696eKKvRyXbp7gtKKlLEZDLAuleuM7-8zyWPq8V8Xa3tBDiiZCnA
Message-ID: <CAP8e=sLRDCCbwDtb4wdw-g3yWCyXCiKKguJ6GyDOXY89BMJKrA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (yogafan) V3.0 Universal refactor and RLLag filter
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sergio Melas <sergio.melas@syensqo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review and for your patience with my first
submission to the kernel. I apologize for the structural errors; I
will address the missing Kconfig, Makefile, and documentation ASAP.

Regarding your specific comments:

** > That is an odd subject line and description for a new driver.

I understand. I will change the subject to the standard "hwmon:
(yogafan) Add new Lenovo Yoga/Legion fan driver" and rewrite the
description to focus on the hardware support rather than my internal
versioning.

** > That doesn't explain why this is needed. Running a background
task is expensive.
** > [...]
** > This will need some explanation. Why is this worker needed, what
exactly does it do,
** > and why not just read the current fan speed from ACPI when requested?

I am a control engineer by trade, so my approach was to implement a
discrete-time physical model for the fan behavior.

The Lenovo Embedded Controller (EC) often reports "jumpy" or
oscillating RPM values due to low-resolution tachometer sampling. A
simple instantaneous read from ACPI results in a very jittery UI in
userspace. The 100ms background worker provided a constant-frequency
heartbeat (10 Hz) necessary for the RLLag (Rate Limited Lag) filter to
function correctly.

This filter mimics the physical inertia of the fan by combining a
first-order lag with a slew-rate limit. This effectively filters out
EC measurement noise while ensuring the reported value follows a
realistic physical trajectory.

However, I understand your concern about the cost of a background task
on a laptop. For the next version, I will refactor this into a
"passive" filter that calculates the state transition (dt) only when
the sensor is read, eliminating the background worker entirely while
maintaining the integrity of the control model.

** > The hardware monitoring subsystem supports synchronization which
should be relied on.

Understood. I will remove my manual mutex locking and rely on the
hwmon core synchronization.

** > Why limit the number of supported fans to 2?

This was an assumption based on the Yoga/Legion models I had access
to. I will refactor this to support a dynamic number of fans to make
the driver more universal.

** > This doesn't stop the delayed worker on driver removal, which I
am sure would
** > have interesting consequences.

You are correct; that was a significant oversight. By moving to the
"passive" filter mentioned above, I will be able to remove the worker
entirely, which solves this safety issue.

I will prepare a new version of the patch incorporating these fixes
and the missing build system files.

Best regards,
Sergio Melas

PS: I am a loyal user of Linux since version 2. I have developed
several private drivers for my own hardware over the years and finally
decided to take the leap and contribute upstream. Sorry again for my
newbie errors regarding the submission process. I will do better in
the future

On Wed, Mar 18, 2026 at 7:21=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 3/18/26 10:25, Sergio Melas wrote:
> > - Refactor driver to V3.0 Universal Platform Mode for cross-model compa=
tibility.
> > - Add support for dual-fan ACPI paths (FANS, FA2S, FANX) for Legion/Yog=
a series.
> > - Implement 100ms (10Hz) background heartbeat for constant-frequency sa=
mpling.
> > - Implement RLLag (Rate Limited Lag) filter to stabilize jumpy EC RPM d=
ata.
> > - Use 10-bit fixed-point integer math to avoid forbidden SSE/floating-p=
oint registers.
> > - Integrate DSTS ACPI modifications to ensure sensor stability during S=
3 sleep cycles.
> > - Provide full documentation for KDE 6 Plasma Sensor compatibility and =
scaling.
> >
>
> That is an odd subject line and description for a new driver.
>
> > Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> > ---
> >   drivers/hwmon/yoga_fan.c | 222 ++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 222 insertions(+)
> >   create mode 100644 drivers/hwmon/yoga_fan.c
> >
> No Makefile update, no Kconfig update, no documentation.
>
> Am I missing something ?
>
> Some more (hight level) comments inline. This is not a complete
> review.
>
> Guenter
>
> > diff --git a/drivers/hwmon/yoga_fan.c b/drivers/hwmon/yoga_fan.c
> > new file mode 100644
> > index 000000000..5a9ae631c
> > --- /dev/null
> > +++ b/drivers/hwmon/yoga_fan.c
> > @@ -0,0 +1,222 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/**
> > + * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
> > + *
> > + * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
> > + *
> > + * This driver provides fan speed monitoring for modern Lenovo Yoga, L=
egion,
> > + * and IdeaPad laptops by interfacing with the Embedded Controller (EC=
)
> > + * via ACPI. It registers a platform device to ensure compatibility wi=
th
> > + * modern HWMON consumers like KDE Plasma 6.
> > + *
> > + * Supported Models:
> > + * - Lenovo Yoga 7 / 14c series (Ryzen/Intel)
> > + * - Lenovo Legion 5 / 7 / Pro series (Dual-fan support)
> > + * - Lenovo Yoga Slim 7 / Pro / Carbon / Nano
> > + * - Lenovo IdeaPad 5 / ThinkBook series
> > + *
> > + * Implementation Details:
> > + * - Fixed static HWMON channel definition for kernel 6.0+ compatibili=
ty.
>
> This patch implements a new driver and thus can not fix anything.
>
> > + * - Implements a 100ms background worker to ensure RLLag filter consi=
stency.
> > + * - RLLag Formula: x(t) =3D x(t-dt) + clamp(step, -limit, limit)
> > + * where step =3D (input - x) * alpha
>
> That doesn't explain why this is needed. Running a background task is exp=
ensive.
>
> > + */
> > +
> > +
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/acpi.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/dmi.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/mutex.h>
> > +
> > +#define DRVNAME "yogafan"
> > +#define MAX_FANS 2
> > +
> > +/* --- RLLAG CONFIGURATION --- */
> > +#define TS_MS            100
> > +#define TAU_MS           1000
> > +#define MAX_SPEED_RPM_S  500
> > +
> > +#define ALPHA_SCALED ((TS_MS * 1024) / (TAU_MS + TS_MS))
> > +#define STEP_LIMIT ((MAX_SPEED_RPM_S * TS_MS) / 1000)
> > +
> > +struct yoga_fan_data {
> > +     const char *active_paths[MAX_FANS];
> > +     long filtered_val[MAX_FANS];
> > +     struct delayed_work heartbeat;
> > +     struct mutex lock;
>
> The hardware monitoring subsystem supports synchronization which should b=
e
> relied on.
>
> > +     int fan_count;
> > +};
> > +
> > +static void yoga_fan_worker(struct work_struct *work)
> > +{
> > +     struct yoga_fan_data *data =3D container_of(work, struct yoga_fan=
_data, heartbeat.work);
> > +     unsigned long long raw_acpi;
> > +     long rpm, delta, lag_step;
> > +     int i;
> > +
> > +     mutex_lock(&data->lock);
> > +     for (i =3D 0; i < data->fan_count; i++) {
> > +             if (ACPI_SUCCESS(acpi_evaluate_integer(NULL, (char *)data=
->active_paths[i], NULL, &raw_acpi))) {
> > +                     rpm =3D (raw_acpi > 0 && raw_acpi <=3D 255) ? ((l=
ong)raw_acpi * 100) : (long)raw_acpi;
> > +
> > +                     delta =3D rpm - data->filtered_val[i];
> > +                     lag_step =3D (delta * ALPHA_SCALED) >> 10;
> > +
> > +                     if (lag_step > (long)STEP_LIMIT)
> > +                             lag_step =3D (long)STEP_LIMIT;
> > +                     else if (lag_step < -(long)STEP_LIMIT)
> > +                             lag_step =3D -(long)STEP_LIMIT;
> > +
> > +                     data->filtered_val[i] +=3D lag_step;
> > +
> > +                     if (data->filtered_val[i] < 50)
> > +                             data->filtered_val[i] =3D 0;
> > +             }
>
> This will need some explanation. Why is this worker needed, what exactly =
does it do,
> and why not just read the current fan speed from ACPI when requested ?
>
> > +     }
> > +     mutex_unlock(&data->lock);
> > +
> > +     schedule_delayed_work(&data->heartbeat, msecs_to_jiffies(TS_MS));
> > +}
> > +
> > +static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types t=
ype,
> > +                      u32 attr, int channel, long *val)
> > +{
> > +     struct yoga_fan_data *data =3D dev_get_drvdata(dev);
> > +
> > +     if (type !=3D hwmon_fan || attr !=3D hwmon_fan_input)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (channel >=3D data->fan_count)
> > +             return -EINVAL;
> > +
> > +     mutex_lock(&data->lock);
> > +     *val =3D data->filtered_val[channel];
> > +     mutex_unlock(&data->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static umode_t yoga_fan_is_visible(const void *data, enum hwmon_sensor=
_types type,
> > +                                u32 attr, int channel)
> > +{
> > +     const struct yoga_fan_data *fan_data =3D data;
> > +
> > +     if (type =3D=3D hwmon_fan && channel < fan_data->fan_count)
> > +             return 0444;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct hwmon_ops yoga_fan_hwmon_ops =3D {
> > +     .is_visible =3D yoga_fan_is_visible,
> > +     .read =3D yoga_fan_read,
> > +};
> > +
> > +static const struct hwmon_channel_info *yoga_fan_info[] =3D {
> > +     HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> > +     NULL
> > +};
> > +
> > +static const struct hwmon_chip_info yoga_fan_chip_info =3D {
> > +     .ops =3D &yoga_fan_hwmon_ops,
> > +     .info =3D yoga_fan_info,
> > +};
> > +
> > +static int yoga_fan_probe(struct platform_device *pdev)
> > +{
> > +     struct yoga_fan_data *data;
> > +     struct device *hwmon_dev;
> > +     acpi_handle handle;
> > +     unsigned long long init_raw;
> > +     int i;
> > +     static const char * const fan_paths[] =3D {
> > +             "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S",
> > +             "\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC.EC.FAN0",
> > +             "\\_SB.PCI0.LPC0.EC.FAN0"
> > +     };
> > +
> > +     data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&data->lock);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(fan_paths); i++) {
> > +             if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[=
i], &handle))) {
> > +                     data->active_paths[data->fan_count] =3D fan_paths=
[i];
> > +
> > +                     if (ACPI_SUCCESS(acpi_evaluate_integer(NULL, (cha=
r *)data->active_paths[data->fan_count], NULL, &init_raw)))
> > +                             data->filtered_val[data->fan_count] =3D (=
init_raw > 0 && init_raw <=3D 255) ? ((long)init_raw * 100) : (long)init_ra=
w;
> > +
> > +                     data->fan_count++;
> > +                     if (data->fan_count >=3D MAX_FANS)
> > +                             break;
>
> Can this happen in practice ? If so, why limit the number of supported fa=
ns to 2 ?
>
> > +             }
> > +     }
> > +
> > +     if (data->fan_count =3D=3D 0)
> > +             return -ENODEV;
> > +
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, DR=
VNAME,
> > +                                                      data, &yoga_fan_=
chip_info, NULL);
> > +
> > +     INIT_DELAYED_WORK(&data->heartbeat, yoga_fan_worker);
> > +     schedule_delayed_work(&data->heartbeat, msecs_to_jiffies(TS_MS));
> > +
>
> This doesn't stop the delayed worker on driver removal, which I am sure w=
ould
> have interesting consequences.
>
> > +     return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static struct platform_driver yoga_fan_driver =3D {
> > +     .driver =3D { .name =3D DRVNAME },
> > +     .probe =3D yoga_fan_probe,
> > +};
> > +
> > +static struct platform_device *yoga_fan_device;
> > +
> > +static const struct dmi_system_id yoga_dmi_table[] __initconst =3D {
> > +     { .ident =3D "Lenovo", .matches =3D { DMI_MATCH(DMI_SYS_VENDOR, "=
LENOVO") } },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(dmi, yoga_dmi_table);
> > +
> > +static int __init yoga_fan_init(void)
> > +{
> > +     int ret;
> > +
> > +     if (!dmi_check_system(yoga_dmi_table))
> > +             return -ENODEV;
> > +
> > +     ret =3D platform_driver_register(&yoga_fan_driver);
> > +     if (ret)
> > +             return ret;
> > +
> > +     yoga_fan_device =3D platform_device_register_simple(DRVNAME, 0, N=
ULL, 0);
> > +     if (IS_ERR(yoga_fan_device)) {
> > +             platform_driver_unregister(&yoga_fan_driver);
> > +             return PTR_ERR(yoga_fan_device);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void __exit yoga_fan_exit(void)
> > +{
> > +     struct yoga_fan_data *data =3D platform_get_drvdata(yoga_fan_devi=
ce);
> > +
> > +     if (data)
> > +             cancel_delayed_work_sync(&data->heartbeat);
> > +
> > +     platform_device_unregister(yoga_fan_device);
> > +     platform_driver_unregister(&yoga_fan_driver);
> > +}
> > +
> > +module_init(yoga_fan_init);
> > +module_exit(yoga_fan_exit);
> > +
> > +MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
> > +MODULE_DESCRIPTION("Universal Lenovo Fan Driver v3.0.0");
> > +MODULE_LICENSE("GPL v2");
>
