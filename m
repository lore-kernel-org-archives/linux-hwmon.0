Return-Path: <SRS0=0Rzu=CR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA267C43461
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 16:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96384205CB
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 16:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdMDbyzF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731643AbgIHQV6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Sep 2020 12:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731708AbgIHQVh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Sep 2020 12:21:37 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77718C061573
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2020 09:21:37 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x77so9521024lfa.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2020 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jruhtFEL9Uos2ximrXqyKbwtIHpbqiJe831RZRynyjQ=;
        b=FdMDbyzFu/yQFLS6vsolBlfr8+0v4oaaoe7n6Ma+alaATkmCCfPq35LPFW5C9h4LXZ
         NQMIDak2g/eqjNh0M/53YBxCApcOOIeJvMR/7Gxqv0GhE6ejfIxWA+eDFrZ/KemMVZsV
         4ujIzjdj0S00dqD6QGqW7tExkiDCmyiqrRbEjyJJxPMDpa7/BpiZhlTaoFCeRD5bX5k+
         FthCUfh4zp6rO2757Vp66uDws/CqpnzPo+kfcuKNGRJ1l0VNlhxtWqci4YG63y7qHwnn
         AiIA1KfyzpiT4eVlX4wr+Ay/YthCEtTLrFZEzUsqEyHuOvh5XfBD30icL2vHsNrXew/4
         5eSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jruhtFEL9Uos2ximrXqyKbwtIHpbqiJe831RZRynyjQ=;
        b=nVZBjHfWx1U8VzgNC4ltdNsSsLLkbS2hs6t4XD5nR5qTbf+w3UpoaU3tHr4a+xsI3h
         wP48hll6UAEv03ICELfweA4Xj7rgjiV88K7qBLgmGIhMJBZZjBOvtgq4GCByFW88TkzA
         /v8ofXWmsy1Mi35UxXyqP9F48inJ377oJKd1yvdO14h9QemcobpxAve+OpsQRh5kK4SF
         2rapUunLdTyAIaeSoTSBivDuDx9Uox3t2GRh0UoTj+QAoQ74E2VdKwoyB7PC27eRZoJe
         l0vtGwub28vFND7kjRmjo9WDJ8WnemaeC69kN/xkVfAf3Dbmfm3wvBBHwAw4E3MBfsRz
         QSlA==
X-Gm-Message-State: AOAM532hLgNUZscIEFIykYGBR1Ljuw2JBD/jDU/rTnBvBrFgF3G2zP0I
        +USu0x648hbG0+E9Wb6PrUEOVCm8d6AxfFkczPfveNGnVWCs5qJN
X-Google-Smtp-Source: ABdhPJw9WzKkAABSj++yk5RxWjd50SaVigk7kAzMLRV8L2d466xqtuQ3TeAfc4J0s+0mxXTC+Ec0j5TMJzGF5fxm8kA=
X-Received: by 2002:a19:480c:: with SMTP id v12mr12461575lfa.195.1599582095582;
 Tue, 08 Sep 2020 09:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200905143230.195049-1-nchatrad@amd.com> <20200905143230.195049-5-nchatrad@amd.com>
 <850781c9-8332-1618-f4f1-1722a8491f2f@roeck-us.net> <53f9b993-20e2-92b0-4957-c444b23cb37f@roeck-us.net>
 <DM6PR12MB4388A21B749811BBE1309AA3E8290@DM6PR12MB4388.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4388A21B749811BBE1309AA3E8290@DM6PR12MB4388.namprd12.prod.outlook.com>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Tue, 8 Sep 2020 21:51:23 +0530
Message-ID: <CAHfPSqDO3_KgSToQs9GNy3Ag8e4Am8z85qmi2fRSAz=62ztHmg@mail.gmail.com>
Subject: Re: FW: [PATCH 4/6] hwmon: amd_energy: let user enable/disable the sw accumulation
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <groeck7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Tue, 8 Sep 2020 at 21:42, Chatradhi, Naveen Krishna
<NaveenKrishna.Chatradhi@amd.com> wrote:
>
> [AMD Public Use]
>
> [CAUTION: External Email]
>
> On 9/5/20 8:17 AM, Guenter Roeck wrote:
> > On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> >> Provide an option "accumulator_status" via sysfs to enable/disable
> >> the software accumulation of energy counters.
> >>
> >> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> >
> > I am quite substantially opposed to this. I'd be willing to accept a
> > module parameter. However, the code is there, and it is enabled by
> > default, and it should stay enabled by default.
Sure, I will change it back.

