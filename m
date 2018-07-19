Return-Path: <stewart@linux.ibm.com>
Return-path: <stewart@linux.ibm.com>
From: Stewart Smith <stewart@linux.ibm.com>
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>, mpe@ellerman.id.au,
        linux@roeck-us.net
Cc: linuxppc-dev@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ego@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 2/2] hwmon: ibmpowernv: Add attributes to enable/disable sensor groups
In-Reply-To: <1531937610-6454-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
References: <1531937610-6454-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com> <1531937610-6454-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Date: Thu, 19 Jul 2018 16:59:21 +1000
MIME-Version: 1.0
Content-Type: text/plain
Message-Id: <87lga7r9rq.fsf@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com> writes:
> On-Chip-Controller(OCC) is an embedded micro-processor in POWER9 chip
> which measures various system and chip level sensors. These sensors
> comprises of environmental sensors (like power, temperature, current
> and voltage) and performance sensors (like utilization, frequency).
> All these sensors are copied to main memory at a regular interval of
> 100ms. OCC provides a way to select a group of sensors that is copied
> to the main memory to increase the update frequency of selected sensor
> groups. When a sensor-group is disabled, OCC will not copy it to main
> memory and those sensors read 0 values.

OCC is an implementation detail rather than a core part of this firmware
API.

Why not something like this:

OPAL firmware provides the facility for some groups of sensors to be
enabled/disabled at runtime to give the user the option of using the
system resources for collecting these sensors or not.

For example, on POWER9 systems, the On Chip Controller (OCC) gathers
various system and chip level sensors and maintains their values in main
memory.


> +static int init_sensor_group_data(struct platform_device *pdev,
> +				  struct platform_data *pdata)
> +{
> +	struct sensor_group_data *sgrp_data;
> +	struct device_node *groups, *sgrp;
> +	enum sensors type;
> +	int count = 0, ret = 0;
> +
> +	groups = of_find_node_by_path("/ibm,opal/sensor-groups");
> +	if (!groups)
> +		return ret;

Why not look for the compatible property?


-- 
Stewart Smith
OPAL Architect, IBM.
