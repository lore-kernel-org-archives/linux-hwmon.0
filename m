Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f179.google.com ([209.85.214.179]:45082 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbeH0X1g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Aug 2018 19:27:36 -0400
Received: by mail-pl1-f179.google.com with SMTP id j8-v6so36045pll.12
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Aug 2018 12:39:38 -0700 (PDT)
Date: Mon, 27 Aug 2018 12:39:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>,
        David Jander <david.jander@protonic.nl>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: Reading from the MC13892 ADC channels causes shutdown
Message-ID: <20180827193936.GB18363@roeck-us.net>
References: <CAOMZO5B5CdyGosPduP0uje_wNhiJDcH5NsumENAdQKjLBWFM0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5B5CdyGosPduP0uje_wNhiJDcH5NsumENAdQKjLBWFM0g@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 27, 2018 at 04:08:47PM -0300, Fabio Estevam wrote:
> Hi,
> 
> Has anyone managed to read ADC values from the MC13892 ADC recently?
> 
> I am running 4.19-rc1 on a imx51-babbage board and after trying to
> read a channel:
> 
> # cat /sys/class/hwmon/hwmon0/device/in7_input
> 
> the PMIC shuts down completely, which causes the entire board to die.
> 
> I don't know if this is a regression or not. I can try to run a
> bisect, but I would be interested to know if anyone knows if MC13892
> ADC readings worked at some point in the past.
> 

If I recall correctly, the most recent change was commit ed645cccc0eb
("hwmon: MC13783: Add uid and die temperature sensor inputs"). It is a
wild shot, but you could try reverting it to see if it makes a difference.

Guenter
