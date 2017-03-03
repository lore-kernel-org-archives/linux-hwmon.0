Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51939 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751518AbdCCC4q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Mar 2017 21:56:46 -0500
Subject: Re: Conversion of w83627ehf to hwmon_device_register_with_info ?
To: =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>,
        linux-hwmon@vger.kernel.org
References: <201703030133.01363.PeterHuewe@gmx.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bb297d0e-e87a-83a9-7a2a-9cc0e6f51164@roeck-us.net>
Date: Thu, 2 Mar 2017 18:56:01 -0800
MIME-Version: 1.0
In-Reply-To: <201703030133.01363.PeterHuewe@gmx.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Peter,

On 03/02/2017 04:33 PM, Peter Hüwe wrote:
> Hi,
>
> is anybody else working on the conversion of the w83627ehf to the new
> hwmon_device_register_with_info interface?
>
I don't think so.

> Otherwise I will probably update the driver to this interface within the next
> days - but since it's a lot of work I wanted to check for duplication first.
>
Go ahead. I would suggest to drop nct6775/nct6776 support to simplify the code
when you do that. Maybe as separate commit, though.

> Do you think it makes sense to introduce a hwmon_sensor_types for "intrusion"
> as well? - there are currently 8 drivers who offer that interface.
>
I don't really like the idea of introducing another type for just one attribute,
but it might be the easiest and most consistent approach. Feel free to submit
a patch to add it.

Guenter

