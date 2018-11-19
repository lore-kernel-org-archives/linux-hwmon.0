Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38572 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725722AbeKTIof (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Nov 2018 03:44:35 -0500
Date: Mon, 19 Nov 2018 14:18:43 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon (ina3221) Add single-shot mode support
Message-ID: <20181119221842.GA26382@Asurada-Nvidia.nvidia.com>
References: <20181113042353.1507-1-nicoleotsuka@gmail.com>
 <20181113043248.GB11205@roeck-us.net>
 <20181113045823.GB26327@Asurada-Nvidia.nvidia.com>
 <20181113172102.GA21714@roeck-us.net>
 <20181114001141.GA14925@Asurada-Nvidia.nvidia.com>
 <20181114172330.GA25592@roeck-us.net>
 <20181117015131.GA10407@Asurada-Nvidia.nvidia.com>
 <20181119174559.GC27435@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119174559.GC27435@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 19, 2018 at 09:45:59AM -0800, Guenter Roeck wrote:
> > In short, other than exposing it via a generic ABI to the user
> > space, how about defining some policy to maintaining it within
> > the driver?

> I think that would be a bad idea. It changes timing for everyone
> curently using the driver. It also effectively disables monitoring,
> which is the main purpose for using this chip (and other hardware
> monitoring chips). This is indeed a key difference between iio
> and hwmon - the main purpose of chips in the iio subsystem is to
> be able report data efficiently to user space, not hardware monitoring.
> I do not think it is appropriate to use iio requirements as argument
> to change hwmon driver behavior (and vice versa).

OK...what about setting a default mode via DT? I didn't expect it
to be possible until I found this existing solution. Though it is
still in an iio driver, I don't think this should be iio specific.

  commit 023e30fb0d3a3b9d6b8dc9e47590aa544d58a22f
  Author: Adriana Reus <adriana.reus@intel.com>
  Date:   Tue Nov 24 12:59:49 2015 +0200

    Documentation: devicetree: Add property for controlling power saving
                   mode for the us5182 als sensor

    Add a property to allow changing the default power-saving mode.
    By default, at read raw the chip will activate and provide
    one measurent, then it will shut itself down. However, the
    chip can also work in "continuous" mode which may be more reliable
    but is also more power consuming.

    Signed-off-by: Adriana Reus <adriana.reus@intel.com>
    Acked-by: Rob Herring <robh@kernel.org>
    Signed-off-by: Jonathan Cameron <jic23@kernel.org>

Would it be possible for me to apply a similar one? Since hwmon
driver uses continuous mode by default, I will add a "one-shot"
property instead of "continuous" -- all existing users won't be
effected unless they place one-shot properties in DT bindings.

Thanks
Nicolin
