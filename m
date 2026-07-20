Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC342BC24
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558126; cv=none; b=jgttmMDwlcACi+a4FDNK7nmRnspt0DecrdiKveXmePVBcnariPVgmd8krmN0BTI+LoWvqdHujuFAbkmnVUcMNqND1/d2xESLox3aXdry2/nswU+5ENmLd1YZSV+HotepFYMX2o3hw56VEjliCvu+1qREfkMvFz6H68NpQN9PaZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558126; c=relaxed/simple;
	bh=YrvMzB1knR68X/qnxAHGXAxie2p6T21Ro619d48a/hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOHcCg0dUpASRFspeX7EP9Wz28ld7vYDIP9QuYEDY1iVTo+k15M+Ng0ljyudMJEdnuCl003eCIjH/tZhF7A184H48ma324ENlQLod0EtWGF6DSJReqkPeGQ2/7PrMh4OZ8MmeUR5xY3zi4U9Jb+XLMhluOnXOmSB99iYsADA3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTRK/G7I; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTRK/G7I"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so1315729a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558125; x=1785162925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LFN363HGkmKolu8ZyYIXYI5cm0J6ZqNyF0df9hOoskg=;
        b=cTRK/G7IhvfhVwZCaZHYLoaoPTTpLBe+u6aM0MdeS+Q6rNgr605XDc0XO0vemtxEwh
         PS365mzqGhvWBUmgid5LRvQNNKnJdNd08YQyMEUsRmVVore+1CLA8X8M33eg4oXIvJYi
         2EdzThzRHQ/bFmIRnCIDbuTYXz7O2Z0so6uLCu7yo2sTFK4d7VRGvnsF2hyyVCTr/uN+
         fPQTzOIxbWNh+krR2E3gb08dK0aNM+JIq0VI1XviFHeCJSDxgyF/auw8qv5u9L5bTf8M
         T/+MgLxmvm21psqPo+XTYb4ULqhq175lZYAjtbgpErLMeYJDozZsGjSEFFuo78wr4dMf
         VImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558125; x=1785162925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFN363HGkmKolu8ZyYIXYI5cm0J6ZqNyF0df9hOoskg=;
        b=PyVARz8gHTP4CBV+OKLyp0cVmrIVrUdK6gyBzSdm7v1KQiQsOB06SlnO6aG612uDh9
         t1ODrUI4pu5kSzCy9y+HtQCVWYlPi1BVgowbh564/xSvJxOoBu1jR0tFvFooqZdHJ4ta
         LVssCx9c0gvq2btPyOqz6U2r6HkN1brlB3SxYWgQbLe7uDmCRpTvRyiH+gqmr2JaC9XX
         a6a1PEDVsL01P3U25zYxR+B2NnMxn9DsRuFD3A1cay9jcyL4Ju/x7+VIPo+/KkF+2uKG
         Jta+19XKgYu4EcE0cuOgKcwYqaah6gwKMP9A4jC6UyGcVEpuryR/herR/MbhuW6VUaIL
         p1NA==
X-Gm-Message-State: AOJu0Yxb1ndoFJnE1wne8vmmDrujO/z1H8PZsDm8cnVpTwIEXMevHyc+
	UISK4TsHudCCA1P1iJvadNElTbI+P7Q63JLtBUbvbd3461xLwuX506Qq
X-Gm-Gg: AfdE7cmiPOEKMSCovvAymQP3VOHQz3uojAuYPMQ9oyh5SeGg5/o9a6fr54byiDIjIkk
	J7IfiBw5CzUr1zvQEMH3jfxbbj+GPhpLsk65LDxavOmTet+CPMvzaV2796lrD5hkIqdA60kNI/1
	t+9/1mRNhqdR2wNIaDOqFSGmIrRgkYDcGhXiOB22C4T90ccD2lRctBtYtWL2uNCKJ8ZobaWx6zw
	XlnlW2eI2oNxX/sBMWz7d4zBx36+WR9mh0QCf5PTcDDYIVCt2gKqzoV6xLiYfVohg3AxNhDC4H2
	pnjlV/PMpxE7Y5Q7MyLTOw3y4ce0b2It3G1Z7zLRtowzxwDg1/3cShsec/tvCBtR0HcU73AsE3Y
	uSMDWK0kAGAbmki+t02F4RmCVYcjGGc8c+VuOmf7gWqq1QdyDDevPGMbjbYVTXhNTphJixvAAxT
	z76oSqnqROspFVt8w=
X-Received: by 2002:a05:6a21:730c:b0:3c0:9c19:b271 with SMTP id adf61e73a8af0-3c3adaa56edmr15796191637.63.1784558124645;
        Mon, 20 Jul 2026 07:35:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm34666095eec.8.2026.07.20.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:35:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:35:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] hwmon: (pwm-fan) Remove redundant dev_err()
Message-ID: <289980ef-14f8-4ff6-b875-657e95f6320f@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-6-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-6-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:39PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs detailed
> error messages on failure. Remove the now-redundant driver-specific
> dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter
