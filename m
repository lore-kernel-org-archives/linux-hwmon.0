Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:39910 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755672AbdCLKe1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2017 06:34:27 -0400
Date: Sun, 12 Mar 2017 10:34:13 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Subject: it87 causes VIA hardware to lockup
Message-ID: <20170312103413.GJ21222@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

I recently upgraded a machine that backs up data at a club from a
2.6.30 based distribution to 4.8.0 based distribution, and I find
that modprobing the it87 sensor driver on 4.8.0 causes the machine
to lockup.

Unfortunately, as far as I'm aware, there is no kernel oops or
kernel messages, it just locks the machine up such that it requires
a power cycle.

With 2.6.30, it was possible to modprobe the driver and lm_sensors
would then read out the fan and temperature information (which is
necessary to monitor the head-less machine that is otherwise buried
in an area that hardly anyone goes.)

it87-isa-0290
Adapter: ISA adapter
in0:         +1.60 V  (min =  +0.00 V, max =  +4.08 V)
in1:         +2.50 V  (min =  +0.00 V, max =  +4.08 V)
in2:         +3.34 V  (min =  +0.00 V, max =  +4.08 V)
in3:         +2.29 V  (min =  +0.00 V, max =  +4.08 V)
in4:         +3.14 V  (min =  +0.00 V, max =  +4.08 V)
in5:         +2.72 V  (min =  +0.00 V, max =  +4.08 V)
in6:         +2.11 V  (min =  +0.00 V, max =  +4.08 V)
in7:         +2.10 V  (min =  +0.00 V, max =  +4.08 V)
Vbat:        +0.00 V
fan1:       3245 RPM  (min =    0 RPM, div = 8)
fan2:          0 RPM  (min =    0 RPM, div = 8)
temp1:        +9.0 C  (low  = +127.0 C, high = +127.0 C)  sensor = thermistor
temp2:        +5.0 C  (low  = +127.0 C, high = +127.0 C)  sensor = thermistor
temp3:       +27.0 C  (low  = +127.0 C, high = +127.0 C)  sensor = thermal diode

Looking at the changes between the two kernels, I'd imagine that
unconditionally touching the registers at 0x4e/0x4f (which the
driver never used to do) is upsetting the bridges, causing the
machine to lock up.

Unfortuantely, I'm unable to "play" with the machine, as my only
access to it is remotely, and locking the machine up at this stage
would mean (a) that it's no longer able to do its job, and (b) it
would require visiting the machine physically to power cycle it.

Obviously, bisecting over such a large range of kernels is also
out as that would require causing the machine to lockup in order
to test failure, something I can't risk remotely.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
