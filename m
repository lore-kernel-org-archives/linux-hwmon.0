Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33024 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbdAUQ6Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2017 11:58:16 -0500
Subject: Re: [PATCH] hwmon: (ltc4151) Export OF device ID table as module
 aliases
To: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-kernel@vger.kernel.org
References: <1484578347-12352-1-git-send-email-javier@osg.samsung.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4058bcec-7b53-bac0-22cc-443d82451807@roeck-us.net>
Date: Sat, 21 Jan 2017 08:58:09 -0800
MIME-Version: 1.0
In-Reply-To: <1484578347-12352-1-git-send-email-javier@osg.samsung.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/16/2017 06:52 AM, Javier Martinez Canillas wrote:
> The I2C core always reports a MODALIAS of the form i2c:<foo> even if the
> device was registered via OF, this means that exporting the OF device ID
> table device aliases in the module is not needed. But in order to change
> how the core reports modaliases to user-space, it's better to export it.
>
> Before this patch:
>
> $ modinfo drivers/hwmon/ltc4151.ko | grep alias
> alias:          i2c:ltc4151
>
> After this patch:
>
> $ modinfo drivers/hwmon/ltc4151.ko | grep alias
> alias:          i2c:ltc4151
> alias:          of:N*T*Clltc,ltc4151C*
> alias:          of:N*T*Clltc,ltc4151
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Applied to -next.

Thanks,
Guenter

