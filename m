Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AE2C54EE9
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 23:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiIVXrG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 19:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIVXrG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 19:47:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9490EC54B
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:47:03 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b35so15888141edf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TkxUzXFxdRfPxCXPrk1oaEic6jBLN8HvAFzot/PxMPE=;
        b=Rdp5x6H1HXPGCSC+CAv9ZhdtVGnMSMmx4aJzPKnHVW/qMx8SpzkkbTfXitcW59ReBK
         N3pFnGDOHv/v7fpYG3ooAED/6sq8x9kDi/LmkDgkCjuFBUPbwXtLGZBNIrHLOjgxbQyQ
         2lY7xL8xnP89rVararSLqUm/TIX7GGYXWLL1fo8dTj8RMsgvTyR5l74nEZp/quVLqICd
         08hrXvq9tIeI5eOvQb++ZyXWShtMewtYBvdpBCREZC8bgScU/t+VzjQsjNGoSV3bgYgO
         TBK9S/H4yhapYBnwYNy8jPzShouJyaOH5fJhNOMjZWTytuLGSYf94MfQQGlQMhTuZ5ij
         kl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TkxUzXFxdRfPxCXPrk1oaEic6jBLN8HvAFzot/PxMPE=;
        b=ipcQ82dUrtXjnA5hNvRIh/U67LI0OBWMosfx/vXJwHRV5RN5KHYRrJRjnhTFAcDqgn
         TZO2WZKkr5pqleOmmpuOSWvLvw83EIHQwp6s0ZVi2/nOqD9GCfXsnZG85besl9rrG+7G
         i0dGE4U62qSFzdn4dqzIb9StvBdz7DLZF6UC1E+0esA+F75e5YJfk1eyLENW9dT2FkVO
         T8NpEXjl65MKC6JRmMyuYMOROMHu9v6vHKbXGZme0nKPnDeIZ0IkALw0Wug2SNDBBiUQ
         6pwZx1HbzGF82VZ4UinlVXGmOi7PED9zac3hdb0cwxg4oeIBuWq4Q6nGsC2e5/yucB3i
         pOYw==
X-Gm-Message-State: ACrzQf1GUt2JEgo1QnSauMv/+XvBuY+9i4dyV7SJgPp0rJ4EnIu/Uskg
        ZXjxvvg19j92RGVrST8Mhzl4Lv8Y2fWoENs7beo=
X-Google-Smtp-Source: AMsMyM5pamUHqdNYQWg4pnqYuoFgHrn4Axp3p1Z+oovqVrcJIH5xQLLNPSomGac7ALEiBcIkl9E2RU/IbGy+M7Etobw=
X-Received: by 2002:a05:6402:26cf:b0:451:70af:ecc5 with SMTP id
 x15-20020a05640226cf00b0045170afecc5mr5769993edd.287.1663890422257; Thu, 22
 Sep 2022 16:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220921233109.1672345-1-floridsleeves@gmail.com>
 <99ea1416-46dc-9712-271a-9e3daaa43e05@roeck-us.net> <CAMEuxRprFMU8RZmZw8A53ND3iLkgcgGUWg4D77ii8EWnm3kvnA@mail.gmail.com>
 <1420a755-6f8c-e1e2-2a34-dcb535730f7a@roeck-us.net>
In-Reply-To: <1420a755-6f8c-e1e2-2a34-dcb535730f7a@roeck-us.net>
From:   Li Zhong <floridsleeves@gmail.com>
Date:   Thu, 22 Sep 2022 16:46:52 -0700
Message-ID: <CAMEuxRo+3UgPCX44OGWZBvhOC6V+ocLYwjOLjYW7UHF=5KBrxQ@mail.gmail.com>
Subject: Re: [BUG] drivers: adm9240: possible data race bug in adm9240_fan_read()
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 22, 2022 at 2:53 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/22/22 13:37, Li Zhong wrote:
> > On Wed, Sep 21, 2022 at 8:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 9/21/22 16:31, Li Zhong wrote:
> >>> Hello,
> >>>
> >>> My static analysis tool reports a possible bug in the adm9240 driver in Linux
> >>> v6.0:
> >>>
> >>> drivers/hwmon/adm9240.c:
> >>>
> >>> adm9240_read()
> >>>       adm9240_fan_read() --> Line 509
> >>>           adm9240_write_fan_div()
> >>>
> >>> adm9240_write_fan_div() says 'callers must hold
> >>> data->update_lock'. However, it seems like the context does
> >>> not hold the lock it requires. So it may cause data race when
> >>> setting new fan div.
> >>>
> >>> I am not quite sure whether this is a real bug. Any feedback would be
> >>> appreciated!
> >>>
> >>
> >> You are correct, the code in adm9240_fan_read() should acquire
> >> the mutex before calling adm9240_write_fan_div() and while
> >> manipulating data->fan_div[channel].
> >>
> >> Guenter
> >
> > Thanks for your patient reply! Can I submit a patch on this? The draft will
> > be something like:
> >
> > +  mutex_lock(&data->update_lock)
> >      err = adm9240_write_fan_div(data, channel, ++data->fan_div[channel]);
> >      if (err)
> >          return err;
> > +  mutex_unlock(&data->update_lock);
> >
> > Let me know if you have any suggestions!
>
> That would leave the mutex in locked state after an error, and it does not
> take into account that data->fan_div[channel] might still change after being
> checked but before being used. The lock has to be around the if() statement,
> and the lock must be released after an error was observed.
>
> At the very least, the code has to be something like
>
>         ...
>         mutex_lock(&data->update_lock);
>          if (regval == 255 && data->fan_div[channel] < 3) {
>                  /* adjust fan clock divider on overflow */
>                  err = adm9240_write_fan_div(data, channel,
>                                              ++data->fan_div[channel]);
>                  if (err) {
>                         mutex_unlock(&data->update_lock);
>                          return err;
>                 }
>          }
>         mutex_unlock(&data->update_lock);
>         ...
>
> However, that isn't perfect since the fan divisor and the fan speed
> register value are not in sync. Technically it needs to be something like
>
>         u8 fan_div;
>         ...
>
>         mutex_lock(&data->update_lock);
>         err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
>         if (err) {
>                 mutex_unlock(&data->update_lock);
>                 return err;
>         }
>         fan_div = data->fan_div[channel];
>         if (regval == 255 && fan_div < 3) {
>                 err = adm9240_write_fan_div(data, channel, fan_div + 1);
>                 if (err) {
>                         mutex_unlock(&data->update_lock);
>                         return err;
>                 }
>                 data->fan_div[channel] = fan_div + 1;
>         }
>         mutex_unlock(&data->update_lock);
>         *val = FAN_FROM_REG(regval, BIT(fan_div));
>         break;
>
> Thanks,
> Guenter

Thanks for your suggestions and drafts! I submit the patch.
