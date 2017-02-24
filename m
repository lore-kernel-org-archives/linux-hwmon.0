Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40433 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751163AbdBXSLK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Feb 2017 13:11:10 -0500
Subject: Re: [PATCH 00/19] hwmon: Add OF device table to I2C drivers that are
 missing it
To: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-kernel@vger.kernel.org
References: <20170224131313.953-1-javier@osg.samsung.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Dirk Eibach <eibach@gdsys.de>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4ac3e71b-448f-0995-4dd7-5bc9a70bca6b@roeck-us.net>
Date: Fri, 24 Feb 2017 09:10:38 -0800
MIME-Version: 1.0
In-Reply-To: <20170224131313.953-1-javier@osg.samsung.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/24/2017 05:12 AM, Javier Martinez Canillas wrote:
> Hello,
>
> This series add OF device ID tables to hwmon I2C drivers whose devices are
> either used in Device Tree source files or are listed in binding docs as a
> compatible string.
>
> That's done because the plan is to change the I2C core to report proper OF
> modaliases instead of always reporting a MODALIAS=i2c:<foo> regardless if
> a device was registered via DT or using the legacy platform data.
>
> So these patches will make sure that hwmon I2C drivers will continue to be
> able to module auto-load oncethe I2C core is changed.

Series applied to hwmon-next.

Thanks,
Guenter

