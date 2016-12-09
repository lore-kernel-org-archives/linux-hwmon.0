Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45509 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753308AbcLIJRG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Dec 2016 04:17:06 -0500
Date: Fri, 9 Dec 2016 10:17:02 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (adm9240) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161209101702.244908cb@endymion>
In-Reply-To: <1481224949-4288-1-git-send-email-linux@roeck-us.net>
References: <1481224949-4288-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu,  8 Dec 2016 11:22:29 -0800, Guenter Roeck wrote:
> Module test reports:
> 
> in0_min: Suspected overflow: [3320 vs. 0]
> in0_max: Suspected overflow: [3320 vs. 0]
> in4_min: Suspected overflow: [15938 vs. 0]
> in4_max: Suspected overflow: [15938 vs. 0]
> temp1_max: Suspected overflow: [127000 vs. 0]
> temp1_max_hyst: Suspected overflow: [127000 vs. 0]
> aout_output: Suspected overflow: [1250 vs. 0]
> 
> Code analysis reveals that the overflows are caused by conversions
> from unsigned long to long to int, combined with multiplications on
> passed values.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Improved and simplified clamping
> 
>  drivers/hwmon/adm9240.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
