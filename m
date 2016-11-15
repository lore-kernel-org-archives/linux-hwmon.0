Return-path: <jgunthorpe@obsidianresearch.com>
Date: Mon, 14 Nov 2016 21:32:57 -0700
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3]  lm87: Allow channel data to be set from dts file.
Message-ID: <20161115043257.GB22482@obsidianresearch.com>
References: <20161115040006.7435-1-mahoda.ratnayaka@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161115040006.7435-1-mahoda.ratnayaka@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Nov 15, 2016 at 05:00:06PM +1300, Mahoda Ratnayaka wrote:

> +		if (of_property_read_bool(of_node, "vcc-supply"))
> +			val |= CHAN_VCC_5V;

vcc-supply is a phandle not a bool, you need to use the regulator api
to learn the voltage.

Jason
