Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F8363095
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jul 2026 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874384; cv=none; b=AwxguSoB1AzE0h8GNiHPm5CBZujjMc7LcrknxqYiwiDlaJ77aoypEaOi9KQ4thqwr/6vF/Lcj3uWAPiGdLuyrOR+r/cRUtQM/i/jcg21h0yBRwsyG7OU81vZnM0HkiR7CEPmYGec9BHlXaQM/Z6QnaJq5zFNS/vz37FwbyuoZ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874384; c=relaxed/simple;
	bh=Yh3dhM3Obyc4LKQdaXT79H8bgttcpoxGufhn+j5RBYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4mjBvDKAzpg9yJWqz/vgQ07lJa10gFQnOmDvkEjIhkSDJ4QLjsSLjIfL80EKONx4vKha2xot9jN/hkp5nOVUacdQME6P++By1iTVSQqDWI86f9wJqkayOjtALp+QorECF+SBOp6KLabfmMcMUGxkPmw41jU900XddeswlrREak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbVGoD+6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbVGoD+6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8471013fac2so90893b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 19:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782874383; x=1783479183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btER22HlBJmTkrjtvUi1/5trK8wZBzz6RHBsqW0SMZM=;
        b=mbVGoD+6GsglowsewIqZAuHB9eXIEAqHDllVKPV6V5hPxORP6IEHAtMrt+cuUG5zX5
         nxVgddi1p1FAfoj0lcAnqv1szwatxcGFw3vrqy2z/0FboWCiddkJr0PKKgshY1NXbLZe
         HSolu/ee7Zbqxtgs6zJPai5eR9caTnRAHSD/9xE1QYIlRzHOP/CaqfxPk6jmJq2smyu7
         QO9+VKh3+oCmBZm+mEaJd04vFpltaY7jfYZ5t8fa3ZJWYLMiYfJbNcczQgbbxpbMFUT/
         EJFSlUW7lYfeySrF2YXjEhItdwRPszbYMrc1849PcBXRTEx4tZWrPYpyPUwkd/oDYqz3
         L+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782874383; x=1783479183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=btER22HlBJmTkrjtvUi1/5trK8wZBzz6RHBsqW0SMZM=;
        b=RtSIbqBRBpmLxEkuxqq6kFfPR1Ttca8GTNywNIj686/e2yJVmk4kfIDf1ToUfazilG
         yaiktXTjWH8ByuAHQRx7AohvM5DbsRznAUkw3rOY4N0um90FWIY3TLWLF3nJBmrnHZOe
         kClg54KN7QA4nomk2KdONTSpGtYeoOKpJkWx8DmxpPT0f5blU2CvgTxGhyXwZnybVqpY
         q328CUfUoTk78r9ZQE2aCIkKa0vp/SG0eKYQ6bvQEifWXpbrrot7JRsBSi5+J/E+yuBA
         SrMqhQl8YUW4MYqJYSpXh0ziEIs4DrEnyufw4ag7mdxzdkP/xsqi/B2oUlqJraTFSMTu
         ADjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrL/39x57XwaQH2M4MxE/isjRO9mQrQceX803u86pd/GbnbQQehqI6VSYMhuTi5BWGuCy+wpN0/sveYUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIJQyVxwNq9h+v0a9BTir5eaVL/wq5BufqUQC2Irq3gJpD74vl
	bAakPHuxTCwH28E6geCNxctj8hFJ6tNZuIrgn+owbn7TtruNN/VzI3PX
X-Gm-Gg: AfdE7cm8Auf83KYH1SVryz4txIUH+x1khlfTWrMrCfimBzEpaitztTDHhafsAdRm2dv
	ERE9ILTzLFaytWEMzKiybcrbZilCRkBAO2fPo68cSrxcWPdfp+23rcgeUh2gNzYWEmtRZJZO3ge
	11OMWGAINaJ1Xed34ptNvvLJCrLEmN24JvZzB55c8Zf/0uD2znIapNjAIJ9R177SOf9v2B3w7Vi
	Kpa2NID8/b5gj6wfglrytk6MfIM5B2t1z93CNMlgAHYcKDU0u8XD/E8JZe3G2IulYQZvgwnsQZ8
	RMlB5ogsQ5PlQo17cXrvHIq/7IvXA4t+qgDJ/lOm9vhVt0dbHrhexdJK7DcYOaMCJETFkIuU1ss
	6gC3q1BZyty/5TUFHrSI+BQwnegLYIU6XbcwR6o3V8in4QvztXqCVQtSVwodBYIPXR0auNvyce/
	9QLFwMyV3Xd3yuuhH0qYzfo4JKeg==
X-Received: by 2002:a05:6a00:368a:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-8479eec78d5mr5335555b3a.17.1782874383056;
        Tue, 30 Jun 2026 19:53:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a00029d3sm3080774b3a.20.2026.06.30.19.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:53:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jun 2026 19:53:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: [PATCH v9 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Message-ID: <cb67d09d-301d-4c54-b04a-97ac4c7c4e84@roeck-us.net>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
 <20260630091220.1608-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630091220.1608-1-dongxuyang@eswincomputing.com>

On Tue, Jun 30, 2026 at 05:12:20PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
> supports temperature and voltage monitoring with polynomial conversion,
> and provides sysfs interface for sensor data access.
> 
> The PVT IP contains one temperature sensor and one voltage sensor.
> 
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Applied.

Thanks,
Guenter
