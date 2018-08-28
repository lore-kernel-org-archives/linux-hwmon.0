Return-Path: <robh@kernel.org>
Return-path: <robh@kernel.org>
MIME-Version: 1.0
References: <20180828015252.28511-1-robh@kernel.org> <20180828015252.28511-20-robh@kernel.org>
 <aa9473ef-61f6-270f-ff7c-284a2789c0a9@roeck-us.net>
In-Reply-To: <aa9473ef-61f6-270f-ff7c-284a2789c0a9@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Aug 2018 10:11:40 -0500
Message-ID: <CAL_Jsq+3LOyXJQ88Q5pqWTnyvK5v2PDdTjK45H+03QdG30=ajg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Convert to using %pOFn instead of device_node.name
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Aug 28, 2018 at 8:57 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 08/27/2018 06:52 PM, Rob Herring wrote:
> > In preparation to remove the node name pointer from struct device_node,
> > convert printf users to use the %pOFn format specifier.
> >
> > Cc: Jean Delvare <jdelvare@suse.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: linux-hwmon@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> The devm_kstrdup((..., "iio_hwmon") is getting a bit ridiculous and is asking
> for a rewrite, but that can be done in a separate patch.

Yeah, I tend to think the drivers should just set a name rather than
pass thru whatever is in DT. If the DT follows good practice then the
node name is just going to reflect the generic class of device.

> Other than that, do you want this taken through hwmon or as a series on its own ?

You can take it.

Rob
