Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B91FA3743
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 00:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJaADq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Oct 2022 20:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJaADq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Oct 2022 20:03:46 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FD69FFC
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Oct 2022 17:03:45 -0700 (PDT)
Date:   Mon, 31 Oct 2022 00:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1667174621; x=1667433821;
        bh=8SjWMgyM6mFpa+vViSr8QO9KEWkfub/Exg3W3SE2mTA=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=h+mb6fThU17Fe5n1TbJ5jgviL2NXAOABB1GPsEwGhe8NWSQV4EDGkehKkUKXbnGid
         Vsg5viJvYFBnyqoHagTth4fwBrZdTJUXENbS0bEPVbihZwsEOYSP5Ocg595TvSYLtk
         olisMjw5ikKVTRY9lDUt2VWz4L4ZM9sR1RW/aPHa2B8vL3eiog6VOevT1yPJ0u1UqS
         nFlq6WubAkWboxN6+5roRD6YaR653TFyHzAdnu2XhnAmJf+91Mqph9jSctRHHwQakv
         wujrYjql4VzbHLFe4het6RAuWZWqz1qchvbN1Pnc3QCchdQRCaOeln7J01ShkfoLJh
         qpk8AhhDViIBw==
To:     =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= 
        <samsagax@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] Add OneXPlayer mini AMD sensors driver
Message-ID: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
In-Reply-To: <20221030203248.15485-1-samsagax@gmail.com>
References: <c6c16bc6-d86b-84ca-e49a-0788f9c80006@roeck-us.net> <20221030203248.15485-1-samsagax@gmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi


2022. okt=C3=B3ber 30., vas=C3=A1rnap 21:32 keltez=C3=A9ssel, Joaqu=C3=
=ADn Ignacio Aramend=C3=ADa =C3=ADrta:

> Sensors driver for OXP Handhelds from One-Netbook that expose fan reading
> and control via hwmon sysfs.
>=20
> As far as I could gather all OXP boards have the same DMI strings and
> they are told appart by the boot cpu vendor (Intel/AMD).
> Currently only AMD boards are supported.
>=20
> Fan control is provided via pwm interface in the range [0-255]. AMD
> boards have [0-100] as range in the EC, the written value is scaled to
> accommodate for that.
>=20
> Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> ---
> Rewritten the driver according to feedback, checkpatch passes, removed
> unnecessary complexity and moved the driver to hwmon
> ---
>  drivers/hwmon/Kconfig       |  13 +-
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/oxp-sensors.c | 278 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 291 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hwmon/oxp-sensors.c
>=20
> [...]
> diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> new file mode 100644
> index 000000000000..128fdf4c46e2
> --- /dev/null
> +++ b/drivers/hwmon/oxp-sensors.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Platform driver for OXP Handhelds that expose fan reading and control
> + * via hwmon sysfs.
> + *
> + * All boards have the same DMI strings and they are told appart by the
> + * boot cpu vendor (Intel/AMD). Currently only AMD boards are supported
> + * but the code is made to be simple to add other handheld boards in the
> + * future.
> + * Fan control is provided via pwm interface in the range [0-255]. AMD
> + * boards use [0-100] as range in the EC, the written value is scaled to
> + * accommodate for that.
> + *
> + * PWM control is disabled by default, can be enabled via module paramet=
er.

As far as I can see this is not true anymore.

Also, have you checked if there is maybe a WMI interface for this?


> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
