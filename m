Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46119 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752227AbcEVO6z (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 22 May 2016 10:58:55 -0400
Subject: Re: [PATCH 0041/1529] Fix typo
To: Andrea Gelmini <andrea.gelmini@gelma.net>
References: <20160521114107.1029-1-andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, jdelvare@suse.com, corbet@lwn.net,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5741C92E.9090207@roeck-us.net>
Date: Sun, 22 May 2016 07:58:54 -0700
MIME-Version: 1.0
In-Reply-To: <20160521114107.1029-1-andrea.gelmini@gelma.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/21/2016 04:41 AM, Andrea Gelmini wrote:
> Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>

Applied, with updated subject line.

Guenter

> ---
>   Documentation/hwmon/max1668 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/hwmon/max1668 b/Documentation/hwmon/max1668
> index 0616ed9..8f9d570 100644
> --- a/Documentation/hwmon/max1668
> +++ b/Documentation/hwmon/max1668
> @@ -17,7 +17,7 @@ This driver implements support for the Maxim MAX1668, MAX1805 and MAX1989
>   chips.
>
>   The three devices are very similar, but the MAX1805 has a reduced feature
> -set; only two remote temperature inputs vs the four avaible on the other
> +set; only two remote temperature inputs vs the four available on the other
>   two ICs.
>
>   The driver is able to distinguish between the devices and creates sysfs
>

