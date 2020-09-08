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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7021C43461
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 16:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80D2320708
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 16:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmjAHz3n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgIHQqh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Sep 2020 12:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731680AbgIHQq1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Sep 2020 12:46:27 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFD6C061573
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2020 09:46:27 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y2so9535851lfy.10
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2020 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cFA6EOlIA6O+92qMXbWMMD7JUvgnQCOwEFi6Xs/OOzg=;
        b=RmjAHz3nFSya8jG/fUSmJKEos78b9njeq7PF45bpa/QfplQhWmqoFpLiBBdS7JRAWQ
         nx9Lieek+Ts13QIsMdCZE2BSVHZgj82LNXe4+k4fRmiw8sxa7lUj8pUDJqFM0WgmZKha
         ycifV9liIjFncttAPHlqEm7GmL/QYwVzxzDjEtxDe2Q6nCvrvdoPsZu3J1aQXtlvzd9E
         +7D1yyW0TMM64T6GuHkD2jdkGwTMvo762IL88+Fo7ujN/32uQL/+I1blWokqija90F8r
         eXE6taZyLwu/dJEL2RPG6jIuuBxc+HCcHMImwkS8DfTLqYT7198odpmunkoKKJ+iFcYy
         8J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFA6EOlIA6O+92qMXbWMMD7JUvgnQCOwEFi6Xs/OOzg=;
        b=EyaVDRoYShane7r/nsYUjmIq/YCvukXHQW1EoXfowOOCAsfOhyIUcE6I/hnma2Ddc4
         QHTtLxi7tX6KfW8wzzexW/sZ3SgYta2Fb/VxvTfVZGJlb9L+NujGY8iNLKIuc93lkbKd
         fsfJbY+UlbGP0PzN9tJ5j9RlCcW443HbEkObRn6o3cRILI4RMnYAO80yS5h75uyouaWT
         Jyglrd0mimpUDyovPZy7dNSDttoqlaBlPC5SqlaZY+0MpRuvMTSzb9QOSWTiTD8irnEA
         Yy9ScOm9cRYEtaDAb0/pXLIHxtJXhvdfV8EsdFpCo8Bqq+oZx5OfLmu7ifUUFKie93/6
         jvgA==
X-Gm-Message-State: AOAM5323bjX2z6n9QlKvU+Xrdq5YeHjnz7aM+Yy/i2MsZdEBDO/wD9ih
        oE92Efo4oY4up+lXAFsnFpYV9s5uUxi4Z69L8Sk=
X-Google-Smtp-Source: ABdhPJy6zQhockpmrfjAS40jetg3Z68nJHXw9ahDN+P+FKUyifQRVMCarjlkX5MxyCmNsw928cFowSMnufsPmL+CBZg=
X-Received: by 2002:a05:6512:419:: with SMTP id u25mr4350066lfk.81.1599583583835;
 Tue, 08 Sep 2020 09:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200905143230.195049-1-nchatrad@amd.com> <20200905143230.195049-6-nchatrad@amd.com>
 <1c48945d-09d7-8154-d678-2c6201c928d9@roeck-us.net> <DM6PR12MB4388C77E35BD61F4DC2EAEC9E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAHfPSqBSctZtG7KQCRdRmO0HbFXF-UZVZZqcxM_SehrqU2EZ9w@mail.gmail.com>
 <fed67fcd-f148-e84d-eb73-a265e179941d@roeck-us.net> <CAHfPSqCkEetYEo2yqZC_0JpGYUYgpqh34-B6sdCWde57_1PhbA@mail.gmail.com>
 <20200908163432.GA169609@roeck-us.net>
