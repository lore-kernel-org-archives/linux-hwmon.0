Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:60644 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752339AbdHKDg6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 23:36:58 -0400
Message-ID: <1502422611.2598.19.camel@intel.com>
Subject: Re: [PATCH 0/9 v2] constify thermal_zone_of_device_ops structures
From: Zhang Rui <rui.zhang@intel.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>,
        linux-rpi-kernel@lists.infradead.org
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Date: Fri, 11 Aug 2017 11:36:51 +0800
In-Reply-To: <1502204943-20075-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1502204943-20075-1-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 2017-08-08 at 17:08 +0200, Julia Lawall wrote:
> The thermal_zone_of_device_ops structures are only passed as the
> fourth
> argument to thermal_zone_of_sensor_register or
> devm_thermal_zone_of_sensor_register, both of which are declared as
> const.
> Thus the thermal_zone_of_device_ops structures themselves can be
> const.
> 
> v2: add structures passed to devm_thermal_zone_of_sensor_register
> also.
> 
> Done with the help of Coccinelle.
> 
I don't see the patches changes out of drivers/thermal.

As there is no dependencies between these patches, I guess I will only
take patches that changes drivers/thermal.

thanks,
rui
> ---
> 
>  drivers/hwmon/hwmon.c                      |    2 +-
>  drivers/hwmon/scpi-hwmon.c                 |    2 +-
>  drivers/input/touchscreen/sun4i-ts.c       |    2 +-
>  drivers/thermal/broadcom/bcm2835_thermal.c |    2 +-
>  drivers/thermal/hisi_thermal.c             |    2 +-
>  drivers/thermal/qoriq_thermal.c            |    2 +-
>  drivers/thermal/rcar_gen3_thermal.c        |    2 +-
>  drivers/thermal/samsung/exynos_tmu.c       |    2 +-
>  drivers/thermal/zx2967_thermal.c           |    2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
