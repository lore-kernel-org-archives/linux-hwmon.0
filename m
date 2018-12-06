Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38526 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbeLFR7i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Dec 2018 12:59:38 -0500
Date: Thu, 6 Dec 2018 09:59:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
Subject: Re: [PATCH] hwmon: (lm75) Add STLM75 support
Message-ID: <20181206175935.GA10500@roeck-us.net>
References: <20181205211422.22266-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181205211422.22266-1-jagan@amarulasolutions.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Dec 06, 2018 at 02:44:22AM +0530, Jagan Teki wrote:
> The STLM75 is a high-precision digital CMOS temperature sensor
> IC with a sigma-delta temperature-to-digital converter.
> 
> The configuration register mapping is similar to existing lm75
> but the sample rate is 150ms(max).
> 
> Tested on real hardware and verified temperature readings are correct.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Applied to hwmon-next.

Thanks,
Guenter
