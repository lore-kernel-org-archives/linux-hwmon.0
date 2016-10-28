Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33246 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752947AbcJ1ORD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Oct 2016 10:17:03 -0400
Subject: Re: [PATCH v2] lm87: Use hwmon to create the sysfs groups
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
References: <20161026165659.GA13461@obsidianresearch.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d5e4a692-b447-c875-d074-836cffb413ac@roeck-us.net>
Date: Fri, 28 Oct 2016 07:16:59 -0700
MIME-Version: 1.0
In-Reply-To: <20161026165659.GA13461@obsidianresearch.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/26/2016 09:56 AM, Jason Gunthorpe wrote:
> This is the expected thing for a hwmon driver to do, this changes
> the sysfs paths from, say:
>
>   /sys/bus/i2c/devices/0-002c/temp1_input
>
> to:
>
>   /sys/bus/i2c/devices/0-002c/hwmon/hwmon0/temp1_input
>
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> ---

Applied to hwmon-next.

Thanks,
Guenter

