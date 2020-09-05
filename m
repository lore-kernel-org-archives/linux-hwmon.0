Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200DFC433E2
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 16:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8F02078E
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 16:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHzJBDCF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgIEQbU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 12:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEQbT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 12:31:19 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64260C061244
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 09:31:17 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r13so11455170ljm.0
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HJG38cP4jgfGY7dHN7ssjnON+ghCVt7G14rZhNGiI7c=;
        b=EHzJBDCFn3EEChoCSq9Mwp1h9h/mM4DgmxGDTlf2CP6u321+zKPIMrLCL2ng75ckaS
         jz+7waNnpIoWGbNeTzI8nytkk+1BUJk6F7hpvZEXK0vTQWTYTRDWejHUzvgw5J+irnlm
         NM22y9g1ELfxQt3rRjEitExdnEZOZdCIHNIWQLQN/tJbZZJXJK65aZ7GcXTR5JBIjq2K
         HQJ+RSrg4s4vL7bqC7haQANErrWdlVvWvdZx/5R/iWrc7oYIxdIK/jCejiPqnr3g4/Q3
         5snqEMGX7OBcJvyVBLw+dAZrkXELs76RA7SgugrHOhoDZtIgfFOWAJgGc7xsYfFAhjUE
         xXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HJG38cP4jgfGY7dHN7ssjnON+ghCVt7G14rZhNGiI7c=;
        b=M6iqIASWZZkyo6EKHVQZR+FkVdgPCSwXMd0ps/NnFBKR16jhaZTSVUbdVrUaBwpsKr
         ZHeK9C8B9lZe9W0Y0+IVxwEjFU2IU2jP8hzHPR+isatWsmbwBV7+tSQPoJHHwrNeEmzT
         pdFgNsCSaX/41qEwReDuuiUdShERleR0uZQD+GO3tFreFgrldx5KMufZq/bVsVI23zSo
         nm8JROGXz+SrCfmooJAMDkPwdEEQyuAT+RVgQW3CGTKOtt4GXlL6sc3HtL7LYfwyhhBG
         Uj2tkx7Q0RkgetgNkonrO7FMqHFOLUrVMl69GpYnSVYbTjhZeaihsC6rviTp8KCQ0LoI
         RPQg==
X-Gm-Message-State: AOAM533cbZvr7gnR0ar1txFzBRkwSIXRUPozeRKb4suOzq3PTV1EFItt
        h6YL4Gr7+KJoCMuvUg07GIN1ea6gJy5PT/ozBBMXo4BFpIw=
X-Google-Smtp-Source: ABdhPJwUnzBUfLjKGBwIxAEKowFYKgARK82pcIIjr6uKCmQoIa/ogRiK8hGratJvluISsM4l0CKw45NSyeBUlHuT0sQ=
X-Received: by 2002:a2e:a588:: with SMTP id m8mr6277139ljp.210.1599323475057;
 Sat, 05 Sep 2020 09:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200905143230.195049-1-nchatrad@amd.com> <20200905143230.195049-4-nchatrad@amd.com>
 <c84d9f76-beb4-c760-42be-58118c3d13c8@roeck-us.net> <DM6PR12MB438850F9DFD14163F11AA946E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB438850F9DFD14163F11AA946E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Sat, 5 Sep 2020 22:01:03 +0530
