Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35822 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726768AbeIRPxT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Sep 2018 11:53:19 -0400
Message-ID: <1537266082.4234.3.camel@suse.de>
Subject: Re: [PATCH] hwmon: (lm92) Fix whitespace issues
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Date: Tue, 18 Sep 2018 12:21:22 +0200
In-Reply-To: <1537109242-21449-1-git-send-email-linux@roeck-us.net>
References: <1537109242-21449-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, 2018-09-16 at 07:47 -0700, Guenter Roeck wrote:
> Sparse complains:
> 
> drivers/hwmon/lm92.c:209 set_temp_hyst() warn: inconsistent indenting
> 
> While at it, fix various other whitespace issues reported by checkpatch
> (double empty lines, missing empty lines, whitespace at empty line).
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm92.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks Guenter,
-- 
Jean Delvare
SUSE L3 Support
