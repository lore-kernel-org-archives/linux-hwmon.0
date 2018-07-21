Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:56297 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbeGUT4r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jul 2018 15:56:47 -0400
Date: Sat, 21 Jul 2018 21:02:19 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: linux-rpi-kernel@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
Cc: Eric Anholt <eric@anholt.net>
Message-ID: <956429717.29244.1532199739302@email.1und1.de>
In-Reply-To: <20180720230212.26006-1-pbrobinson@gmail.com>
References: <20180720230212.26006-1-pbrobinson@gmail.com>
Subject: Re: [PATCH] hwmon: rpi: add module alias to raspberrypi-hwmon
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


> Peter Robinson <pbrobinson@gmail.com> hat am 21. Juli 2018 um 01:02 geschrieben:
> 
> 
> The raspberrypi-hwmon driver doesn't automatically load, although it does work
> when loaded, by adding the alias it auto loads as expected when built as a
> module. Tested on RPi2/RPi3 on 32 bit kernel and RPi3B+ on aarch64 with
> Fedora 28 and a patched 4.18 RC kernel.
> 
> Fixes: q3c493c885cf ("hwmon: Add support for RPi voltage sensor")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> CC: Stefan Wahren <stefan.wahren@i2se.com>
> CC: Eric Anholt <eric@anholt.net>
> ---

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

Thanks
