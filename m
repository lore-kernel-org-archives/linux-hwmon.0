Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:47028 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbeI0CMz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Sep 2018 22:12:55 -0400
Date: Wed, 26 Sep 2018 12:58:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Add enable sysfs nodes
Message-ID: <20180926195817.GA19695@roeck-us.net>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-3-nicoleotsuka@gmail.com>
 <0cfe55e1-10d8-ac1f-8b6e-73777074a219@roeck-us.net>
 <20180926180243.GA6329@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926180243.GA6329@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Nicolin,

On Wed, Sep 26, 2018 at 11:02:44AM -0700, Nicolin Chen wrote:
> On Wed, Sep 26, 2018 at 06:06:32AM -0700, Guenter Roeck wrote:
> > On 09/25/2018 11:42 PM, Nicolin Chen wrote:
> > > The inX_enable interface allows user space to enable or disable
> > > the corresponding channel. Meanwhile, according to hwmon ABI, a
> > > disabled channel/sensor should return -ENODATA as a read result.
> > > 
> > > However, there're configurable nodes sharing the same __show()
> > > functions. So this change also adds to check if the attribute is
> > > read-only to make sure it's not reading a configuration but the
> > > sensor data.
>  
> > One necessary high level change I don't see below: With this change,
> > we should no longer drop a channel entirely if it is disabled from
> > devicetree. All channels should be visible but report -ENODATA if
> > disabled. In other words, it should be possible for the 'enable' flag
> > to override settings in DT.
> 
> Hmm...I don't feel so convinced here. The status in DT binding isn't
> exactly a setting but a physical status: if a hardware design leaves
> a channel to be disconnected, I don't really see a point in enabling
> it in the runtime. Or maybe you can shed some light on it?
> 

You are making an assumption from your use case. It might as well be that
some or all channels are disabled in DT by default to conserve power,
not because they are disconnected.

> Meanwhile, I believe the enable nodes are necessary in either way as
> users could decide to disable the connected channels, based on their
> use cases, to save power.
> 
Agreed, though I would not say "necessary". "Useful" seems to be more
appropriate.

Thanks,
Guenter
