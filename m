Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BDA330678
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558040; cv=none; b=FN65SZhAhHOuegWkE72EzsC2a9FLH+Qfh0ltDUu6SKEsermgCNOkYIohUt8wv5A95yVl2pd80tcshJ5C3dkpnpbYpj3Gul/Njnv11EWIsYlbhrYcYIj/raTxpkejwcREU5a9gdBcj+bwm/Qfc8FdTvzGEufz0sS8M0/JsSbK/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558040; c=relaxed/simple;
	bh=XQs6j/ydab+8NwLj5N/pCjqk8IWvbxC49V64kNkzcKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbu7UmpJDvLPBOp/Tf+V25e5teKbmieHI5tdGPtkcEz+QhoIgdXTKzgbSeA8jjwDcPdfRuurSRRtXmwBEV4xJv1vBTe3bE525f9+RKEgUuR9SwJD0CBVSbaETCFwCi+ogC/Auhe5YBDKbO2EtQz3GDNuNMAGmVqSPw0/S/W3tD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkMebkYh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkMebkYh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca12086c06eso8460417a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558039; x=1785162839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZKvUA/C8UCIo3GbCU2nZN0PXCuDBp5y57ySSlYWarmE=;
        b=QkMebkYhk4iocGPkAEkExpV03VqPybu01md2lnWmy4zI2b2TID1iEAbPZzFyhWQ7ry
         MnjvzdBq9WMUsYyxRM4inl+ddtmmaBHHpNGTEBSyqcrWaYJ3Nq65yiz6lbOm44OdibsY
         oPfTzuTi821jU4TRM0JHWsylWCCMqPouqH3DOwwQLTHOntAUfCTyDALnyqXKpbisXVmi
         +TDC7bn+l3QLOoOKn1NrNyce5Yp+SjHl42n5A0N5enIhTsiKX2n6VJZLClPRDgHQ13Hb
         69gtVUjyWJyC+UTH0UDtTn/YvI1Ls6htfUsCaesvV5tI7/Jsm6LzwrIELJXOMlQJ70gT
         4w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558039; x=1785162839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKvUA/C8UCIo3GbCU2nZN0PXCuDBp5y57ySSlYWarmE=;
        b=YdoGEe5qnIkjFWJkzU+Mhlkni2xycHqsY+etahnuzbQVlbGkiLojB0iyvgx/QQ3X33
         uUiacDXx3QxdXf/2DRGfOumTIkMGOmyyrsQE62c4/BOS4kwHNvAS/GBeZOuKqxThhRPT
         CL7nsX0QeoegjAM3etp8rRDHpIEbdtnswartG8XWEST9eZSpnK22jeSWgUiWebuD8rLs
         uxQDO5WbqKvy1Ncu9h/+L22e4JWKPiodYzRJCS1j6zfUdp5hsGIaOKhCAALIfxufGjR7
         nEYRGtNjjV1bq07Q7yVejejDZuVGDck+fBK5R6r0mKJllmoS+3NDl8QCEfj0fYZDgMSI
         cg7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrdtHmEd4POAMovAz+PIFUzGQy9mUgTXejAk99B/H6qHAzlh1mJMxdUK1FMZBeIXsEgxcuwBLJ0PaUJSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyENy+21r0HdZA5K4sLNSQkH9AgK1/GyRq6QJM1peMwK3FeNfq9
	o4KwkUPWOXa0xL8VoOUukIjgZ/lp9URRvzfMXIU8dGmxMfX9rG4+P6GT
X-Gm-Gg: AfdE7ckJ2hytol2+LSWbQ8/FsedS+yJ/VClIn+IMsebocPO3daCT79jh3FVeq4XXKeU
	tn4Jh9GCEYohOP2T8jKWKHN4Rp91QcFYp4un6GfXEGGlu3QBRYYbhEYjx8YhDzjxgMI+JmulPc6
	aoHk6kzwezA7Xtyxw5OeLVbwnFaE/9aSiJkdqtzDRcPnF1lfQmX+eKhGsJiCTUxSEl8/nFLUz9o
	iufzOnYP7G4kQw341+6PR0AKpIcmb0Xz1CEYovBRH9m1w9cQhkk0j108EBjVkuScksEzAwJiWiD
	RO53V9N8cGvM4EbeqHxycHQn/hmrsYW0I8ek+cdC/xG46JDH/RY4i8srqcD9RpKWU4tp70s9cOz
	EU4c+3JxRM5Nsmz58BQyMB+UGJZZv+O44g5K4AtBvfCQLRVptvJg69o0AqeuL7bbyVkUC81EuMZ
	Kg1cpyrKhJqvn8u6IhM6jypRj7ng==
X-Received: by 2002:a05:6a20:4391:b0:3c3:9070:96bf with SMTP id adf61e73a8af0-3c3ad795734mr15364423637.9.1784558039037;
        Mon, 20 Jul 2026 07:33:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm36608325eec.26.2026.07.20.07.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:33:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:33:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"open list:LM90 HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] hwmon: (lm90) Remove redundant dev_err()
Message-ID: <f22b78fd-3f3f-4cb5-925f-951c439b3f1f@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-4-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-4-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:37PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter
