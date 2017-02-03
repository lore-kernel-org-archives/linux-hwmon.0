Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43397 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbdBCNeJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Feb 2017 08:34:09 -0500
Subject: Re: [PATCH v6 1/2] hwmon: new driver for ST stts751 thermal sensor
To: Andrea Merello <andrea.merello@gmail.com>,
        linux-hwmon@vger.kernel.org
References: <1486021444-9429-1-git-send-email-andrea.merello@gmail.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5c29386d-bc39-5e31-d972-f17290aa7d98@roeck-us.net>
Date: Fri, 3 Feb 2017 05:34:06 -0800
MIME-Version: 1.0
In-Reply-To: <1486021444-9429-1-git-send-email-andrea.merello@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/01/2017 11:44 PM, Andrea Merello wrote:
> This patch adds a HWMON driver for ST Microelectronics STTS751
> temperature sensors.
>
> Changes since V3:
> - fix sysfs_notify() filename
> - simplify error exit path in stts751_update_temp(): kill useless goto
> - fix set function were racy due to lock incorrectly placed
> - use msecs_to_jiffies instead of manual calculation
> - fix jiffies and msecs were mixed up
> - don't mark cache as good unless reads really succeded to fill up it
> - when updating therm, hyst keeps relative value rather than abs value
> - don't should in dev_dbg when chip is detected
> - don't ever generate two uevents
> - clarify clear-on-read behaviour of status reg alarm flags
> - simplify mDEG to HW conversion function
> - fix chip stops due to incorrect resolution configuration
> - fix incorrectly reading negative numbers from HW
>
> Changes since V4:
> - fix continuation lines (style, remove uncecessary, ..)
> - shorten a unnecessary verbose dev_warn() message
> - fix set_interval() exitpath didn't return error
> - change uncecesary neg-logic
> - change file symbolic permissions with octal
> - move chip revision test in probe(), change dev_notice() in dev_dbg()
> - use "return 0" on success (non functional change)
> - add further checks in i2c detect function
> - fix i2c detect function read wrong reg while checking for manufacturer ID
>
> Changes since V5:
> - fix mixed usage of i2c dev and hwmon dev for logging functions
> - avoid max/min alert log spam
>
> Thanks-to: LABBE Corentin [for suggestions]
> Thanks-to: Guenter Roeck [for suggestion and discussions]
> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>

Applied to hwmon-next.

Guenter

