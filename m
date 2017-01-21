Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:54884 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751152AbdAUUya (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2017 15:54:30 -0500
Message-ID: <1485031997.2495.4.camel@kernel.crashing.org>
Subject: Re: [PATCH linux v3 3/6] hwmon: occ: Add I2C transport
 implementation for SCOM operations
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>, eajames.ibm@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Sun, 22 Jan 2017 07:53:17 +1100
In-Reply-To: <b47e5359-5587-cc89-43e2-379eb9e95fc8@roeck-us.net>
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
         <1484601219-30196-4-git-send-email-eajames.ibm@gmail.com>
         <b47e5359-5587-cc89-43e2-379eb9e95fc8@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, 2017-01-21 at 10:11 -0800, Guenter Roeck wrote:
> > +int occ_i2c_getscom(void *bus, u32 address, u64 *data)
> > +{
> > +     ssize_t rc;
> > +     u64 buf;
> > +     struct i2c_client *client = bus;
> > +
> > +     rc = i2c_master_send(client, (const char *)&address,
> > sizeof(u32));
> > +     if (rc < 0)
> > +             return rc;
> > +     else if (rc != sizeof(u32))
> > +             return -EIO;
> > +
> > +     rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
> > +     if (rc < 0)
> > +             return rc;
> > +     else if (rc != sizeof(u64))
> > +             return -EIO;
> > +
> > +     *data = be64_to_cpu(buf);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(occ_i2c_getscom);

Additionally, this assumes that is is the only other user of that i2c
path to P8. Something interleaving will break it. pdbg for example.

Talk to Alistair, the right thing here would probably be to have
a separate driver that provides the XSCOM interface via i2c to both
in-kernel and userspace, with proper arbitration.

An expedient might be to instead have the address and data cycles
of the above be 2 i2c messages in one i2c request, thus being
serialized somewhat atomically with other transactions to that i2c
bus.

You may need to make sure the underlying i2c controller driver supports
dual messages, and if it doesn't fix it. This is rather classic 4-bytes 
subaddress style i2c, it shouldn't be too hard.

Cheers,
Ben.

