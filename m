Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45785 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752227AbcEVO6g (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 22 May 2016 10:58:36 -0400
Subject: Re: [PATCH 0040/1529] Fix typo
To: Andrea Gelmini <andrea.gelmini@gelma.net>
References: <20160521114100.980-1-andrea.gelmini@gelma.net>
Cc: trivial@kernel.org, jdelvare@suse.com, corbet@lwn.net,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5741C914.806@roeck-us.net>
Date: Sun, 22 May 2016 07:58:28 -0700
MIME-Version: 1.0
In-Reply-To: <20160521114100.980-1-andrea.gelmini@gelma.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/21/2016 04:41 AM, Andrea Gelmini wrote:
> Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>

Applied, but please use a more descriptive subject line the next time.
It should include the affected subsystem and driver.

Thanks,
Guenter

> ---
>   Documentation/hwmon/abituguru | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/hwmon/abituguru b/Documentation/hwmon/abituguru
> index f1d4fe4..44013d2 100644
> --- a/Documentation/hwmon/abituguru
> +++ b/Documentation/hwmon/abituguru
> @@ -24,7 +24,7 @@ Supported chips:
>   				 AW9D-MAX) (2)
>   	1) For revisions 2 and 3 uGuru's the driver can autodetect the
>   	   sensortype (Volt or Temp) for bank1 sensors, for revision 1 uGuru's
> -	   this doesnot always work. For these uGuru's the autodection can
> +	   this does not always work. For these uGuru's the autodetection can
>   	   be overridden with the bank1_types module param. For all 3 known
>   	   revison 1 motherboards the correct use of this param is:
>   	   bank1_types=1,1,0,0,0,0,0,2,0,0,0,0,2,0,0,1
>

