Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:39775 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933210AbeBVRZE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Feb 2018 12:25:04 -0500
Subject: Re: [RFC PATCH] drivers/peci: peci_match_id() can be static
To: fengguang.wu@intel.com
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
        gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
        benh@kernel.crashing.org, andrew@lunn.ch,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
 <20180222070111.GA22310@lkp-ne02>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f5f9afd0-a5ce-346f-772a-e8dec78bd872@linux.intel.com>
Date: Thu, 22 Feb 2018 09:25:02 -0800
MIME-Version: 1.0
In-Reply-To: <20180222070111.GA22310@lkp-ne02>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 2/21/2018 11:01 PM, kbuild test robot wrote:
> 
> Fixes: 99f5d2b99ecd ("drivers/peci: Add support for PECI bus driver core")
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> ---
>   peci-core.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
> index d976c73..4709b8c 100644
> --- a/drivers/peci/peci-core.c
> +++ b/drivers/peci/peci-core.c
> @@ -770,8 +770,8 @@ peci_of_match_device(const struct of_device_id *matches,
>   }
>   #endif
>   
> -const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
> -					   struct peci_client *client)
> +static const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
> +						  struct peci_client *client)
>   {
>   	if (!(id && client))
>   		return NULL;
> 

Hi Fengguang,

Thanks a lot for the fix. I'll merge your patch in v3 submission.

BR,
Jae
