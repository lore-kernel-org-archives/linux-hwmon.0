Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E2B37C901
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855988; cv=none; b=nKwriZNWRlamoE12i62GKEViMWGURjoVaDghE0jVcrYppHkvC9B708GxYACymiv2r9EFWIBydZRZ4u1Lag+mbGBFKgeBsLVf7hcNoPRX44IDmPf6IphzoY13Dd1KU1/UmbTo88yuVxr+JRPlLEIxb0JGxoo1F5MLrAnfhNyxSMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855988; c=relaxed/simple;
	bh=fuCyX+hZOebLDyB2K4LSMxb94MV+Q1+/Ojmf1HDk+G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMSVh4TwZ4D13qxarOQilMnvRrRveDY7hsVT9QMl/Ku6o8iXUL3FuvHjURdXLtKQNJ4ThCpqegQT3hP4anfXlvuPkVqUHNXZ482t7LWrkW3y6EYR3q5OGHBbIicQPEC0DaFy8sW1ZX3fIFD2TozoE/v/48KMb28kCMm2E473y8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1z87ue0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1z87ue0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso2295925a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775855987; x=1776460787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dc2MPay3qECEt5RutZpeQRm16NiVkPyk7oyirHTTtZ0=;
        b=E1z87ue0RATBjEt4QXg/ua8kQ7XGFXnsfnUW46ucWQrjJ1OaR0aGrbij6VyKfL3xGt
         OeSWA5PAc5qUfxAW9QXvDPpgHe7qpJNalha5BWq6pecKcIv5v2wmiIr9OASf5TFWsgVV
         q+wgU6GQWb+zWbTAbPbWqzEXb7PzP7C4+ULBdiQIe2cKkMu3TLYIU+YJmeu18HSc7uGf
         FuK+QpQZQKLW1om6w8Qxcfhj25AA926xj3mI05Mfcn6jBgpflyHBndchuC/BUWLsQvUQ
         JOuPWYMJfDTocS4kzymQvhuhlPe/Pqzi25YLdiDHjpdIzh/iYdfsbExB757fJi/DSo+t
         suhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775855987; x=1776460787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dc2MPay3qECEt5RutZpeQRm16NiVkPyk7oyirHTTtZ0=;
        b=ZSkPcHygkDsORVXqzF35Zu7XXcAkK9don3hbCMsKRH10w7qkB6vA/Figf0URhckkxM
         Alw6M659xvsH6kVEUuKvsbOhxeeLrMaWuvn4ymjT58QdnIpPwh+NkfLkZQgiRAwXm27v
         mPdxtAzw4Rp2Tv3qaLIB+j1PELUkOH15r17G2+1xcOnryOYPmmlQklflTVlgdOG0RVUs
         5+8Pl4i2g4DyTMLsWQd4NU2irQccmIzdz/9oJy0xm6zr9OEcJuncOOjy/xUdcVS8lMgS
         +kTbPwV+OncOrUjDMSGIZsYtrDNfQHZ729I7GgLbhyyV7Bp5xNgGJQ3DtN/tbcfi5taU
         jtrA==
X-Forwarded-Encrypted: i=1; AJvYcCWWO8/PXQfIQOa1ZCkEIsTGFwKRQtpdfHFEFYBdM3ImWMV+mVOZf5QV1r3Mp8b86rUjh5eCz/Z1JaIbLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsGsyGZvd2AFfoO4SwzZNQ+J4HhjkDc84D0jKWItI++M0K0+AS
	mvrrCZx5QAwUtSJMTQzS/oRFur9iDYopNiquat6g42Y5gkjXewRWT7bpjR597g==
X-Gm-Gg: AeBDietbKyIPk5+v5dcEIgs8leXcgrtOWFTDLI/of6zy+TAj8EiAW5X7mjCdAnQ/IMo
	DuXOKpfkOVLTtfVzUvNy7Bq3FgH3c6oowr9kRYabFv7W9QLzU1ZH7Vvw2uP7Z4ORIhTXiH6gYf3
	y9SfUiQVWfo04b9t7sc9c61L27HW215CxBsnyue+G5oKdG275TumkuyhDWqPZwR2cvV5oPt8GuZ
	wgvZ4mK//QtJbl0iXLSEE9KhKPj/z18SL/vCJWA6NwRUvZPCFB3+wQo4Qv5k/y15r+dmDJ/M1Bc
	FWa8wC1kZ1H7IcAn737j5HKgTe2Ed98FwW+K6AyiWkrXGHPaEMxwmoRDFZnzrNVJvMmC+gjTsOS
	l/q44jH+aoLbuo/feelmf+rRBsU+Ty96JJAYxl+HUVTg5hVDbygwwLqNFg1PRx5kJQ5AqqKwS8e
	OoARAqoaxqm8Kubw9BQ+Tjj3MwUCQeXtbGC4FW
X-Received: by 2002:a17:90b:3c0e:b0:35d:974d:8f7 with SMTP id 98e67ed59e1d1-35e4274696bmr4688590a91.1.1775855986630;
        Fri, 10 Apr 2026 14:19:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e143d8sm1652603a91.4.2026.04.10.14.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:19:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 14:19:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Message-ID: <907ab36a-d230-4fb8-a20c-5848d619e51d@roeck-us.net>
References: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
 <20260410070154.3313-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410070154.3313-2-Ashish.Yadav@infineon.com>

On Fri, Apr 10, 2026 at 12:31:53PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP720 eFuse.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
