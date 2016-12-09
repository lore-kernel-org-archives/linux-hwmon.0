Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45680 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753308AbcLIJTK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Dec 2016 04:19:10 -0500
Date: Fri, 9 Dec 2016 10:19:08 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (adm1026) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161209101908.694c6fef@endymion>
In-Reply-To: <1481225369-13461-1-git-send-email-linux@roeck-us.net>
References: <1481225369-13461-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu,  8 Dec 2016 11:29:29 -0800, Guenter Roeck wrote:
> Fix overflows seen when writing large values into voltage limit,
> temperature limit, temperature offset, and DAC attributes.
> 
> Overflows are seen due to unbound multiplications and additions.
> 
> While at it, change the low temperature limit to -128 degrees C,
> since this is the minimum temperature accepted by the chip.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Provide reason for changing lower temperature range.
> 
>  drivers/hwmon/adm1026.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
