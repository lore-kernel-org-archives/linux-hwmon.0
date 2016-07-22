Return-path: <michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 22 Jul 2016 13:09:56 +0200
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: adt7411: external thermal diode support
Message-ID: <aac86af3ebfe30bf306955c62470d797@walle.cc>
List-ID: <linux-hwmon@vger.kernel.org>

Hi,

I'm looking into adding support for the external thermal diode. On the 
ADT7411 you can either use AIN1 and AIN2 to measure voltages or use the 
two input to measure temperature via a thermal diode. As far as I 
understand it, the sysfs attributes have to be created dynamically, eg. 
either create the in1_input and in2_input or temp2_input depending on 
the mode. All current drivers (besides coretemp) use 
devm_hwmon_device_register_with_groups() which has a static set of 
groups, but registers its attributes in 
/sys/class/hwmon/hwmonN/<attribute>. Drivers which use some kind of 
dynamic attributes use sysfs_create_group(<underlying device>) and 
hwmon_device_register(), where the attributes are visible at 
/sys/class/hwmon/hwmonN/device/<attribute>.

/sys/class/hwmon/<attribute> is the preferred/new method, isn't it? If I 
add support for the the thermal diode I would have to switch the adt7411 
driver to the old method, right? So, I guess this is a bad way to do it. 
Do you have any hints for me?

What entity should configure the external mode? Eg. the bootloader might 
set the EXT_TDM bit or the linux kernel could enable it depending on 
some DTS property.

Thanks,
-michael
