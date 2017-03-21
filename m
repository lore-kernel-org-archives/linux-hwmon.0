Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:52070 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932430AbdCUOPU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Mar 2017 10:15:20 -0400
Date: Tue, 21 Mar 2017 14:08:12 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170321140812.GZ21222@n2100.armlinux.org.uk>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
 <20170312132544.GA17687@roeck-us.net>
 <20170312141522.GL21222@n2100.armlinux.org.uk>
 <20170312142634.GA1917@roeck-us.net>
 <20170321134430.GA3177@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170321134430.GA3177@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Mar 21, 2017 at 06:44:30AM -0700, Guenter Roeck wrote:
> On Sun, Mar 12, 2017 at 07:26:34AM -0700, Guenter Roeck wrote:
> > On Sun, Mar 12, 2017 at 02:15:22PM +0000, Russell King - ARM Linux wrote:
> > > On Sun, Mar 12, 2017 at 06:25:44AM -0700, Guenter Roeck wrote:
> > > > I found some reference suggesting that The IT8705F may respond on
> > > > both SIO addresses. Can you try the following patch ?
> > > 
> > > Thanks for the patch - it'll take about a week or so for me to test,
> > > as I can only risk testing it when I'm physically at the machine.
> > > 
> > 
> > My pleasure. Sorry for the trouble. I attached a more comprehensive version
> > of the patch.
> > 
> Hi Russell,
> 
> did you by any chance have time to test the patch ? I would like to send
> the fix upstream, but I held it back in the hope to get feedback if it
> actually solves the problem.

Sorry, I haven't, and given my current situation, I'm unlikely to be
able to for quite some time (medical issues).

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
