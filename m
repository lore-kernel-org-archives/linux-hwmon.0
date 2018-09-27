Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 27 Sep 2018 13:44:07 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, "Andrew F. Davis" <afd@ti.com>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>,
	devicetree@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add ina3221 documentation
Message-ID: <20180927204407.GB20923@Asurada-Nvidia.nvidia.com>
References: <20180927194910.18464-1-nicoleotsuka@gmail.com>
 <20180927194910.18464-2-nicoleotsuka@gmail.com>
 <CAL_JsqLcuJyjHFzW7-p4HAZq3g5tGAo0wT8f5ZT_KYWV5X5+5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLcuJyjHFzW7-p4HAZq3g5tGAo0wT8f5ZT_KYWV5X5+5A@mail.gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 27, 2018 at 03:38:44PM -0500, Rob Herring wrote:
> On Thu, Sep 27, 2018 at 2:49 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > Texas Instruments INA3221 is a triple-channel shunt and bus
> > voltage monitor. This patch adds a DT binding doc for it.
> >
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> > Changelog
> > v5->v6:
> >  * Removed status property as no need to explicitly list it.
> >  * Combined all examples into a complete one.
> 
> Sorry, I meant combine the parent and child nodes into one. Showing 3
> children is perfectly fine as the device has 3 channels.

Sending v7.

Thanks
Nicolin
