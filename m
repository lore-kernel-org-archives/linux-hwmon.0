Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34607 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753533AbeC1P2e (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Mar 2018 11:28:34 -0400
Received: by mail-wr0-f193.google.com with SMTP id o8so2659003wra.1
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Mar 2018 08:28:33 -0700 (PDT)
Date: Wed, 28 Mar 2018 16:28:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        jdelvare@suse.com, cphealy@gmail.com, andrew.smirnov@gmail.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: MC13783: add uid and die temperature sensor
 inputs
Message-ID: <20180328152830.nx6dsce4bm43e5wl@dell>
References: <1522160389-18822-1-git-send-email-andrey.gusakov@cogentembedded.com>
 <ecb9f724-de98-5435-135c-2ca2661f5ee6@roeck-us.net>
 <20180328100606.huvblelpdsbzx3w7@dell>
 <66c664db-c4d8-f2bc-e34c-2480509d0d95@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66c664db-c4d8-f2bc-e34c-2480509d0d95@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 28 Mar 2018, Guenter Roeck wrote:

> On 03/28/2018 03:06 AM, Lee Jones wrote:
> > On Tue, 27 Mar 2018, Guenter Roeck wrote:
> > 
> > > On 03/27/2018 07:19 AM, Andrey Gusakov wrote:
> > > > The uid and die temperature can be read out on the ADIN7 using
> > > > input mux. Map uid and die temperature sensor to channels 16
> > > > and 17.
> > > > 
> > > > Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> > > 
> > > Applied to hwmon-next.
> > 
> > You've applied changes to a subsystem without an appropriate
> > Maintainer Ack?
> > 
> 
> Me blind. I didn't realize that part of it was in mfd. Now dropped, and sorry.

Patch looks okay.

Do you want me to apply it and send you a PR or vise versa?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
