Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41951 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbeHJSoF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Aug 2018 14:44:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id y10-v6so4740604pfn.8
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Aug 2018 09:13:36 -0700 (PDT)
Date: Fri, 10 Aug 2018 09:13:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 0/4] hwmon: (adt7475) Add error handling for update
 function
Message-ID: <20180810161333.GA3404@roeck-us.net>
References: <20180808013219.26118-1-ikegami@allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180808013219.26118-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 08, 2018 at 10:32:15AM +0900, Tokunori Ikegami wrote:
> Currently the device update function does not care the I2C SMBus error.
> This causes a spurious sensor warining detection by sensor application.
> To prevent this issue add error handling for the update function.
> Also change the show functions to return error pointer value.
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: linux-hwmon@vger.kernel.org
> 
> Tokunori Ikegami (4):
>   hwmon: (adt7475) Split device update function to measure and limits
>   hwmon: (adt7475) Change valid parameter to bool type
>   hwmon: (adt7475) Change update functions to add error handling
>   hwmon: (adt7475) Change show functions to return error data correctly
> 

Series applied to hwmon-next.

Thanks,
Guenter
