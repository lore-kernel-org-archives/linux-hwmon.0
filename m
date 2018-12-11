Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39158 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbeLKAVP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 19:21:15 -0500
Received: by mail-qt1-f194.google.com with SMTP id n21so14552415qtl.6
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 16:21:13 -0800 (PST)
MIME-Version: 1.0
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net> <1544479728-30077-19-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-19-git-send-email-linux@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Dec 2018 10:51:01 +1030
Message-ID: <CACPK8XdnXYN0HoXF51x6EDGXk0TqfsoFd0jQPgzRNo2q5e=_Fw@mail.gmail.com>
Subject: Re: [PATCH 18/30] hwmon: (aspeed-pwm-tacho) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 11 Dec 2018 at 08:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
> to improve readbility, and to reduce the chance of inconsistencies.
>
> Also replace any remaining S_<PERMS> in the driver with octal values.
>
> The conversion was done automatically with coccinelle. The semantic patches
> and the scripts used to generate this commit log are available at
> https://github.com/groeck/coccinelle-patches/hwmon/.
>
> This patch does not introduce functional changes. It was verified by
> compiling the old and new files and comparing text and data sizes.
>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I gave this a spin on hardware and it looks good.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
