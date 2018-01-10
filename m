Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:38908 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965535AbeAJM3k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jan 2018 07:29:40 -0500
MIME-Version: 1.0
In-Reply-To: <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com> <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Jan 2018 13:29:39 +0100
Message-ID: <CAK8P3a31+9HGQ=fQby5Zi1RZ671hKraZP_2ggLTMX3qvOiTx0w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 6/6] drivers/hwmon: Add a driver for a
 generic PECI hwmon
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        gregkh <gregkh@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds driver implementation for a generic PECI hwmon.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

> +static int xfer_peci_msg(int cmd, void *pmsg)
> +{
> +       int rc;
> +
> +       mutex_lock(&peci_hwmon_lock);
> +       rc = peci_ioctl(NULL, cmd, (unsigned long)pmsg);
> +       mutex_unlock(&peci_hwmon_lock);
> +
> +       return rc;
> +}

I said earlier that peci_ioctl() looked unused, that was obviously
wrong, but what you have here
is not a proper way to abstract a bus.

Maybe this can be done more like an i2c bus: make the peci controller
a bus device
and register all known target/index pairs as devices with the peci bus
type, and have
them probed from DT. The driver can then bind to each of those individually.
Not sure if that is getting to granular at that point, I'd have to
understand better
how it is expected to get used, and what the variances are between
implementations.

       Arnd
