Return-Path: <benh@kernel.crashing.org>
Return-path: <benh@kernel.crashing.org>
Message-ID: <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
Subject: Re: hwmon driver with misc interface
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Eddie James
	 <eajames@linux.vnet.ibm.com>
Date: Tue, 22 May 2018 11:36:09 +1000
In-Reply-To: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
References: 
	<66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 2018-05-22 at 09:31 +1000, Benjamin Herrenschmidt wrote:
> I'm looking at a driver we're currently keeping out of tree which I
> want to rework a bit and submit upstream. (You may have seen earlier
> versions of it, it's the POWER8/POWER9 "OCC" driver). I have a couple
> of design questions however, which I'd like to discuss with you before
> I make choices that you may or may not accept.

I also found some of the earlier threads on the matter and notice you
weren't fan of the fact that we expose other attributes in sysfs that
aren't per-se hwmon.

This is a bit of a connundrum though.

There's a single communication channel providing all the values for
both the "HW sensors" and the more high level synthetic informations
provided by the OCC such as its status, whether it's throttling
the main processor etc...

It's all coming in via the same structure, under the same lock etc...
and it would make little sense to explode that into many drivers.

Now it is not unheard of to have a single driver expose multiple
interfaces without creating multiple "devices" in sysfs.

In this specific case (OCC) we essentially have these "interfaces":

 - Actual sensors (thermal, power, etc...)

 - Additional attributes going with each sensor, some corresponding to
attributes defined in sysfs-interface (_label, _fault, ...) , some are
specific to our chips (_fru_type, _accumulator, _update_time..). I
understand you aren't fan of our "specific" ones, but some of them are
necessary for us, and since they are sensor specific attributes,
putting them elsewhere doesn't make much sense. Should we continue as
we have done and just document them ? Should we "prefix" the names with
something like an "vendor" prefix like we do in the device-tree to
avoid namespace clashes ?

 - General information from the OCC. This is one of your point of
contention. This is just currently 8 values we expose to userspace, so
a separate driver for that seems rather overkill, this includes things
like whether this is the master OCC (vs. slave OCC, ie multi-socket
machines have an OCC in each socket), the state of the OCC, whether
it's throttling the system memory, etc... All these come along with the
sensor values in the "poll" response from the OCC.

 - On POWER9, what I described in my previous email, a chardev
interface to send various commands to the OCC. Because these go via the
same channel used to poll the sensor values, it needs to be done by the
same kernel component. Currently a separate driver but it would
simplify things a lot (and reduce code & memory footprint) to make it
simply another interface exposed by the same driver as it's a rather
trivial read/write chardev.

Now, we really want to get to a point where we can upstream this, so I
want to work with you to find an acceptable design for all this, while
keeping in mind this is all running on a rather small and slow SoC, so
we don't want to "bloat" things if it can be avoided. Also simpler code
has less bugs.

Cheers,
Ben.
