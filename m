Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56392 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752978AbeDPShH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Apr 2018 14:37:07 -0400
Date: Mon, 16 Apr 2018 11:37:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ahsan_hussain@mentor.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, noor_ahsan@mentor.com,
        cedric_hombourger@mentor.com
Subject: Re: [PATCH 1/1] hwmon: (ina2xx) initialize mutex before locking
Message-ID: <20180416183705.GA12401@roeck-us.net>
References: <1523901203-2981-1-git-send-email-ahsan_hussain@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523901203-2981-1-git-send-email-ahsan_hussain@mentor.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Apr 16, 2018 at 10:53:23PM +0500, ahsan_hussain@mentor.com wrote:
> From: Ahsan Hussain <ahsan_hussain@mentor.com>
> 
> Upstream commit 8d008c0c ("hwmon: (ina2xx) Make calibration register
> value fixed"), makes ina2xx_set_shunt() call mutex_lock on an
> un-initialized mutex. Initialize it prior so we don't get a NULL pointer
> dereference error.
> 
> Fixes: 8d008c0c ("hwmon: (ina2xx) Make calibration register value fixed")
> 
> Signed-off-by: Ahsan Hussain <ahsan_hussain@mentor.com>

Hmm ... the patch still does not apply ... having closer look ....

It appears that you don't use the mainline kernel. Commit 8d008c0c
is not upstream. It is in a stable release. Only which one ... ok,
I see it in linux-4.9.y. The offending commit is also in 4.4.y,
4.14.y, and 4.15.y. The fix needs to be pulled from upstream into
those stable releases. I'll send a request to Greg.

Thanks,
Guenter
