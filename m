Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42835 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935977AbeFMQEc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jun 2018 12:04:32 -0400
Date: Wed, 13 Jun 2018 09:04:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jakob Albert <jakob.j.albert@fau.de>
Cc: devel@linuxdriverproject.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenz Kaestle <lorenz.kaestle@fau.de>,
        linux-kernel@i4.cs.fau.de
Subject: Re: [PATCH v2 0/3] hwmon: (nct7904) Fix style issues
Message-ID: <20180613160430.GA11640@roeck-us.net>
References: <1528902805-21474-1-git-send-email-jakob.j.albert@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528902805-21474-1-git-send-email-jakob.j.albert@fau.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 13, 2018 at 05:13:22PM +0200, Jakob Albert wrote:
> This set of patches fixes style errors reported by checkpatch.pl. This
> adapts the code to the coding style.
> 
> Changes since v1:
> * Changed patch subjects and descriptions
> 
> 
> 
> Jakob Albert (3):
>   hwmon: (nct7904) Fix SPACING errors
>   hwmon: (nct7904) Fix CODE_INDENT error
>   hwmon: (nct7904) Fix UNSPECIFIED_INT warning
> 

Series applied to hwmon-next.

Thanks,
Guenter
