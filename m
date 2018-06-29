Return-Path: <andrew@lunn.ch>
Return-path: <andrew@lunn.ch>
Date: Fri, 29 Jun 2018 09:21:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: netdev <netdev@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>, vadimp@mellanox.com,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] hwmon: Add support for power min, lcrit,
 min_alarm and lcrit_alarm
Message-ID: <20180629072156.GA11285@lunn.ch>
References: <1530218475-4369-1-git-send-email-andrew@lunn.ch>
 <1530218475-4369-2-git-send-email-andrew@lunn.ch>
 <20180628224236.GB20118@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628224236.GB20118@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Jun 28, 2018 at 03:42:36PM -0700, Guenter Roeck wrote:
> On Thu, Jun 28, 2018 at 10:41:14PM +0200, Andrew Lunn wrote:
> > Some sensors support reporting minimal and lower critical power, as
> > well as alarms when these thresholds are reached. Add support for
> > these attributes to the hwmon core.
> > 
> > Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> 
> I am inclined to accept this patch immediately. I'll do that
> in the next couple of days unless someone gives me a good reason
> not to.

Hi Guenter

We need to watch out for merge dependencies. If you take it, you
probably should also take the second patch into your tree as
well. Otherwise, you need a stable branch DaveM can pull into net-next
if he takes the second patch.

I also have a patch to lm-sensors sensors, so it prints these
values. I will create a github pull request.

	Andrew
