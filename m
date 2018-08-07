Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.1]:16057 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727429AbeHGReS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Aug 2018 13:34:18 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/4] hwmon: (adt7475) Add error handling for update function
Date: Wed,  8 Aug 2018 00:19:05 +0900
Message-Id: <20180807151909.24433-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Currently the device update function does not care the I2C SMBus error.
This causes a spurious sensor warining detection by sensor application.
To prevent this issue add error handling for the update function.
Also change the show functions to return error pointer value.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org

Tokunori Ikegami (4):
  hwmon: (adt7475) Split device update function to measure and limits
  hwmon: (adt7475) Change valid parameter to bool type
  hwmon: (adt7475) Change update functions to add error handling
  hwmon: (adt7475) Change show functions to return error data correctly

 drivers/hwmon/adt7475.c | 346 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 250 insertions(+), 96 deletions(-)

-- 
2.16.1

