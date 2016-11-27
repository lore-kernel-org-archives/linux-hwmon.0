Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49237 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752752AbcK0CS6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Nov 2016 21:18:58 -0500
Subject: Re: [PATCH 0/3] Texas Instruments TMP108 temperature sensor driver.
To: John Muir <john@jmuir.com>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
Cc: John Muir <muirj@google.com>, Anatol Pomazau <anatol@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <acdc4999-2f89-3945-1758-35a7fae41db7@roeck-us.net>
Date: Sat, 26 Nov 2016 18:18:54 -0800
MIME-Version: 1.0
In-Reply-To: <1480209983-65915-1-git-send-email-john@jmuir.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/26/2016 05:26 PM, John Muir wrote:
> This driver is split into three patches as it is being ported forward from
> a Linux 4.4 implementation where it was tested. The final driver code uses
> interfaces that are not available in 4.4.
>
> John Muir (3):
>   hwmon: Add Texas Instruments TMP108 temperature sensor driver.
>   hwmon: tmp108: Use devm variants of registration interfaces.
>   hwmon: tmp108: Update driver to use hwmon_chip_info.
>
>  Documentation/devicetree/bindings/hwmon/tmp108.txt |  27 ++
>  Documentation/hwmon/tmp108                         |  38 ++
>  drivers/hwmon/Kconfig                              |  11 +
>  drivers/hwmon/Makefile                             |   1 +
>  drivers/hwmon/tmp108.c                             | 421 +++++++++++++++++++++
>  5 files changed, 498 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt
>  create mode 100644 Documentation/hwmon/tmp108
>  create mode 100644 drivers/hwmon/tmp108.c
>

Hi John,

maybe the rest of the patches are delayed, but so far I only see this introduction.
Just an early note, in case the other patches still show up.

Can you send me a register dump for this chip ?

Thanks,
Guenter

