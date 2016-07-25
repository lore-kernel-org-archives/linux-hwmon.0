Return-path: <jdelvare@suse.de>
Date: Mon, 25 Jul 2016 10:53:38 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrea Scopece <andrea.scopece@gmx.com>, linux-hwmon@vger.kernel.org
Subject: Re: contact / hwmon
Message-ID: <20160725105338.13b6d8ec@endymion>
In-Reply-To: <20160615184056.GA17538@roeck-us.net>
References: <20160615140308.0afb61e6@gmx.com>
	<20160615184056.GA17538@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 15 Jun 2016 11:40:56 -0700, Guenter Roeck wrote:
> On Wed, Jun 15, 2016 at 02:03:08PM +0200, Andrea Scopece wrote:
> > 
> > Hello,
> > 
> > my system is afflicted from a small bug, from a long time, and I have no idea
> > where to report it.
> > 
> > Just found your email address on github, linked to hwmon related commits, so 
> > I decided to write to you directly, hope this is not much of problem.
> > If I did it wrong, my apologies, and if you can please direct me to the right
> > place.
> > 
> > 
> > The bug:
> > 
> > I'm using a "conky" panel to monitor some parameters, among them the CPU
> > temps.
> > 
> > What is happening is that upon reboot, sometimes the temps display correctly,
> > sometimes not. (by reboot, I mean also complete power off / power on
> > sequence).
> > 
> > I did a bit of research and found that the hwmon instance sometime is
> > enumerated as 0 and sometimes as 1 ... both works but obviously when I make a
> > constant reference in conky, say "hwmon 0" it work only half of the times.
> > 
> > These are the involved parameters:
> > sometimes as:
> > /sys/devices/virtual/hwmon/hwmon0/temp1_input
> > /sys/devices/virtual/hwmon/hwmon0/temp1_label
> > /sys/devices/virtual/hwmon/hwmon0/temp2_input
> > /sys/devices/virtual/hwmon/hwmon0/temp2_label
> > 
> > sometimes as:
> > /sys/devices/virtual/hwmon/hwmon1/temp1_input
> > /sys/devices/virtual/hwmon/hwmon1/temp1_label
> > /sys/devices/virtual/hwmon/hwmon1/temp2_input
> > /sys/devices/virtual/hwmon/hwmon1/temp2_label
> > 
> > 
> > coretemp enumeration show the same behavior:
> > /sys/devices/platform/coretemp.0
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp3_input
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp3_label
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_crit_alarm
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_crit
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp3_crit
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp3_crit_alarm
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_max
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp3_max
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_input
> > /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_label
> > 
> > sometimes as:
> > /sys/devices/platform/coretemp.0
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_input
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_label
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_crit_alarm
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_crit
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_crit
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_crit_alarm
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_max
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_max
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_input
> > /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_label
> 
> Unfortunately, that is a "feature". Numbering is determined by the module
> load order. hwmon0 is the first registered hwmon device, hwmon1 is the next,
> and so on. Since the module load order is not fixed, device name assignments
> are not fixed either.
> 
> This is quite similar to network device naming problems; unfortunately
> the solution applied there (using udev to select fixed names) does not work
> with non-network devices.
> 
> I know this is very annoying, but right now I don't have a good idea
> how to solve it.

libsensors provides stable names for monitoring devices. conky should
simply use it.

-- 
Jean Delvare
SUSE L3 Support
