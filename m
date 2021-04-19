Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E92C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 17:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F0946108B
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 17:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239994AbhDSRlu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Apr 2021 13:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbhDSRlt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 13:41:49 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB187C06174A
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 10:41:19 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso19278764otm.4
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wXD0D3hfe2BAd7NtmDeAV4TPFzs25BX94Mi+65Az++E=;
        b=BXjaU8x8bMHbUqNgEijy7qxhXPqBUy+Ei/ftmzhzEddgPhWCp8CdU+RkNvX5c6SNil
         d4JzT+Hss1kkeqRrawcWccKjA+hIYQT7oSwzrbfzvjzT27Bhn681VBSTyZJ26VF13hJK
         dIAe8aij+Eyt8miFLJuGQ/AISwWcZn5xfpRbOyHqtzoimEm15AxG5d3OypGqguk6M3GO
         /wG5LOcWfIPQ5Kyl2yPXdnKVL0YrdXHVTRZgr720vQ+bsrxnn1Tk5ukUuXnWWY22Wnov
         T7J2WI9niUEruI8B/Itqq92nSB7Ve1rBNyF9VYym0wB9pzCmJJfEcb39pEL5DLIo3u55
         8iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=wXD0D3hfe2BAd7NtmDeAV4TPFzs25BX94Mi+65Az++E=;
        b=ProDfc4qyggv7v3ROEVi8Q3qdICoMciIfC2/Z9ULTMX+SvhlfohLm1Cw2T6b290DAa
         dPszFQ772JwFnu2j+Vykdb7iKC7gdDLHsti1xKCLFYdOidcE7ifnRhg/qgweeiihd3AE
         rlT92zX6PTB7JXar6tFOkwixZdvG15KPAbk/Wcx8DBKVdc0QtMNI76tjYGnD18WmTwAf
         3L4L2JDGawwyDiPI3eIYOXsmpKcjOR9pGX2QEXZt182GQBuR3LCxkzm73kUQgdu7h5R0
         wIBfVYwhdys6sX4TkHWEGwjK5nUFwL329WXLMCG9rfBFnGvamaU99Qemk/qsJwPpbfIK
         SjlQ==
X-Gm-Message-State: AOAM530jFI2ZO/bFWltGyioTJXlXxeCegVIkmGdiKD6CeUB2mglMCoar
        htRRlzHVEBXVCVuYTu2hXno=
X-Google-Smtp-Source: ABdhPJxnuoGLq30nPnf46V01Fc61QDoAQ/mEKgsbfCCIoc3CT52n4eEvSgyfH/nVwP5ymEsocEHt1Q==
X-Received: by 2002:a9d:6ad0:: with SMTP id m16mr15542501otq.259.1618854079132;
        Mon, 19 Apr 2021 10:41:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b12sm3606314oti.17.2021.04.19.10.41.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:41:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 19 Apr 2021 10:41:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] hwmon: (amd_energy) Restore visibility of energy
 counters
Message-ID: <20210419174116.GA209514@roeck-us.net>
References: <20210409174852.4585-1-linux@roeck-us.net>
 <20210409174852.4585-2-linux@roeck-us.net>
 <20210412142744.54c55d06@endymion>
 <797392a6-2d45-2755-7de6-b58ed26c5a50@roeck-us.net>
 <DM6PR12MB43888DFB5A7FD52DE4D4433DE8499@DM6PR12MB4388.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR12MB43888DFB5A7FD52DE4D4433DE8499@DM6PR12MB4388.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 19, 2021 at 04:29:59PM +0000, Chatradhi, Naveen Krishna wrote:
> [AMD Official Use Only - Internal Distribution Only]
> 
> Hi Guenter,
> 
> >>      accum->prev_value = input;
> >> +    accum->cache_timeout = jiffies + HZ + get_random_int() % HZ;
> 
> I've noticed this change is reviewed and accepted, please note “AMD guidance remains to restrict the RAPL MSR access to privilege users for the CVE-2020-12912. See 2020 tab in https://www.amd.com/en/corporate/product-security#paragraph-313561”
> 

This has been on the list for a while, so your feedback is a tiny
bit late.

Please feel free to send a NACK to the patch. If my suggested solution
is not acceptable, I'll remove the driver entirely and add a note
to the sysfs ABI stating that attributes MUST be world readable
for a driver to be acceptable. After all, this patch forces users
of the hwmon ABI to run previously restricted applications as
super-user (or to revert the patch introducing the restrictions
in their private builds), which completely defeats the purpose
of the patch and opens up additional unnecessary attack surface. 

Thanks,
Guenter

