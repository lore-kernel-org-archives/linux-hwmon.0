Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E0288535
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947415; cv=none; b=JVhqXvIAdkjOW1QJ2u9K50TJIRxCvUFdz6uUR5CH/5XZWreW8MkEw1A3sA8R5PfhoIUhS+Py0L2wWL5yIaYMyUNgmaeOBDWHFazcrZkTVySz1/n5ET20Sf/dx/pvW/bBarqtz5+xbsrXyZo0oHpqYbzReBzdoGS/JkVIo4gtiSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947415; c=relaxed/simple;
	bh=rLpX/y2Cl/jQl3ZNkpEcClUh7P3N6PP6tj7DaIZfki0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0NWsUOLwDfkpNKY03JJIxJCdHvh+IXQ/786TzcIDS6kqu/K9O9Ox94So5km+zVlTgCyaNdkXDyTbHA6jh2QuAYGcXGfxb5FB7eg9z6TVU3o5BFhd+JsXau2VbWK2HhF1gMds9kMqQYK/NAni7yL6NghG8DevmWoz3R/GHLSydo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+fF2w7R; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+fF2w7R"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1274204434bso4332677c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947413; x=1772552213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oqiWdRSzTyx05kcW6bZuttjxv+FJl1Sh32tunh5LQ0=;
        b=b+fF2w7RLKLYMakxOETa3NS+Ja/MFAWN4XqHZapcTdypTyBdp8MCvBfpNa5M9tTzCC
         So9UjflVigJ9BnQ6C35khnMI84JmnnddlWe1duXCaTyS26WGZnDQwsribNRs6Wbyjo1P
         daXSiLQQhhLl9jmhS3rYC8Ixev+rxJSQprrEtkaJFh6iSEOAyjnfgIaBSwpkHTekVALa
         a/JUrIDgEddjLXhr5HTBma6Wff1w7CV99jlpXiue+7rjDbDbCGU9aUM1vngnZQ0+CY/q
         2rFuZBqsitB6FdRryzOa6hthbs2t2Z0xW0i0tvxC2VeKE7tBSXPAl1xYWK5ltbK7vAf/
         fW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947413; x=1772552213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+oqiWdRSzTyx05kcW6bZuttjxv+FJl1Sh32tunh5LQ0=;
        b=sZ7YWCYt6U9eIveN2ku9eq9VsOQhQXtDITUytIh3i2WQYsLOlDGOgpxUFH4J28gKRl
         2bZlBuzEPn1ctaKcm5Kr4GhZJ9JOjXTORpno+ddThf9YC21ebWd7sE0LlnTSYCXdZBpj
         RDsLN0L02pLz2ZHTG8ZT5TdmaAWG9HcYTlNZyKL5eBGN0+PRmpGFSUCRm74AdT+Jz1vo
         hbT2/dNruGVfbPdN9Th9GIaslkmzOioPuBZO3q8S9FhsZP8Uf76Q9AfJP62Wr1YcsFj+
         EzKI1gBosaEhW9ySt0Ngv1h4jtcLlzBvNrcliDsnvaQU1PHIVkCD66kBB523DaIrRo5v
         NHYw==
X-Forwarded-Encrypted: i=1; AJvYcCVzyANLP2qG40Rb0H4hWqbES97YF4a+2xE1JtYO88ERLVU4qzH8wkFVjsl8DzqThK3cXks40YB65y7IoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJKMAebEUg2OGhRn/2PTE54SKY0Rp5zLmtj1icL0+eLhN8heMX
	dZLkL94kArPKLusBEyyRv2HtpqDQu9Qz7/qI6wTQICJ2x33QcTuoftk/
X-Gm-Gg: ATEYQzycqtv0f8332U7QtHCaR1yNnjni2Qxs8Wn2UTNoESVmuxQ4JhqgKznjO1+tm8A
	maBLnT8FD0VEthgwvzd9W3aCPwNONrBoos1BrJka16rRgJAnMEYTeiWCcktdvbb/3Q6mi9FboE+
	Yp90WZL9h/EbKoHMjR7tPuKE+X1YqjU6Lt0ucN6l2ka5FT6co1JO1ZJDl/xxpDFR+XzN0OtX8r1
	4sK0dEHNNxUks5fmE82A2upbWUJW1MgpDAXoCmwF4G68tyQzqpl86sWX9EkJpYsm+yhtmYX2NEB
	DOnw0oUaybn6Krz+EEm2KYchn4zi2Wlh7uujELuNhMN6XhthTFceudL5biGn4enSLkq64WQQ/uI
	vCeTeKz/zsY4LGtEXeDYx0TXsaQLcvOZiVo+XJMZxLxraIsEmgJr8faJDw9WJ93cY09AwvsWcil
	bkjaWdoVELED7mmsxsfjVbczBtDPEa/o4j0Bgi
X-Received: by 2002:a05:693c:6301:b0:2ba:6f16:10cf with SMTP id 5a478bee46e88-2bdbc5239bfmr124449eec.14.1771947413298;
        Tue, 24 Feb 2026 07:36:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa3d77sm6823262eec.13.2026.02.24.07.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:36:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:36:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v3 3/3] hwmon:(pmbus/xdpe1a2g7b) Add support for
 xdpe1a2g5b/7b controllers
Message-ID: <cc5db8cc-bec1-4244-8d1c-c1fc5a79bc9a@roeck-us.net>
References: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
 <20260223050804.4287-4-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223050804.4287-4-Ashish.Yadav@infineon.com>

On Mon, Feb 23, 2026 at 10:38:04AM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
> XDPE1A2G7B controllers.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter
