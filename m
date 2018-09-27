Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 27 Sep 2018 15:11:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: ina3221: Read channel input source info
 from DT
Message-ID: <20180927221111.GA29012@Asurada-Nvidia.nvidia.com>
References: <20180927205406.21932-1-nicoleotsuka@gmail.com>
 <20180927205406.21932-3-nicoleotsuka@gmail.com>
 <20180927220620.GD9198@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180927220620.GD9198@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 27, 2018 at 03:06:20PM -0700, Guenter Roeck wrote:
 
> I am quite sure I asked to use kstrtobool(). Did that get lost or do you have
> some reason to not use it ?
> 
> I can understand if you don't want to change ina3221_is_enable() to
> ina3221_is_enabled(), since that is POV, but I don't really understand
> why you did not make the other changes. Am I missing something ?

Sorry, my fault. It's not really "I don't want to" but I missed the
part in that review. Will fix them all.

Thanks
Nicolin
