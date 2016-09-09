Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51013 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbcIIESK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2016 00:18:10 -0400
Subject: Re: [PATCH 1/2] hwmon: (max6650) Allow fan shutdown and initial rpm
 target
To: Mike Looijmans <mike.looijmans@topic.nl>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <1471334034-14894-1-git-send-email-mike.looijmans@topic.nl>
 <c47e4482-a8e0-6a38-cccb-062b667587ac@roeck-us.net>
 <57B6A8BF.2080508@topic.nl>
 <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3712d00f-589e-f264-4df0-4ab6e7dc61a1@roeck-us.net>
Date: Thu, 8 Sep 2016 21:18:07 -0700
MIME-Version: 1.0
In-Reply-To: <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/24/2016 01:13 AM, Mike Looijmans wrote:
> The fan can be stopped by writing "3" to pwm1_enable in sysfs.
>
> Add devicetree property for early initialization of the fan controller
> to prevent overheating, for example when resetting the board while the
> fan was completely turned off.
>
> Also improve error reporting, I2C failures were ignored while writing
> new values.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>


Applied to hwmon-next.

Thanks,
Guenter


