Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:44930 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbeH0XsM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Aug 2018 19:48:12 -0400
Received: by mail-oi0-f54.google.com with SMTP id l82-v6so306686oih.11
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Aug 2018 13:00:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180827193936.GB18363@roeck-us.net>
References: <CAOMZO5B5CdyGosPduP0uje_wNhiJDcH5NsumENAdQKjLBWFM0g@mail.gmail.com>
 <20180827193936.GB18363@roeck-us.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Aug 2018 17:00:08 -0300
Message-ID: <CAOMZO5B0ayLApo1PKhggeapu62QNu2=DP3ou2WBew2k6vwOFuw@mail.gmail.com>
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

Hi Guenter,

On Mon, Aug 27, 2018 at 4:39 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> If I recall correctly, the most recent change was commit ed645cccc0eb
> ("hwmon: MC13783: Add uid and die temperature sensor inputs"). It is a
> wild shot, but you could try reverting it to see if it makes a difference.

Yes, I tried reverting it and it did not help.

I also put the author of this commit, Andrey on Cc in case he has some
insight to this problem.

Thanks
