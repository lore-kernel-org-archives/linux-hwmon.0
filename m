Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:39737 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752569AbdK1PBo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Nov 2017 10:01:44 -0500
Date: Tue, 28 Nov 2017 09:01:42 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Russell King <linux@armlinux.org.uk>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (jc42) optionally try to disable the SMBUS
 timeout
Message-ID: <20171128150142.dpxg5xdkza5y6qqg@rob-hp-laptop>
References: <20171127163101.27859-1-peda@axentia.se>
 <20171127163101.27859-2-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171127163101.27859-2-peda@axentia.se>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 27, 2017 at 05:31:00PM +0100, Peter Rosin wrote:
> With a nxp,se97 chip on an atmel sama5d31 board, the I2C adapter driver
> is not always capable of avoiding the 25-35 ms timeout as specified by
> the SMBUS protocol. This may cause silent corruption of the last bit of
> any transfer, e.g. a one is read instead of a zero if the sensor chip
> times out. This also affects the eeprom half of the nxp-se97 chip, where
> this silent corruption was originally noticed. Other I2C adapters probably
> suffer similar issues, e.g. bit-banging comes to mind as risky...
> 
> The SMBUS register in the nxp chip is not a standard Jedec register, but
> it is not special to the nxp chips either, at least the atmel chips
> have the same mechanism. Therefore, do not special case this on the
> manufacturer, it is opt-in via the device property anyway.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  Documentation/devicetree/bindings/hwmon/jc42.txt |  4 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/hwmon/jc42.c                             | 21 +++++++++++++++++++++
>  2 files changed, 25 insertions(+)
