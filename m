Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D3DC4708F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 13:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84DFC6121D
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 13:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhFBNGU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Jun 2021 09:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhFBNGU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jun 2021 09:06:20 -0400
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:1:101::144:244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54928C061574
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Jun 2021 06:04:37 -0700 (PDT)
Received: from localhost (ip-78-45-210-72.net.upcbroadband.cz [78.45.210.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 05846400070;
        Wed,  2 Jun 2021 15:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622639076;
        bh=h3UZ2wAtIDY7eXWZL46QPijYp9a1zqJH3T/FRHK9L/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QFeMknQKdziWCYiLNwT2FI9osOHuxUuksO5Qp+nse1GEJ94ijF4p4idOS2upUw46d
         rFBNGwCF+X0slX5XaRJkfeKeP3P4NVNLhK1IRtGxRtePN24yeV8ffiSdNBe/FC4RZc
         MDiLKoFzDNViJa4ypFouG2ppOxbBVyw1LkmhQ7oRZV1rCHgDdx8rYIhvpMPSDhcdkd
         1qL7/jtWbU4bve9X8TURRxt7W+u9RZnQ5o82VNh9p/6iN8UydaD3+nu1Et138pz3hG
         L1SJJJJOH+Wy6+m+9o/1eeMfKK+zBSydfdALFOVGn5DXJJksB0JkA8FKKEX54LH6y0
         tfDqhAN9Bkxuw==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        <kubernat@cesnet.cz>
Subject: Re: [PATCH 4/7] hwmon: (max31790) Add support for =?iso-8859-1?Q?fanX=5Fenable_attributes?=
Date:   Wed, 02 Jun 2021 15:04:35 +0200
MIME-Version: 1.0
Message-ID: <e073d9e2-d7d1-40fb-9717-971833cb25ca@cesnet.cz>
In-Reply-To: <20210526154022.3223012-5-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
 <20210526154022.3223012-5-linux@roeck-us.net>
Organization: CESNET
User-Agent: Trojita/unstable-2020-07-06; Qt/5.15.2; xcb; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On st=C5=99eda 26. kv=C4=9Btna 2021 17:40:19 CEST, Guenter Roeck wrote:
> Since pwmX_enable is now fixed and only handles pwm support instead
> of also enabling/disabling fan tachometers, we need an explicit means
> to do that.
>
> For fan channels 7..12, display the enable status if the channel
> is configured for fan speed reporting. The displayed status matches
> the value of the companion channel but is read-only.

This phrasing is confusing to me. That's once again that "configured to"=20
which in this context doesn't refer to the kernel, but to an initial config=20=

of the chip. I suggest the following:

Fan channels 7..12 are only available when the chip has been configured=20
with PWM output N-6 disabled. This configuration is outside of scope of the=20=

kernel. The displayed status matches the value of the companion channel but=20=

is read-only.

> +fan[1-12]_enable   RW  0=3Ddisable fan speed monitoring,=20
> 1=3Denable fan speed monitoring
> +                       The value is RO for companion channels=20
> (7-12). For those
> +                       channels, the value matches the value=20
> of the primary channel.

I realize that it probably doesn't belong to this patch because it affects=20=

the other fan_* files, but the docs would be improved by something like:

 Tachometer inputs monitor fan tachometer logic outputs for precise (+/-1%)
 monitoring and control of fan RPM as well as detection of fan failure.
 Six pins are dedicated tachometer inputs. Any of the six PWM outputs can
-also be configured to serve as tachometer inputs.
+also be reconfigured to serve as tachometer inputs by the firmware. The
+kernel will respect the initial configuration of the chip.

Want an extra patch on top of this series?

> +=09case hwmon_fan_enable:
> +=09=09config =3D data->fan_config[channel];
> +=09=09if (val =3D=3D 0) {
> +=09=09=09/* Disabling TACH_INPUT_EN has no effect in RPM_MODE */
> +=09=09=09if (!(config & MAX31790_FAN_CFG_RPM_MODE))
> +=09=09=09=09config &=3D ~MAX31790_FAN_CFG_TACH_INPUT_EN;

This means that a "nonsensical" write from userspace will be silently=20
ignored, doesn't it? I think it should return an error instead.

Cheers,
Jan


