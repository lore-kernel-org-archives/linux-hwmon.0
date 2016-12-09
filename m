Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46877 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753178AbcLIJ3y (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Dec 2016 04:29:54 -0500
Date: Fri, 9 Dec 2016 10:29:52 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (adt7462) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161209102952.3ec51771@endymion>
In-Reply-To: <1481225209-12936-1-git-send-email-linux@roeck-us.net>
References: <1481225209-12936-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu,  8 Dec 2016 11:26:49 -0800, Guenter Roeck wrote:
> Fix overflows seen when writing large values into temperature limit,
> voltage limit, and pwm hysteresis attributes.
> 
> The input parameter to DIV_ROUND_CLOSEST() needs to be clamped to avoid
> such overflows.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Simplified clamping
>     Separate clamp_val() and DIV_ROUND_CLOSEST() into two lines.
> 
>  drivers/hwmon/adt7462.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
