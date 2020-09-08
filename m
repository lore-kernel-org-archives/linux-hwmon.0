Return-Path: <SRS0=0Rzu=CR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927DEC43461
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 18:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 519622078E
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 18:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3BGgRPi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731572AbgIHSUE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Sep 2020 14:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731445AbgIHQLG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Sep 2020 12:11:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621CCC061573
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2020 09:10:55 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k25so8199448ljk.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2020 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0S4SexD3r3Jt2SPOLCcshJZHSCgtoXuOa1zxY4uX0Q0=;
        b=P3BGgRPiTa0Aw9cB3Llep6C9WTcFOD60TXQB35c52e/eeCXYGreAuqo1pXIn7+F5P1
         vcD/DQL5Acty3flbxgs0QD3Xj0gKJpJNJWshJS91RGhwXu/EqNn1ZkWQqSV+7s10/ACc
         bevuvWeD1pTsRuBi6n9g2frDwGjQlOcqq2sTBUHRpr2X/CHm5YYMGLXXsm0fYOp3M8eR
         2lzth+ljCtMXVZxGSQnkMQCQa41FNACpWkFe150Jm0CpGpiGk20p0uUxOs+MZKWf+gRo
         9qWhqRywF2XA2cE2G/Pk12o+vb9spVb7dU1mKMhx8cAesZBBBOHOofahxbB2ZLCp7YN5
         tFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0S4SexD3r3Jt2SPOLCcshJZHSCgtoXuOa1zxY4uX0Q0=;
        b=MNs39IiSNkEcedDgZ7nx42OCZZt0U4si9OGzcWsP2QC1/Q4jDw78lEblW7Mb1XsVI9
         +KgF/blMMNv6biXis9KgpxKls7wt8jYiIFK8REcs+tomiw7FNHn/95Qcu5727DuNNlq7
         mTd0fnsNXvvEqnnEnizMjy/tyG1SucjvCStxCmSylJSEENK3QvrCnUAn64DfxGVsFd7i
         0zADGWZuqzFujXI2wbCYbXpjiEyh5sFbFsRLeDqu3qJhOlQE0cbQ8TE0eALiFc+P68pj
         2WCQsEL41wvijx6YhDXINrudIQvHm7G1nulc8qvt/CW9X6dM7A9a1B7ccL/b2DthQyGa
         eV/A==
X-Gm-Message-State: AOAM531B82P13wYoIoQXgpGJzu5Hs7Leum2fYfbXU5GDDrwTweEfEDc5
        TwbR9Vnq3FQx1kPuNPhvmbhw2gi4j/ED/Hl6bW8=
X-Google-Smtp-Source: ABdhPJzgv4xgaXFfjr97hOaHCKEl5rTcuncT661JnBzgJmtkKbwc0uf/eAkAWrlwrzMEk2957rpg+krF5EUworXOmHM=
X-Received: by 2002:a2e:3013:: with SMTP id w19mr5114933ljw.339.1599581452687;
 Tue, 08 Sep 2020 09:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200905143230.195049-1-nchatrad@amd.com> <20200905143230.195049-6-nchatrad@amd.com>
 <1c48945d-09d7-8154-d678-2c6201c928d9@roeck-us.net> <DM6PR12MB4388C77E35BD61F4DC2EAEC9E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAHfPSqBSctZtG7KQCRdRmO0HbFXF-UZVZZqcxM_SehrqU2EZ9w@mail.gmail.com> <fed67fcd-f148-e84d-eb73-a265e179941d@roeck-us.net>
In-Reply-To: <fed67fcd-f148-e84d-eb73-a265e179941d@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Tue, 8 Sep 2020 21:40:40 +0530
Message-ID: <CAHfPSqCkEetYEo2yqZC_0JpGYUYgpqh34-B6sdCWde57_1PhbA@mail.gmail.com>
Subject: Re: FW: [PATCH 5/6] hwmon: amd_energy: dump energy counters via debugfs
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Sat, 5 Sep 2020 at 22:28, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/5/20 9:41 AM, Naveen Krishna Ch wrote:
> > Hi Guenter,
> >
> >> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> >>> Use seq_printf to capture the core and socket energies under debugfs
> >>> path in '/sys/kernel/debug/amd_energy/'
> >>> file cenergy_dump: To print out the core energy counters file
> >>> senergy_dump: To print out the socket energy counters
> >>>
> >>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> >>
> >> Isn't this a duplicate of other functionality available in the kernel ?
> >> I'd have to look it up, but I am quite sure that energy values are already available. Besides that, what is the point of duplicating the hwmon attributes ?
> >
> > Idea is to reduce the latency in gathering all the counters (Rome has
> > 128 cores on 2 sockets) from the user space.
> > If there is a better way to get this done, please let me know. I shall
> > implement and resubmit.
> >
>
> Isn't turbostat supposed to be able to do that ?
Apologies, I was not aware of turbostat, took a look at the turbostat
code now, this is an elaborate tool which is dependent on msr.ko. At
present, this tool provides a lot of information in sequence. There is
no duplication of the code.

We need this functionality for the following reasons.
1. Reduced latency in gathering the energy counters of all cores and packages
2. Possible to provide an API to the user space to integrate into
other tools/frameworks

