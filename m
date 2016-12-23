Return-path: <julia.lawall@lip6.fr>
Date: Fri, 23 Dec 2016 14:03:55 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Guenter Roeck <linux@roeck-us.net>
cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
    linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 00/66] use permission-specific DEVICE_ATTR variants
In-Reply-To: <42ae040d-9939-5e8e-2157-8f635a3f6ab4@roeck-us.net>
Message-ID: <alpine.DEB.2.20.1612231402210.4056@hadrien>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr> <42ae040d-9939-5e8e-2157-8f635a3f6ab4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-hwmon@vger.kernel.org>

> Hi Julia,
>
> I noticed that drivers/hwmon/gl518sm.c was not converted. Running your script
> on it does not do anything. Any idea what might cause that ?

I believe that it is due to the following:

#define show(type, suffix, value)                                       \
static ssize_t show_##suffix(struct device *dev,                        \
                             struct device_attribute *attr, char *buf)  \
{                                                                       \
        struct gl518_data *data = gl518_update_device(dev);             \
        return sprintf(buf, "%d\n", type##_FROM_REG(data->value));      \
}


Coccinelle doesn't understand the relationship between this macro and the
show functions.

julia
