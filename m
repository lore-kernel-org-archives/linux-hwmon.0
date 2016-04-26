From: Rob Herring <robh@kernel.org>
To: linux-hwmon@vger.kernel.org
Date: Tue, 26 Apr 2016 05:34:24 -0700
Subject: Re: [PATCH 01/11] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160426123332.GA25487@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Apr 25, 2016 at 10:01:52AM -0500, Thor Thayer wrote:
> 
> 
> On 04/25/2016 07:55 AM, Rob Herring wrote:
> >On Fri, Apr 22, 2016 at 10:33:29AM -0500, ttha...@opensource.altera.com 
> >wrote:
> >>From: Thor Thayer <ttha...@opensource.altera.com>
> >>
> >>The Altera Arria10 Devkit System Resource chip is a Multi-Function
> >>Device with a GPIO expander and power supply alarm.
> >
> >An alarm with no interrupt? Are the GPIOs interrupt capable?
> 
> The alarms have no interrupt but the GPIOs are interrupt capable (not
> implemented with interrupt capability in this patch series).

Please make the binding as complete as possible even if you don't 
support features in the driver yet. Driver features may evolve, but a 
specific h/w doesn't.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
