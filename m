Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:38849 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935320AbdIYO6Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 10:58:24 -0400
Date: Mon, 25 Sep 2017 07:58:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Binderman <dcb314@hotmail.com>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-4.14-rc2/drivers/hwmon/pmbus/pmbus_core.c:1086]: (style)
 Redundant condition
Message-ID: <20170925145821.GA29763@roeck-us.net>
References: <VI1PR0802MB23367050B5690DAC7D654F0B9C7A0@VI1PR0802MB2336.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0802MB23367050B5690DAC7D654F0B9C7A0@VI1PR0802MB2336.eurprd08.prod.outlook.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 25, 2017 at 01:54:02PM +0000, David Binderman wrote:
> 
> Hello there,
> 
> linux-4.14-rc2/drivers/hwmon/pmbus/pmbus_core.c:1086]: (style) Redundant condition: upper. '!upper || (upper && data->has_status_word)' is equivalent to '!upper || data->has_status_word'
> 
> Source code is
> 
>            (!upper || (upper && data->has_status_word)) &&
> 
Please feel free to submit a patch.

Thanks,
Guenter
