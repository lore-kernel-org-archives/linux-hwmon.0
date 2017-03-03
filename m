Return-path: <PeterHuewe@gmx.de>
From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
To: linux-hwmon@vger.kernel.org
Subject: Conversion of w83627ehf to hwmon_device_register_with_info ?
Date: Fri, 3 Mar 2017 01:33:01 +0100
Cc: Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201703030133.01363.PeterHuewe@gmx.de>
List-ID: <linux-hwmon@vger.kernel.org>

Hi,

is anybody else working on the conversion of the w83627ehf to the new 
hwmon_device_register_with_info interface? 

Otherwise I will probably update the driver to this interface within the next 
days - but since it's a lot of work I wanted to check for duplication first.

Do you think it makes sense to introduce a hwmon_sensor_types for "intrusion" 
as well? - there are currently 8 drivers who offer that interface.

Thanks,
Peter
