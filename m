Return-path: <mdf@kernel.org>
MIME-Version: 1.0
In-Reply-To: <4917fd01-8dd9-eb58-ee29-3ff4f11de0af@roeck-us.net>
References: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com> <4917fd01-8dd9-eb58-ee29-3ff4f11de0af@roeck-us.net>
From: Moritz Fischer <mdf@kernel.org>
Date: Sun, 9 Apr 2017 17:40:35 -0700
Message-ID: <CAJYdmeMFMpp5yE1d_55n90D=Q6Hd_-d-GjimnftEe9dw5Egvxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mfd: cros-ec: Add functions to read mapped memory
To: Guenter Roeck <linux@roeck-us.net>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-hwmon@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>,
	lee.jones@linaro.org, olof@lixom.net, jdelvare@suse.com,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Moritz Fischer <mdf@kernel.org>, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Apr 09, 2017 at 04:02:04PM -0700, Guenter Roeck wrote:
> On 04/07/2017 03:00 PM, Moritz Fischer wrote:
> > From: Moritz Fischer <mdf@kernel.org>
> >
> > The ChromeOS EC has mapped memory regions where things like temperature
> > sensors and fan speed are stored. Provide access to those from the
> > cros-ec mfd device.
> >
> > Signed-off-by: Moritz Fischer <mdf@kernel.org>
>
> I'll have to consult with others at Google if this is a good idea.
> Benson, can you comment ?

Well to my knowledge the only other way to get to it is the 'ectool'
from userland
via ioctl calls. The other option would be IIO ...
>
> > ---
> >  drivers/platform/chrome/cros_ec_proto.c | 55 +++++++++++++++++++++++++++++++++
> >  include/linux/mfd/cros_ec.h             | 39 +++++++++++++++++++++++
> >  2 files changed, 94 insertions(+)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> > index ed5dee7..28063de 100644
> > --- a/drivers/platform/chrome/cros_ec_proto.c
> > +++ b/drivers/platform/chrome/cros_ec_proto.c
> > @@ -494,3 +494,58 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev)
> >   return get_keyboard_state_event(ec_dev);
> >  }
> >  EXPORT_SYMBOL(cros_ec_get_next_event);
> > +
> > +static int __cros_ec_read_mapped_mem(struct cros_ec_device *ec, uint8_t offset,
> > +     void *buf, size_t size)
> > +{
> > + int ret;
> > + struct ec_params_read_memmap *params;
> > + struct cros_ec_command *msg;
> > +
> > + msg = kzalloc(sizeof(*msg) + max(sizeof(*params), size), GFP_KERNEL);
> > + if (!msg)
> > + return -ENOMEM;
> > +
>
> I don't think using kzalloc here makes much sense. It is well known
> that size is <= 4, so using a local buffer should not be a problem.

Good point, that was basically copy & paste from other cros-ec code ;-)
I'll fix this.

>
> > + msg->version = 0;
> > + msg->command = EC_CMD_READ_MEMMAP;
> > + msg->insize = size;
> > + msg->outsize = sizeof(*params);
> > +
> > + params = (struct ec_params_read_memmap *)msg->data;
> > + params->offset = offset;
> > + params->size = size;
> > +
> > + ret = cros_ec_cmd_xfer(ec, msg);
> > + if (ret < 0 || msg->result != EC_RES_SUCCESS) {
>
> cros_ec_cmd_xfer_status() was introduced to be able to avoid the second check.
>

Alright, cool. Will fix this.

> > + dev_warn(ec->dev, "cannot read mapped reg: %d/%d\n",
> > + ret, msg->result);
> > + goto out_free;
> > + }
> > +
> > + memcpy(buf, msg->data, size);
> > +
> > +out_free:
> > + kfree(msg);
> > + return ret;
> > +}
> > +
> > +int cros_ec_read_mapped_mem32(struct cros_ec_device *ec, const uint8_t offset,
> > +      uint32_t *data)
> > +{
> > + return __cros_ec_read_mapped_mem(ec, offset, data, sizeof(*data));
> > +}
> > +EXPORT_SYMBOL_GPL(cros_ec_read_mapped_mem32);
> > +
> > +int cros_ec_read_mapped_mem16(struct cros_ec_device *ec, const uint8_t offset,
> > +      uint16_t *data)
> > +{
> > + return __cros_ec_read_mapped_mem(ec, offset, data, sizeof(*data));
> > +}
> > +EXPORT_SYMBOL_GPL(cros_ec_read_mapped_mem16);
> > +
>
> Either case, this assumes that EC endianness matches host endianness. I don't
> think we can just assume that this is the case.

Huh, yeah. Will need to figure out how to detect the EC endianness in
that case.

>
> > +int cros_ec_read_mapped_mem8(struct cros_ec_device *ec, const uint8_t offset,
> > +     uint8_t *data)
> > +{
> > + return __cros_ec_read_mapped_mem(ec, offset, data, sizeof(*data));
> > +}
> > +EXPORT_SYMBOL_GPL(cros_ec_read_mapped_mem8);
> > diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
> > index b3d04de..c2de878 100644
> > --- a/include/linux/mfd/cros_ec.h
> > +++ b/include/linux/mfd/cros_ec.h
> > @@ -190,6 +190,45 @@ struct cros_ec_dev {
> >  };
> >
> >  /**
> > + * cros_ec_read_mapped_mem8 - Read mapped memory in the ChromeOS EC
> > + *
> > + * This can be called by drivers to access the mapped memory in the EC
> > + *
> > + * @ec_dev: Device to read from
> > + * @offset: Offset to read
> > + * @data: Return data
> > + * @return: 0 if Ok, -ve on error
> > + */
> > +int cros_ec_read_mapped_mem8(struct cros_ec_device *ec, const uint8_t offset,
> > +     uint8_t *data);
> > +
> > +/**
> > + * cros_ec_read_mapped_mem16 - Read mapped memory in the ChromeOS EC
> > + *
> > + * This can be called by drivers to access the mapped memory in the EC
> > + *
> > + * @ec_dev: Device to read from
> > + * @offset: Offset to read
> > + * @data: Return data
> > + * @return: 0 if Ok, -ve on error
> > + */
> > +int cros_ec_read_mapped_mem16(struct cros_ec_device *ec, const uint8_t offset,
> > +      uint16_t *data);
> > +
> > +/**
> > + * cros_ec_read_mapped_mem32 - Read mapped memory in the ChromeOS EC
> > + *
> > + * This can be called by drivers to access the mapped memory in the EC
> > + *
> > + * @ec_dev: Device to read from
> > + * @offset: Offset to read
> > + * @data: Return data
> > + * @return: 0 if Ok, -ve on error
> > + */
> > +int cros_ec_read_mapped_mem32(struct cros_ec_device *ec, const uint8_t offset,
> > +      uint32_t *data);
> > +
> > +/**
> >   * cros_ec_suspend - Handle a suspend operation for the ChromeOS EC device
> >   *
> >   * This can be called by drivers to handle a suspend event.
> >
>

Thanks for the feedback,

Moritz
