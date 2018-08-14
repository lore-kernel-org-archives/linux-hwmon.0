Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39369 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732699AbeHNQZw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 12:25:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id a11-v6so9114115pgw.6
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Aug 2018 06:38:39 -0700 (PDT)
Date: Tue, 14 Aug 2018 06:38:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lothar Felten <lothar.felten@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: (ina2xx) fix sysfs shunt resistor read access
Message-ID: <20180814133838.GA27969@roeck-us.net>
References: <20180814070937.3794-1-lothar.felten@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180814070937.3794-1-lothar.felten@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 14, 2018 at 09:09:37AM +0200, Lothar Felten wrote:
> fix the sysfs shunt resistor read access: return the shunt resistor
> value, not the calibration register contents.
> 
> update email address
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Applied.

Thanks,
Guenter
