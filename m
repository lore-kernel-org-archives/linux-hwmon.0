Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36902 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752096AbeCQBxm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Mar 2018 21:53:42 -0400
Subject: Re: [PATCH v7 0/2] hwmon: (ucd9000) Add gpio and debugfs interfaces
To: Eddie James <eajames@linux.vnet.ibm.com>,
        linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com, joel@jms.id.au
References: <1521235326-24310-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a7aab7e3-4ebc-c816-f50e-4c6f06e89e95@roeck-us.net>
Date: Fri, 16 Mar 2018 18:53:40 -0700
MIME-Version: 1.0
In-Reply-To: <1521235326-24310-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/16/2018 02:22 PM, Eddie James wrote:
> The ucd9000 series chips have gpio pins. Add a gpio chip interface to the ucd
> device so that users can query and set the state of the gpio pins.
> 
> Add a debugfs interface using the existing pmbus debugfs directory to provide
> MFR_STATUS and the status of the gpi faults to users.
> 

Series applied to hwmon-next. Thanks a lot for your patience.

Guenter

> Changes since v6:
>   - don't return null terminator for mfr_status
> 
> Changes since v5:
>   - enclose gpio code in #ifdef GPIOLIB
>   - don't initialize buffers for mfr_status; set last char to 0 instead
>   - cap the size argument to bin2hex
> 
> Changes since v4:
>   - max-sized buffers for smbus transfers
>   - used bin2hex instead of my own code
> 
> Changes since v3:
>   - remove setting of gpio_chip->owner
>   - format the mfr_status data
>   - switch to #ifdef rather than #if IS_ENABLED for debugfs
> 
> Changes since v2:
>   - split the gpio registration into it's own function
> 
> Changes since v1:
>   - dropped dev_err messages
>   - made gpio chip registration conditional on having gpio pins
>   - made mfr_status debugfs attribute more simple
> 
> 
> Christopher Bostic (2):
>    hwmon: (ucd9000) Add gpio chip interface
>    hwmon: (ucd9000) Add debugfs attributes to provide mfr_status
> 
>   drivers/hwmon/pmbus/ucd9000.c | 350 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 349 insertions(+), 1 deletion(-)
> 

