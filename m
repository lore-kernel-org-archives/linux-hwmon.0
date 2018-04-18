Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:46944 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbeDRQ4K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Apr 2018 12:56:10 -0400
Date: Wed, 18 Apr 2018 09:55:59 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: minyard@acm.org
Cc: openipmi-developer@lists.sourceforge.net,
        linux-hwmon@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH] hwmon:ibm: Change ipmi_user_t to struct ipmi_user *
Message-ID: <20180418165559.GD5210@magnolia>
References: <1524064430-22093-1-git-send-email-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524064430-22093-1-git-send-email-minyard@acm.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Apr 18, 2018 at 10:13:50AM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Cc: Darrick J. Wong <darrick.wong@oracle.com>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  drivers/hwmon/ibmaem.c | 2 +-
>  drivers/hwmon/ibmpex.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> I'm getting rid of this annoying coding style violation, if you
> could get this in, that would be great.
> 
> diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
> index 1f64378..9e92673 100644
> --- a/drivers/hwmon/ibmaem.c
> +++ b/drivers/hwmon/ibmaem.c
> @@ -101,7 +101,7 @@ static struct platform_driver aem_driver = {
>  struct aem_ipmi_data {
>  	struct completion	read_complete;
>  	struct ipmi_addr	address;
> -	ipmi_user_t		user;
> +	struct ipmi_user	*user;
>  	int			interface;
>  
>  	struct kernel_ipmi_msg	tx_message;
> diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
> index 21b9c72..4f7b12b 100644
> --- a/drivers/hwmon/ibmpex.c
> +++ b/drivers/hwmon/ibmpex.c
> @@ -84,7 +84,7 @@ struct ibmpex_bmc_data {
>  
>  	struct ipmi_addr	address;
>  	struct completion	read_complete;
> -	ipmi_user_t		user;
> +	struct ipmi_user	*user;
>  	int			interface;
>  
>  	struct kernel_ipmi_msg	tx_message;
> -- 
> 2.7.4
> 
