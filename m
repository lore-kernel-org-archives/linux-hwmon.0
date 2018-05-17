Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f48.google.com ([209.85.160.48]:44985 "EHLO
        mail-pl0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751150AbeEQAeh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 May 2018 20:34:37 -0400
Received: by mail-pl0-f48.google.com with SMTP id e6-v6so1388833plt.11
        for <linux-hwmon@vger.kernel.org>; Wed, 16 May 2018 17:34:37 -0700 (PDT)
Subject: Re: Units for measurements and page 1 temperature for LTM4676A
To: Rail Shafigulin <rail@esenciatech.com>, linux-hwmon@vger.kernel.org
References: <CAOLNbFZoEfG_unGXMpT76ShEyJNpAqWVos44PNFr4v_ZzT6Lww@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bded2e5b-5e38-6d15-3405-d3eee14f599d@roeck-us.net>
Date: Wed, 16 May 2018 17:34:33 -0700
MIME-Version: 1.0
In-Reply-To: <CAOLNbFZoEfG_unGXMpT76ShEyJNpAqWVos44PNFr4v_ZzT6Lww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/16/2018 02:39 PM, Rail Shafigulin wrote:
> My team is working on a custom board. We have LTM4676A on it. I'm trying to understand what are the units of measurement for a given register. For example:
> 
> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# ls -l
> total 0
> lrwxrwxrwx 1 root root    0 Apr 12 07:51 device -> ../../../1-0044
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_crit
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_crit_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_highest
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_lowest
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_min
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in1_min_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in1_reset_history
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_crit
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_crit_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_highest
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_lcrit
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_lcrit_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_max
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_min
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in2_min_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in2_reset_history
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_crit
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_crit_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_highest
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_lcrit_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_max
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_min
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in3_min_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in3_reset_history
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in4_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in4_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in4_reset_history
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in5_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in5_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in5_reset_history
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in6_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in6_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in6_reset_history
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in7_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in7_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in7_reset_history
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in8_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in8_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in8_reset_history
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in9_input
> -r--r--r-- 1 root root 4096 Apr 12 07:51 in9_label
> -rw-r--r-- 1 root root 4096 Apr 12 07:51 in9_reset_history
> -r--r--r-- 1 root root 4096 Apr 12 07:51 name
> drwxr-xr-x 2 root root    0 Apr 12 07:51 power
> lrwxrwxrwx 1 root root    0 Apr 12 07:51 subsystem -> ../../../../../../../../class/hwmon
> -rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_crit
> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_input
> -rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit
> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_lcrit_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:50 temp1_max
> -r--r--r-- 1 root root 4096 Apr 12 07:50 temp1_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 12 07:49 uevent
> 
> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat name
> ltm4676
> 
> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat in1_label
> vin
> 
> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat in1_input
> 11953
> 
> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0044/hwmon/hwmon2# cat temp1_input
> 40937
> 
> 
> What are the units of in1_input and temp1_input? Are those milli-volts (10^-3 V) and milli-celcius (10^-3 C)? Or these are raw values and I need to do a conversion?
> 

Please read Documentation/hwmon/sysfs-interface. Are the units listed
there ambiguous ?

The values are values as measured by the chip on the chip's input pins.

The output above is completely messed up. The chip doesn't have 9
voltage sensors. I have no idea how such output would be possible,
unless this is a different chip. An interesting detail is that the
output below (which looks at least almost ok) is from i2c address
0x41, while the output above is from i2c address 0x44, both on the
same bus. So, whatever the chips are, the output is not from the
same chip. This makes it quite difficult to compare.

Guenter

> LTM4676A and LTM4676 have 2 pages for reporting READ_TEMPERATURE_1 register. How do I change a page value? The LTM4676 driver also doesn't seem to be aware that there should be a READ_TEMPERATURE_2 register. At least I don't see it in sysfs.
> 
> I tried using a generic driver, pmbus, and here is what I got
> 
> root@custom-board:/sys/class/i2c-adapter/i2c-1/1-0041/hwmon/hwmon0# ls -l
> total 0
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_label
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr1_max
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr1_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr2_crit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_label
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr2_max
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr2_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr3_crit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_label
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 curr3_max
> -r--r--r-- 1 root root 4096 Apr 11 03:04 curr3_max_alarm
> lrwxrwxrwx 1 root root    0 Apr 11 03:04 device -> ../../../1-0041
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in1_crit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_label
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in1_min
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in1_min_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_crit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_label
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_lcrit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_lcrit_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_max
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in2_min
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in2_min_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_crit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_label
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_lcrit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_lcrit_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_max
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 in3_min
> -r--r--r-- 1 root root 4096 Apr 11 03:04 in3_min_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 name
> drwxr-xr-x 2 root root    0 Apr 11 03:04 power
> -r--r--r-- 1 root root 4096 Apr 11 03:04 power1_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 power1_label
> -r--r--r-- 1 root root 4096 Apr 11 03:04 power2_input
> -r--r--r-- 1 root root 4096 Apr 11 03:04 power2_label
> lrwxrwxrwx 1 root root    0 Apr 11 03:04 subsystem -> ../../../../../../../../class/hwmon
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_crit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_input
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_lcrit_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp1_max
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp1_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_crit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_crit_alarm
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_input
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_lcrit_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 temp2_max
> -r--r--r-- 1 root root 4096 Apr 11 03:04 temp2_max_alarm
> -rw-r--r-- 1 root root 4096 Apr 11 03:04 uevent
> 
> This one does seem to be aware that there is READ_TEMPERATURE_2 register, but when it comes to READ_TEMPERATURE_1 I see the same problem. How do I know for which page this is reported and what are the units?
> > Any help is appreciated.
> 
> -- 
> Rail Shafigulin
> Software Engineer
> Esencia Technologies
> 
> 
> *ESENCIA TECHNOLOGIES, INC.
> *2350 Mission College Blvd. Suite #490
> Santa Clara CA 95054
> ________________________________________________________
> 
> Phone: +1 408 736 8284 Fax: +1 408 519 3475
> http://www.esenciatech.com <http://www.esenciatech.com/>| http://www.lnttechservices.com <http://www.lnttechservices.com/>
> 
> 

