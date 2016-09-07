Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ua0-f172.google.com ([209.85.217.172]:34997 "EHLO
        mail-ua0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754975AbcIGVG1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2016 17:06:27 -0400
Received: by mail-ua0-f172.google.com with SMTP id 71so23840547uag.2
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Sep 2016 14:06:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160907192402.GA26672@roeck-us.net>
References: <1473220019-2519-1-git-send-email-hotran@apm.com>
 <b93b5e63-aae2-a90a-0e23-0b9b1d94f9a6@roeck-us.net> <CAFHUOYxaHz8o+8wMxbZHnfRyoWzGk7zhHbWSSbYn4oir_B5tkA@mail.gmail.com>
 <efd8b7d7-cc8d-11e0-4c56-428423bd7aff@roeck-us.net> <CAFHUOYzFDXwPdS3OHz=t-iZ6L8uNq1goFafJhDnpU0bAtsEWLw@mail.gmail.com>
 <dde4b95d-a587-1b66-4294-748e4ee9ae3c@roeck-us.net> <CAFHUOYwYLMJtY7HUPGpSABP0BDwpDRvRQ5JTBrhe-FWiJvG=jA@mail.gmail.com>
 <20160907192402.GA26672@roeck-us.net>
From: Hoan Tran <hotran@apm.com>
Date: Wed, 7 Sep 2016 14:06:26 -0700
Message-ID: <CAFHUOYyPRu5W82xsd1pDCBHziNOc91TCAvgGm=3jw29dkencSA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: xgene: Fix crash when alarm occurs before driver probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        Itaru Kitayama <itaru.kitayama@riken.jp>, Loc Ho <lho@apm.com>,
        Duc Dang <dhdang@apm.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Wed, Sep 7, 2016 at 12:24 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Sep 07, 2016 at 11:55:06AM -0700, Hoan Tran wrote:
>> Hi Guenter,
>>
>> On Tue, Sep 6, 2016 at 11:39 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> > On 09/06/2016 11:07 PM, Hoan Tran wrote:
>> >>
>> >> Hi Guenter,
>> >>
>> >> On Tue, Sep 6, 2016 at 10:50 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> >>>
>> >>> On 09/06/2016 10:21 PM, Hoan Tran wrote:
>> >>>>
>> >>>>
>> >>>> Hi Guenter,
>> >>>>
>> >>>> Thank for your quick review !
>> >>>>
>> >>>> On Tue, Sep 6, 2016 at 9:35 PM, Guenter Roeck <linux@roeck-us.net>
>> >>>> wrote:
>> >>>>>
>> >>>>>
>> >>>>> On 09/06/2016 08:46 PM, Hoan Tran wrote:
>> >>>>>>
>> >>>>>>
>> >>>>>>
>> >>>>>> The system crashes during probing xgene-hwmon driver when temperature
>> >>>>>> alarm interrupt occurs before.
>> >>>>>> It's because
>> >>>>>>  - xgene_hwmon_probe() requests PCC mailbox channel which also enables
>> >>>>>> the mailbox interrupt.
>> >>>>>>  - As temperature alarm interrupt is pending, ISR runs and crashes
>> >>>>>> when
>> >>>>>> accesses
>> >>>>>> into invalid resource as unmapped PCC shared memory.
>> >>>>>>
>> >>>>>> This patch fixes this issue by saving this alarm message and
>> >>>>>> scheduling
>> >>>>>> a
>> >>>>>> bottom handler after xgene_hwmon_probe() finish.
>> >>>>>>
>> >>>>>
>> >>>>> I am not completely happy with this fix. Main problem I have is that
>> >>>>> the
>> >>>>> processing associated with resp_pending doesn't happen until init_flag
>> >>>>> is
>> >>>>> set.
>> >>>>> Since the hwmon functions can be called right after
>> >>>>> hwmon_device_register_with_groups(),
>> >>>>> there is now a new race condition between that call and setting
>> >>>>> init_flag.
>> >>>>
>> >>>>
>> >>>>
>> >>>> I think it's still good if hwmon functions are called right after
>> >>>> hwmon_device_register_with_groups().
>> >>>> The response message will be queued into FIFO and be processed later.
>> >>>>
>> >>> Yes, but the call to complete() won't happen in this case, or am I
>> >>> missing
>> >>> something ?
>> >>
>> >>
>> >> Yes, I think xgene_hwmon_rd() and xgene_hwmon_pcc_rd() functions have
>> >> to check "init_flag == true" before issue the read command.
>> >>
>> >
>> > This is getting more and more messy :-(
>> >
>> >> Thanks
>> >> Hoan
>> >>
>> >>>
>> >>> Guenter
>> >>>
>> >>>
>> >>>>>
>> >>>>> I am also a bit concerned with init_flag and rx_pending not being
>> >>>>> atomic
>> >>>>> and
>> >>>>> protected.
>> >>>>> What happens if a second interrupt occurs right after init_flag is set
>> >>>>> but
>> >>>>> before
>> >>>>> (or while) rx_pending is evaluated ?
>> >>>>
>> >>>>
>> >>>>
>> >>>> Yah, that's a good catch. I can re-use the "kfifo_lock" spinlock for
>> >>>> this atomic protection.
>> >>>>
>> >>>>>
>> >>>>> On top of that, init_flag and thus the added complexity is (unless I am
>> >>>>> missing
>> >>>>> something) only needed if acpi is enabled. Penaltizing non-acpi code
>> >>>>> doesn't
>> >>>>> seem
>> >>>>> to be optimal.
>> >>>>
>> >>>>
>> >>>>
>> >>>> I think, with DT, we still need this flag. In a case of temperature
>> >>>> alarm, the driver needs to set "temp1_critical_alarm" sysfs.
>> >>>> This "temp1_critical_alarm" should be created before "init_flag" = true.
>> >>>>
>> >
>> > I don't know. After all, any such alarm would be lost if it occurred
>> > before the driver was loaded, no ? Those mailboxes should really have
>> > a means to be informed that the initiator is ready to handle
>> > interrupts/callbacks.
>>
>> We don't want to miss an alarm message. User should be warned.
>>
>> As
>> ctx->hwmon_dev = hwmon_device_register_with_groups(ctx->dev,
>>
>> "apm_xgene",
>>                                                            ctx,
>>                                                            xgene_hwmon_groups);
>> How about, callback functions check the ctx->hwmon_dev validation. If
>> not, they just save msg into FIFO.
>> Beside of that, as hwmon functions can be called before ctx->hwmon_dev
>> is assigned. Callback functions check if there is a mailbox response
>> pending before saving msg into FIFO as below
>>
>> static int xgene_hwmon_rx_ready(struct xgene_hwmon_dev *ctx, void *msg)
>> {
>>         if (IS_ERR(ctx->hwmon_dev) && !ctx->resp_pending) {
>
> Probably IS_ERR_OR_ZERO() ?

Yes, I'll use IS_ERR_OR_NULL().

>
> Guenter
>
>>                 /* Enqueue to the FIFO */
>>                 kfifo_in_spinlocked(&ctx->async_msg_fifo, msg,
>>                                     sizeof(struct slimpro_resp_msg),
>>                                     &ctx->kfifo_lock);
>>
>>                 return -EBUSY;
>
> Need to find something else. EBUSY isn't correct.

Change to ENODEV.

>
>>         }
>>
>>         return 0;
>> }
>>
>>
>> At the end of probe function, driver always schedules a bottom handler
>> to handle FIFO msg.
>>
>> Then we can remove the init_flag and rx_pending.
>>
>
> At least better than before, though I think it is still racy.
> It might be worthwhile checking by adding a large msleep()
> after hwmon registration and before ctx->hwmon_dev is written,
> and have a user space program access sysfs attributes immediately
> after they have been created.

Yes, I'll test it out by adding msleep() right before
__hwmon_device_register() returns.

Thanks
Hoan

>
> Thanks,
> Guenter
