Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93E52D9787
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120801; cv=none; b=BcxknwRlq0G54HFLueuzGnT3YpMUcQZfbXEt42hQSkSRr2i9Y2sbIVq/jmnjvh3m9fqC2lLi0SbmOqYh5PDZaUXAGKZnB/AR7sK8lT3/vy+nhMmV08eZuIvWxXMigaIz6rRvK6Zb/5hffBA1Bi9rCSirotY/0IySNhIaCZ8GbSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120801; c=relaxed/simple;
	bh=m/D3kjV4WCE7YLF5e+ZTCyvD2jFMdM1MgU0t8CDjh9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMOXbOzIclmWXVJEyNZ6dRYABey727ww505h/j3An3HuzegAfgiqjCIyAIrNiXZ+bIO/7Jclnsy+LxlpFDxzssHYouI+hfclJOYeiXsEPaCxV/T470qkbaSBO8DpCehsQfqPHQStSnEJsoIFEkMYBYAErRM+hRUE+Oh0qbxnxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLA/Tegg; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLA/Tegg"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30749947917so3819847eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781120800; x=1781725600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMJUWqbBGFmtLXG0IOfebCL3RCb5topHpC868EHhG7A=;
        b=nLA/TeggiAU9eKzYh8N51z+wK4JRJ/H3UTj6GR2U3x/Bh8iqhqxQfKMXPj/1Qk2OsG
         7EkfzDSTgQWLW5G2if4pU8eWbjJieyscB2FcEHmuoNy1IIAJjEOJQKGTzAZUSKQFupJa
         vnMi9qJmqb/owTp4UtuSlD1ygdC2k2R6DvBtSCkk0k5Ke0dmMS7aFo2Erqv7nTcME8Gd
         SvZmiSKspEq/o2W/J2Wr1mqyTMAdWBSvHVpgL9Bg0DvSGsnR6SswCVE9Pm0lInKgbxdK
         fNPGpZZrRsHTEOvqO+jPE/yo+DnZX9apnvkyD2Q8LmNPBMmmAer6ogCzAoT35IXB9Tq+
         nyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781120800; x=1781725600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMJUWqbBGFmtLXG0IOfebCL3RCb5topHpC868EHhG7A=;
        b=eawJkogycd/SGCBIZEIPBRHHBvF7c8GO6mQbAcnIEZCUc816NNVIbN40JmPnofpZA2
         xKOcTyhKIDzKNdmF/xOhoAJuVoUeMcDTaFw+JF+oRF5ktRDoDNaU6ymAxeY4hJcGoo9n
         uQOXfukklbVcGmFtKxSDEqu0FlKLlg1RgHq/GNoyCJ/A8tuw0nsc1Roy0U9zxfvdIMq+
         OpE8cR0inpesaGQdeffhbxAWCQSljLT1whxVHs1eOl9QmhqWLuSOM3FIZ8N/xKW8g7zp
         6w5QEu2/OKiBUSQJ5WueODAjueiscX2vEkdLdd2Rcy1umciYewmTYLjUXsgbkZ1Flbnb
         8Tzw==
X-Forwarded-Encrypted: i=1; AFNElJ9oATPrWSfBWW6Z47YdApjzVAajqTlIhimAbcI9NAjWhKcAlb34xEbkFkYgfSUiS4okJxFBNYgEQY0mxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmbUdO/zBMVHBm+HsX1hLob8P7Iss7LMwnmOrtQ8c+YK4qPv5X
	0mD8GSsuLfaJl+gRjMO8sd5NGuXTZO3JNX8EbXuHMHzETkgz3tee8Jof
X-Gm-Gg: Acq92OFtxzW988dRa70SjJAQt/RGu4LwOAyBHnsiU2/c7taewsmUqWi0cEzEsP5PZXh
	4MaS3fmNopBCPDr3OCuEKbBiciI4cudIncOZtkk4uSrFX9iG+7RX+0OtPtM4FvnDoIUKWiC273a
	l1s/3VzN900/q44VKy07uNNEiFF66SIM07iEawNvxvcrQxr3pefyxO9F5vplvj1MLUxY6SYETEK
	SPiBfWzW75s6jlNTU58cgcs6bCUYPHAxS85NYhsiWDmDujuatSMF3FupRmTUcUQ2iG0DKMFCfP0
	Xw2CllN+aI7E01bgjP3kRW6XnmuxRUYIpX09G86A94i6P9NiMq+aXtUe8uUkmhzRXo6rwnkz96S
	gSBQwz8K9vsLNmdUojrqTG2zGqTegzptWr7gyw+iFqjFAygvYDwH7rsQuwO7JX/PCnfcOGfsJJi
	lf9acQrhAotzbbzECE3mIGhhJBVnP8hyItzI9NBEhx2XzKKKU=
X-Received: by 2002:a05:7300:534f:b0:304:b15:17d6 with SMTP id 5a478bee46e88-3077b357e93mr17911170eec.6.1781120799634;
        Wed, 10 Jun 2026 12:46:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm33615378eec.8.2026.06.10.12.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:46:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:46:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <88645a7f-94b1-4c78-a7da-f644c4f3d84f@roeck-us.net>
References: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
 <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>

On Wed, Jun 10, 2026 at 06:19:46PM +0300, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family. It also
> updates the MAINTAINERS file to include the new driver.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
