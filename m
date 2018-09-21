Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43267 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390231AbeIUXd4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 19:33:56 -0400
Date: Fri, 21 Sep 2018 10:43:54 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Get channel names from DT node
Message-ID: <20180921174353.GA24662@Asurada-Nvidia.nvidia.com>
References: <20180921000753.21846-1-nicoleotsuka@gmail.com>
 <20180921000753.21846-3-nicoleotsuka@gmail.com>
 <21a6e8f3-c95d-43d0-ca3f-3f91ddfeff07@roeck-us.net>
 <20180921012038.GA23354@Asurada-Nvidia.nvidia.com>
 <20180921091813.GA21564@Asurada-Nvidia.nvidia.com>
 <75741ce9-80a3-9277-b8e3-2d3c3e003797@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75741ce9-80a3-9277-b8e3-2d3c3e003797@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Sep 21, 2018 at 05:56:00AM -0700, Guenter Roeck wrote:

> > I tried is_visible but it looks like it won't be that neat to
> > implement as some attributes of this driver don't really pass
> > the channel index to the store()/show() but some other indexes.
> > 
> 
> The channel index is not the only means that can be used to determine
> the channel index. Many drivers use the position in the attrs[] array
> to determine the channel index. I don't see why this would not be
> possible here.

Hmmm, that should simply work...I didn't mean not possible though.

> > If you are very against the dynamical group, I can drop it to
> > leave the sysfs node as it was.
> > 
> > And for the name nodes that I was talking about above, I will
> > add an sysfs store() function so non-DT users can set them,
> > and I also removed the confusing "unknown" default name.
> > 
> 
> The label attributes are RO. Please follow the ABI.
> 
> temp[1-*]_label Suggested temperature channel label.

Thanks a lot for the hint. I looked up the doc and feel that
this one probably fits my situation more:
    in[0-*]_label   Suggested voltage channel label.

Will follow it in my next version.

Thank you
Nicolin
