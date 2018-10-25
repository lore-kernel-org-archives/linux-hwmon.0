Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35271 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbeJZH4U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Oct 2018 03:56:20 -0400
Date: Thu, 25 Oct 2018 16:21:38 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] hwmon: (core) Inherit power properties to hdev
Message-ID: <20181025232138.GA28487@Asurada-Nvidia.nvidia.com>
References: <20181024193402.16698-1-nicoleotsuka@gmail.com>
 <20181024193402.16698-2-nicoleotsuka@gmail.com>
 <20181025001301.Horde.VCevVrrSs6rOyXT41xiPOzW@cp2.active-venture.com>
 <20181025010116.GA4543@Asurada-Nvidia.nvidia.com>
 <20181025013349.GA7569@Asurada-Nvidia.nvidia.com>
 <20181025065531.Horde.JhVAJU3eOlwYcSJ57tV4I5-@cp2.active-venture.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181025065531.Horde.JhVAJU3eOlwYcSJ57tV4I5-@cp2.active-venture.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Oct 25, 2018 at 06:55:31AM +0000, linux@roeck-us.net wrote:
> > won't work then. I guess it'd be safer to ignore the problem of
> > the power node, i.e. using parent dev pointer for pm runtime.
> > 
> It might be worthwhile looking up how other virtal devices handle
> this problem. Maybe the hwmon code could have its own suspend/resume
> callbacks. Not sure how to make that work, though, and what those
> callbacks would (have to) do.

I am adding a core pm pointer to the class. A hwmon driver will
also need to pass a private pm pointer in a chip/info structure.
I will send it soon.

Thanks
Nicolin
