Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28940C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jan 2022 09:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355160AbiAYJcA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jan 2022 04:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1455528AbiAYJFb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jan 2022 04:05:31 -0500
Received: from vulcan.natalenko.name (vulcan.natalenko.name [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C491C0612F5
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jan 2022 00:49:36 -0800 (PST)
Received: from spock.localnet (unknown [83.148.33.151])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 83345D845DF;
        Tue, 25 Jan 2022 09:47:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1643100446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uTrZfvw59gH/3yxbYSrOyea1yqewZSxFlFrA41C8gmc=;
        b=a7E6jbTNzy5ydzDySaPbga0Kq5FR+O89hoyGtZCaMNv44l4WaoLSBJpGZszh02N2JEIdKd
        txL5c5ClX5Vfg17nW1Fs9TFoLjO1EOsBfjvMh07Ei5syltrf1SO+TReGH1rNM9wccx7Slr
        FDqttV1yeSHVS2SyCyKdM/yxLKRkVes=
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     eugene.shalygin@gmail.com,
        Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     andy.shevchenko@gmail.com, pauk.denis@gmail.com,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [ASUS EC Sensors v8 3/3] hwmon: deprecate asis_wmi_ec_sensors driver
Date:   Tue, 25 Jan 2022 09:47:24 +0100
Message-ID: <2614570.mvXUDI8C0e@natalenko.name>
In-Reply-To: <20220124015658.687309-4-eugene.shalygin@gmail.com>
References: <20220124015658.687309-1-eugene.shalygin@gmail.com> <20220124015658.687309-4-eugene.shalygin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On pond=C4=9Bl=C3=AD 24. ledna 2022 2:56:45 CET Eugene Shalygin wrote:
> Deprecate the asus_wmi_ec_sensors driver in favor of the asus_ec_sensors
>=20
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> ---
>  drivers/hwmon/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2c16b19d2c03..38094c702e4d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2243,13 +2243,16 @@ config SENSORS_ASUS_WMI
> =20
>  config SENSORS_ASUS_WMI_EC
>  	tristate "ASUS WMI B550/X570"
> -	depends on ACPI_WMI
> +	depends on ACPI_WMI && SENSORS_ASUS_EC=3Dn
>  	help
>  	  If you say yes here you get support for the ACPI embedded controller
>  	  hardware monitoring interface found in B550/X570 ASUS motherboards.
>  	  This driver will provide readings of fans, voltages and temperatures
>  	  through the system firmware.
> =20
> +	  This driver is deprecated in favor of the ASUS EC Sensors driver
> +	  which provides fully compatible output.
> +
>  	  This driver can also be built as a module. If so, the module
>  	  will be called asus_wmi_sensors_ec.
> =20
>=20

Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>

=2D-=20
Oleksandr Natalenko (post-factum)


