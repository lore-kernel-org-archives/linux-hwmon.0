Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454935F8AD
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526730; cv=none; b=JtlHKCJ3Yn7L6rpGaYyUnyGFJLrW7P2TKdVacAlPn+MBUgJNiGb1nyLDzw5eszNvea20Ib8iQOTvyR6z2NKtb1gA0xFwSXNDePHvuujaFVehK4vfevMiABoF1V0pVwk9tTSYK1CGCxtioGUz/o6NaFJX1Ksr3/YokgVtbcHsFQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526730; c=relaxed/simple;
	bh=Q0cKqs0Dz1obaEFFVDj8DAU+DC9JZA7AYb0lIuSwGY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um7R/NulJDrk9JpLyO3Uxq5AVB+z9dzSrpqc53N7JTslmy/xbxEMUFAIfD6lSB5QhrDUy+k7XMkXjEOfH6xw0AkXTdwyMFNIhnPDgtMqGf8/cIcdAT4lQd2OFCtl06rNjpQFuBMV6bBbxFZhNV2XeF6BWH3bNbcFzKrm2IKgEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3yan2P/; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3yan2P/"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b74f839bdfso2151776eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 07:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526728; x=1770131528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9zCVx2BWe5mnavK+mjSCOB1GzARJ9mP4Z2n+82aaf4=;
        b=W3yan2P/gMAHlxzzJLW1KiccBJLSrALkYwyCrvnOFksDW++Pml8uHBhmsOYTDBqIlg
         ybA6xAAGcMMBjBD/44BcvulDyLprj2R3CpjyQXq9DjWmPRDOPCGT7hu5z0UnAP44XlMe
         imhETc9gUtnWVpURzfPpTikLvXQLIB4a1jxW/u7AQ73SGw8NKa57YCmkl+Y3ywjBoh18
         BwOdofgXOWHvAiHvpzNBeOI3xlioZgq8FsM9ESwCDEry7Ze87N4cMilffkIb2UH9E1Kt
         WLK4PHb5v1vrwt1VKBmpvOcMScuPyykhIc8GgZGLYXxOwBBeGnWFGmJACxnBsoGNF+6r
         YY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526728; x=1770131528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9zCVx2BWe5mnavK+mjSCOB1GzARJ9mP4Z2n+82aaf4=;
        b=TmzGbSIJpY4Ehb5HBi2WS3DqRurgrKVCJ8KRGZ4oldV+MUIe/6bJR61E9D5NoUfJTA
         ub1U6W+fXOG1Z2R+AIhIop8+y2/DE9tqCx0L+1hhLMGP9qz1XMXMKWGWqSOt4RG69QDL
         tCzOQU3tkX/PhKdYq8RMDxwmbLs1B4aXgLJla4QH/eF2Ueq7wx9CgGq9I61/ICctYHNA
         1Mntz7YhU61Cmgb6UVP1XMb6F+5x+Z8ONkYOBJ1XO//rnOUCUMmzYjUGkI0gB2dq595I
         ZQI4gE/urN830HI4HRi2Dck41r5llGBpBLqBcqIds2tbD0QwUohJoVH/bcSG6euXlULC
         TdVg==
X-Forwarded-Encrypted: i=1; AJvYcCXl/Um76GeZO9HWcM3wSpZpeOD13wnkefef6569bpCA2AjOzIL6J9kU20TCLbUXNG1+aK3M7fs5NPUG8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmZHO1+FXBWynxKDGxULr813RadaKbRDL+Kd/hTM07E1wVh2L
	DYmFwenvwPbA53c0KEt5E1IU4FrJ38dfyiy1wl/sLewzWH1j5QEKYuRC
X-Gm-Gg: AZuq6aJuzNOgZrBcHB0g7a/8TFI0NEQdi6dON7AiWcMxd1xB2HrJ5NRYDN8u8fIU0p6
	EfdteJVwwdHPLgXP68hlaXFEySDQp4QkEaJ2jd/dLv927QWusMGJWmsLpLsXkkwlfiLN64XnUKh
	sVxTjGu1zeIP9SCWjlpQ3Eji0VPrLS1CG1ObQelJfbSkSavN3wINJwJtgitRcZ/Z3WGvwbph1Gt
	2EQALxlo3XXP5iYwyMiNmZmkq/d53F98rMMxAlMv7eF11heJFCLMqD75z0amv1AXOolKo+XY8Y6
	SipHMuiU2DUu/rRv0z08uG/WUrccDt5USCciLQLPw7Y1j5qF6e5W15AcyOpBJvPQawYVA54CVB3
	aiCV8U50JkpF3lWs1Z7aiK7gEkj7s+oRlxKuXauceSh++5WhHbnsf6HILAB8QmD8pvi3d6Cv9yx
	UkfNqJpOeacMCRGd1+mJy0sY0u
X-Received: by 2002:a05:7300:72cb:b0:2b6:f13c:8d58 with SMTP id 5a478bee46e88-2b78e977fadmr1460659eec.20.1769526727776;
        Tue, 27 Jan 2026 07:12:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7987cc01csm493102eec.35.2026.01.27.07.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:12:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 07:12:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add hitron,hac300s
Message-ID: <b4c150ce-1570-4b12-82e7-62b699adb377@roeck-us.net>
References: <20260119190806.35276-1-vassilisamir@gmail.com>
 <20260119190806.35276-2-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119190806.35276-2-vassilisamir@gmail.com>

On Mon, Jan 19, 2026 at 08:08:05PM +0100, Vasileios Amoiridis wrote:
> From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> 
> Add HiTRON HAC300S PSU to trivial devices since it is simple PMBUS
> capable device.
> 
> Since this is the first supported device from this vendor, document its
> name to the vendor-prefixes.yaml file as well.
> 
> Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
