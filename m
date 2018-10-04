Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f170.google.com ([209.85.214.170]:35659 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbeJDHdK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Oct 2018 03:33:10 -0400
Received: by mail-pl1-f170.google.com with SMTP id f8-v6so4271170plb.2
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Oct 2018 17:42:26 -0700 (PDT)
Subject: Re: hwmon: trace event support?
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20181003234657.GA32550@Asurada-Nvidia.nvidia.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <cbc579ab-b95f-4917-154d-95dc0c059a06@roeck-us.net>
Date: Wed, 3 Oct 2018 17:42:23 -0700
MIME-Version: 1.0
In-Reply-To: <20181003234657.GA32550@Asurada-Nvidia.nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Ni Nicolin,

On 10/03/2018 04:46 PM, Nicolin Chen wrote:
> Hello Guenter,
> 
> I am thinking about a possibility of adding a trace event support
> in hwmon subsystem. Ftrace is pretty useful and widely applied to
> different subsystems already while hwmon doesn't seem to have one
> yet. I know some power/perf folks who rely on the trace events to
> analyse relationships among cpufreq <-> thermal <-> power: usually
> what they do is enabling trace events, then letting the system run
> for a while, and finally collecting all data from Ftrace outputs.
> 
> Both cpufreq and thermal have trace events; but for power data, it
> seems that they have to go through sysfs nodes, which is difficult
> for them to get data at the same timestamps corresponding to those
> Ftrace data. Similar to tz->poll_queue in thermal_core, hwmon core
> could also have a work queue polling the registered sensor inputs
> (by default disabled; enabled only if users configure poll_delay)
> so that the power data can be generated to Ftrace outputs as well.
> 
> To add this, the hwmon core needs an interface that can get sensor
> inputs as drivers like ina3221 don't report any values back to the
> core but directly expose them via sysfs ABI nodes.
> 
> I noticed the hwmon_device_register_with_info() could be actually
> a good API to use since it has defined different sensor types and
> more importantly the ops->read() interface, but the ina3221 driver
> is very compact that there would be very little gain from this API
> at this moment. However, maybe having trace event support would be

"very little gain" is a false assumption. Its size would most likely
be reduced by 20% or more, mostly because all the sysfs handling
is done by the core if one uses the _info API.

> a good reason to apply this API.
> 
> What do you think about it? Any concern or better solution?

I would not object to adding trace support into the hwmon subsystem.
However, it should be tied to the new API. I would resist patches
adding trace support to individual hwmon drivers unless the new API
is used and additional driver specific trace support is warranted.

Note that this also applies to hwmon drivers registering through
thermal. The thermal subsystem calls the _info API but misuses it
to avoid a warning generated when using the old API. Of course,
I have no influence over the hwmon code in the thermal subsystem,
so whatever is done there is essentially wild-wild-west.

Hope this helps,
Guenter
