Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49652 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752182AbcEVP2k (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 22 May 2016 11:28:40 -0400
Date: Sun, 22 May 2016 08:28:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Andy Lutomirski <luto@kernel.org>, Jethro <xtompok@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Experimental PATCH] dell-smm-hwmon: Add support for disabling
 automatic BIOS fan control
Message-ID: <20160522152823.GA18331@roeck-us.net>
References: <1463917836-12985-1-git-send-email-pali.rohar@gmail.com>
 <5741CA70.9070100@roeck-us.net>
 <201605221717.26604@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201605221717.26604@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, May 22, 2016 at 05:17:26PM +0200, Pali Rohár wrote:
> On Sunday 22 May 2016 17:04:16 Guenter Roeck wrote:
> > On 05/22/2016 04:50 AM, Pali Rohár wrote:
> > > This patch exports standard hwmon pwmX_enable sysfs attribute for
> > > enabling or disabling automatic fan control by BIOS. Standard
> > > value "1" is for disabling automatic BIOS fan control and value
> > > "2" for enabling.
> > > 
> > > Currently there is no way to check if BIOS auto mode is enabled (at
> > > least it is not know how to do it), so hwmon sysfs attribute is
> > > write-only.
> > 
> > You could cache the mode and report it after it was set, and define
> > '0' as read value for 'unknown'.
> 
> I was thinking about it, but there is problem, that userspace can also 
> update/change BIOS auto mode. Process with CAP_SYS_RAWIO can use 
> sys_iopl(3) or sys_ioperm() which allows it access to I/O ports. There 
> are already different i8k* userspace tools which do that. And once 
> userspace change BIOS auto mode, then cached value in kernel does not 
> have to be correct and can confuse other applications which use standard 
> hwmon interface (not direct I/O ports).
> 
> And value '0' is already defined in hwmon API as:
> "no fan speed control (i.e. fan at full speed)"
> 
Ok.

> > > +static ssize_t i8k_hwmon_set_pwm_enable(struct device *dev,
> > > +					struct device_attribute *attr,
> > > +					const char *buf, size_t count)
> > > +{
> > > +	int err;
> > > +	bool enable;
> > > +	unsigned long val;
> > > +
> > > +	err = kstrtoul(buf, 10, &val);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (val == 0)
> > > +		return -EINVAL;
> > > +
> > > +	enable = (val != 1);
> > > +
> > 
> > Please accepted only explicit values (1 and 2).
> 
> In Documentation/hwmon/sysfs-interface is written:
> 
> pwm[1-*]_enable
> 		2+: automatic fan speed control enabled
> 
> And this reason why my patch accept also other numeric values.
> 
> If other values does not make sense, maybe update documentation file?
> 

The idea behind 2+ is that there can be multiple automatic fan speed modes.
Which modes are actually supported, and what those modes mean, is then
commonly described in the driver documentation.

It does not mean (or is not supposed to mean) that random values shall
be accepted.

Of course that assumes that a driver documentation actually exists,
which AFAICS is not the case for dell-smm-hwmon. Maybe it would make
sense to add one ?

Thanks,
Guenter
