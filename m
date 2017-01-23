Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50401 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbdAWHBc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Jan 2017 02:01:32 -0500
Subject: Re: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
To: Joe Perches <joe@perches.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
References: <20170121192010.30681-1-f.fainelli@gmail.com>
 <20170121192010.30681-2-f.fainelli@gmail.com>
 <1485153837.12563.23.camel@perches.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <637f229a-cfbb-938e-4700-89b180c8b2c0@roeck-us.net>
Date: Sun, 22 Jan 2017 23:01:26 -0800
MIME-Version: 1.0
In-Reply-To: <1485153837.12563.23.camel@perches.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/22/2017 10:43 PM, Joe Perches wrote:
> On Sat, 2017-01-21 at 11:20 -0800, Florian Fainelli wrote:
>> We have a device reference, utilize it instead of pr_warn().
>
> There is at least one more hwmon to convert in applesmc.c
>
> Perhaps a coccinelle script?
>
> Two questions for Julia Lawall:
>
> o is there a better way to do this than repeat the blocks
>   one for each replacement
> o can struct device * dev be made an arbitrary identifier

Definitely yes here; otherwise you only catch the ones named 'dev'.
Did you try "identifier dev;" ?

The type of fn is irrelevant; you don't need to specify it.

There is also the case where 'struct device *dev' is a local variable

fn(...) {
...
struct device *dev = e;
<...
...>
}

or when it isn't but is still available

fn (..., struct \(platform_device\|i2c_device\|spi_device\) *pdev, ...) {
}

>
> $ cat dev_printk.cocci
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_emerg(
> +	dev_emerg(dev,
> 	...);
> ...>
> }
>
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_crit(
> +	dev_crit(dev,
> 	...);
> ...>
> }
>
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_alert(
> +	dev_alert(dev,
> 	...);
> ...>
> }
>
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_err(
> +	dev_err(dev,
> 	...);
> ...>
> }
>
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_notice(
> +	dev_notice(dev,
> 	...);
> ...>
> }
>
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_warn(
> +	dev_warn(dev,
> 	...);
> ...>
> }
>
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_info(
> +	dev_info(dev,
> 	...);
> ...>
> }
>
> @@
> identifier fn;
> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_debug(
> +	dev_dbg(dev,
> 	...);
> ...>
> }
>
>

