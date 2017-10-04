Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34913 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751132AbdJDCWa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Oct 2017 22:22:30 -0400
Date: Tue, 3 Oct 2017 19:22:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, jiri@resnulli.us
Subject: Re: [v4,2/2] Documentation: devicetree: add max6621 device
Message-ID: <20171004022229.GA1422@roeck-us.net>
References: <1507054108-195806-3-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1507054108-195806-3-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 03, 2017 at 06:08:28PM +0000, Vadim Pasternak wrote:
> Add device record for Maxim MAX6621 temperature sensor device.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> v1->v2
>  Comments pointed out by Rob:
>  - Add device to trivial-devices.txt instead of having separate binding
>    doc file;
> ---
>  Documentation/devicetree/bindings/trivial-devices.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
> index af284fb..8bcac6e 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/trivial-devices.txt
> @@ -71,6 +71,7 @@ isil,isl29028		Intersil ISL29028 Ambient Light and Proximity Sensor
>  isil,isl29030		Intersil ISL29030 Ambient Light and Proximity Sensor
>  maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
>  maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
> +maxim,max6621		PECI-to-I2C translator for PECI-to-SMBus/I2C protocol conversion
>  maxim,max6625		9-Bit/12-Bit Temperature Sensors with I²C-Compatible Serial Interface
>  mc,rv3029c2		Real Time Clock Module with I2C-Bus
>  mcube,mc3230		mCube 3-axis 8-bit digital accelerometer
