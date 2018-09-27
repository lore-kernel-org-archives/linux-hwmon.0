Return-Path: <robh+dt@kernel.org>
Return-path: <robh+dt@kernel.org>
MIME-Version: 1.0
References: <20180927194910.18464-1-nicoleotsuka@gmail.com> <20180927194910.18464-2-nicoleotsuka@gmail.com>
In-Reply-To: <20180927194910.18464-2-nicoleotsuka@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 27 Sep 2018 15:38:44 -0500
Message-ID: <CAL_JsqLcuJyjHFzW7-p4HAZq3g5tGAo0wT8f5ZT_KYWV5X5+5A@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, "Andrew F. Davis" <afd@ti.com>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>, devicetree@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 27, 2018 at 2:49 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
> v5->v6:
>  * Removed status property as no need to explicitly list it.
>  * Combined all examples into a complete one.

Sorry, I meant combine the parent and child nodes into one. Showing 3
children is perfectly fine as the device has 3 channels.

Rob
