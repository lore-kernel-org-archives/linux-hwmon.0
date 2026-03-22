Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776A2DF3FD
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189355; cv=none; b=QiB2T/nR5bIq5O3s4+fciHDOUArD9nYZyRPUkYU3n/Lk84p4A+p7v3HEwuaGOS0H6+H5pzoVc6jXBXKRGT5HywUh4RUDTtn8lMgQ3CHp+kOVsMjCwdQuWsGNQk+kx4L5Hv6HNak/zQvcqyFdYrsbtUFUX0HHOgnpnIKWV75fUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189355; c=relaxed/simple;
	bh=eMDhzc2hSxs25T5e80ZInysl7aGQk4nQnQ4SDi73ZeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/0zeIUffB807nyUWQE/OO6Tnby75TWCpdE8rEYcrMW0f848INyAqMnf3lOEMtcR5uvYz6UMvr81Im9/GEsCIJY0BR4DdS9gXzAG9nBBhMHKny4pyexUCodOuOfs7PSHRrGr6Ev1rvW/MjLiW57EBc82yW7D7LFUd4pwWWkLgZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f18sPkKy; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f18sPkKy"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1954542eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189353; x=1774794153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXtu4vWFf84nyFq4kigv3ZVOF6HDlGnNmELe5UVz+MM=;
        b=f18sPkKyGCVEu/ijDIn+U9FGWfkaq59h6nPaAA1TBf7Ey6Xvtqv2BcSGk/J8+oIXO3
         ykl8TszsnMWg1GXHXBjmaSJ9IUVEfg6GR7IVdt94sMqQ7rxKTJiyYTdRL4Y/H4OXT0KM
         2sxlBSPN4m0O88CBFJ1dhNJytgVjg5znsfVawMacrITaTbpqa8KHej71Rv99JW7X98cF
         n8Loi5/qwRGE96UkGO7R4rU1dcOsY1tw3ckT/L9Pai3j9WnkvmfPMAKMmLaMmJ+ly832
         iZUYIpVDisOBG2dsO7DfgWCSkU3M+ADgUObnIkUnC3dR7sa+C1q10GaU5/PGgXW+HNhd
         UBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189353; x=1774794153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXtu4vWFf84nyFq4kigv3ZVOF6HDlGnNmELe5UVz+MM=;
        b=jhoFr4p8K0Nt0RCYzT60FSSBT4aiAcD9oFdxhfgSoznflji6flEWtfQdqr6ytwFZbB
         ZhOHgqmfOOpvWJgdIVu7WE8mipLQoyJ360/GYzNcUrsccCYuebcCgRU++ksuRkahLMnw
         n4WVkDq6TcAZ7tpfmkvXq0S+ecAjWu/JHCZ5HnoEjVCehRfE9TeVjpTtS0AWiRf5LReT
         QZ9Cu+zRgYXIlSr4a+CpRj6j955M30svLKigW+JPNJ/FcDSERhyk+i9vaZ9l1uom3vLR
         gj2WiHuhQ6/PLq350WDKBcB/mwKedtRc7jZfhGeEvoMirTxQfMDKCyvGzJpG/9KsnUfX
         8Mbw==
X-Gm-Message-State: AOJu0YzQ9Thb4PTpxk/tdQioMI1rnQ/H0H16A8EoOxMrBJkQxV8zJBCv
	Bg2txCfSzCHd5hDxV0Wbr0aLxZ/+DvXc6jFTrtcsg5C5a39dvQn+JHyKxJE/iw==
