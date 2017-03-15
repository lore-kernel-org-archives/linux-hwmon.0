Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35056 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdCOUgr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Mar 2017 16:36:47 -0400
Date: Wed, 15 Mar 2017 15:36:24 -0500
From: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Carlo Caione <carlo@caione.org>, jdelvare@suse.com,
        linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux@endlessm.com,
        punit.agrawal@arm.com, devicetree@vger.kernel.org,
        Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH v3 1/2] Documentation: bindings: Introduce
 scpi,sensors-scale
Message-ID: <20170315203624.iylw2c2nuqb4mrqu@rob-hp-laptop>
References: <20170309101759.18081-1-carlo@caione.org>
 <20170309101759.18081-2-carlo@caione.org>
 <57ff035a-b462-6f5d-0100-051e99e9a2b6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57ff035a-b462-6f5d-0100-051e99e9a2b6@arm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Mar 15, 2017 at 06:20:33PM +0000, Sudeep Holla wrote:
> 
> 
> On 09/03/17 10:17, Carlo Caione wrote:
> > From: Carlo Caione <carlo@endlessm.com>
> > 
> > Document the new property `scpi,sensors-scale` used by the hwmon-scpi
> > driver to convert the sensor readings to the correct / expected scale.
> > 
> 
> I am fine with DT bindings if DT maintainers agree with having one but I
> would like to add couple of points to get their feedback:
> 
> 1. ARM recognized the drawbacks of SCPI which started informally with
>    ARM Ltd platforms and got adopted by few vendors. It's now being
>    worked on and a much better and scalable replacement protocol is
>    being discussed with vendors now. So future enhancement to this SCPI
>    protocol is unlikely.
> 
> 2. AmLogic has diverted from base protocol in many ways and most of them
>    are handled with just compatible so far without any need for
>    additional bindings. Can we avoid it ?
> 
> So based on these, I prefer not to add more bindings to handle such
> deviations but make it just AmLogic specific.

Agreed.

Rob
