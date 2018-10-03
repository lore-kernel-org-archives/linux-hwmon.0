Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Wed, 3 Oct 2018 16:46:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Subject: hwmon: trace event support?
Message-ID: <20181003234657.GA32550@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter,

I am thinking about a possibility of adding a trace event support
in hwmon subsystem. Ftrace is pretty useful and widely applied to
different subsystems already while hwmon doesn't seem to have one
yet. I know some power/perf folks who rely on the trace events to
analyse relationships among cpufreq <-> thermal <-> power: usually
what they do is enabling trace events, then letting the system run
for a while, and finally collecting all data from Ftrace outputs.

Both cpufreq and thermal have trace events; but for power data, it
seems that they have to go through sysfs nodes, which is difficult
for them to get data at the same timestamps corresponding to those
Ftrace data. Similar to tz->poll_queue in thermal_core, hwmon core
could also have a work queue polling the registered sensor inputs
(by default disabled; enabled only if users configure poll_delay)
so that the power data can be generated to Ftrace outputs as well.

To add this, the hwmon core needs an interface that can get sensor
inputs as drivers like ina3221 don't report any values back to the
core but directly expose them via sysfs ABI nodes.

I noticed the hwmon_device_register_with_info() could be actually
a good API to use since it has defined different sensor types and
more importantly the ops->read() interface, but the ina3221 driver
is very compact that there would be very little gain from this API
at this moment. However, maybe having trace event support would be
a good reason to apply this API.

What do you think about it? Any concern or better solution?

Thank you
Nicolin
