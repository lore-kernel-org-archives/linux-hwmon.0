Return-Path: <benh@kernel.crashing.org>
Return-path: <benh@kernel.crashing.org>
Message-ID: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
Subject: hwmon driver with misc interface
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Eddie James
	 <eajames@linux.vnet.ibm.com>
Date: Tue, 22 May 2018 09:31:49 +1000
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter !

I'm looking at a driver we're currently keeping out of tree which I
want to rework a bit and submit upstream. (You may have seen earlier
versions of it, it's the POWER8/POWER9 "OCC" driver). I have a couple
of design questions however, which I'd like to discuss with you before
I make choices that you may or may not accept.

Background: the OCC is a microcontroller inside a POWER8 or POWER9
processor which controls various power management functions of the
chip, and monitor various chip internal metrics including temperature.

The driver is for the kernel of the BMC (the management controller),
typically a little ARM SoC, which needs to communicate with the above
OCC on the main processor, to perform various system power and thermal
management tasks.

Our current out-of-tree driver has a "common" part which exposes all of
the OCC "sensors" via hwmon, and two backends, one for P8 and one for
P9, handling the communication with the actual OCC implementation.

The backend gets instanciated from the device-tree and brings the
common parts in, so far it's rather standard.

The communication on POWER8 goes via i2c which is rather simple. There
is no other channel and all is good.

On POWER9, it however uses our "FSI" interface (drivers/fsi), more
specifically it's stacked on top of another driver (fsi-sbefifo.c, not
yet upstream, working on it too) which provides the communication with
the actual OCC (it's much faster than i2c). In addition, on POWER9, we
also need a separate userspace interface to the OCC for various
management tasks beyond the simple sensors, which we provide via a misc
chardev (/dev/occ*).

The current design of the driver is a bit convoluted though:

 - The sbefifo (transport controller if you want) creates a child
platform device for the occ which represents its ability to communicate
with the occ.

 - A first driver (fsi-occ) binds to that, it's not an hwmon driver. It
provides the /dev/occ* interface, and exports in-kernel functions for
sending commands and receiving responses from the OCC (simple wrappers
on top of the sbefifo). It also creates another platform device
underneath itself.

 - A second driver (occ-hwmon) then binds to that and uses the above
exported functions to communicate with the occ (this is the POWER9
backend of the hwmon driver).

This is all a bit convoluted and I think I can simplify it quite a bit
by removing the fsi-occ.c layer. The "wrappers" for sending commands to
the OCC via sbefifo aren't particularily useful, the POWER9 hwmon occ
backend could do that directly like the POWER8 one directly formats the
i2c commands.

However, I would have to bring the misc device into the hwmon driver.

Do you have a policy against this ? I noticed a couple of drivers in
drivers/hwmon already do something similar, but I wanted to double
check.

Additionally, there's another problem for which I'm not entirely fan of
our solution... The OCC isn't always there. IE, when the server is
powered off, the POWER9 chip is off, thus one cannot communicate with
the OCC. Only after it's powered on and has gone sufficiently far
during boot so that the POWER9 firmware has started the OCC can we
communicate with it.

Currently, what happens is that the occ-hwmon driver fails to bind when
the server is off (in my latest code base due to specific error codes
from sbefifo). Later on, the BMC userspace who monitors the system
state gets notified via an IPMI message by the POWER9 firmware that the
OCCs are up, and manually re-binds the driver.

It works ... but I'm not fan of it. Do you have a better suggestion ?
Should we keep the driver bound but error out on the values ? Should we
play with the "power state" of the device ? What's the policy when
accessing hwmon for a device in "suspended" state ?

Thanks for your time,

Cheers,
Ben.
