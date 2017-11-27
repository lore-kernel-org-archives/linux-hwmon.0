Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:39971 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753078AbdK0QG5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Nov 2017 11:06:57 -0500
Received: by mail-pf0-f194.google.com with SMTP id q63so6248380pfd.7
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2017 08:06:57 -0800 (PST)
Date: Mon, 27 Nov 2017 08:06:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, mspinler@linux.vnet.ibm.com
Subject: Re: Overflow the hwmon API restricted to 32 bit signed integers
Message-ID: <20171127160655.GB16884@roeck-us.net>
References: <045ffd41-794b-f734-0ab1-550f688742c9@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <045ffd41-794b-f734-0ab1-550f688742c9@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 27, 2017 at 09:54:44AM -0600, Eddie James wrote:
> Hi Guenter,
> 
> We're having a problem with overflowing signed 32 bit integers for reading
> some hwmon attributes:
> 
> struct hwmon_ops { umode_t (*is_visible)(const void *drvdata, enum
> hwmon_sensor_types type, u32 attr, int channel); int (*read)(struct device
> *dev, enum hwmon_sensor_types type, u32 attr, int channel, long *val); int
> (*read_string)(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> int channel, const char **str); int (*write)(struct device *dev, enum
> hwmon_sensor_types type, u32 attr, int channel, long val); };
> 
> Specifically, power values in micro-watts (about 2200 watts will overflow
> the value - imagine multiple processors and a number of GPUs...). What do
> you suggest in this case?
> 
> This is relevant for our OCC driver; thanks for the comments btw. In our OCC
> driver, we have custom sysfs entries for power, and so can return a string
> with "%llx" to deal with this. But of course, the user space client, based
> on the hwmon API, can't handle it.
> 
> Appreciate any suggestions.
> 
The easiest solution might be to expand the API with an optional function
pointer to return 64 bit values. The hwmon core would then call either one
or the other function.

Guenter

> Thanks,
> Eddie
> 
