Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3828 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750872AbdAWMA6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Jan 2017 07:00:58 -0500
Date: Mon, 23 Jan 2017 13:00:35 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Joe Perches <joe@perches.com>
cc: Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
In-Reply-To: <1485154594.12563.27.camel@perches.com>
Message-ID: <alpine.DEB.2.20.1701231300240.3435@hadrien>
References: <20170121192010.30681-1-f.fainelli@gmail.com>  <20170121192010.30681-2-f.fainelli@gmail.com>  <1485153837.12563.23.camel@perches.com> <1485154594.12563.27.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On Sun, 22 Jan 2017, Joe Perches wrote:

> On Sun, 2017-01-22 at 22:43 -0800, Joe Perches wrote:
> > Two questions for Julia Lawall:
> >
> > o is there a better way to do this than repeat the blocks
> >   one for each replacement
> > o can struct device * dev be made an arbitrary identifier
> >
> > $ cat dev_printk.cocci
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_emerg(
> > +	dev_emerg(dev,
> > 	...);
> > ...>
> > }
>
> Well, the second question is simple if I would just
> think a little before asking...
>
> @@
> identifier fn;
> identifier dev;

Yes :)

julia

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
> etc...
>
>
