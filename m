Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33843 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbeKMOhu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Nov 2018 09:37:50 -0500
Date: Mon, 12 Nov 2018 20:41:24 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon (ina3221) Add mutex lock to shunt nodes
Message-ID: <20181113044122.GA26327@Asurada-Nvidia.nvidia.com>
References: <20181113042324.852-1-nicoleotsuka@gmail.com>
 <20181113043122.GA11205@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113043122.GA11205@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 12, 2018 at 08:31:22PM -0800, Guenter Roeck wrote:
> On Mon, Nov 12, 2018 at 08:23:24PM -0800, Nicolin Chen wrote:
> > The shunt resistor values are used to calculate shunt voltages
> > and currents. As a part of sysfs nodes, it would be better to
> > get protected with the same mutex too as other sysfs ABI nodes,
> > although this is not very critical because the mutex was added
> > to mainly protect register access.
> > 
> > So this patch adds the mutex lock to protect the shunt node.
> > 
> 
> I am missing something here. I don't see the point of this mutex.
> It just reads a variable and reports the result. When setting,
> it just writes a value. Protecting the conversion of the passed
> value with a mutex is pointless. Protecting writing the value
> against reading it is just as pointless.

The penalty here is that the resistor value would be mismatched
between here and the ongoing calculation when a race happens to
the sysfs accesses. But I feel it might not be really that hurt
to allow it happen.

Let's just drop it then: the mutex was used to protect register
read/writes any way.

Thanks
Nicolin