> Regards,
> Naveenk
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, April 12, 2021 7:56 PM
> To: Jean Delvare <jdelvare@suse.de>
> Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>; Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Subject: Re: [PATCH v2 2/2] hwmon: (amd_energy) Restore visibility of energy counters
> 
> [CAUTION: External Email]
> 
> On 4/12/21 5:27 AM, Jean Delvare wrote:
> > On Fri,  9 Apr 2021 10:48:52 -0700, Guenter Roeck wrote:
> >> Commit 60268b0e8258 ("hwmon: (amd_energy) modify the visibility of 
> >> the counters") restricted visibility of AMD energy counters to work 
> >> around a side-channel attack using energy data to determine which 
> >> instructions are executed. The attack is described in 'PLATYPUS:
> >> Software-based Power Side-Channel Attacks on x86'. It relies on quick 
> >> and accurate energy readings.
> >>
> >> Limiting energy readings to privileged users is annoying. A much 
> >> better solution is to make energy readings unusable for attacks by 
> >> randomizing the time between updates. We can do that by caching 
> >> energy values for a short and randomized period of time.
> >>
> >> Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
> >> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> ---
> >> v2: Simplified code by using unified function to accumulate energy 
> >> data
> >>
> >>  drivers/hwmon/amd_energy.c | 29 +++++++++++++++++++++--------
> >>  1 file changed, 21 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c 
> >> index 93bad64039f1..1bf0afc2740c 100644
> >> --- a/drivers/hwmon/amd_energy.c
> >> +++ b/drivers/hwmon/amd_energy.c
> >> @@ -18,6 +18,7 @@
> >>  #include <linux/mutex.h>
> >>  #include <linux/processor.h>
> >>  #include <linux/platform_device.h>
> >> +#include <linux/random.h>
> >>  #include <linux/sched.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/topology.h>
> >> @@ -35,6 +36,7 @@
> >>  struct sensor_accumulator {
> >>      u64 energy_ctr;
> >>      u64 prev_value;
> >> +    unsigned long cache_timeout;
> >>  };
> >>
> >>  struct amd_energy_data {
> >> @@ -74,17 +76,14 @@ static void get_energy_units(struct amd_energy_data *data)
> >>      data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;  
> >> }
> >>
> >
> > Add a comment stating that this function must be called with accum's 
> > &data->lock held?
> >
> >> -static void accumulate_delta(struct amd_energy_data *data,
> >> -                         int channel, int cpu, u32 reg)
> >> +static void __accumulate_delta(struct sensor_accumulator *accum,
> >> +                           int cpu, u32 reg)
> >>  {
> >> -    struct sensor_accumulator *accum;
> >>      u64 input;
> >>
> >> -    mutex_lock(&data->lock);
> >>      rdmsrl_safe_on_cpu(cpu, reg, &input);
> >>      input &= AMD_ENERGY_MASK;
> >>
> >> -    accum = &data->accums[channel];
> >>      if (input >= accum->prev_value)
> >>              accum->energy_ctr +=
> >>                      input - accum->prev_value; @@ -93,6 +92,14 @@ 
> >> static void accumulate_delta(struct amd_energy_data *data,
> >>                      accum->prev_value + input;
> >>
> >>      accum->prev_value = input;
> >> +    accum->cache_timeout = jiffies + HZ + get_random_int() % HZ;
> >
> > Needs #include <linux/jiffies.h> maybe?
> >
> >> +}
> >> +
> >> +static void accumulate_delta(struct amd_energy_data *data,
> >> +                         int channel, int cpu, u32 reg) {
> >> +    mutex_lock(&data->lock);
> >> +    __accumulate_delta(&data->accums[channel], cpu, reg);
> >>      mutex_unlock(&data->lock);
> >>  }
> >>
> >> @@ -124,6 +131,7 @@ static int amd_energy_read(struct device *dev,  {
> >>      struct amd_energy_data *data = dev_get_drvdata(dev);
> >>      struct sensor_accumulator *accum;
> >> +    u64 energy;
> >>      u32 reg;
> >>      int cpu;
> >>
> >> @@ -140,10 +148,15 @@ static int amd_energy_read(struct device *dev,
> >>              reg = ENERGY_CORE_MSR;
> >>      }
> >>
> >> -    accumulate_delta(data, channel, cpu, reg);
> >>      accum = &data->accums[channel];
> >>
> >> -    *val = div64_ul(accum->energy_ctr * 1000000UL, BIT(data->energy_units));
> >> +    mutex_lock(&data->lock);
> >> +    if (!accum->energy_ctr || time_after(jiffies, accum->cache_timeout))
> >> +            __accumulate_delta(accum, cpu, reg);
> >> +    energy = accum->energy_ctr;
> >> +    mutex_unlock(&data->lock);
> >> +
> >> +    *val = div64_ul(energy * 1000000UL, BIT(data->energy_units));
> >>
> >>      return 0;
> >>  }
> >> @@ -152,7 +165,7 @@ static umode_t amd_energy_is_visible(const void *_data,
> >>                                   enum hwmon_sensor_types type,
> >>                                   u32 attr, int channel)  {
> >> -    return 0440;
> >> +    return 0444;
> >>  }
> >>
> >>  static int energy_accumulator(void *p)
> >
> > Very nice. This will make the driver useful again :-)
> >
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> >
> I made the suggested changes.
> 
> Thanks a lot for the review!
> 
> Guenter
