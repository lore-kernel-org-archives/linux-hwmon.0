Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39274 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940590AbdAJRRg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jan 2017 12:17:36 -0500
Date: Tue, 10 Jan 2017 09:17:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Koch <mail@alexanderkoch.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Michael Hornung <mhornung.linux@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] hwmon: adc128d818: Support missing operation modes
Message-ID: <20170110171733.GA15339@roeck-us.net>
References: <20170106103817.11588-1-mail@alexanderkoch.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170106103817.11588-1-mail@alexanderkoch.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jan 06, 2017 at 11:38:13AM +0100, Alexander Koch wrote:
> The ADC128D818 offers four different chip operation modes which vary in the
> number and measurement types of the available input signals (see datasheet
> sec. 8.4.1).
> 
> The current version of the driver only supports the default chip operation
> mode (mode 0), providing seven analog values and a temperature reading.
> 
> This patch series adds support for operation modes 1-3, selectable through
> the device tree attribute 'ti,mode':
> 
>         adc1: adc128d818@1d {
>                 compatible = "ti,adc128d818";
>                 reg = <0x1d>;
>                 mode = <1>;
>         };
> 
> The changes are transparent as the driver defaults to keeping the currently
> active operation mode if no mode is specified via device tree (which is
> mode 0 on chip initialization).
> 
> 
> Changes from v2:
>  - Omit device attribute refactoring (for checkpatch.pl), as requested by
>    maintainer
>  - Add vendor prefix 'ti,' for mode property in device tree
>  - Drop size indication for mode property in device tree
>  - Preserve chip operation mode if none specified in devicetree
>  - Fix missing '\n' in dev_err() calls
> 
> Changes from v1:
>  - Add bindings document as first patch
>  - Preserve logical atomicity of code changes
>  - Improve sysfs device node handling (use is_visible() instead of
>    duplicate attribute list)
>  - Add trivial code refactoring stage for checkpatch.pl to succeed
> 
> 
> Alexander Koch (4):
>   devicetree: hwmon: Add bindings for ADC128D818
>   hwmon: adc128d818: Implement mode selection via dt
>   hwmon: adc128d818: Support operation modes 1-3
>   hwmon: adc128d818: Preserve operation mode
> 
>  .../devicetree/bindings/hwmon/adc128d818.txt       |  39 ++++++
>  drivers/hwmon/adc128d818.c                         | 147 +++++++++++++++------
>  2 files changed, 149 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt
> 
Series applied to -next.

Thanks,
Guenter