> > I don't want to have to deal with people complaining that it suddenly
> > no longer works.
Understood.
> >
> > Also, there needs to be an explanation for why this is needed.
> >
>
> No, wait, without accumulator this driver has zero value.
> Users should just not load the driver if they don't want the overhead ass=
ociated with accumulation.

The use case we have is to provide an interface to enable/disable
accumulation by the admins, without having to reboot or install
something.
A userspace API is provided which will be used by the applications.

>
> Guenter
>
> > Guenter
> >
> >> ---
> >>  drivers/hwmon/amd_energy.c | 104
> >> ++++++++++++++++++++++++++++++-------
> >>  1 file changed, 86 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> >> index 96c61784d05c..c294bea56c02 100644
> >> --- a/drivers/hwmon/amd_energy.c
> >> +++ b/drivers/hwmon/amd_energy.c
> >> @@ -32,6 +32,8 @@
> >>  #define AMD_ENERGY_UNIT_MASK        0x01F00
> >>  #define AMD_ENERGY_MASK             0xFFFFFFFF
> >>
> >> +static struct device_attribute accumulate_attr;
> >> +
> >>  struct sensor_accumulator {
> >>      u64 energy_ctr;
> >>      u64 prev_value;
> >> @@ -42,10 +44,12 @@ struct amd_energy_data {
> >>      const struct hwmon_channel_info *info[2];
> >>      struct hwmon_chip_info chip;
> >>      struct task_struct *wrap_accumulate;
> >> +    struct device *hwmon_dev;
> >>      /* Lock around the accumulator */
> >>      struct mutex lock;
> >>      /* An accumulator for each core and socket */
> >>      struct sensor_accumulator *accums;
> >> +    bool accumulator_status;
> >>      /* Energy Status Units */
> >>      u64 energy_units;
> >>      unsigned int timeout;
> >> @@ -128,13 +132,15 @@ static void amd_add_delta(struct amd_energy_data=
 *data, int ch,
> >>      rdmsrl_safe_on_cpu(cpu, reg, &input);
> >>      input &=3D AMD_ENERGY_MASK;
> >>
> >> -    accum =3D &data->accums[ch];
> >> -    if (input >=3D accum->prev_value)
> >> -            input +=3D accum->energy_ctr -
> >> -                            accum->prev_value;
> >> -    else
> >> -            input +=3D UINT_MAX - accum->prev_value +
> >> -                            accum->energy_ctr;
> >> +    if (data->accumulator_status) {
> >> +            accum =3D &data->accums[ch];
> >> +            if (input >=3D accum->prev_value)
> >> +                    input +=3D accum->energy_ctr -
> >> +                                    accum->prev_value;
> >> +            else
> >> +                    input +=3D UINT_MAX - accum->prev_value +
> >> +                                    accum->energy_ctr;
> >> +    }
> >>
> >>      /* Energy consumed =3D (1/(2^ESU) * RAW * 1000000UL) =CE=BCJoules=
 */
> >>      *val =3D div64_ul(input * 1000000UL, BIT(data->energy_units)); @@
> >> -264,9 +270,67 @@ static int amd_create_sensor(struct device *dev,
> >>      return 0;
> >>  }
> >>
> >> +static ssize_t amd_energy_accumulate_show(struct device *dev,
> >> +                                      struct device_attribute *dev_at=
tr,
> >> +                                      char *buf) {
> >> +    struct amd_energy_data *data =3D dev_get_drvdata(dev);
> >> +
> >> +    return sprintf(buf, "%d\n", data->accumulator_status); }
> >> +
> >> +static ssize_t amd_energy_accumulate_store(struct device *dev,
> >> +                                       struct device_attribute *dev_a=
ttr,
> >> +                                       const char *buf, size_t
> >> +count) {
> >> +    struct amd_energy_data *data =3D dev_get_drvdata(dev);
> >> +    bool input;
> >> +    int ret;
> >> +
> >> +    ret =3D kstrtobool(buf, &input);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    if (data->accumulator_status =3D=3D input)
> >> +            return count;
> >> +
> >> +    if (input) {
> >> +            memset(data->accums, 0, (data->nr_cpus + data->nr_socks) =
*
> >> +                    sizeof(struct sensor_accumulator));
> >> +
> >> +            if (!data->wrap_accumulate) {
> >> +                    data->wrap_accumulate =3D
> >> +                            kthread_run(energy_accumulator,
> >> +                                        data, "%s", dev_name(dev));
> >> +                    if (IS_ERR(data->wrap_accumulate))
> >> +                            return PTR_ERR(data->wrap_accumulate);
> >> +            }
> >> +    } else {
> >> +            if (data && data->wrap_accumulate) {
> >> +                    ret =3D kthread_stop(data->wrap_accumulate);
> >> +                    if (ret)
> >> +                            return ret;
> >> +                    data->wrap_accumulate =3D NULL;
> >> +            }
> >> +    }
> >> +    data->accumulator_status =3D input;
> >> +
> >> +    return count;
> >> +}
> >> +
> >> +static int create_accumulate_status_file(struct amd_energy_data
> >> +*data) {
> >> +    accumulate_attr.attr.name =3D "accumulator_status";
> >> +    accumulate_attr.attr.mode =3D 0664;
> >> +    accumulate_attr.show =3D amd_energy_accumulate_show;
> >> +    accumulate_attr.store =3D amd_energy_accumulate_store;
> >> +
> >> +    return sysfs_create_file(&data->hwmon_dev->kobj,
> >> +                             &accumulate_attr.attr); }
> >> +
> >>  static int amd_energy_probe(struct platform_device *pdev)  {
> >> -    struct device *hwmon_dev;
> >>      struct amd_energy_data *data;
> >>      struct device *dev =3D &pdev->dev;
> >>      int ret;
> >> @@ -290,12 +354,12 @@ static int amd_energy_probe(struct platform_devi=
ce *pdev)
> >>      mutex_init(&data->lock);
> >>      get_energy_units(data);
> >>
> >> -    hwmon_dev =3D devm_hwmon_device_register_with_info(dev, DRVNAME,
> >> -                                                     data,
> >> -                                                     &data->chip,
> >> -                                                     NULL);
> >> -    if (IS_ERR(hwmon_dev))
> >> -            return PTR_ERR(hwmon_dev);
> >> +    data->hwmon_dev =3D devm_hwmon_device_register_with_info(dev, DRV=
NAME,
> >> +                                                           data,
> >> +                                                           &data->chi=
p,
> >> +                                                           NULL);
> >> +    if (IS_ERR(data->hwmon_dev))
> >> +            return PTR_ERR(data->hwmon_dev);
> >>
> >>      /* Once in 3 minutes for a resolution of 1/2*16 */
> >>      if (data->energy_units =3D=3D 0x10)
> >> @@ -305,10 +369,12 @@ static int amd_energy_probe(struct platform_devi=
ce *pdev)
> >>      if (data->energy_units =3D=3D 0x6)
> >>              data->timeout =3D 3 * 24 * 60 * 60;
> >>
> >> -    data->wrap_accumulate =3D kthread_run(energy_accumulator, data,
> >> -                                        "%s", dev_name(hwmon_dev));
> >> -    if (IS_ERR(data->wrap_accumulate))
> >> -            return PTR_ERR(data->wrap_accumulate);
> >> +    /* Disabling the energy accumulation by default */
> >> +    data->accumulator_status =3D 0;
> >> +
> >> +    ret =3D create_accumulate_status_file(data);
> >> +    if (ret)
> >> +            return ret;
> >>
> >>      return 0;
> >>  }
> >> @@ -317,6 +383,8 @@ static int amd_energy_remove(struct
> >> platform_device *pdev)  {
> >>      struct amd_energy_data *data =3D dev_get_drvdata(&pdev->dev);
> >>
> >> +    sysfs_remove_file(&data->hwmon_dev->kobj,
> >> + &accumulate_attr.attr);
> >> +
> >>      if (data && data->wrap_accumulate)
> >>              kthread_stop(data->wrap_accumulate);
> >>
> >>
> >



--=20
Shine bright,
(: Nav :)