In-Reply-To: <20200908163432.GA169609@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Tue, 8 Sep 2020 22:16:12 +0530
Message-ID: <CAHfPSqB-AszjJ_N-A7MYK1wni1ADD5p9YVHDMYsBT1xacS2H=g@mail.gmail.com>
Subject: Re: FW: [PATCH 5/6] hwmon: amd_energy: dump energy counters via debugfs
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Tue, 8 Sep 2020 at 22:04, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Sep 08, 2020 at 09:40:40PM +0530, Naveen Krishna Ch wrote:
> > Hi Guenter
> >
> > On Sat, 5 Sep 2020 at 22:28, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 9/5/20 9:41 AM, Naveen Krishna Ch wrote:
> > > > Hi Guenter,
> > > >
> > > >> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> > > >>> Use seq_printf to capture the core and socket energies under debugfs
> > > >>> path in '/sys/kernel/debug/amd_energy/'
> > > >>> file cenergy_dump: To print out the core energy counters file
> > > >>> senergy_dump: To print out the socket energy counters
> > > >>>
> > > >>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > > >>
> > > >> Isn't this a duplicate of other functionality available in the kernel ?
> > > >> I'd have to look it up, but I am quite sure that energy values are already available. Besides that, what is the point of duplicating the hwmon attributes ?
> > > >
> > > > Idea is to reduce the latency in gathering all the counters (Rome has
> > > > 128 cores on 2 sockets) from the user space.
> > > > If there is a better way to get this done, please let me know. I shall
> > > > implement and resubmit.
> > > >
> > >
> > > Isn't turbostat supposed to be able to do that ?
> > Apologies, I was not aware of turbostat, took a look at the turbostat
> > code now, this is an elaborate tool which is dependent on msr.ko. At
> > present, this tool provides a lot of information in sequence. There is
> > no duplication of the code.
> >
> > We need this functionality for the following reasons.
> > 1. Reduced latency in gathering the energy counters of all cores and packages
> > 2. Possible to provide an API to the user space to integrate into
> > other tools/frameworks
> >
> > Please let me know your opinion.
>
> debugfs should only used for debugging and not to create a backdoor API.
> What you are looking for is a more efficient API than the hwmon API
Yes and when i looked around i found this debugfs implementation in
k10temp driver, providing the svi and thm information. So, I have
implemented accordingly.  Should have discussed this earlier.

> to access sensor data. There is an available API to do that: iio.
> You have two options: Register the driver with iio directly, or better
> implement a generic hwmon->iio bridge in the hwmon core. I have wanted
> to do the latter forever, but never got around to impementing it.
I've had some experience with iio drivers in the past, i will look
into this. In the meanwhile, can we keep this implementation here ?


