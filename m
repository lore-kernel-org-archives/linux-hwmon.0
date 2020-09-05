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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66697C43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 16:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C97720760
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 16:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLCDiNKa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgIEQlq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 12:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEQlk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 12:41:40 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B0CC061244
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 09:41:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a22so5019879ljp.13
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G+YVDlcGPLjcsQgnoZNYMsfS4Ruy30bvAFgZIx/FvWg=;
        b=qLCDiNKaM4sMlNoTEw4Gr1Ju0vLLI+5Zgovsm32W0fEvTiQdJXW/6tJXwDpyUSQp5B
         ts0Ff3zHDQxZE2SNO75mNQdtgYTUJwY/XH8rSIaI7DMeLkMKAqs7QtgOG+ILjupKi5rv
         EOiTtcOnvliSnjHtuICFw2Lhb8svh0Cq32Eh6LIIxf7nKsixOMJAFKIBg/FQ884z9aCR
         aa/6A6p8hKqoVOSXxGptIIL1iwDHqHTbXH5uUisN6u0+NO68loDOdTKtsCCYG9/968B/
         SiAIpITUIQ+bA3H8TB/1oKsEVF9/095OunUmXCe/WhzLGlctJduqaezZup9dNJUZpcQX
         zAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G+YVDlcGPLjcsQgnoZNYMsfS4Ruy30bvAFgZIx/FvWg=;
        b=X4BjLbE+i+OAEkh18f9BZQDBmrgDi7n1WZwUpGFso/dKP/ZXacZyWbCinO7+5ukmFF
         QB/Kv2jzG/fArBYWbSCStIidzN6gZleURQIOFvPKS2Rp/Q5kRJb0jLmsstSu7rCYYKsn
         zcw2VyerxVMVvjMocjRIDxDpVB6BpcJIS3ZUoz0RE8sIG1EhQbynxbJF4l2RIL7i8+Jf
         aJ5UGAZPwIzQL75o1lhpI2wDpA8Blh3fwfXCPIlOPnCGfUtOEI6XXbgrZo9NH0OVpcBa
         Ps3dKkBJsO4MvQaFNkzKjuiulSq8OcrKjUfOv/1+gnSkefQAz/WEj5UgSMFmBM0podwo
         17ug==
X-Gm-Message-State: AOAM530yV0Egt8BHl6TBnX9BOWnkqG4cnOIBeRJu1dFge/HEPVuK5pN3
        Liyz/Uc4B+UphV4IQARS1oGry29k69CiC2U5C0/xiuPh2iiACg==
X-Google-Smtp-Source: ABdhPJy8Xe3HF+RjPaRSVKYJ2clWSJ+AYUhO4LFtgJF12RXKHYxIITbyAjNxe95+hHdXU3feolnt71X9fkR2QUKddl8=
X-Received: by 2002:a05:651c:1119:: with SMTP id d25mr5875176ljo.300.1599324095773;
 Sat, 05 Sep 2020 09:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200905143230.195049-1-nchatrad@amd.com> <20200905143230.195049-6-nchatrad@amd.com>
 <1c48945d-09d7-8154-d678-2c6201c928d9@roeck-us.net> <DM6PR12MB4388C77E35BD61F4DC2EAEC9E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4388C77E35BD61F4DC2EAEC9E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Sat, 5 Sep 2020 22:11:24 +0530
Message-ID: <CAHfPSqBSctZtG7KQCRdRmO0HbFXF-UZVZZqcxM_SehrqU2EZ9w@mail.gmail.com>
Subject: Re: FW: [PATCH 5/6] hwmon: amd_energy: dump energy counters via debugfs
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <groeck7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> > Use seq_printf to capture the core and socket energies under debugfs
> > path in '/sys/kernel/debug/amd_energy/'
> > file cenergy_dump: To print out the core energy counters file
> > senergy_dump: To print out the socket energy counters
> >
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>
> Isn't this a duplicate of other functionality available in the kernel ?
> I'd have to look it up, but I am quite sure that energy values are already available. Besides that, what is the point of duplicating the hwmon attributes ?

Idea is to reduce the latency in gathering all the counters (Rome has
128 cores on 2 sockets) from the user space.
If there is a better way to get this done, please let me know. I shall
implement and resubmit.