Please let me know your opinion.
>
> Guenter
>
> >>
> >> Guenter
> >>
> >>> ---
> >>>  drivers/hwmon/amd_energy.c | 110
> >>> +++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 110 insertions(+)
> >>>
> >>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> >>> index c294bea56c02..2184bd4510ed 100644
> >>> --- a/drivers/hwmon/amd_energy.c
> >>> +++ b/drivers/hwmon/amd_energy.c
> >>> @@ -8,6 +8,7 @@
> >>>  #include <linux/bits.h>
> >>>  #include <linux/cpu.h>
> >>>  #include <linux/cpumask.h>
> >>> +#include <linux/debugfs.h>
> >>>  #include <linux/delay.h>
> >>>  #include <linux/device.h>
> >>>  #include <linux/hwmon.h>
> >>> @@ -20,6 +21,7 @@
> >>>  #include <linux/platform_device.h>
> >>>  #include <linux/sched.h>
> >>>  #include <linux/slab.h>
> >>> +#include <linux/smp.h>
> >>>  #include <linux/topology.h>
> >>>  #include <linux/types.h>
> >>>
> >>> @@ -57,6 +59,8 @@ struct amd_energy_data {
> >>>       int nr_socks;
> >>>       int core_id;
> >>>       char (*label)[10];
> >>> +     u64 *cdump;
> >>> +     u64 *sdump;
> >>>  };
> >>>
> >>>  static int amd_energy_read_labels(struct device *dev, @@ -329,6
> >>> +333,108 @@ static int create_accumulate_status_file(struct amd_energy_data *data)
> >>>                                &accumulate_attr.attr);  }
> >>>
> >>> +#ifdef CONFIG_DEBUG_FS
> >>> +static void dump_on_each_cpu(void *info) {
> >>> +     struct amd_energy_data *data = info;
> >>> +     int cpu = smp_processor_id();
> >>> +
> >>> +     amd_add_delta(data, cpu, cpu, (long *)&data->cdump[cpu],
> >>> +                   ENERGY_CORE_MSR);
> >>> +}
> >>> +
> >>> +static int cenergy_dump_show(struct seq_file *s, void *unused) {
> >>> +     struct amd_energy_data *data = s->private;
> >>> +     struct cpumask *cpus_mask;
> >>> +     int i;
> >>> +
> >>> +     cpus_mask = kmalloc(sizeof(*cpus_mask), GFP_KERNEL);
> >>> +     memset(data->cdump, 0, (data->nr_cpus) * sizeof(u64));
> >>> +     cpumask_clear(cpus_mask);
> >>> +     for (i = 0; i < data->nr_cpus; i++) {
> >>> +             if (cpu_online(i))
> >>> +                     cpumask_set_cpu(i, cpus_mask);
> >>> +     }
> >>> +
> >>> +     on_each_cpu_mask(cpus_mask, dump_on_each_cpu, data, true);
> >>> +
> >>> +     for (i = 0; i < data->nr_cpus; i++) {
> >>> +             if (!(i & 3))
> >>> +                     seq_printf(s, "Core %3d: ", i);
> >>> +
> >>> +             seq_printf(s, "%16llu ", data->cdump[i]);
> >>> +             if ((i & 3) == 3)
> >>> +                     seq_puts(s, "\n");
> >>> +     }
> >>> +     seq_puts(s, "\n");
> >>> +
> >>> +     kfree(cpus_mask);
> >>> +     return 0;
> >>> +}
> >>> +DEFINE_SHOW_ATTRIBUTE(cenergy_dump);
> >>> +
> >>> +static int senergy_dump_show(struct seq_file *s, void *unused) {
> >>> +     struct amd_energy_data *data = s->private;
> >>> +     int i, cpu;
> >>> +
> >>> +     for (i = 0; i < data->nr_socks; i++) {
> >>> +             cpu = cpumask_first_and(cpu_online_mask,
> >>> +                                     cpumask_of_node(i));
> >>> +             amd_add_delta(data, data->nr_cpus + i, cpu,
> >>> +                           (long *)&data->sdump[i], ENERGY_PKG_MSR);
> >>> +             seq_printf(s, "Socket %1d: %16llu\n",
> >>> +                        i, data->sdump[i]);
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +DEFINE_SHOW_ATTRIBUTE(senergy_dump);
> >>> +
> >>> +static void dump_debugfs_cleanup(void *ddir) {
> >>> +     debugfs_remove_recursive(ddir);
> >>> +}
> >>> +
> >>> +static int create_dump_file(struct device *dev,
> >>> +                         struct amd_energy_data *data) {
> >>> +     struct dentry *debugfs;
> >>> +     char name[] = "amd_energy";
> >>> +
> >>> +     data->cdump = devm_kcalloc(dev, data->nr_cpus,
> >>> +                                sizeof(u64), GFP_KERNEL);
> >>> +     if (!data->cdump)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     data->sdump = devm_kcalloc(dev, data->nr_socks,
> >>> +                                sizeof(u64), GFP_KERNEL);
> >>> +     if (!data->sdump)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     debugfs = debugfs_create_dir(name, NULL);
> >>> +     if (debugfs) {
> >>> +             debugfs_create_file("cenergy_dump", 0440,
> >>> +                                 debugfs, data, &cenergy_dump_fops);
> >>> +             debugfs_create_file("senergy_dump", 0440,
> >>> +                                 debugfs, data, &senergy_dump_fops);
> >>> +             devm_add_action_or_reset(data->hwmon_dev,
> >>> +                                      dump_debugfs_cleanup, debugfs);
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +#else
> >>> +
> >>> +static int create_dump_file(struct device *dev,
> >>> +                         struct amd_energy_data *data) {
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +#endif //CONFIG_DEBUG_FS
> >>> +
> >>>  static int amd_energy_probe(struct platform_device *pdev)  {
> >>>       struct amd_energy_data *data;
> >>> @@ -376,6 +482,10 @@ static int amd_energy_probe(struct platform_device *pdev)
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> +     ret = create_dump_file(dev, data);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>>       return 0;
> >>>  }
> >>>
> >>>
> > Naveen
> >
>


-- 
Shine bright,
(: Nav :)
