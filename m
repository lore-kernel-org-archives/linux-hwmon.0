Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36616 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbeH1TvA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Aug 2018 15:51:00 -0400
Received: by mail-oi0-f50.google.com with SMTP id r69-v6so3764735oie.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Aug 2018 08:58:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5B0ayLApo1PKhggeapu62QNu2=DP3ou2WBew2k6vwOFuw@mail.gmail.com>
References: <CAOMZO5B5CdyGosPduP0uje_wNhiJDcH5NsumENAdQKjLBWFM0g@mail.gmail.com>
 <20180827193936.GB18363@roeck-us.net> <CAOMZO5B0ayLApo1PKhggeapu62QNu2=DP3ou2WBew2k6vwOFuw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 Aug 2018 12:58:40 -0300
Message-ID: <CAOMZO5D=22LDAMr0xUFsTALjjqbrNQ09yROvDpQKfnhiNZ1=ow@mail.gmail.com>
Subject: Re: Reading from the MC13892 ADC channels causes shutdown
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>,
        David Jander <david.jander@protonic.nl>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 27, 2018 at 5:00 PM, Fabio Estevam <festevam@gmail.com> wrote:

> Yes, I tried reverting it and it did not help.
>
> I also put the author of this commit, Andrey on Cc in case he has some
> insight to this problem.

After comparing the MC13892 initialization in the vendor kernel, I
managed to fix this issue inside drivers/mfd/mc13xxx-core.c.

Will submit a fix for the mfd folks.

Thanks