X-Gm-Gg: ATEYQzyx7HIB0kzTgkYyFvDG5+2nVPsRY2+kKlkUabRlEkHuWI6zS/JdgUm0MVWQByw
	ICwrbEUEB+XPikS798nqcBw9C+7MSSLAn2xzSqZSenVw3Zz124G/WxkJ/DZDIMTKUVzZ3iEBngF
	RgVwKpsnZ+lhFkcjJETCPwVn1ZtlEPT/n0VsDyU8XwgNNNkoDdASRodX0dooU8cMBlXyfcLgKbx
	8kBmPeHQ5/+2+QrY0LomdGq08DPeKn/mpzir1szEjh1IYOjCVPY7OkbWKvBM0iqWXI8C6AVJOUL
	ahjRdSNZjpk/kS1p/pxwoTitrpuZVzkdf1bS5SgQwlsqyYlKkOS94XG3Yp9fldP5mVjgxWypuEs
	uhcF2fzkOc3XBjC7ZLyTq0Dut0WDlj0DKI/Ul3+K7lfD8O8FS8YgdRgBynnemkL2xagRARVDS84
	mSYNThQW3wCQRCoY/6Hgctb0i6afbuWreozC2A
X-Received: by 2002:a05:7301:4083:b0:2be:8da:3207 with SMTP id 5a478bee46e88-2c1095a5704mr4502105eec.6.1774189353348;
        Sun, 22 Mar 2026 07:22:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c99bsm10164098eec.1.2026.03.22.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:22:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 07:22:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/ina233) Fix error handling and sign
 extension in shunt voltage read
Message-ID: <c7be3ee6-174d-45cd-a9a7-17a7aad8e8cf@roeck-us.net>
References: <20260319173055.125271-1-sanman.pradhan@hpe.com>
 <20260319173055.125271-2-sanman.pradhan@hpe.com>
 <f5221388-a939-4a6e-a00d-c2d8302cca80@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5221388-a939-4a6e-a00d-c2d8302cca80@roeck-us.net>

On Sun, Mar 22, 2026 at 07:20:43AM -0700, Guenter Roeck wrote:
> On Thu, Mar 19, 2026 at 05:31:19PM +0000, Pradhan, Sanman wrote:
> > From: Sanman Pradhan <psanman@juniper.net>
> > 
> > ina233_read_word_data() reads MFR_READ_VSHUNT via pmbus_read_word_data()
> > but has two issues:
> > 
> > 1. The return value is not checked for errors before being used in
> >    arithmetic. A negative error code from a failed I2C transaction is
> >    passed directly to DIV_ROUND_CLOSEST(), producing garbage data.
> > 
> > 2. MFR_READ_VSHUNT is a 16-bit two's complement value. Negative shunt
> >    voltages (values with bit 15 set) are treated as large positive
> >    values since pmbus_read_word_data() returns them zero-extended in an
> >    int. This leads to incorrect scaling in the VIN coefficient
> >    conversion.
> > 
> > Fix both issues by adding an error check, casting to s16 for proper
> > sign extension, and clamping the result to a valid non-negative range.
> > The clamp is necessary because read_word_data callbacks must return
> > non-negative values on success (negative values indicate errors to the
> > pmbus core).
> > 
> > Fixes: b64b6cb163f16 ("hwmon: Add driver for TI INA233 Current and Power Monitor")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> > ---
> >  drivers/hwmon/pmbus/ina233.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
> > index dde1e16783943..1f7170372f243 100644
> > --- a/drivers/hwmon/pmbus/ina233.c
> > +++ b/drivers/hwmon/pmbus/ina233.c
> > @@ -67,10 +67,13 @@ static int ina233_read_word_data(struct i2c_client *client, int page,
> >  	switch (reg) {
> >  	case PMBUS_VIRT_READ_VMON:
> >  		ret = pmbus_read_word_data(client, 0, 0xff, MFR_READ_VSHUNT);
> > +		if (ret < 0)
> > +			return ret;
> >  
> >  		/* Adjust returned value to match VIN coefficients */
> >  		/* VIN: 1.25 mV VSHUNT: 2.5 uV LSB */
> > -		ret = DIV_ROUND_CLOSEST(ret * 25, 12500);
> > +		ret = clamp_val(DIV_ROUND_CLOSEST((s16)ret * 25, 12500),
> > +				0, 0x7FFF);
> 
> The clamp should be to 0xffff, not 0x7fff. That is still a positive return
> value, but does not drop the sign bit (bit 15).
> 
Never mind though, I'll fix that up myself.

Applied.

Thanks,
Guenter
