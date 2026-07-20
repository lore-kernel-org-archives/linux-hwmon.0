Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D45E3DCDAE
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558009; cv=none; b=hgA7TGJgMIq2ZTTO2ifCUUWb7eY4FieZhpo+JoRDnv6K0clLSAq4hN0+zFARDOxka9gm8a4evhb11OY1SDZ+/4t/4q0AjZ9bJ8lEA8A5nmWW8DhxPQQBWcSsV7kEHzw3eesErmtfSaYyGLPBjJOIrB0h511lab5Enw41OX4n3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558009; c=relaxed/simple;
	bh=8kUpVrGdnvy4I1QC6LY5IMnGXmAN9C0O5vbxUSdAEdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LM+ZEigcZUPPZhpvlBD/rm7pyoHAt0IIVvcDue2tlal/5mNN5nC/9YKtt25LpvjQPFI77qjsw8GXNaDCzguzGuS0u6SA0RVEC+PByTCqHFlozyqvDJ6n0UklNAblxLkEPYUY6JMNUiWBLlvAMyHL8UZoYqajALzSIU0wkysLCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn8tTktk; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn8tTktk"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-caf45fc5202so7007319a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558007; x=1785162807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gOTP1uNUOX7yWj41pP83uB1mSz7AepYTZIRO91a+T6U=;
        b=Vn8tTktksDElVp+Jvero7fcr3RfHyoq4+nEXokNGJ+qJAtRnh/5Rcwip9KXZDsc4VW
         5pB+FJd47ywCjiVhsmtlKDVRUo+f8RjUe4/SkI48+dYoSSLYjsyQ5lgv9Gty9JI28PMm
         Kr7VLxu/9SUcCd+rnSv9/ceVSm1NvowPCwsjXhH4LGQj6OpoS1w29/ig0z1quIiaOzBS
         sbclCUl6CXBN9A1DW0se0RYZ3WQS4vMp4gSR1iHD4a2UIeRcLgnPhgNOWMml8PsiYNb1
         +dKdVP+XPqzLs+BgYV8IfdprugePdldXqYj2gFw1lncrglbeLrZapJLWqaOJJJb/dyPt
         Ug+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558007; x=1785162807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOTP1uNUOX7yWj41pP83uB1mSz7AepYTZIRO91a+T6U=;
        b=hQWglCjC//7mQuW4SOUxjYuCikre+9G+VatC70LSamvK3pMrYvFUrVPgA49lZ8fKJM
         DO+v+4qHXEpg1hBSisPpE6ehq2xZadiMWXpCB+MeVUr8YR6NXLcgRgdTbXPxTrYK0YvO
         yRHTZaJcVV1jvpJnfoEuDk5weX7mLO4UZ3Ryr8a3DcVTjpJE0OqKIihnnMoy8ngBAHVA
         Z55yQqaEkJAn1fHgdaS5MrKWvp15jwpuJjAqsvmkNjA9lXVN+NyNBlNYwBZzU360a63j
         hRLt9qotuDEUoW3mxpQwqYfjEcqGTvOuP8Q2GtRZEfo1jrdNqmNK0f1HqFkq2JYjZ01r
         y9qw==
X-Forwarded-Encrypted: i=1; AHgh+RqZBaWCPHSlcM4NH3bxQsy5rVT6Pl4VcISmbt1iFEKvN9WtMHCnQNPsjaJOAfs6OIDktjw5BBPGicYWMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpU3B4eknERz1xjyXA7MtlZG2SuwL6SM3W1AZcCn6ZNreBBxdn
	qW4XOjQ89w3jsqqPLbCkO+vqWtOocFF97SmhTjLYH1zHnjspbGqrIuoa
X-Gm-Gg: AfdE7cnvkJ7LgJrbkosz6uh4hNjU/+2QeE0utuX6XK3V1osdEJ9cPVLZQeONzANURe/
	5+T8FvGSL86+dHSAAI4iYYjLxvIUecNhE+TdsRtqe9yzUVz3o7qpmL4ilRMeg1DvXqof4+Aj/U/
	B8lXr6HNpdE1ir6pn6AZo3VfOtr5hsb0RPMpO+HDwUOI3Imu+RyIQqpB5OgkDWXW1kdF8CX6TDh
	Sp+ZWTYWUgfcDSZbyvO+aFcld58mACKACeRo2T23PwGr80tBjvYfjMbHXGAdpxcoMWYxFdwf2ry
	m+f05GW5cqSVheiiA22ut1vlk83PBO/qsOySfoce4SpZ/89UksFtuwWmqahbTUWAvK2plaEHVWk
	mL5Z/jJ9MYvilonZNYcudgfhql1Gy9D+zGCRx7IBgyPCFLDf2XVcqwZHdtOFWYC1DX/db+6oRkT
	XJNkNtahzZl4jdazk=
X-Received: by 2002:a05:6a21:a8d:b0:3c3:9c4e:de3a with SMTP id adf61e73a8af0-3c3ad5b1bd4mr15899221637.6.1784558007368;
        Mon, 20 Jul 2026 07:33:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm39403612eec.27.2026.07.20.07.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:33:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:33:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] hwmon: (da9055) Remove redundant dev_err()
Message-ID: <ff864772-70d7-4be3-b1f0-a63ba6c9496f@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-3-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-3-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:36PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter
