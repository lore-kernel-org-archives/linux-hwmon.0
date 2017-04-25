Return-path: <clg@kaod.org>
Subject: Re: [PATCH] hwmon: (ibmpowernv) Add min/max attributes and current
 sensors
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <1492749112-32465-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, svaidy@linux.vnet.ibm.com,
 ego@linux.vnet.ibm.com, akshay.adiga@linux.vnet.ibm.com, andrew@aj.id.au
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f10a3983-def5-e3dc-9c19-a1119e1dd612@kaod.org>
Date: Tue, 25 Apr 2017 16:34:32 +0200
MIME-Version: 1.0
In-Reply-To: <1492749112-32465-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

...

> +			sdata[count].id = sensor_id;
> +			sdata[count].type = type;
> +			sdata[count].hwmon_index = sdata[count - 1].hwmon_index;
> +			create_hwmon_attr(&sdata[count], attr_name,
> +					  show_sensor);
> +			pgroups[type]->attrs[sensor_groups[type].attr_count++] =
> +				&sdata[count++].dev_attr.attr;
> +		}

We are duplicating these lines at least three times. I wonder if we 
could make a routine for them. Don't bother doing so if the number
of arguments is too large.

Thanks,

C.
