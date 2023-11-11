Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09B5667
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Nov 2023 03:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XKCgeMhN"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26033C2F;
	Fri, 10 Nov 2023 19:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=llMnpaL01Y9oCoC10nuyKVdYtVCHMnCE4rqMcViacP0=; b=XKCgeMhN7V7S4H830g9CGf6CXE
	Fy4L5IacTDrvhdKGORw2Q9gnYRQ3vg9MtPcg3fAUoUXjTH148TgMiZ5oGJvn8tVmhQzzsTdVsxkWM
	43uIx3/HkBbUjcy75jUaEGV+1uZzAghGnAgfN+OXT4/oxEbYByPgOX9O5WRiN9BfV2D/BXz58wBdO
	oAbj4WM9MThtComxx/L/HL1B8GmEy4+zE7TrvgV9daKmBcQiDYYBuKHSRQdYZUb/JGWfbET8YukrI
	kIkGSMOCD6RdqAm+iDoQ6DufgPvhV1W7HdVz4bSX324VShJT3gOzocyzbY1rwwOQNJLWYUnHCdow4
	gL8QBPlw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r1eKJ-009udW-1v;
	Sat, 11 Nov 2023 03:06:27 +0000
Message-ID: <540e654b-904e-4201-b526-c9150d6b08d8@infradead.org>
Date: Fri, 10 Nov 2023 19:06:27 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] hwmon: Fix some kernel-doc comments
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, jdelvare@suse.com,
 linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20231110055341.39939-1-yang.lee@linux.alibaba.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231110055341.39939-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/23 21:53, Yang Li wrote:
> Fix some kernel-doc comments to silence the warnings:
> drivers/hwmon/sht4x.c:65: warning: Function parameter or member 'valid' not described in 'sht4x_data'
> drivers/hwmon/sht4x.c:73: warning: Function parameter or member 'data' not described in 'sht4x_read_values'
> drivers/hwmon/sht4x.c:73: warning: Excess function parameter 'sht4x_data' description in 'sht4x_read_values'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7220
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/hwmon/sht4x.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
> index 7ee797410458..4883755d4b1e 100644
> --- a/drivers/hwmon/sht4x.c
> +++ b/drivers/hwmon/sht4x.c
> @@ -49,6 +49,7 @@ DECLARE_CRC8_TABLE(sht4x_crc8_table);
>   * struct sht4x_data - All the data required to operate an SHT4X chip
>   * @client: the i2c client associated with the SHT4X
>   * @lock: a mutex that is used to prevent parallel access to the i2c client
> + * @valid: validity of fields below
>   * @update_interval: the minimum poll interval
>   * @last_updated: the previous time that the SHT4X was polled
>   * @temperature: the latest temperature value received from the SHT4X
> @@ -66,7 +67,7 @@ struct sht4x_data {
>  
>  /**
>   * sht4x_read_values() - read and parse the raw data from the SHT4X
> - * @sht4x_data: the struct sht4x_data to use for the lock
> + * @data: the struct sht4x_data to use for the lock
>   * Return: 0 if successful, -ERRNO if not
>   */
>  static int sht4x_read_values(struct sht4x_data *data)

-- 
~Randy
