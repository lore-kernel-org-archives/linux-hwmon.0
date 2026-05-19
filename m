Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FE0409603;
	Tue, 19 May 2026 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197044; cv=none; b=Z+LD5e7oQjFfQT6wJ54FIVXjL7gbMwT8UKKLSLMiMooXG/XD9Xhp269Pfz20OplEmKoCqd+LPaJdKJMmEnLuEU7Om3YxRNsrikJyDuX3q9LRQOlubXed5A45NhP0bu+XAOL+ExeNKvQgjp5SsC1pwcFGI7E9Ina+XlzvaZziiDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197044; c=relaxed/simple;
	bh=PZZJ6SOKuUxHZpyq6LUq7dCXr8g2wg+VuBzmFpl3peI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG9HrVqcrhQoVnQVoEUp8cIroeWhYnAEMiyXDzCqMM8wj2SXnEWCn+4ynupb0TMQbwIbAW3YbwKT9zx7zLJpIf8XwxIBEvKJw33lddj++pTRHZsGa/vkx7edXPvBo6UlllpJNg8sConiNz+pkz/nDwzXyu8qwb7g/YIhi2URk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gy3qhRPE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gy3qhRPE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04D1C2BCB3;
	Tue, 19 May 2026 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779197044;
	bh=PZZJ6SOKuUxHZpyq6LUq7dCXr8g2wg+VuBzmFpl3peI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gy3qhRPE0kwucGzTZ5je5NXgokjk8/Zv9Frs9e9EGQw/42l8TaCWYTM1Un3pBLmes
	 IxMfYmREtySiIclSUp0XCA2GLRQGZfsX8KhGl0LcXEBTqDCyDsALDeuDUr+ULnQPMb
	 UENcoUUjawY0D0lqHVR8u2kIgBKKHDdpexWwf9ThGMSVGLI68tOS+JN/nYoSq2lcwK
	 YJdIGbgUliYpxvY6HbR4DMHbogCo1TGhSL/gsCgZhTKq873nt0/qQk6bARH+Af6LxJ
	 Cy/BOBjkTz7J81PdQwPWKduq2CvVPZuoHNxU/5KPmLxnBzeClPaIEJCF7DfBUMlqMl
	 uK2trvp0oqIBA==
Date: Tue, 19 May 2026 14:23:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
Message-ID: <20260519-inquisitive-teal-yak-56abd1@sudeepholla>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518193006.27425-1-admiyo@os.amperecomputing.com>

On Mon, May 18, 2026 at 03:30:06PM -0400, Adam Young wrote:
> The tx_done callback function has a return code (rc) parameter
> that the tx_done callback can use to determine how to handle an error.
> However the IRQ handler was not setting that value if there is an error.
> 
> The following clients are affected:
> 
> drivers/acpi/cppc_acpi.c
> drivers/i2c/busses/i2c-xgene-slimpro.c
> drivers/hwmon/xgene-hwmon.c
> drivers/soc/hisilicon/kunpeng_hccs.c
> drivers/devfreq/hisi_uncore_freq.c
> 
> All of these only use the error code to report, so they
> are expecting an error code to come thorugh, but they
> do not modify behavior based on this code.
> 
> In the case of an error code in the IRQ, the handler was returning
> IRQ_NONE which is not correct:  the IRQ handler was matched
> to the IRQ.  This mean that multiple error codes returned from
> a PCC triggered interrupt would end up disabling the device.
> 
> In addition, if the error code IRQ was coming from a Type4 Device that was
> expecting an IRQ response, that device would then be hung.
> 
> Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
> Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
> 
> ---
> ---
>  drivers/mailbox/pcc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db7..16b9ce087b9e 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  {
>  	struct pcc_chan_info *pchan;
>  	struct mbox_chan *chan = p;
> +	int rc;
>  
>  	pchan = chan->con_priv;
>  
> @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	if (!pcc_mbox_cmd_complete_check(pchan))
>  		return IRQ_NONE;
>  
> -	if (pcc_mbox_error_check_and_clear(pchan))
> -		return IRQ_NONE;
> +	rc = pcc_mbox_error_check_and_clear(pchan);

I think we may have to skip the check inside pcc_mbox_error_check_and_clear()
for Type 4 channel as the spec expects OSPM to ignore it. It is a separate
fix, just noting that here.

>  
>  	/*
>  	 * Clear this flag after updating interrupt ack register and just
> @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	 * required to avoid any possible race in updatation of this flag.
>  	 */
>  	pchan->chan_in_use = false;
> -	mbox_chan_received_data(chan, NULL);
> -	mbox_chan_txdone(chan, 0);
> +	if (!rc)
> +		mbox_chan_received_data(chan, NULL);

Not sure if making this conditional is good as some platforms may expect
it to move the state machine, I am not sure 100% just thinking aloud here.

-- 
Regards,
Sudeep