>
> Guenter
>
> > ---
> >  drivers/hwmon/amd_energy.c | 110
> > +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >
> > diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> > index c294bea56c02..2184bd4510ed 100644
> > --- a/drivers/hwmon/amd_energy.c
> > +++ b/drivers/hwmon/amd_energy.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/bits.h>
> >  #include <linux/cpu.h>
> >  #include <linux/cpumask.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/hwmon.h>
> > @@ -20,6 +21,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>
> > +#include <linux/smp.h>
> >  #include <linux/topology.h>
> >  #include <linux/types.h>
> >
> > @@ -57,6 +59,8 @@ struct amd_energy_data {
> >       int nr_socks;
> >       int core_id;
> >       char (*label)[10];
> > +     u64 *cdump;
> > +     u64 *sdump;
> >  };
> >
> >  static int amd_energy_read_labels(struct device *dev, @@ -329,6
> > +333,108 @@ static int create_accumulate_status_file(struct amd_energy_data *data)
> >                                &accumulate_attr.attr);  }
> >
> > +#ifdef CONFIG_DEBUG_FS
> > +static void dump_on_each_cpu(void *info) {
> > +     struct amd_energy_data *data = info;
> > +     int cpu = smp_processor_id();
> > +
> > +     amd_add_delta(data, cpu, cpu, (long *)&data->cdump[cpu],
> > +                   ENERGY_CORE_MSR);
> > +}
> > +
> > +static int cenergy_dump_show(struct seq_file *s, void *unused) {
> > +     struct amd_energy_data *data = s->private;
> > +     struct cpumask *cpus_mask;
> > +     int i;
> > +
> > +     cpus_mask = kmalloc(sizeof(*cpus_mask), GFP_KERNEL);
> > +     memset(data->cdump, 0, (data->nr_cpus) * sizeof(u64));
> > +     cpumask_clear(cpus_mask);
> > +     for (i = 0; i < data->nr_cpus; i++) {
> > +             if (cpu_online(i))
> > +                     cpumask_set_cpu(i, cpus_mask);
> > +     }
> > +
> > +     on_each_cpu_mask(cpus_mask, dump_on_each_cpu, data, true);
> > +
> > +     for (i = 0; i < data->nr_cpus; i++) {
> > +             if (!(i & 3))
> > +                     seq_printf(s, "Core %3d: ", i);
> > +
> > +             seq_printf(s, "%16llu ", data->cdump[i]);
> > +             if ((i & 3) == 3)
> > +                     seq_puts(s, "\n");
> > +     }
> > +     seq_puts(s, "\n");
> > +
> > +     kfree(cpus_mask);
> > +     return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(cenergy_dump);
> > +
> > +static int senergy_dump_show(struct seq_file *s, void *unused) {
> > +     struct amd_energy_data *data = s->private;
> > +     int i, cpu;
> > +
> > +     for (i = 0; i < data->nr_socks; i++) {
> > +             cpu = cpumask_first_and(cpu_online_mask,
> > +                                     cpumask_of_node(i));
> > +             amd_add_delta(data, data->nr_cpus + i, cpu,
> > +                           (long *)&data->sdump[i], ENERGY_PKG_MSR);
> > +             seq_printf(s, "Socket %1d: %16llu\n",
> > +                        i, data->sdump[i]);
> > +     }
> > +
> > +     return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(senergy_dump);
> > +
> > +static void dump_debugfs_cleanup(void *ddir) {
> > +     debugfs_remove_recursive(ddir);
> > +}
> > +
> > +static int create_dump_file(struct device *dev,
> > +                         struct amd_energy_data *data) {
> > +     struct dentry *debugfs;
> > +     char name[] = "amd_energy";
> > +
> > +     data->cdump = devm_kcalloc(dev, data->nr_cpus,
> > +                                sizeof(u64), GFP_KERNEL);
> > +     if (!data->cdump)
> > +             return -ENOMEM;
> > +
> > +     data->sdump = devm_kcalloc(dev, data->nr_socks,
> > +                                sizeof(u64), GFP_KERNEL);
> > +     if (!data->sdump)
> > +             return -ENOMEM;
> > +
> > +     debugfs = debugfs_create_dir(name, NULL);
> > +     if (debugfs) {
> > +             debugfs_create_file("cenergy_dump", 0440,
> > +                                 debugfs, data, &cenergy_dump_fops);
> > +             debugfs_create_file("senergy_dump", 0440,
> > +                                 debugfs, data, &senergy_dump_fops);
> > +             devm_add_action_or_reset(data->hwmon_dev,
> > +                                      dump_debugfs_cleanup, debugfs);
> > +     }
> > +
> > +     return 0;
> > +}
> > +#else
> > +
> > +static int create_dump_file(struct device *dev,
> > +                         struct amd_energy_data *data) {
> > +     return 0;
> > +}
> > +
> > +#endif //CONFIG_DEBUG_FS
> > +
> >  static int amd_energy_probe(struct platform_device *pdev)  {
> >       struct amd_energy_data *data;
> > @@ -376,6 +482,10 @@ static int amd_energy_probe(struct platform_device *pdev)
> >       if (ret)
> >               return ret;
> >
> > +     ret = create_dump_file(dev, data);
> > +     if (ret)
> > +             return ret;
> > +
> >       return 0;
> >  }
> >
> >
Naveen
