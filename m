Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from smtprelay0086.hostedemail.com ([216.40.44.86]:57093 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725726AbeLBHqr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 2 Dec 2018 02:46:47 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 5FCA78005A6C
        for <linux-hwmon@vger.kernel.org>; Sat,  1 Dec 2018 20:27:22 +0000 (UTC)
Message-ID: <188e822951d0b3a30cf4eea8ec0ea7b6d3bb4fca.camel@perches.com>
Subject: Re: [PATCH 2/2] hwmon: Remove multiple space after dot
From: Joe Perches <joe@perches.com>
To: Corentin Labbe <clabbe@baylibre.com>, jdelvare@suse.com,
        linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 01 Dec 2018 12:27:18 -0800
In-Reply-To: <1543522155-17406-2-git-send-email-clabbe@baylibre.com>
References: <1543522155-17406-1-git-send-email-clabbe@baylibre.com>
         <1543522155-17406-2-git-send-email-clabbe@baylibre.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, 2018-11-29 at 20:09 +0000, Corentin Labbe wrote:
> This patch remove extra space after a dot.
[]
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
---
>  drivers/hwmon/Kconfig | 236 +++++++++++++++++++++---------------------
>  1 file changed, 118 insertions(+), 118 deletions(-)
[]
> @@ -11,7 +11,7 @@ menuconfig HWMON
>  	  of a system. Most modern motherboards include such a device. It
>  	  can include temperature sensors, voltage sensors, fan speed
>  	  sensors and various additional features such as the ability to
> -	  control the speed of the fans.  If you want this support you
> +	  control the speed of the fans. If you want this support you
>  	  should say Y here and also to the specific driver(s) for your
>  	  sensors chip(s) below.

Please no.

You can't pry two spaces after a period when using a
fixed width font from me.

And the use is nowhere consistent in the kernel as it's
less than 2:1 in favor of one style over the other.

$ git grep -i '[a-z][a-z]\. [a-z][a-z ]' | wc -l
146888
$ git grep -i '[a-z][a-z]\.  [a-z][a-z ]' | wc -l
85195

The kernel Kconfig use ratio is similar.

$ git grep -i '[a-z][a-z]\. [a-z][a-z ]' -- '*/Kconfig*' | wc -l
5389
$ git grep -i '[a-z][a-z]\.  [a-z][a-z ]' -- '*/Kconfig*' | wc -l
2463

And even in this specific file, it's reversed ratio

$ git grep -i '[a-z][a-z]\. [a-z][a-z ]' -- 'drivers/hwmon/Kconfig*' | wc -l
70
$ git grep -i '[a-z][a-z]\.  [a-z][a-z ]' -- 'drivers/hwmon/Kconfig*' | wc -l
129

So if you _really_ wanted to do this, please do the
entire file consistently.

You seemed to do 118 conversions.  Shouldn't there be 129?
