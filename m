Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from vulcan.natalenko.name ([104.207.131.136]:22738 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751951AbeA0Qmr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:42:47 -0500
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Mario Limonciello <mario.limonciello@dell.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] hwmon: (dell-smm) Disable fan support on Inspiron 7720 and Vostro 3360
Date: Sat, 27 Jan 2018 17:33:58 +0100
Message-ID: <3267498.dAmo7guSa9@natalenko.name>
In-Reply-To: <20180127162204.13752-1-pali.rohar@gmail.com>
References: <20180127162204.13752-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi.

On sobota 27. ledna 2018 17:22:00 CET Pali Roh=E1r wrote:
> This patch series disable fan support on two machines on which is BIOS
> broken. And it changes measurement of SMM calls duration.
>=20
> Oleksandr Natalenko (1):
>   hwmon: (dell-smm) Disable fan support for Dell Vostro 3360
>=20
> Pali Roh=E1r (3):
>   hwmon: (dell-smm) Enable broken functionality via "force" module param
>   hwmon: (dell-smm) Disable fan support for Dell Inspiron 7720
>   hwmon: (dell-smm) Measure time duration of SMM call around inlined asm
>=20
>  drivers/hwmon/dell-smm-hwmon.c | 68
> +++++++++++++++++++++++++++++++++++++----- 1 file changed, 61
> insertions(+), 7 deletions(-)

Thanks for taking care of them (finally :)).

Regards,
  Oleksandr