Message-ID: <CAHfPSqDXjW8MWt0g9bF0WDpg_A83qWoby0mXNfj6dxf63Xf0vA@mail.gmail.com>
Subject: Re: FW: [PATCH 3/6] hwmon: amd_energy: Improve the accumulation logic
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> > Factor out the common code in the accumulation functions for core and
> > socket accumulation.
> >
> > While at it, handle the return value of the amd_create_sensor() functio=
n.
> >
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > ---
> >  drivers/hwmon/amd_energy.c | 126
> > +++++++++++++------------------------
> >  1 file changed, 45 insertions(+), 81 deletions(-)
> >
> > diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> > index f0a13d6cc419..96c61784d05c 100644
> > --- a/drivers/hwmon/amd_energy.c
> > +++ b/drivers/hwmon/amd_energy.c
> > @@ -74,108 +74,67 @@ static void get_energy_units(struct amd_energy_dat=
a *data)
> >       data->energy_units =3D (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> > }
> >
> > -static void accumulate_socket_delta(struct amd_energy_data *data,
> > -                                 int sock, int cpu)
> > +static void accumulate_delta(struct amd_energy_data *data,
> > +                          int channel, int cpu, u32 reg)
> >  {
> > -     struct sensor_accumulator *s_accum;
> > +     struct sensor_accumulator *accum;
> >       u64 input;
> >
> >       mutex_lock(&data->lock);
> > -     rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> > +     rdmsrl_safe_on_cpu(cpu, reg, &input);
> >       input &=3D AMD_ENERGY_MASK;
> >
> > -     s_accum =3D &data->accums[data->nr_cpus + sock];
> > -     if (input >=3D s_accum->prev_value)
> > -             s_accum->energy_ctr +=3D
> > -                     input - s_accum->prev_value;
> > +     accum =3D &data->accums[channel];
> > +     if (input >=3D accum->prev_value)
> > +             accum->energy_ctr +=3D
> > +                     input - accum->prev_value;
> >       else
> > -             s_accum->energy_ctr +=3D UINT_MAX -
> > -                     s_accum->prev_value + input;
> > +             accum->energy_ctr +=3D UINT_MAX -
> > +                     accum->prev_value + input;
> >
> > -     s_accum->prev_value =3D input;
> > +     accum->prev_value =3D input;
> >       mutex_unlock(&data->lock);
> >  }
> >
> > -static void accumulate_core_delta(struct amd_energy_data *data)
> > +static void read_accumulate(struct amd_energy_data *data)
> >  {
> > -     struct sensor_accumulator *c_accum;
> > -     u64 input;
> > -     int cpu;
> > +     int sock, scpu, cpu;
> > +
> > +     for (sock =3D 0; sock < data->nr_socks; sock++) {
> > +             scpu =3D cpumask_first_and(cpu_online_mask,
> > +                                      cpumask_of_node(sock));
> > +
> > +             accumulate_delta(data, data->nr_cpus + sock,
> > +                              scpu, ENERGY_PKG_MSR);
> > +     }
> >
> > -     mutex_lock(&data->lock);
> >       if (data->core_id >=3D data->nr_cpus)
> >               data->core_id =3D 0;
> >
> >       cpu =3D data->core_id;
> > +     if (cpu_online(cpu))
> > +             accumulate_delta(data, cpu, cpu, ENERGY_CORE_MSR);
> >
> > -     if (!cpu_online(cpu))
> > -             goto out;
> > -
> > -     rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> > -     input &=3D AMD_ENERGY_MASK;
> > -
> > -     c_accum =3D &data->accums[cpu];
> > -
> > -     if (input >=3D c_accum->prev_value)
> > -             c_accum->energy_ctr +=3D
> > -                     input - c_accum->prev_value;
> > -     else
> > -             c_accum->energy_ctr +=3D UINT_MAX -
> > -                     c_accum->prev_value + input;
> > -
> > -     c_accum->prev_value =3D input;
> > -
> > -out:
> >       data->core_id++;
> > -     mutex_unlock(&data->lock);
> > -}
> > -
> > -static void read_accumulate(struct amd_energy_data *data) -{
> > -     int sock;
> > -
> > -     for (sock =3D 0; sock < data->nr_socks; sock++) {
> > -             int cpu;
> > -
> > -             cpu =3D cpumask_first_and(cpu_online_mask,
> > -                                     cpumask_of_node(sock));
> > -
> > -             accumulate_socket_delta(data, sock, cpu);
> > -     }
> > -
> > -     accumulate_core_delta(data);
> >  }
> >
> >  static void amd_add_delta(struct amd_energy_data *data, int ch,
> > -                       int cpu, long *val, bool is_core)
> > +                       int cpu, long *val, u32 reg)
> >  {
> > -     struct sensor_accumulator *s_accum, *c_accum;
> > +     struct sensor_accumulator *accum;
> >       u64 input;
> >
> >       mutex_lock(&data->lock);
> > -     if (!is_core) {
> > -             rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> > -             input &=3D AMD_ENERGY_MASK;
> > -
> > -             s_accum =3D &data->accums[ch];
> > -             if (input >=3D s_accum->prev_value)
> > -                     input +=3D s_accum->energy_ctr -
> > -                               s_accum->prev_value;
> > -             else
> > -                     input +=3D UINT_MAX - s_accum->prev_value +
> > -                               s_accum->energy_ctr;
> > -     } else {
> > -             rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> > -             input &=3D AMD_ENERGY_MASK;
> > +     rdmsrl_safe_on_cpu(cpu, reg, &input);
> > +     input &=3D AMD_ENERGY_MASK;
> >
> > -             c_accum =3D &data->accums[ch];
> > -             if (input >=3D c_accum->prev_value)
> > -                     input +=3D c_accum->energy_ctr -
> > -                              c_accum->prev_value;
> > -             else
> > -                     input +=3D UINT_MAX - c_accum->prev_value +
> > -                              c_accum->energy_ctr;
> > -     }
> > +     accum =3D &data->accums[ch];
> > +     if (input >=3D accum->prev_value)
> > +             input +=3D accum->energy_ctr -
> > +                             accum->prev_value;
> > +     else
> > +             input +=3D UINT_MAX - accum->prev_value +
> > +                             accum->energy_ctr;
> >
> >       /* Energy consumed =3D (1/(2^ESU) * RAW * 1000000UL) =CE=BCJoules=
 */
> >       *val =3D div64_ul(input * 1000000UL, BIT(data->energy_units)); @@
> > -188,20 +147,22 @@ static int amd_energy_read(struct device *dev,
> >                          u32 attr, int channel, long *val)  {
> >       struct amd_energy_data *data =3D dev_get_drvdata(dev);
> > +     u32 reg;
> >       int cpu;
> >
> >       if (channel >=3D data->nr_cpus) {
> >               cpu =3D cpumask_first_and(cpu_online_mask,
> >                                       cpumask_of_node
> >                                       (channel - data->nr_cpus));
> > -             amd_add_delta(data, channel, cpu, val, false);
> > +             reg =3D ENERGY_PKG_MSR;
> >       } else {
> >               cpu =3D channel;
> >               if (!cpu_online(cpu))
> >                       return -ENODEV;
> >
> > -             amd_add_delta(data, channel, cpu, val, true);
> > +             reg =3D ENERGY_CORE_MSR;
> >       }
> > +     amd_add_delta(data, channel, cpu, val, reg);
> >
> >       return 0;
> >  }
> > @@ -249,7 +210,7 @@ static const struct hwmon_ops amd_energy_ops =3D {
> >
> >  static int amd_create_sensor(struct device *dev,
> >                            struct amd_energy_data *data,
> > -                          u8 type, u32 config)
> > +                          enum hwmon_sensor_types type, u32 config)
> >  {
> >       struct hwmon_channel_info *info =3D &data->energy_info;
> >       struct sensor_accumulator *accums; @@ -308,6 +269,7 @@ static
> > int amd_energy_probe(struct platform_device *pdev)
> >       struct device *hwmon_dev;
> >       struct amd_energy_data *data;
> >       struct device *dev =3D &pdev->dev;
> > +     int ret;
> >
> >       data =3D devm_kzalloc(dev,
> >                           sizeof(struct amd_energy_data), GFP_KERNEL);
> > @@ -320,8 +282,10 @@ static int amd_energy_probe(struct platform_device=
 *pdev)
> >       dev_set_drvdata(dev, data);
> >       /* Populate per-core energy reporting */
> >       data->info[0] =3D &data->energy_info;
> > -     amd_create_sensor(dev, data, hwmon_energy,
> > -                       HWMON_E_INPUT | HWMON_E_LABEL);
> > +     ret =3D amd_create_sensor(dev, data, hwmon_energy,
> > +                             HWMON_E_INPUT | HWMON_E_LABEL);
> > +     if (ret)
> > +             return ret;
> >
> >       mutex_init(&data->lock);
> >       get_energy_units(data);
> > @@ -346,7 +310,7 @@ static int amd_energy_probe(struct platform_device =
*pdev)
> >       if (IS_ERR(data->wrap_accumulate))
> >               return PTR_ERR(data->wrap_accumulate);
> >
> > -     return PTR_ERR_OR_ZERO(data->wrap_accumulate);
> > +     return 0;
>
> Actually, what you want to remove is the above if() statement, since
> PTR_ERR_OR_ZERO() is supposed to replace it.
Yes, that would have been better. Will resubmit.
>
> >  }
> >
> >  static int amd_energy_remove(struct platform_device *pdev)
> >

Naveen
