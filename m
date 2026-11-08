Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153244;
	b=b+pkTrVNbmOhzPLFHb6yOCXQjf1eiS2euXNmJ9sn6LYDBQ7DgWdWLUFn06m6MsIUhwxE
	 i/EWoGpAHwcfbbZwytbEoXGsPBOV00GDVLY8Bv2xX+MDsu/gr0P0TfwA44n9teKYxQ+E9
	 jubp4Lb0nvlPL70KXbAvangf+R4uMssCotPLaxcj6yJgltGg2S9WQLj1K9/dhk9mftjf0
	 6J3tf48FxE5avNbXnGwHYTewKjCXXQcisoI+1X2yO9edI+U8xdQAQc4cT5YkW3HS9i+d2
	 EhfGVB0DAJkF/nrFBOnAlxSvlKV1eb3CzfQ8nHyWMhOS2kOGI5wuCfoCcr/1/HXLKyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153244;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ZQmMTx5RluJtf0A+XJrvCuHZR5Iy8QjIVd3VWCArd1I=;
	b=ecIBG/8SaKX0KE2zw5pmWwOeH+hUmN4vA0Jf6/EtbgywFw6e8uftEEWMwcfCv51MwdGB
	 XR1tprfU2iTJ/plnfnJCf+yLrhDxmkidkONt7dVqaFUoR3Te+rX75pKu2RYZpU262BuWx
	 VkCADuNnocwHmdY8/xL4I2GNCBafhmIuR6MjXYhEYh1kdo3e6UetqrAV4AXvc5h+5tt32
	 EPNb+6iNAqa+HI7SJ8rYNVSPvVrNyrWWbypJsB7/eBCWD4r5hpayet6cpa5CnrIRqLSTK
	 ngGnBLE4K0Hlh3Rax7yQ1F+CtdxMxSUFne1japh4rSfg3t9BcOvGwi8QZ6mn/Ha1j1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="CKaGdLl/";
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2E2606A31C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 15:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED2E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CKaGdLl/
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id PyLNxSLyxJFmFQ5DXxx2ZO; Sun, 08 Nov 2026 15:54:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q5DXxudJHb2qJQ5DXxGo35; Sun, 08 Nov 2026 15:54:03 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6af09b1b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=4c8sCpXBnLrgCEX_27wA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZQmMTx5RluJtf0A+XJrvCuHZR5Iy8QjIVd3VWCArd1I=; b=CKaGdLl/xMyv+YLa2gl3/DOWEK
	VahdtMogY3I5UygecVfUvZ27un+T923nODQ2RMjvoqL2G0YSIEPrNC1QMexwnGervHZXMSNeGByQs
	ZoT7lqUxY48NuMpy4cvsSRFe+IZWc1KcnN/jLJgfzXUMhFvEM865GAzO0ieV4CUX/9Q910AZP6AjW
	Tqvy658G9NLUsT4lk3O9HxIi16gDVl5wG/PyXuWQNEyGayb9wRS52MhDU6W/Fy2Ww2UuWkH0W7Keb
	Wbg8HsAPkUUkCJ3hlwOaRHHVjOfkzXHLMHvG+LYiLOZdRjx80HEs/QeqWWH46GkF8MDASqXvEi0UX
	/jchPB3A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:39188 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ5DX-00000000ra4-02bA;
	Sun, 08 Nov 2026 21:24:03 +0530
Date: Sun, 8 Nov 2026 07:54:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (max31760) Leave standby mode at probe
Message-ID: <0007b6f9-db5c-4203-a044-0c99e8564283@roeck-us.net>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
 <20261108-max31760-fixes-v1-2-a61450463059@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-max31760-fixes-v1-2-a61450463059@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ5DX-00000000ra4-02bA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:39188
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGDRx0FsuCqQjmmnYA6BynbH4VQGI0/IWb/ciCHvjrH43MTd0mHrWGLs53lwJj8eKHrY8u9pjpoTrwFrkZ47u2FzXtlKJuyI0pPeuo3TMq9KtoDjeelh
 tc6BiqALCR2ax67PlkzCfPRHbnxX7IRB9Um9q3CYpb+vWAYRsmTq+gAshLTkvPTPYBdfa3xcBXNSsLWFX0JydU4MSC4Mfp1p7LTJAhYy68Tk+ledf1zDtTAt

On Sun, Nov 08, 2026 at 03:59:54AM +0000, Stanislav Aleksandrov wrote:
> The driver never clears the standby bit (CR2_STBY) during probe.
> While max31760_resume() clears this bit on resume, probe only
> configured CR2_ALERTS.
> 
> If the chip was left in standby (for example, by boot firmware or a
> previously running OS before a warm reboot), it remains in standby:
> temperature sensing, fan speed counting, and PWM output are halted.
> This occurs on the Samsung Galaxy XR, where the bootloader places the
> chip in standby during boot.
> 
> Clear CR2_STBY alongside setting CR2_ALERTS in probe.
> 
> Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/max31760.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
> index e3d86dc4257e..e967555a21af 100644
> --- a/drivers/hwmon/max31760.c
> +++ b/drivers/hwmon/max31760.c
> @@ -533,8 +533,9 @@ static int max31760_probe(struct i2c_client *client)
>  
>  	dev_set_drvdata(dev, state);
>  
> -	/* Set alert output to comparator mode */
> -	ret = regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
> +	/* Leave standby mode, set alert output to comparator mode */
> +	ret = regmap_update_bits(state->regmap, REG_CR2, CR2_STBY | CR2_ALERTS,
> +				 CR2_ALERTS);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "cannot write register\n");
>  
