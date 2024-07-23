Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A61A134B6
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 05:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721713048; cv=none; b=oCLMLkDOE2UAUiwvxUFJ48Am0QzVqo5x+1lC5eIpEmXqAlrV1vbYCqcMSMTa3+7FRWeNcOPqluCMM/qqi5pGYvMF4/5hDb4AhVeEcqOrUrfZiKwaG4xY+mep14528kzjAYh70bI7DEvjqs0HgrGmUFs6/c7gE9HoMUKj6j9Rvuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721713048; c=relaxed/simple;
	bh=rLoJJjYfXWDCYgLGzNPZGsHzkFqi2ALGPSFidqHEFLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhO8sgA/3gQLDiU39Eh9RD8kfNBQC75EYNjRVFznXhntfLXZYmOJnJNqMYo4Cm0hnfBe07FCRDfqfL/eayXOdAuY3GMdFztdOPVG++bZApDca7GCHEXHwJj4r0qQSSMw2H375xsdTNut90ZLQ/VFmiKfFV7C944UBgLNjZLKx4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtOyNW2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtOyNW2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9D1C4AF0B;
	Tue, 23 Jul 2024 05:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721713047;
	bh=rLoJJjYfXWDCYgLGzNPZGsHzkFqi2ALGPSFidqHEFLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtOyNW2BVUjdvFFbmIvQ7iY24qqeU9gxGKd0VypYGHXY3pakVmjSRDCAbIbMeuH2C
	 qciVuv3zjJM6VCXpAqDUtFCrnUdp6eIKdrrQwi9PB4snYj9hjQtuDn13B/WYZ4obYc
	 rUsbJYCUnI9ZIc8fldGgPLlS3Xg3JGFZME1xI/SMPuB3K0aN7bCfW1BL18e9A/j7Sk
	 z8DPcUy5DvfVN/Ej/OimWU2PgsC/gdy5M9JagpmpBb5CD19oWkYkPWK6z5rWwdh8si
	 cjXofTnyYOmfOMYv1aiXHX2/5u7E/MbdlvcroCQCbkAGI38rOgierjcLkcB4zdea2K
	 cLFNs8DrJWN+g==
Date: Tue, 23 Jul 2024 05:37:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/6] hwmon: (max6697) Use bit operations where possible
Message-ID: <Zp9BlV3Hw00QNccD@google.com>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723005204.1356501-4-linux@roeck-us.net>

On Mon, Jul 22, 2024 at 05:52:01PM -0700, Guenter Roeck wrote:
> @@ -32,20 +34,31 @@ static const u8 MAX6697_REG_CRIT[] = {
>  			0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27 };
>  
>  /*
> - * Map device tree / platform data register bit map to chip bit map.
> + * Map device tree / internal register bit map to chip bit map.
>   * Applies to alert register and over-temperature register.
>   */
> +
> +#define MAX6697_EXTERNAL_MASK_DT	GENMASK(7, 1)
> +#define MAX6697_LOCAL_MASK_DT		BIT(0)
> +#define MAX6697_EXTERNAL_MASK_CHIP	GENMASK(6, 0)
> +#define MAX6697_LOCAL_MASK_CHIP		BIT(7)
> +
> +/* alert - local channel is in bit 6 */
>  #define MAX6697_ALERT_MAP_BITS(reg)	((((reg) & 0x7e) >> 1) | \
>  				 (((reg) & 0x01) << 6) | ((reg) & 0x80))
> -#define MAX6697_OVERT_MAP_BITS(reg) (((reg) >> 1) | (((reg) & 0x01) << 7))
> +
> +/* over-temperature - local channel is in bit 7 */
> +#define MAX6697_OVERT_MAP_BITS(reg)	\
> +	(FIELD_PREP(MAX6697_EXTERNAL_MASK_CHIP, FIELD_GET(MAX6697_EXTERNAL_MASK_DT, reg)) | \
> +	 FIELD_PREP(MAX6697_LOCAL_MASK_CHIP, FIELD_GET(MAX6697_LOCAL_MASK_DT, reg)))

How about:
#define MAX6697_OVERT_MAP_BITS(reg)	\
    (FIELD_GET(MAX6697_EXTERNAL_MASK_DT, reg) | \
     FIELD_PREP(MAX6697_LOCAL_MASK_CHIP, reg))
