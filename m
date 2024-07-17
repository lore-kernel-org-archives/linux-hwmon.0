Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167D4566A
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223342; cv=none; b=M2HPWWyz0sZMHORCnCDEVTQnlZHY4HIpc6Js2lAnbHCR+Gg1BbpCr8C0YdAyC7qEnFV/NUEym31XLvYP99KE59D6HnO+9XF4RldySlqZm0fV9zcvLqYuhYtUdfeZ6JnZ9uyWG1Mqj1TRfc3kuu1hMilnhM49pl29aI4jF+flhAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223342; c=relaxed/simple;
	bh=McUs+fE4QcPz8wrshJuh6vu1WyNgrmoeiiPGGyNn3Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4OYsXSzuLVGHntvBGbgF6eaaOc9m/no3hdO5uNTZuV/I5Hwoh92REDx3jjFBwPne3jkmYqkGe2VXQm6Qlmajf1NXFwjZ3fwUXiDxAeh+c4EZjDK60ncvPbQ/QdYrya3m2ydFsua65ybIgBIJPkdfRZ5nlucH/Y+Dk8LKBowM6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugwHTDff; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugwHTDff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFAEC32782;
	Wed, 17 Jul 2024 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223341;
	bh=McUs+fE4QcPz8wrshJuh6vu1WyNgrmoeiiPGGyNn3Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugwHTDffB2DjwtF9/bOwsGmAPjo736epxx3iCIhJqzZsSA0PXL27BjjXA8n7HGkbX
	 BLx5mb1Sgiu9WCsjHUpwldXWez3qLYaR/dpmrut0pg6VvDbMyk3X0PY8amthz7Gu/t
	 3MmbjNLjnxWlEfcTSF/oV7GC6p8WiwZFZ+9hV6cP95il6Gbg2IHHotHYnEJHDqMoS2
	 tR6OFj2W5aXYrIQItC18acYudeqiWWLUTZJdVS1QtGXUyK51rKz6DLxkvEqwovgS2h
	 Qh6h538Ec5bbn6deYiecOTiQUu/s30GYSNJANuTI0Pox6QybHGS3fEGB/sX2ArzUNl
	 WulwoCl4tQq3g==
Date: Wed, 17 Jul 2024 21:35:38 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/6] hwmon: (tmp464) Use multi-byte regmap operations
Message-ID: <ZpfIqtrclTDsTy0x@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716230050.2049534-5-linux@roeck-us.net>

On Tue, Jul 16, 2024 at 04:00:48PM -0700, Guenter Roeck wrote:
> @@ -147,11 +147,11 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
>  {
[...]
> -	mutex_lock(&data->update_lock);
> -
>  	switch (attr) {
>  	case hwmon_temp_max_alarm:
>  		err = regmap_read(regmap, TMP464_THERM_STATUS_REG, &regval);
> @@ -172,26 +172,27 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
>  		 * complete. That means we have to cache the value internally
>  		 * for one measurement cycle and report the cached value.
>  		 */
> +		mutex_lock(&data->update_lock);
>  		if (!data->valid || time_after(jiffies, data->last_updated +
>  					       msecs_to_jiffies(data->update_interval))) {
>  			err = regmap_read(regmap, TMP464_REMOTE_OPEN_REG, &regval);
>  			if (err < 0)
> -				break;
> +				goto unlock;
>  			data->open_reg = regval;
>  			data->last_updated = jiffies;
>  			data->valid = true;
>  		}
>  		*val = !!(data->open_reg & BIT(channel + 7));
> +unlock:
> +		mutex_unlock(&data->update_lock);
>  		break;

I think the function can entirely drop the mutex.  Only [1] needs it.

[1]: https://elixir.bootlin.com/linux/v6.10/source/drivers/hwmon/tmp464.c#L313
