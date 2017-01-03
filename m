Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47482 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752064AbdACEZW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Jan 2017 23:25:22 -0500
Subject: Re: hwmon: w83781d: Unused sysfs group w83781d_group_other
To: Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Jean Delvare <jdelvare@suse.com>
References: <1483393793-28724-1-git-send-email-khoroshilov@ispras.ru>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <413f33a6-8e6e-29e4-d249-b941d59017fe@roeck-us.net>
Date: Mon, 2 Jan 2017 20:25:17 -0800
MIME-Version: 1.0
In-Reply-To: <1483393793-28724-1-git-send-email-khoroshilov@ispras.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/02/2017 01:49 PM, Alexey Khoroshilov wrote:
> Hello,
>
> w83781d.c contains a definition of sysfs group:
>
> static const struct attribute_group w83781d_group_other = {
> 	.attrs = w83781d_attributes_other,
> };
>
> the only usage of which is:
>
> static void w83781d_remove_files(struct device *dev)
> {
> 	...
> 	sysfs_remove_group(&dev->kobj, &w83781d_group_other);
> }
>
> So, it seems the group should be either created in w83781d_create_files() or removed completely.
> What do you think?
>

If you look very closely, you'll see that the attributes are created individually
using  device_create_file(). Given that, removing the group might not be such a
good idea.

Yes, this is messy. If you have the time, feel free to convert the driver to use
hwmon_device_register_with_groups() or, even better, hwmon_device_register_with_info().

Thanks,
Guenter

