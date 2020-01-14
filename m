Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9A2C33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E18A524672
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyALs+fz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgANOIg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:08:36 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36711 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgANOIg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:08:36 -0500
Received: by mail-pf1-f193.google.com with SMTP id x184so6651109pfb.3;
        Tue, 14 Jan 2020 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ss3fXpszwhFSMMEOeRY8BC0FGonewknATivLpFC0dKA=;
        b=EyALs+fzbsRIiCfGPl36ceRz4CXPRoQwXwLTA3ronMpxWpGf16DrxPQ8GPhepIi2vg
         s5PWBUBN4bF1fcTeq2hVW1CS1qu2FxD20E7pUKXZ0idbGGJOYJkRm9YW8kud6/e3Dg8Y
         qVpbMbr0moNtwgx0wkLKILyx/WhUhttjVONlBkmodhCLMbhedVvB0NocFMuhUkAkEutf
         dzlkMX8aM2EGpNc0TZW5yywSIS4qXnloLIPnX4KeKSs07nahVcKkvshxcpUn4bLgCc5W
         CnYMN02SEiADQATn6aTZHCVZZVtzgo49XhnICouVVn/h9UmLquNNUMZChIGsNFE136Rc
         C1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ss3fXpszwhFSMMEOeRY8BC0FGonewknATivLpFC0dKA=;
        b=Vi0HVT0MJaEyvqR5m2rgV5VJHA5jTkcVpP+v065NPNLY3BdtJyDiaAsTmE5KU2JduJ
         bjSwP3cVtEjExOWwHGyPZi8ONr4MV0v6ExYNmMHweu5mNJouFoxw51owrA3m2pfCDuIe
         t3moIcOl0VrwRGo3JhdwjaMlFnpvVzmD/J6mx2SGFTz5XtiCXp7zxEvpJtOSluTlh8xN
         bqtCJ8t6/voeFZ+E3mrbMRDFPf/tVRXhvq0iNpMgxG+sdGnJnG44hcqZ3qiRf4ShqXgw
         7jAiTEhMVjW7JltJ5RW/Map7uWpsc/n0zHpefbgGwwZNFVzX1X2ALvcmoePtqApU2fHP
         HA9g==
X-Gm-Message-State: APjAAAWgzfVijmrbIoFiVO92e2CmicKz+pffIuLQxdf/DyFzO5+QiU3U
        mH2uM0SByGRAcwAuhyLZYEo=
X-Google-Smtp-Source: APXvYqzGqn6wM6quVswhTbDrDAA94Dqvd4nw6Di48Jmia3y8Dktekesp0n+CL0t3U1kzyLf2h/aHQg==
X-Received: by 2002:a62:1c95:: with SMTP id c143mr24761321pfc.219.1579010915833;
        Tue, 14 Jan 2020 06:08:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2sm17509223pgc.19.2020.01.14.06.08.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 06:08:35 -0800 (PST)
Date:   Tue, 14 Jan 2020 06:08:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v1 6/6] docs: hwmon: Include 'xdpe12284.rst'
 into docs
Message-ID: <20200114140834.GA3386@roeck-us.net>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-7-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-7-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 13, 2020 at 03:08:41PM +0000, Vadim Pasternak wrote:
> Add documentation for 'xdpe122' devices.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next (and added to index.rst).

Thanks,
Guenter

> ---
>  Documentation/hwmon/xdpe12284.rst | 101 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/hwmon/xdpe12284.rst
> 
> diff --git a/Documentation/hwmon/xdpe12284.rst b/Documentation/hwmon/xdpe12284.rst
> new file mode 100644
> index 000000000000..6b7ae98cc536
> --- /dev/null
> +++ b/Documentation/hwmon/xdpe12284.rst
> @@ -0,0 +1,101 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver xdpe122
> +=====================
> +
> +Supported chips:
> +
> +  * Infineon XDPE12254
> +
> +    Prefix: 'xdpe12254'
> +
> +  * Infineon XDPE12284
> +
> +    Prefix: 'xdpe12284'
> +
> +Authors:
> +
> +	Vadim Pasternak <vadimp@mellanox.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Infineon Multi-phase XDPE122 family
> +dual loop voltage regulators.
> +The family includes XDPE12284 and XDPE12254 devices.
> +The devices from this family complaint with:
> +- Intel VR13 and VR13HC rev 1.3, IMVP8 rev 1.2 and IMPVP9 rev 1.3 DC-DC
> +  converter specification.
> +- Intel SVID rev 1.9. protocol.
> +- PMBus rev 1.3 interface.
> +
> +Devices support linear format for reading input voltage, input and output current,
> +input and output power and temperature.
> +Device supports VID format for reading output voltage. The below modes are
> +supported:
> +- VR12.0 mode, 5-mV DAC - 0x01.
> +- VR12.5 mode, 10-mV DAC - 0x02.
> +- IMVP9 mode, 5-mV DAC - 0x03.
> +- AMD mode 6.25mV - 0x10.
> +
> +Devices support two pages for telemetry.
> +
> +The driver provides for current: input, maximum and critical thresholds
> +and maximum and critical alarms. Critical thresholds and critical alarm are
> +supported only for current output.
> +The driver exports the following attributes for via the sysfs files, where
> +indexes 1, 2 are for "iin" and 3, 4 for "iout":
> +
> +**curr[3-4]_crit**
> +
> +**curr[3-4]_crit_alarm**
> +
> +**curr[1-4]_input**
> +
> +**curr[1-4]_label**
> +
> +**curr[1-4]_max**
> +
> +**curr[1-4]_max_alarm**
> +
> +The driver provides for voltage: input, critical and low critical thresholds
> +and critical and low critical alarms.
> +The driver exports the following attributes for via the sysfs files, where
> +indexes 1, 2 are for "vin" and 3, 4 for "vout":
> +
> +**in[1-4]_crit**
> +
> +**in[1-4_crit_alarm**
> +
> +**in[1-4]_input**
> +
> +**in[1-4_label**
> +
> +**in[1-4]_lcrit**
> +
> +**in[1-41_lcrit_alarm**
> +
> +The driver provides for power: input and alarms. Power alarm is supported only
> +for power input.
> +The driver exports the following attributes for via the sysfs files, where
> +indexes 1, 2 are for "pin" and 3, 4 for "pout":
> +
> +**power[1-2]_alarm**
> +
> +**power[1-4]_input**
> +
> +**power[1-4]_label**
> +
> +The driver provides for temperature: input, maximum and critical thresholds
> +and maximum and critical alarms.
> +The driver exports the following attributes for via the sysfs files:
> +
> +**temp[1-2]_crit**
> +
> +**temp[1-2]_crit_alarm**
> +
> +**temp[1-2]_input**
> +
> +**temp[1-2]_max**
> +
> +**temp[1-2]_max_alarm**
