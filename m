Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35349 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbeHNX7t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 19:59:49 -0400
Date: Tue, 14 Aug 2018 14:10:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature
 sensors
Message-ID: <20180814211045.GA10415@roeck-us.net>
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
 <cf319e6a-59a9-d6de-79e2-91994177194c@roeck-us.net>
 <CACRpkdYZnqTeCQSeVq38b_pVmJNpSN+P4xnU0Jr4v=WAQ6tBfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYZnqTeCQSeVq38b_pVmJNpSN+P4xnU0Jr4v=WAQ6tBfw@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 14, 2018 at 11:03:03PM +0200, Linus Walleij wrote:
> On Mon, Aug 13, 2018 at 12:31 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 08/09/2018 09:15 PM, Guenter Roeck wrote:
> > > On 08/09/2018 03:24 PM, Linus Walleij wrote:
> 
> > >> +        if (id == SMART_TEMP_PROP_194)
> > >> +            break;
> >
> > 231 also seems to report the temperature if available, as does 190.
> 
> They have the same temperature format(s) but AFAICT these
> have specific meanings:
> smartmontools has a drive database that tells the story.
> 
> 190 is the Air flow temperature
> 231 reports temperature on some drives but on others this is the
>    "SSD life left"
> 
> To avoid erroneous interpretation I kept with just 194.
> 
Makes sense.

> > Not sure if 190 is worth it, though - Samsung SSD 840 PRO Series supports
> > it but reports a static value of 28. And it seems to be either as
> > degrees C or as 100 - degrees C, depending on the drive manufacturer,
> > which makes it quite unreliable.
> 
> I guess we could add more heuristics if we want. Maybe not
> as the first step.
> 
Agreed.

Thanks,
Guenter
