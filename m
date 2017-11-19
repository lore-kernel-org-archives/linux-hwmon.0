Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43996 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751004AbdKSUr2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Nov 2017 15:47:28 -0500
Date: Sun, 19 Nov 2017 21:47:26 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: Drop unnecessary 'default n' from Kconfig
Message-ID: <20171119214726.0a6fbdd7@endymion>
In-Reply-To: <1511111762-6419-1-git-send-email-linux@roeck-us.net>
References: <1511111762-6419-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Sun, 19 Nov 2017 09:16:02 -0800, Guenter Roeck wrote:
> 'default n' is default, so there is no need to specify it explicitly.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/Kconfig | 16 ----------------
>  1 file changed, 16 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

(and heartily approved - thanks for doing that)

-- 
Jean Delvare
SUSE L3 Support
