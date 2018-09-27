Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37040 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbeI0WYJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Sep 2018 18:24:09 -0400
Date: Thu, 27 Sep 2018 09:05:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Add enable sysfs nodes
Message-ID: <20180927160509.GA18064@roeck-us.net>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-3-nicoleotsuka@gmail.com>
 <0cfe55e1-10d8-ac1f-8b6e-73777074a219@roeck-us.net>
 <20180926180243.GA6329@Asurada-Nvidia.nvidia.com>
 <20180926195817.GA19695@roeck-us.net>
 <20180926202519.GB10595@Asurada-Nvidia.nvidia.com>
 <20180926204455.GA17035@roeck-us.net>
 <20180926215504.GC10595@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926215504.GC10595@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nicolin,

On Wed, Sep 26, 2018 at 02:55:06PM -0700, Nicolin Chen wrote:
> On Wed, Sep 26, 2018 at 01:44:55PM -0700, Guenter Roeck wrote:
> > On Wed, Sep 26, 2018 at 01:25:20PM -0700, Nicolin Chen wrote:
> > > Hello,
> > > 
> > > On Wed, Sep 26, 2018 at 12:58:17PM -0700, Guenter Roeck wrote:
> > > > On Wed, Sep 26, 2018 at 11:02:44AM -0700, Nicolin Chen wrote:
> > > > > On Wed, Sep 26, 2018 at 06:06:32AM -0700, Guenter Roeck wrote:
> > > > > > On 09/25/2018 11:42 PM, Nicolin Chen wrote:
> > > > > > > The inX_enable interface allows user space to enable or disable
> > > > > > > the corresponding channel. Meanwhile, according to hwmon ABI, a
> > > > > > > disabled channel/sensor should return -ENODATA as a read result.
> > > > > > > 
> > > > > > > However, there're configurable nodes sharing the same __show()
> > > > > > > functions. So this change also adds to check if the attribute is
> > > > > > > read-only to make sure it's not reading a configuration but the
> > > > > > > sensor data.
> > > > >  
> > > > > > One necessary high level change I don't see below: With this change,
> > > > > > we should no longer drop a channel entirely if it is disabled from
> > > > > > devicetree. All channels should be visible but report -ENODATA if
> > > > > > disabled. In other words, it should be possible for the 'enable' flag
> > > > > > to override settings in DT.
> > > > > 
> > > > > Hmm...I don't feel so convinced here. The status in DT binding isn't
> > > > > exactly a setting but a physical status: if a hardware design leaves
> > > > > a channel to be disconnected, I don't really see a point in enabling
> > > > > it in the runtime. Or maybe you can shed some light on it?
> > > > > 
> > > > 
> > > > You are making an assumption from your use case. It might as well be that
> > > > some or all channels are disabled in DT by default to conserve power,
> > > > not because they are disconnected.
> > > 
> > > I think I probably should update my DT binding somehow to say it
> > > explicitly that the property should be only used in cases of the
> > > physical disconnections, although I feel the current binding "no
> > > input source" already has the same meaning.
> > > 
> > > In my opinion, disabling channels in DT to save power isn't very
> > > plausible, because it sounds more likely a user decision, while,
> > > as we know, DT merely describes the hardware design.
> > > 
> > 
> > I try to avoid making such assumptions. All I know is that I'll have
> > to deal with the fallout if a single person wants to use the property
> > differently.
> 
> I can understand your point (or pain lol). But I believe in such
> a case, DT maintainers should reject such a DT change. Let's say
> if this kinda "default setting" in DT is allowable, other things
> such as having a default mode setting between polling or one-shot
> modes, and as default critical current settings would be able to
> put into DT. But we know that these would be rejected as a reason
> of "not being hardware design but a user decision".
> 
> > This is similar to disabling an entire subsystem in DT
> > because it isn't used in a specific system - say, a SPI or I2C bus
> > which has nothing connected on some shipping hardware, even though
> > the board has a connector for it. Your argument is that one shall
> > not use the status property do disable loading the driver, and that
> > one must not remove a set of properties for unused hardware either.
> > That doesn't sound very realistic to me.
> 
> SPI/I2C is a good example comparing to my case. And you do make
> a point. In that case, I think DT overlay is designed for it --
> one shall overlay the status property from "disable" (defined in
> the DTS of the shipping hardware -- the main board) to "okay" in
> the overlay DTS where a connection actually happens.
> 
> And even in this case, it makes sense to me to disable both the
> status and the driver of SPI/I2C for the main board. Otherwise,
> memory could be wasted for standalone main board users at those
> unused SPI/I2C buses -- and the memory might be larger than one
> could expect depending on where drivers allocate data buffers.
> 
> > Point is that I don't _know_ how this is going to be used, so I'd
> > rather keep it flexible.
> 
> Well, taking one step back, I am okay to follow your way if you
> are really firm about it. Just please give me a more reply and
> I will merge this change to that v5, dropping the is_visible().

Quite obviously we are not converging. Given that, I think it
would be better to shelve the new attributes for now and to wait
for an actual user who actually needs the new attributes.

Thanks,
Guenter
