Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 20 Sep 2018 18:24:48 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, afd@ti.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180921012447.GB23354@Asurada-Nvidia.nvidia.com>
References: <20180921000753.21846-1-nicoleotsuka@gmail.com>
 <20180921000753.21846-2-nicoleotsuka@gmail.com>
 <d744da89-ebd3-6059-31bf-e65e4c3d2ea4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d744da89-ebd3-6059-31bf-e65e4c3d2ea4@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 20, 2018 at 05:45:07PM -0700, Guenter Roeck wrote:
> On 09/20/2018 05:07 PM, Nicolin Chen wrote:
> > +- ti,channel1-name:
> > +- ti,channel2-name:
> > +- ti,channel3-name:
> > +	The names of the input sources (described in the schematics)
> > +	Set the names with "NC" to indicate not-connected channels
> > +
> 
> I don't really think this is a good idea - first to specify sensor
> names this way, and much less specifying that "NC" means that a sensor
> shall be disconnected/disabled.

I will replace the NC with a bool property for disconnection.

> Also, if we define devicetree support for this chip, it should include
> all configuration options required to configure it. This should at
> the very least include shunt resistor values.

I plan to add them too but am doing it incrementally. I can
try to include them in the next version.

Thanks
Nicolin
