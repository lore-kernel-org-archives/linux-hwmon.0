Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0210315785
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Feb 2026 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770620022; cv=none; b=rmzbR78IADTaaSZvZvAgRXc8+ldSHhwSGNTIzQ0p+ek+gRDtlcrf+fg5MVrkG/TLj+FMaYZEAciS3h6suO5fKDWAAEprBVz1bcI+/Fq2SXj9P5Qaf4jAe1APhBKwlA4uG5WzL/CxTm3MYgQsQr9a/epCjW7Us83uBQj9WWxKAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770620022; c=relaxed/simple;
	bh=34oE8k9pbYUI5EGosABwPmeVX24fpZFq86+F+iptjnk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPS/uc2xEntALOK1+iY/wMbkqJbnquuEph9m0A6nTOGvRJYLWXNewErfbDzvZcaNIG4kUfaPPAi9q141Q9Pj87KVE49hucN4f1LQjm4eP8yeOlkka6lzrV/yaFGfdpUCqPIZk9XTZQe6TNYKyv4k/JB6wEW5HoOec7PgaGc+a/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TR8pGz/t; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TR8pGz/t"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-352dda4a34eso1718431a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Feb 2026 22:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770620022; x=1771224822; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J0yBZlUfIwO8R+8/v699G5QRXerYU4/HGTHJycEONF0=;
        b=TR8pGz/tufmAFgA6xgWviADId42jKk5sYv0ITja6rUsXUI5Lg1iYtJ5wxZWKSTK2qe
         ilhc5MsAa97OEUtdoWR61MEPXMh1j829hrPSqfR6oKHkEcnnZFx3bNL5Dmz+jXqVAR4p
         C8eyFmaOjvWI9ccLfkl56uzEJjQr7ivUix4WE6Qy9nOySJhvL3BAdRl90LoVAuezzzB8
         LzBbVM0u5eXZifpZdg+/00WihuTbUxL37GBtKWNFHIQCs4z0D5Z4l7uroMQ8UwU8/Tz1
         9GqP6locmbG5uYTACkJEmDcp2eObVk31d3zvd9dHQYhsAuZgyRIG/4k33962wyuXud4x
         wMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770620022; x=1771224822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0yBZlUfIwO8R+8/v699G5QRXerYU4/HGTHJycEONF0=;
        b=Jej6vI91m+4DXeon2GGXPKpLeke27+pdbRyOkOpwSrOyIIeP2+k003XkvDio+KcUvb
         zqKriatObSkxJAWvL8hNEe1Gs6pnTBm1WydeDhLoQc+GbqVSFoGqOizfxnJgINFtjH5c
         qc/GkklNlc3WiUs/oQmTqxhulHvzdfjhwi5OJM1DIQFodAcxLqPcu1Vz/XiamaPn+Eae
         zhXrotyfhVSW3Bg9WGN4JfXn+oie1AL+3aVLizU2Vk1Et0WdME3jbuKgpD5R8khNtds0
         RqVBoBvuM3ShU46Z3P78ysiYWId6HGDlNUmdO8jdZht6UW0YtGLKOVBshssRndOsovcD
         xK1A==
X-Forwarded-Encrypted: i=1; AJvYcCUrRRyV053pm4W4Sl3hXya7Eymmw5xCiE9KraWnNQ3krE3R/mUVGuAwXzX2tiJ102s7ujNpHVwnWRQBQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVLhahSQPAMx8kFqVA+JHVRwVYm2QftdT3oppPk5xEhvmoNjJk
	LTHu6qkQj+aRfLKagkYjz2f8IwpS5HemtZiREBxpsndJFeUYWx8/VZDb
X-Gm-Gg: AZuq6aJhtDe1O3oYxf/3wz1/ZpZGs3KlJBWIJmIyzztVp8oRdBDDaVBolEsJR0IY0qn
	0I8lv1Oir7n/EtQvEhxJ8FVOcrUn+FeiyhojZlhCs9O04EQI0OWaVvaHD+lpXoguMfmudmdB3k0
	IhMHwBzaiey89qu7sY+/ByWjF3q9fwq78nRFNIaDwe4v4e1vrCjkeMbfPVRILD7iu/jkptuO0gG
	Gl2kfwXqnqtx3460d4LhuR/rtFGmnAA0uRnGs2fBdusepsV2JVSOA0xvvaU2dBiBbJ/ISpAFFAa
	L2t/LP6zxKL5lKVK89YZGgkohvSUJx2buCPNperdYAfWKRorBat6eXVbD36gn58oz9MfpjHsBYB
	/PfwEBo8J7PvX1LFtDSX0aed17EmwkGFsZDPDSeitof0+ZashuuIrfLY9jP6T0hFjSZjs0p33AT
	foKg==
X-Received: by 2002:a17:90b:1c87:b0:34c:3501:d118 with SMTP id 98e67ed59e1d1-354b3ba32cemr7736151a91.1.1770620021939;
        Sun, 08 Feb 2026 22:53:41 -0800 (PST)
Received: from localhost ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354c7fad6c6sm4166851a91.1.2026.02.08.22.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:53:41 -0800 (PST)
From: Carl Lee <qq1145099@gmail.com>
X-Google-Original-From: Carl Lee <carl.lee@amd.com>
Date: Mon, 9 Feb 2026 14:53:38 +0800
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID
 VOUT on MPQ8785/MPQ8786
Message-ID: <aYmEctaGrQ578xfD@carl-amd>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>
 <fa07bf22-d56f-46fc-8e39-a50dae2efc46@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa07bf22-d56f-46fc-8e39-a50dae2efc46@roeck-us.net>

On Thu, Feb 05, 2026 at 09:46:05AM -0800, Guenter Roeck wrote:
> On Thu, Feb 05, 2026 at 06:01:39PM +0800, Carl Lee via B4 Relay wrote:
> > From: Carl Lee <carl.lee@amd.com>
> > 
> > According to MPQ8785/MPQ8786 datasheet, VID mode configuration is
> > the same as direct mode configuration. Therefore, when VOUT is
> > reported in VID mode, it must be forced to use direct format.
> > 
> > Signed-off-by: Carl Lee <carl.lee@amd.com>
> > ---
> >  drivers/hwmon/pmbus/mpq8785.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> > index f35534836cb8..d6624af076c3 100644
> > --- a/drivers/hwmon/pmbus/mpq8785.c
> > +++ b/drivers/hwmon/pmbus/mpq8785.c
> > @@ -48,6 +48,25 @@ static int mpq8785_identify(struct i2c_client *client,
> >  	return 0;
> >  };
> >  
> > +static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
> > +{
> > +	int ret;
> > +
> > +	switch (reg) {
> > +	case PMBUS_VOUT_MODE:
> > +		ret = pmbus_read_byte_data(client, page, reg);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		if ((ret >> 5) == 1)
> > +			return PB_VOUT_MODE_DIRECT;
> > +	default:
> > +		return -ENODATA;
> > +	}
> > +
> > +	return ret;
> > +}
> 
> In addition to my earlier reply, here is AI code review feedback:
> 
> This switch statement appears to fall through to the default case when the
> mode is not VID (when (ret >> 5) != 1). If it falls through, it returns
> -ENODATA.  The core function _pmbus_read_byte_data() will then see -ENODATA
> and call pmbus_read_byte_data() again, resulting in a second I2C transaction
> for the same register.
> 
> Also, the `return ret;` at the end of the function is unreachable because
> the default case returns.
> 
> Should the PMBUS_VOUT_MODE case return `ret` instead of falling through?
> 
> Guenter

Got it, I’ll correct this.
