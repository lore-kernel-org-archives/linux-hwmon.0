Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1486509056-25838-7-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com> <1486509056-25838-7-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Feb 2017 16:01:58 +1030
Message-ID: <CACPK8XeX12cQgJ2HqHFqvZmFh7TNWMJq3ysaOOmnh-kp02D+YA@mail.gmail.com>
Subject: Re: [PATCH linux v7 6/6] hwmon: occ: Add callbacks for parsing P9 OCC datastructures
To: eajames <eajames@linux.vnet.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Feb 8, 2017 at 9:40 AM,  <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add functions to parse the data structures that are specific to the OCC on
> the POWER9 processor. These are the sensor data structures, including
> temperature, frequency, power, and "caps."
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/hwmon/occ    |   3 +
>  drivers/hwmon/occ/occ_p9.c | 309 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/occ_p9.h |  30 +++++
>  3 files changed, 342 insertions(+)
>  create mode 100644 drivers/hwmon/occ/occ_p9.c
>  create mode 100644 drivers/hwmon/occ/occ_p9.h

> diff --git a/drivers/hwmon/occ/occ_p9.c b/drivers/hwmon/occ/occ_p9.c
> new file mode 100644
> index 0000000..9c1283c
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p9.c
> @@ -0,0 +1,309 @@
> +/*
> + * occ_p9.c - OCC hwmon driver
> + *
> + * This file contains the Power9-specific methods and data structures for
> + * the OCC hwmon driver.
> + *
> + * Copyright 2016 IBM Corp.

It's 2017.

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

We generally just include the first paragraph. Same goes for all of the files.

> +
> +static const u32 p9_sensor_hwmon_configs[MAX_OCC_SENSOR_TYPE] = {
> +       HWMON_I_INPUT | HWMON_I_LABEL,  /* freq: value | label */
> +       /* temp: value | label | fru_type */
> +       HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_TYPE,
> +       /* power: value | label | accum[0] | accum[1] | update_tag |
> +        *       (function_id | (apss_channel << 8))
> +        */
> +       HWMON_P_INPUT | HWMON_P_LABEL | HWMON_P_AVERAGE_MIN |
> +               HWMON_P_AVERAGE_MAX | HWMON_P_AVERAGE_INTERVAL |
> +               HWMON_P_RESET_HISTORY,
> +       /* caps: curr | max | min | norm | user | source */
> +       HWMON_P_CAP | HWMON_P_CAP_MAX | HWMON_P_CAP_MIN | HWMON_P_MAX |
> +               HWMON_P_ALARM | HWMON_P_CAP_ALARM,

I find this really hard to read. Perhaps something like this:


#define FREQ_CONFIG        (HWMON_I_INPUT | HWMON_I_LABEL)
#deifne TEMP_CONFIG        (HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_TYPE)
#define POWER_CONFIG    ( HWMON_P_INPUT | HWMON_P_LABEL |
HWMON_P_AVERAGE_MIN | \
                                                 HWMON_P_AVERAGE_MAX |
HWMON_P_AVERAGE_INTERVAL | \
                                                 HWMON_P_RESET_HISTORY)

etc. Do the same in the p8 driver.


> diff --git a/drivers/hwmon/occ/occ_p9.h b/drivers/hwmon/occ/occ_p9.h
> new file mode 100644
> index 0000000..18ca16a
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p9.h

> +
> +#ifndef __OCC_P9_H__
> +#define __OCC_P9_H__
> +
> +#include "scom.h"
> +
> +struct device;

Include the header for struct device instead.

Did you consider the one header file for all of your shared functions?
I don't think there's much value in having a whole heap of small ones.

> +
> +const u32 *p9_get_sensor_hwmon_configs(void);
> +struct occ *p9_occ_start(struct device *dev, void *bus,
> +                        struct occ_bus_ops *bus_ops);
> +
> +#endif /* __OCC_P9_H__ */
> --
> 1.8.3.1
>
