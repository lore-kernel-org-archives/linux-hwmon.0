Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:32899 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751653AbdKVPFD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Nov 2017 10:05:03 -0500
Received: by mail-pg0-f65.google.com with SMTP id s75so12700498pgs.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Nov 2017 07:05:03 -0800 (PST)
Date: Wed, 22 Nov 2017 07:05:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: hwmon: Drop reference to Jean's tree
Message-ID: <20171122150501.GA12927@roeck-us.net>
References: <20171121170959.310e4636@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171121170959.310e4636@endymion>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Nov 21, 2017 at 05:09:59PM +0100, Jean Delvare wrote:
> This tree has not been used for over a year, Guenter is taking all
> the hwmon patches in practice.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks Jean!

Guenter

> ---
>  MAINTAINERS |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-4.14.orig/MAINTAINERS	2017-11-12 19:46:13.000000000 +0100
> +++ linux-4.14/MAINTAINERS	2017-11-21 17:07:29.991926400 +0100
> @@ -6072,7 +6072,6 @@ M:	Jean Delvare <jdelvare@suse.com>
>  M:	Guenter Roeck <linux@roeck-us.net>
>  L:	linux-hwmon@vger.kernel.org
>  W:	http://hwmon.wiki.kernel.org/
> -T:	quilt http://jdelvare.nerim.net/devel/linux/jdelvare-hwmon/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>  S:	Maintained
>  F:	Documentation/hwmon/
