Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mailcluster2.itpays.net ([193.107.29.212]:45971 "EHLO
        mailcluster2.itpays.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934759AbcKWJ1d (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2016 04:27:33 -0500
Received: from [10.10.48.149] (unknown [195.159.183.42])
        by mailcluster2.itpays.net (Postfix) with ESMTPA id DA3683199579
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Nov 2016 09:44:23 +0100 (CET)
From: Martin Etnestad <martin.etnestad@appeartv.com>
Subject: Concerns re: sensor count in adt7470_read_temperatures()
To: linux-hwmon@vger.kernel.org
Message-ID: <02d36c1c-0939-27fd-457c-ba07256bcb1f@appeartv.com>
Date: Wed, 23 Nov 2016 09:44:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

I believe I have found an issue with adt7470_read_temperatures() and am 
looking for input from anyone familiar with the driver.

The sensor counting in said function treats a temperature reading of 
0x00 as meaning there is no sensor.
It happens on this line:
https://github.com/groeck/linux/blob/master/drivers/hwmon/adt7470.c#L253

The device manual states that 0x00 is the default value for the 
temperature registers, so I would indeed expect that value if there is 
no corresponding sensor.
But it also seems clear to me that 0x00 is in fact a valid temperature 
reading, and one that we must allow for.
For reference, see " TEMPERATURE DATA FORMAT" on page 14 of the device 
manual here:
http://www.analog.com/media/en/technical-documentation/data-sheets/ADT7470.pdf

Hence, I think the safest approach is to _not_ attempt to count/detect 
the number of sensors, but simply initialize the count to the maximum 
(ADT7470_TEMP_COUNT) in adt7470_probe().
The number of sensors can be explicitly set after probe.

Am I missing something?
Would this be an acceptable change?

     -Martin

