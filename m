Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58753 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752499AbcKSRXd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2016 12:23:33 -0500
Date: Sat, 19 Nov 2016 09:23:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, rt@linuxtronix.de,
        Thomas Gleixner <tglx@linutronix.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [05/20] hwmon/via-cputemp: Remove pointless CPU check on each CPU
Message-ID: <20161119172331.GA25098@roeck-us.net>
References: <20161117183541.8588-6-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161117183541.8588-6-bigeasy@linutronix.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 17, 2016 at 07:35:26PM +0100, Sebastian Andrzej Siewior wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The check loop for the cpu type is pointless as we already have a cpu model
> match before that. The only thing which is not covered by that check would
> be a smp system with two different cores. Not likely to happen.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Applied to -next.

Thanks,
Guenter
