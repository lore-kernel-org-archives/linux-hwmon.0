Return-Path: <SRS0=z86d=QT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C677DC282C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 08:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A053120675
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 08:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbfBLIwp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Feb 2019 03:52:45 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46564 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbfBLIwp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Feb 2019 03:52:45 -0500
Received: by mail-ua1-f65.google.com with SMTP id j8so595226uae.13;
        Tue, 12 Feb 2019 00:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d0f2h6/PSCtqA+tAPeNLb/jo2IEr2qwo+STy14wU4ok=;
        b=o+9PXaIdSLLqM3UhX61XeJx+36y+Kca0YpkAgenkiIiaWIMB4SCOhNkE5FdhJ6Ywzd
         VQb6wSakNMlOZ2notEKtoDuIBRWrv7Y4Av8bNei5VWKz2Oq3e593nDOXhwv3uSgP3bmA
         12VaVY0V/0/TJi03UxtWq9QaMkOiADW1O4f4IFrhqKYYD9reSDW0XSXoDXT6fYOWE5C2
         zVzmH4Sdh82idF8r1T311EtTJ0IY3nfTQedvMuJDbbwuG7PuJKRXFC/8YHLURdfs04RM
         BSUpgttO/hnkAn/OZ76JjubxAYD9YB45CkzjtPCz+AfFO0mzCEeW2HPQVpAa+M/gHbDR
         X9Ug==
X-Gm-Message-State: AHQUAuZN8dUXu/Cg4cdg4nKi7iCTzL8aIMavw1VAzG9w7h2rkIUZNsX5
        GfjMqw3tM04cF5dC0EqoS8dl+7i5BEeI2Q5frz8=
X-Google-Smtp-Source: AHgI3IYaWcD58+fGpP35XEJ6XG1vwdB+jt7r7L7bIbH+uu+CHWrxB7NHy69+D5AD5E0hZayFzBUczOgsc/PO5Ay9DF4=
X-Received: by 2002:a9f:2726:: with SMTP id a35mr1061155uaa.75.1549961563502;
 Tue, 12 Feb 2019 00:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20181217155644.29278-1-marek.vasut@gmail.com> <20181217155644.29278-4-marek.vasut@gmail.com>
 <20181218214439.GB8850@localhost.localdomain> <867ffa18-9c16-685a-7c83-7534bc14e41d@gmail.com>
 <a4aa607d-f83a-2ed4-09c2-fdcba308664d@gmail.com> <2b24720c-c649-44e0-0337-c8a52c78d33d@gmail.com>
 <20190205232442.GA4423@localhost.localdomain> <1b331713-d1d1-1fe0-277e-2fea4866c244@gmail.com>
In-Reply-To: <1b331713-d1d1-1fe0-277e-2fea4866c244@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Feb 2019 09:52:31 +0100
Message-ID: <CAMuHMdW_ifuQqz9Y_-o4JXX42d+NMOt5L6chszcvw0MriSq8LA@mail.gmail.com>
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in thermal_zone_of_sensor_register_param()
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi all,

On Mon, Feb 11, 2019 at 9:43 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 2/6/19 12:24 AM, Eduardo Valentin wrote:
> > On Mon, Jan 28, 2019 at 01:10:11PM +0100, Marek Vasut wrote:
> >> On 1/15/19 1:35 AM, Marek Vasut wrote:
> >>> On 12/22/18 3:19 AM, Marek Vasut wrote:
> >>>> On 12/18/2018 10:44 PM, Eduardo Valentin wrote:
> >>>>> On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
> >>>>>> From: Marek Vasut <marek.vasut@gmail.com>
> >>>>>>
> >>>>>> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
> >>>>>> in case thermal_zone_params->no_hwmon is set to false. This behavior is
> >>>>>> the same as thermal_zone_device_register().
> >>>>>>
> >>>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> >>>>>> Cc: Eduardo Valentin <edubezval@gmail.com>
> >>>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>>>>> Cc: Zhang Rui <rui.zhang@intel.com>
> >>>>>> Cc: linux-renesas-soc@vger.kernel.org
> >>>>>> To: linux-pm@vger.kernel.org
> >>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>>> ---
> >>>>>> V2: No change
> >>>>>> V3: - Work around the From line and SoB line checkpatch warning
> >>>>>>     - Reorder the SoB line at the end
> >>>>>> ---
> >>>>>>  drivers/thermal/of-thermal.c | 12 +++++++++++-
> >>>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
> >>>>>> index e1a303a5698c..5ccff7b678de 100644
> >>>>>> --- a/drivers/thermal/of-thermal.c
> >>>>>> +++ b/drivers/thermal/of-thermal.c
> >>>>>> @@ -15,6 +15,7 @@
> >>>>>>  #include <linux/string.h>
> >>>>>>
> >>>>>>  #include "thermal_core.h"
> >>>>>> +#include "thermal_hwmon.h"
> >>>>>>
> >>>>>>  /***   Private data structures to represent thermal device tree data ***/
> >>>>>>
> >>>>>> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
> >>>>>>                  if (sensor_specs.np == sensor_np && id == sensor_id) {
> >>>>>>                          tzd = thermal_zone_of_add_sensor(child, sensor_np,
> >>>>>>                                                           data, ops);
> >>>>>> -                        if (!IS_ERR(tzd))
> >>>>>> +                        if (!IS_ERR(tzd)) {
> >>>>>> +                                tzd->tzp = tzp;
> >>>>>
> >>>>> So, here you will overwrite what was done in of_parse_thermal_zones().
> >>>>> That means, after this point, property like sustainable power, slope and
> >>>>> offset are gone.
> >>>>
> >>>> Hmmmmm, that was rather inobvious, indeed.
> >>>>
> >>>> Do you have some suggestion how to pass in the no_hwmon = false then ?
> >>>> Since tzp->no_hwmon is set to true in of_parse_thermal_zones(), the
> >>>> three drivers (stm32, rcar, rcar_gen3) seem to hack around it. I'd like
> >>>> to clean that up.
> >>>
> >
> > Yeah, that is an issue.
> >
> >>> Bump ?
> >>
> >> Bump again, any suggestions ?
> >
> > Yeah, a couple of ideas have been proposed for this issue.
> >
> > First most tempting one is to have a DT property per thermal zone.
> > Making it linux specific, something prefixed by linux,<property>. I
> > recall Amit Kutcheria trying something similar to this, but dont
> > remember where that went. Frankly, this is a Linux thing, I am not
> > convinced DT is really the right place to fix this.
>
> DT is not the right place for this, DT describes hardware and this is
> policy, so it shouldn't be in DT.

Indeed.

> > Another hack that could be written is a module parameter for of-thermal
> > that would reflect the no_hwmon value, globally. The down side here is
> > you have to make sure all drivers match that no_hwmon value, right?
>
> Indeed, it should be the driver which decides whether or not to register
> a HWMON interface for the thermal zone.
>
> I guess for now, I'll just discard this entire series and hack the data
> structure like other drivers do, since I don't see any reasonable solution.

Pardon my ignorance, but when would a thermal driver (not) want to register
a hwmon interface for the thermal zone?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
