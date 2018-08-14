Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40882 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732741AbeHNQ0s (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 12:26:48 -0400
Date: Tue, 14 Aug 2018 06:39:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (adt7475) Potential error pointer dereferences
Message-ID: <20180814133934.GA11077@roeck-us.net>
References: <20180814091236.zubxfj32bedobr52@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180814091236.zubxfj32bedobr52@kili.mountain>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 14, 2018 at 12:12:36PM +0300, Dan Carpenter wrote:
> The adt7475_update_device() function returns error pointers.  The
> problem is that in show_pwmfreq() we dereference it before the check.
> And then in pwm_use_point2_pwm_at_crit_show() there isn't a check at
> all.  I don't know if it's required, but it silences a static checker
> warning and it's doesn't hurt anything to check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

Applied.

Thanks,
Guenter
