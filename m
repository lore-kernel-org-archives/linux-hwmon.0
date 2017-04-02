Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38923 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbdDBLmM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Apr 2017 07:42:12 -0400
Subject: Re: [PATCH v5 0/2] lm87 configuration from dts
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
References: <20170330230100.989-1-chris.packham@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <131917c9-fa68-1075-7582-23e0d60415ff@roeck-us.net>
Date: Sun, 2 Apr 2017 04:42:09 -0700
MIME-Version: 1.0
In-Reply-To: <20170330230100.989-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/30/2017 04:00 PM, Chris Packham wrote:
> I've picked these changes up from Mahoda to hopefully get them landed
> upstream.
>
> Technically this is v5 of the documentation patch and v3 of the driver
> changes but I'm bundling them as v5 of the series.
>
> Mahoda Ratnayaka (2):
>   Documentation: dtb: lm87: Add hwmon binding documentation
>   lm87: Allow channel data to be set from dts file
>
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 30 ++++++++++++++++++++++++
>  drivers/hwmon/lm87.c                             | 23 ++++++++++++++++--
>  2 files changed, 51 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
>
Series applied.

Thanks,
Guenter

