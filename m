Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33866 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbeJDXmL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Oct 2018 19:42:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id g12-v6so3435876pgs.1
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Oct 2018 09:48:05 -0700 (PDT)
Date: Thu, 4 Oct 2018 09:48:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: hwmon: trace event support?
Message-ID: <20181004164802.GA16009@roeck-us.net>
References: <20181003234657.GA32550@Asurada-Nvidia.nvidia.com>
 <cbc579ab-b95f-4917-154d-95dc0c059a06@roeck-us.net>
 <20181004050838.GA9439@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181004050838.GA9439@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 03, 2018 at 10:08:39PM -0700, Nicolin Chen wrote:
> Thanks for the quick response.
> 
> On Wed, Oct 03, 2018 at 05:42:23PM -0700, Guenter Roeck wrote:
> > > Ftrace data. Similar to tz->poll_queue in thermal_core, hwmon core
> > > could also have a work queue polling the registered sensor inputs
> > > (by default disabled; enabled only if users configure poll_delay)
> > > so that the power data can be generated to Ftrace outputs as well.
> > > 
> > > To add this, the hwmon core needs an interface that can get sensor
> > > inputs as drivers like ina3221 don't report any values back to the
> > > core but directly expose them via sysfs ABI nodes.
> > > 
> > > I noticed the hwmon_device_register_with_info() could be actually
> > > a good API to use since it has defined different sensor types and
> > > more importantly the ops->read() interface, but the ina3221 driver
> > > is very compact that there would be very little gain from this API
> > > at this moment. However, maybe having trace event support would be
> > 
> > "very little gain" is a false assumption. Its size would most likely
> > be reduced by 20% or more, mostly because all the sysfs handling
> > is done by the core if one uses the _info API.
> 
> Didn't intend to deny the improvement; probably should have used a
> more positive word instead of "little" :)
> 
> > > a good reason to apply this API.
> > > 
> > > What do you think about it? Any concern or better solution?
> > 
> > I would not object to adding trace support into the hwmon subsystem.
> > However, it should be tied to the new API. I would resist patches
> > adding trace support to individual hwmon drivers unless the new API
> > is used and additional driver specific trace support is warranted.
> 
> Yes, my idea is to implement it with the _info API inside the hwmon
> core. What do you think about the mentioned solution? Would you be
> in favor of a polling work queue?
> 
> "----------. Similar to tz->poll_queue in thermal_core, hwmon core
>  could also have a work queue polling the registered sensor inputs
>  (by default disabled; enabled only if users configure poll_delay)
>  so that the power data can be generated to Ftrace outputs as well."
> 

I am not really in favor of it. This goes well beyond tracing. Tracing
by its nature should be non-invasive and impact the system as little as
possible. Adding a thread which polls thermal sensors, which are often
connected with a slow i2c interface or even blocking, is quite invasive.

I don't mind adding tracing support to trace sensor access. Adding code
to poll thermal sensors on a regular basis is a completely different
beast. I am not convinced that this should really be done in the kernel.
The same could be accomplished with a simple loop from userspace.

while true; do
	cat /sys/class/hwmon/hwmon1/temp1_input
	sleep 1
done

... and you could actually trace those accesses in the kernel.

Now, if the problem is added overhead due to requiring a sysfs access
for each sensor read, we can discuss introducing a different and more
efficient user-space ABI (such as adding a hwmon->iio bridge).
That would however be a different discussion.

> > Note that this also applies to hwmon drivers registering through
> > thermal. The thermal subsystem calls the _info API but misuses it
> > to avoid a warning generated when using the old API. Of course,
> > I have no influence over the hwmon code in the thermal subsystem,
> > so whatever is done there is essentially wild-wild-west.
> 
> I saw they have some obvious code in the hwmon core. If you want,
> we can keep the polling work queue and trace events away from it,
> which sounds plausible to me considering that thermal subsystem
> has its own polling work queue and trace events for sensor data.

The code in the hwmon core is different. I am referring to hwmon code
in the thermal core.

Guenter
