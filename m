Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBF8C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 18:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242126AbiAKSRD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 13:17:03 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:49773 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344099AbiAKSRD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 13:17:03 -0500
Date:   Tue, 11 Jan 2022 18:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1641925020;
        bh=HuYqRO+NxpAmrDf9iS48/sHc8VXB4DvNx7uZ9s7jHNU=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=TsIAR5i1jrXf15l0E86aaAH+5ZBvAmqt4YCVWQn4SATiThLWR6fTg6Wvw4Pun5UYU
         CZUDxPnB46rvraelFEnovovoDIYkRxqDgtwil6PEW/dJCXAYas52/fmSt6lAEWT3uB
         jDk/ZpZMXNyqNy6ViKosfTamvtCJ2+5MT8mUNLsG+ZNQbalwSvRKpX+MD2dAE13Oo/
         FQIFuuaiVZLkQMTYRnXJDAZAsMwSXxMBaVqwNDCVFl8B8Q/CtUp3l4C1qC2URz5DHi
         k49n4a0JJM/FgUVioA9f0530QxPovyZz6ct5O7BCBWJpgVygn0cOFUdm+m2gdDL27I
         ZzrHGYQzH3Gbg==
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     andy.shevchenko@gmail.com, pauk.denis@gmail.com,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: PATCH v4 ASUS EC Sensors
Message-ID: <0uakBuv1oBXoq7hUQxghKrFabqWebbG437WBNMuBVpYRL4vCE-IxwsbH16I82L-hq4xLtuSvBM1UaPfUy1HxmoFJYFHkDuJPxh3dZ_P8LuM=@protonmail.com>
In-Reply-To: <20220111180347.1245774-1-eugene.shalygin@gmail.com>
References: <20220111180347.1245774-1-eugene.shalygin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2022. janu=C3=A1r 11., kedd 19:03 keltez=C3=A9ssel, Eugene Shalygin =C3=
=ADrta:

> This patchset replaces the HWMON asus_wmi_ec_sensors driver with
> an implementation that does not use WMI but queries the embedded
> controller directly.
>
> That provides two enhancements: sensor reading became quicker (on some
> systems or kernel configuration it took almost a full second to read
> all the sensors, that transfers less than 15 bytes of data), the driver
> became more fexible. The driver now relies on ACPI mutex to lock access
> to the EC, in the same way as the WMI DSDT code does.
>
> Chenges in v5:
>  - Place the sensors bitset directly into the driver_data field of the
> =09 dmi_system_id struct.
>  - Replace doc comments with regular ones.
>
> Changes in v4:
>  - Deprecate the wmi driver rather than removing it.
>
> Changes in v3:
>  - Remove BIOS version checks and BIOS version dependent mutex path.
>
> Changes in v2:
>  - Replace sensor flags enum with bitset
>  - Replace module init/probe functions with module_platform_driver_probe
>    and ask the platform drivers framework to load the driver when ACPI
>    EC is found (ACPI ID "PNP0C09").
>  - Extend board data with BIOS version attribute for the mutex path to be
>    BIOS version dependent.
>  - Add module parameter to override the mutex path.
>

Hi


I believe the subject should say "v5" and not "v4". In any case, FYI, `git =
format-patch`
has the `--cover-letter` option, which will generate a cover letter templat=
e
with the right patch version, etc.


Regards,
Barnab=C3=A1s P=C5=91cze
