Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f41.google.com ([209.85.160.41]:36533 "EHLO
        mail-pl0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932799AbeGHXaz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Jul 2018 19:30:55 -0400
Received: by mail-pl0-f41.google.com with SMTP id a7-v6so5147171plp.3
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Jul 2018 16:30:55 -0700 (PDT)
Subject: Re: hwmon driver with misc interface
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Eddie James <eajames@linux.vnet.ibm.com>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
 <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
Date: Sun, 8 Jul 2018 16:30:53 -0700
MIME-Version: 1.0
In-Reply-To: <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Ben,

first, sorry for dropping the ball on this one.

On 05/21/2018 06:36 PM, Benjamin Herrenschmidt wrote:
> On Tue, 2018-05-22 at 09:31 +1000, Benjamin Herrenschmidt wrote:
>> I'm looking at a driver we're currently keeping out of tree which I
>> want to rework a bit and submit upstream. (You may have seen earlier
>> versions of it, it's the POWER8/POWER9 "OCC" driver). I have a couple
>> of design questions however, which I'd like to discuss with you before
>> I make choices that you may or may not accept.
> 
> I also found some of the earlier threads on the matter and notice you
> weren't fan of the fact that we expose other attributes in sysfs that
> aren't per-se hwmon.
> 
> This is a bit of a connundrum though.
> 
> There's a single communication channel providing all the values for
> both the "HW sensors" and the more high level synthetic informations
> provided by the OCC such as its status, whether it's throttling
> the main processor etc...
> 
> It's all coming in via the same structure, under the same lock etc...
> and it would make little sense to explode that into many drivers.
> 
> Now it is not unheard of to have a single driver expose multiple
> interfaces without creating multiple "devices" in sysfs.
> 
> In this specific case (OCC) we essentially have these "interfaces":
> 
>   - Actual sensors (thermal, power, etc...)
> 
>   - Additional attributes going with each sensor, some corresponding to
> attributes defined in sysfs-interface (_label, _fault, ...) , some are
> specific to our chips (_fru_type, _accumulator, _update_time..). I
> understand you aren't fan of our "specific" ones, but some of them are
> necessary for us, and since they are sensor specific attributes,
> putting them elsewhere doesn't make much sense. Should we continue as
> we have done and just document them ? Should we "prefix" the names with
> something like an "vendor" prefix like we do in the device-tree to
> avoid namespace clashes ?
> 
>   - General information from the OCC. This is one of your point of
> contention. This is just currently 8 values we expose to userspace, so
> a separate driver for that seems rather overkill, this includes things
> like whether this is the master OCC (vs. slave OCC, ie multi-socket
> machines have an OCC in each socket), the state of the OCC, whether
> it's throttling the system memory, etc... All these come along with the
> sensor values in the "poll" response from the OCC.
> 
>   - On POWER9, what I described in my previous email, a chardev
> interface to send various commands to the OCC. Because these go via the
> same channel used to poll the sensor values, it needs to be done by the
> same kernel component. Currently a separate driver but it would
> simplify things a lot (and reduce code & memory footprint) to make it
> simply another interface exposed by the same driver as it's a rather
> trivial read/write chardev.
> 
> Now, we really want to get to a point where we can upstream this, so I
> want to work with you to find an acceptable design for all this, while
> keeping in mind this is all running on a rather small and slow SoC, so
> we don't want to "bloat" things if it can be avoided. Also simpler code
> has less bugs.
> 

Trying to be be reasonable....

Let's make some ground rules.

- Do not attach foreign attributes (not related to hardware monitoring) to
   the hwmon device. Attach foreign attributes to its parent, eg the platform
   or i2c driver, or to a separate (misc ?) device if that is not feasible
   for some reason.
- Avoid foreign subsystem drivers. If the chip has an input device, a watchdog,
   and a hardware monitor, there should be three drivers.
   This is to some degree flexible; for example, PMBus drivers may register
   as power regulators, and some chips also have gpio support. But what,
   for example, the applesmc driver does is really not acceptable.
- Private hwmon attributes are acceptable as long as they are clearly
   documented and explained as necessary. This is not a free ride; you should
   have good reasons for private attributes and be able to explain that and why
   you need them. In this context, "because the hardware provides the information"
   is not a valid reason. The use case is important, not the fact that
   the hardware provides some random information.

Can you work with that ?

Thanks,
Guenter
