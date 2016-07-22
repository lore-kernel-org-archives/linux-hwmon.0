Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37840 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753543AbcGVNV4 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 22 Jul 2016 09:21:56 -0400
Subject: Re: adt7411: external thermal diode support
To: Michael Walle <michael@walle.cc>
References: <aac86af3ebfe30bf306955c62470d797@walle.cc>
Cc: linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57921DF2.1040704@roeck-us.net>
Date: Fri, 22 Jul 2016 06:21:54 -0700
MIME-Version: 1.0
In-Reply-To: <aac86af3ebfe30bf306955c62470d797@walle.cc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/22/2016 04:09 AM, Michael Walle wrote:
> Hi,
>
> I'm looking into adding support for the external thermal diode. On the ADT7411 you can either use AIN1 and AIN2 to measure voltages or use the two input to measure temperature via a thermal diode. As far as I understand it, the sysfs attributes have to be created dynamically, eg. either create the in1_input and in2_input or temp2_input depending on the mode. All current drivers (besides coretemp) use devm_hwmon_device_register_with_groups() which has a static set of groups, but registers its attributes in /sys/class/hwmon/hwmonN/<attribute>. Drivers which use some kind of dynamic attributes use sysfs_create_group(<underlying device>) and hwmon_device_register(), where the attributes are visible at /sys/class/hwmon/hwmonN/device/<attribute>.

Do not use hwmon_device_register().

>
> /sys/class/hwmon/<attribute> is the preferred/new method, isn't it? If I add support for the the thermal diode I would have to switch the adt7411 driver to the old method, right? So, I guess this is a bad way to do it. Do you have any hints for me?

Either use multiple groups, and select the groups to use in the probe function,
or one group and the is_visible() callback.

>
> What entity should configure the external mode? Eg. the bootloader might set the EXT_TDM bit or the linux kernel could enable it depending on some DTS property.
>
Both are fine, though it would not normally be the bootloader but the BIOS or ROMMON.
Other possible methods would be to use platform data or ACPI.

Guenter

