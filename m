Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36018 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751962AbcHLM5b (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 12 Aug 2016 08:57:31 -0400
Subject: Re: [PATCH] hwmon: correct ftp urls in ftsteutates documentation
To: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>,
	linux-hwmon@vger.kernel.org
References: <1471005550-5685-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Cc: Thilo Cestonaro <thilo@cestona.ro>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b9ff9871-3e1f-b1e1-2b02-e46f49aa4625@roeck-us.net>
Date: Fri, 12 Aug 2016 05:57:28 -0700
MIME-Version: 1.0
In-Reply-To: <1471005550-5685-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/12/2016 05:39 AM, Thilo Cestonaro wrote:
> From: Thilo Cestonaro <thilo@cestona.ro>
>
> Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/ftsteutates | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/hwmon/ftsteutates b/Documentation/hwmon/ftsteutates
> index 2a1bf69..8c10a91 100644
> --- a/Documentation/hwmon/ftsteutates
> +++ b/Documentation/hwmon/ftsteutates
> @@ -19,5 +19,5 @@ enhancements. It can monitor up to 4 voltages, 16 temperatures and
>  implemented in this driver.
>
>  Specification of the chip can be found here:
> -ftp:///pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_V1.21.pdf
> -ftp:///pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf
> +ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_V1.21.pdf
> +ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf
>

