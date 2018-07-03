Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49283 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932377AbeGCQQ0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jul 2018 12:16:26 -0400
Date: Tue, 3 Jul 2018 09:16:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org, jiri@resnulli.us,
        michaelsh@mellanox.com
Subject: Re: [v5,1/1] hwmon: (mlxreg-fan) Add support for Mellanox FAN driver
Message-ID: <20180703161620.GA17299@roeck-us.net>
References: <1530601209-23686-1-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530601209-23686-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jul 03, 2018 at 07:00:09AM +0000, Vadim Pasternak wrote:
> Driver obtains PWM and tachometers registers location according to the
> system configuration and creates FAN/PWM hwmon objects and a cooling
> device. PWM and tachometers are controlled through the on-board
> programmable device, which exports its register map. This device could be
> attached to any bus type, for which register mapping is supported. Single
> instance is created with one PWM control, up to 12 tachometers and one
> cooling device. It could be as many instances as programmable device
> supports.
> 
> Currently driver will be activated from the Mellanox platform driver:
> drivers/platform/x86/mlx-platform.c.
> For the future ARM based systems it could be activated from the ARM
> platform module.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next.

Thanks,
Guenter
