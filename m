Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, mspinler@linux.vnet.ibm.com
From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Overflow the hwmon API restricted to 32 bit signed integers
Date: Mon, 27 Nov 2017 09:54:44 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <045ffd41-794b-f734-0ab1-550f688742c9@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

We're having a problem with overflowing signed 32 bit integers for 
reading some hwmon attributes:

struct hwmon_ops { umode_t (*is_visible)(const void *drvdata, enum 
hwmon_sensor_types type, u32 attr, int channel); int (*read)(struct 
device *dev, enum hwmon_sensor_types type, u32 attr, int channel, long 
*val); int (*read_string)(struct device *dev, enum hwmon_sensor_types 
type, u32 attr, int channel, const char **str); int (*write)(struct 
device *dev, enum hwmon_sensor_types type, u32 attr, int channel, long 
val); };

Specifically, power values in micro-watts (about 2200 watts will 
overflow the value - imagine multiple processors and a number of 
GPUs...). What do you suggest in this case?

This is relevant for our OCC driver; thanks for the comments btw. In our 
OCC driver, we have custom sysfs entries for power, and so can return a 
string with "%llx" to deal with this. But of course, the user space 
client, based on the hwmon API, can't handle it.

Appreciate any suggestions.

Thanks,
Eddie