>
> Guenter
>
> > >
> > > Guenter
> > >
> > > >>
> > > >> Guenter
> > > >>
> > > >>> ---
> > > >>>  drivers/hwmon/amd_energy.c | 110
> > > >>> +++++++++++++++++++++++++++++++++++++
> > > >>>  1 file changed, 110 insertions(+)
> > > >>>
> > > >>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> > > >>> index c294bea56c02..2184bd4510ed 100644
> > > >>> --- a/drivers/hwmon/amd_energy.c
> > > >>> +++ b/drivers/hwmon/amd_energy.c
> > > >>> @@ -8,6 +8,7 @@
> > > >>>  #include <linux/bits.h>
> > > >>>  #include <linux/cpu.h>
> > > >>>  #include <linux/cpumask.h>
> > > >>> +#include <linux/debugfs.h>
> > > >>>  #include <linux/delay.h>
> > > >>>  #include <linux/device.h>
> > > >>>  #include <linux/hwmon.h>
> > > >>> @@ -20,6 +21,7 @@
> > > >>>  #include <linux/platform_device.h>
> > > >>>  #include <linux/sched.h>
> > > >>>  #include <linux/slab.h>
> > > >>> +#include <linux/smp.h>
> > > >>>  #include <linux/topology.h>
> > > >>>  #include <linux/types.h>
> > > >>>
> > > >>> @@ -57,6 +59,8 @@ struct amd_energy_data {
> > > >>>       int nr_socks;
> > > >>>       int core_id;
> > > >>>       char (*label)[10];
> > > >>> +     u64 *cdump;
> > > >>> +     u64 *sdump;
> > > >>>  };
> > > >>>
> > > >>>  static int amd_energy_read_labels(struct device *dev, @@ -329,6
> > > >>> +333,108 @@ static int create_accumulate_status_file(struct amd_energy_data *data)
> > > >>>                                &accumulate_attr.attr);  }
> > > >>>
> > > >>> +#ifdef CONFIG_DEBUG_FS
> > > >>> +static void dump_on_each_cpu(void *info) {
> > > >>> +     struct amd_energy_data *data = info;
> > > >>> +     int cpu = smp_processor_id();
> > > >>> +
> > > >>> +     amd_add_delta(data, cpu, cpu, (long *)&data->cdump[cpu],
> > > >>> +                   ENERGY_CORE_MSR);
> > > >>> +}
> > > >>> +
> > > >>> +static int cenergy_dump_show(struct seq_file *s, void *unused) {
> > > >>> +     struct amd_energy_data *data = s->private;
> > > >>> +     struct cpumask *cpus_mask;
> > > >>> +     int i;
> > > >>> +
> > > >>> +     cpus_mask = kmalloc(sizeof(*cpus_mask), GFP_KERNEL);
> > > >>> +     memset(data->cdump, 0, (data->nr_cpus) * sizeof(u64));
> > > >>> +     cpumask_clear(cpus_mask);
> > > >>> +     for (i = 0; i < data->nr_cpus; i++) {
> > > >>> +             if (cpu_online(i))
> > > >>> +                     cpumask_set_cpu(i, cpus_mask);
> > > >>> +     }
> > > >>> +
> > > >>> +     on_each_cpu_mask(cpus_mask, dump_on_each_cpu, data, true);
> > > >>> +
> > > >>> +     for (i = 0; i < data->nr_cpus; i++) {
> > > >>> +             if (!(i & 3))
> > > >>> +                     seq_printf(s, "Core %3d: ", i);
> > > >>> +
> > > >>> +             seq_printf(s, "%16llu ", data->cdump[i]);
> > > >>> +             if ((i & 3) == 3)
> > > >>> +                     seq_puts(s, "\n");
> > > >>> +     }
> > > >>> +     seq_puts(s, "\n");
> > > >>> +
> > > >>> +     kfree(cpus_mask);
> > > >>> +     return 0;
> > > >>> +}
> > > >>> +DEFINE_SHOW_ATTRIBUTE(cenergy_dump);
> > > >>> +
> > > >>> +static int senergy_dump_show(struct seq_file *s, void *unused) {
> > > >>> +     struct amd_energy_data *data = s->private;
> > > >>> +     int i, cpu;
> > > >>> +
> > > >>> +     for (i = 0; i < data->nr_socks; i++) {
> > > >>> +             cpu = cpumask_first_and(cpu_online_mask,
> > > >>> +                                     cpumask_of_node(i));
> > > >>> +             amd_add_delta(data, data->nr_cpus + i, cpu,
> > > >>> +                           (long *)&data->sdump[i], ENERGY_PKG_MSR);
> > > >>> +             seq_printf(s, "Socket %1d: %16llu\n",
> > > >>> +                        i, data->sdump[i]);
> > > >>> +     }
> > > >>> +
> > > >>> +     return 0;
> > > >>> +}
> > > >>> +DEFINE_SHOW_ATTRIBUTE(senergy_dump);
> > > >>> +
> > > >>> +static void dump_debugfs_cleanup(void *ddir) {
> > > >>> +     debugfs_remove_recursive(ddir);
> > > >>> +}
> > > >>> +
> > > >>> +static int create_dump_file(struct device *dev,
> > > >>> +                         struct amd_energy_data *data) {
> > > >>> +     struct dentry *debugfs;
> > > >>> +     char name[] = "amd_energy";
> > > >>> +
> > > >>> +     data->cdump = devm_kcalloc(dev, data->nr_cpus,
> > > >>> +                                sizeof(u64), GFP_KERNEL);
> > > >>> +     if (!data->cdump)
> > > >>> +             return -ENOMEM;
> > > >>> +
> > > >>> +     data->sdump = devm_kcalloc(dev, data->nr_socks,
> > > >>> +                                sizeof(u64), GFP_KERNEL);
> > > >>> +     if (!data->sdump)
> > > >>> +             return -ENOMEM;
> > > >>> +
> > > >>> +     debugfs = debugfs_create_dir(name, NULL);
> > > >>> +     if (debugfs) {
> > > >>> +             debugfs_create_file("cenergy_dump", 0440,
> > > >>> +                                 debugfs, data, &cenergy_dump_fops);
> > > >>> +             debugfs_create_file("senergy_dump", 0440,
> > > >>> +                                 debugfs, data, &senergy_dump_fops);
> > > >>> +             devm_add_action_or_reset(data->hwmon_dev,
> > > >>> +                                      dump_debugfs_cleanup, debugfs);
> > > >>> +     }
> > > >>> +
> > > >>> +     return 0;
> > > >>> +}
> > > >>> +#else
> > > >>> +
> > > >>> +static int create_dump_file(struct device *dev,
> > > >>> +                         struct amd_energy_data *data) {
> > > >>> +     return 0;
> > > >>> +}
> > > >>> +
> > > >>> +#endif //CONFIG_DEBUG_FS
> > > >>> +
> > > >>>  static int amd_energy_probe(struct platform_device *pdev)  {
> > > >>>       struct amd_energy_data *data;
> > > >>> @@ -376,6 +482,10 @@ static int amd_energy_probe(struct platform_device *pdev)
> > > >>>       if (ret)
> > > >>>               return ret;
> > > >>>
> > > >>> +     ret = create_dump_file(dev, data);
> > > >>> +     if (ret)
> > > >>> +             return ret;
> > > >>> +
> > > >>>       return 0;
> > > >>>  }
> > > >>>
> > > >>>
> > > > Naveen
> > > >
> > >
> >
> >
> > --
> > Shine bright,
> > (: Nav :)



--
Shine bright,
(: Nav :)
