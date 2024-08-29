Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941AD1AE05A
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943297; cv=none; b=GVJ/SGZmLu5fWfkym1lnZ9+RqtWDg9HslLlmxp9Z76+QZE/47/EBdSvfVNm4k3+bBjKzy/yoGAXpUwk1XJ6TG3OJQWjDhkMWiE7GuEOIf12ENQ7sphbDL2Aq+ISNeVnioSsr1zzrj0C3chexTqPHgRcfPIEHWihVn0xh8AnivRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943297; c=relaxed/simple;
	bh=lgkKTUCTqsSpQ9G27x3jhEZCo3pbRoKY2DAihE7kjOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAZ4gMMPMYbHx1u6hCJ2lk5GYHVnS0WB71iuWAY58IE37dOxn3HVsXSFQysA3ukfaY8l57HGpjzeWfIlc0xoGSs/kaXo8LvU6IrgBJe+vfuevsO9nf9KrOROCkAXPLScWPd9CAKGqmTxtQZrzxsla5rtqWYVn1mLyeOpExM24fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSE6SiDp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSE6SiDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805ABC4CEC3;
	Thu, 29 Aug 2024 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943297;
	bh=lgkKTUCTqsSpQ9G27x3jhEZCo3pbRoKY2DAihE7kjOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSE6SiDpPe07q4zHMwJgC7rZKITJBL/lPEk/ZIo8zPCNIatprc6t9RdJXNtBMW1T8
	 g7uPFp/dX93i0H458vFNpj2vRIEXZCmXQeBG9Zvhozrdb807WDUMjqKpklCzUn/nMg
	 7rK1zSBPmEijKALHH9ZF+Cd1oAJ/UeRgtNG8SQWLuuen7L37MM62Ko7Hgbcxzpd/lb
	 4uNdnIwB0pa2WMcQipbNKBz9jAmmVhXLDBkQhzIlSQmAFqwjJUomYXJ3u8YCMdlWL7
	 NryzlsmYm41Pbf4f0ac/QrfMZRppHQAS06jDLMh9S2pxiuFgzgWsGOzonL8uNQV+Vg
	 R2Q1mM/SwRrrw==
Date: Thu, 29 Aug 2024 22:54:53 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 07/11] hwmon: (ina2xx) Set alert latch when enabling
 alerts
Message-ID: <ZtCLvaC0Ls5zEovD@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-8-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-8-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:51AM -0700, Guenter Roeck wrote:
> @@ -440,7 +441,7 @@ static ssize_t ina226_alert_store(struct device *dev,
>  	 */
>  	mutex_lock(&data->config_lock);
>  	ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
> -				 INA226_ALERT_CONFIG_MASK, 0);
> +				 INA226_ALERT_CONFIG_MASK | INA226_ALERT_LATCH_ENABLE, 0);
>  	if (ret < 0)
>  		goto abort;
>  
> @@ -451,8 +452,8 @@ static ssize_t ina226_alert_store(struct device *dev,
>  
>  	if (val != 0) {
>  		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
> -					 INA226_ALERT_CONFIG_MASK,
> -					 attr->index);
> +					 INA226_ALERT_CONFIG_MASK | INA226_ALERT_LATCH_ENABLE,
> +					 attr->index | INA226_ALERT_LATCH_ENABLE);

Does it really need to clear and set every time?  Could it set only once in
ina2xx_probe() just like ina2xx_set_alert_polarity()?
