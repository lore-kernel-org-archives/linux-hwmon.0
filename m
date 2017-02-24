Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54336
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751265AbdBXNOg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 08:14:36 -0500
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dirk Eibach <eibach@gdsys.de>
Subject: [PATCH 00/19] hwmon: Add OF device table to I2C drivers that are missing it
Date: Fri, 24 Feb 2017 10:12:53 -0300
Message-Id: <20170224131313.953-1-javier@osg.samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

This series add OF device ID tables to hwmon I2C drivers whose devices are
either used in Device Tree source files or are listed in binding docs as a
compatible string.

That's done because the plan is to change the I2C core to report proper OF
modaliases instead of always reporting a MODALIAS=i2c:<foo> regardless if
a device was registered via DT or using the legacy platform data.

So these patches will make sure that hwmon I2C drivers will continue to be
able to module auto-load once the I2C core is changed.

Best regards,
Javier


Javier Martinez Canillas (19):
  hwmon: (ad7414) Add OF device ID table
  hwmon: (adc128d818) Add OF device ID table
  hwmon: (ads1015) Add OF device ID table
  hwmon: (ads7828) Add OF device ID table
  hwmon: (adt7475) Add OF device ID table
  hwmon: (ina209) Add OF device ID table
  hwmon: (ina2xx) Add OF device ID table
  hwmon: (lm63) Add OF device ID table
  hwmon: (lm75) Add OF device ID table
  hwmon: (lm85) Add OF device ID table
  hwmon: (lm90) Add OF device ID table
  hwmon: (lm95245) Add OF device ID table
  hwmon: (max6697) Add OF device ID table
  hwmon: (ucd9000) Add OF device ID table
  hwmon: (ucd9200) Add OF device ID table
  hwmon: (stts751) Add OF device ID table
  hwmon: (tmp102) Add OF device ID table
  hwmon: (tmp103) Add OF device ID table
  hwmon: (tmp421) Add OF device ID table

 drivers/hwmon/ad7414.c        |   7 +++
 drivers/hwmon/adc128d818.c    |   7 +++
 drivers/hwmon/ads1015.c       |  22 +++++++++-
 drivers/hwmon/ads7828.c       |  24 +++++++++-
 drivers/hwmon/adt7475.c       |  31 ++++++++++++-
 drivers/hwmon/ina209.c        |   7 +++
 drivers/hwmon/ina2xx.c        |  35 ++++++++++++++-
 drivers/hwmon/lm63.c          |  23 ++++++++++
 drivers/hwmon/lm75.c          |  98 ++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/lm85.c          |  56 ++++++++++++++++++++++-
 drivers/hwmon/lm90.c          | 100 +++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/lm95245.c       |   8 ++++
 drivers/hwmon/max6697.c       |  52 +++++++++++++++++++++-
 drivers/hwmon/pmbus/ucd9000.c |  39 +++++++++++++++-
 drivers/hwmon/pmbus/ucd9200.c |  48 +++++++++++++++++++-
 drivers/hwmon/stts751.c       |   7 +++
 drivers/hwmon/tmp102.c        |   7 +++
 drivers/hwmon/tmp103.c        |   7 +++
 drivers/hwmon/tmp421.c        |  35 ++++++++++++++-
 19 files changed, 601 insertions(+), 12 deletions(-)

-- 
2.9.3

