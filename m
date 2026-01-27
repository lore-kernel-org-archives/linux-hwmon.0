Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C1EFBF0
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769472765; cv=none; b=nUqYycpUdbdm7Ixesb5eyvoVUrikCczbrX7MBrHMOuWun8j4perTw2/HzFF1p/GUqux5kyqxe8Tih63K0xNUUFofwAayOfnbtKOmJVRSt5cQEjJVQ67yb7ozK1Nt83aP1WDbN/pScGcA+eJjPUaPE4fCX+ylD5rEp8wmqrJGGpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769472765; c=relaxed/simple;
	bh=5zdtOCR6B67UyvsFetvz4wHrUvgY2+2bqeihBb6NI4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg/jSiAsZcXTnD8ONlVpo79dCX+kIe8BSBZ99Arn1xLw4YuJYQ3uIX0PRazBsBpXtDd0YlJvjylAxrfFf8YCfDNTCn5jnQ/tJOeoxTOCpJ/77VYwnnkmtMYPH8SqlXE9HAsFlXKpcNEO5EVidSdSivOtVjjaGZsASnsvbm5CMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/FgZAfG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/FgZAfG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so4177305a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769472763; x=1770077563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcSJwRrDpoYJ2bVtrTSdiMttSE2V1rSy0vAG6+hLHR4=;
        b=m/FgZAfGgt1u6x5far3s3UhnoFh8jtRDUSTH936xO/L7+f1WoFlU4VaNKTiBfZeWVW
         tvvC7fFaPnjFqXJJ2ioBC/Y2gDhkf1XmQkL6bGn9wlLzKrNkVEX5g4sju15UpjlAFcHP
         ZXgf15pJ86a5YJjzInq+H/L2sFtoa/W4hPi+ZF7fmlMQKajirb55BeSY6s2d5MSddLWA
         cFolFWwB/4QByiT7xfAAp5jjLA3aKA45ln1t/eqvAdGRxtCP/vR6T7CVgSKIXbVrb90q
         ya3iOCSnOrRyWceMyLxAqNDxZ4mjDJYfQzSbwNAqpKblvJ43kGUY9WFPXShX1yZfjWdu
         EpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769472763; x=1770077563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NcSJwRrDpoYJ2bVtrTSdiMttSE2V1rSy0vAG6+hLHR4=;
        b=CbTiohW/NbKpY9ioSPKITac/Mhdvfgd40BCACIr4URFwRIHKFcwRERRhAAtWIvvKLX
         vAkRt+TbHj3uyj/pnfasy+p1VC+pKs1DZj3zOqvrVnBFjTvcpHInQ88BjuzPuEcx5fGj
         LKFymfm1BNF4qzeTXO+SraIMRJYNGTOPpKVbiUMi+d2kzErf4vxMTStqexqFpr9NecLS
         q21TXQ9nxDUwFsWSdWtfhCdBa4x3BfodzAG6HEM/7EX0bs1yKZSXiW09Rwp12MYNV9cz
         Ljt5OkcUwGHo4fPbcr//1EwTBDw15JfJn+7WIhMtcDQ2sqxh+ljza6XkxksS2LRxMOjN
         RmRw==
X-Forwarded-Encrypted: i=1; AJvYcCV4XyIXjeAco5EyL7HrdsDtbhCDzwMzL5kQ2Xqm8uS2gLVHULRAWgjbNHJJ7A7r1lOAYz3qI6W9bBf+Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfEN9MCUTH/LI22B3p3hHcmoEQcAY0ueNb3oMKLmtbDgkPyInR
	089bSgaMM3UKWV4njbJIY+PtmgGogFI3OdWHAEMXKupK4f7Jcknw62mU
X-Gm-Gg: AZuq6aI0PLisy837zXE8Ro+gUsRlfDXTrzfkO+w4oINOBoTL2Zo02eUJElwjQ5EL4Mc
	P1ofHYFOhqBA2b4hQh5675tawzb6DemcNNeMG1Qu91ZxPK4kONitU4Agghg9rDKAFK54BMi1wIY
	t4YUCMVCw5SsepSLaOz7QwIEuezIwmMrakPoTZtElsmOgakBG/kWf9yCaQb+M8ztLOcvwRWBZCX
	8GmL4nwJ0lVClN3tcRxHCDvCertt/DZ4BK+3LEI/mQ1uqs8fczL7IzQJcitzRaIXxcMdsRPLI6b
	QaRuF+TnJHZylUo919Mr1v1+cY+GVLHVisZzins9PnqhJiA4y8J5oXAdaX+Z2ceJdsE+zrzPZjm
	uNtcj/CkunZbMPIilHBaa219hFct+a+i1OH2WMiYQYTJBhj1IAjnsyG6NFBdR8BqsZS0Cg6axUc
	54Bym0eQryaxMTIDIn7epDHugl/hkdCjfbNS4=
X-Received: by 2002:a17:90b:1f92:b0:353:356c:6840 with SMTP id 98e67ed59e1d1-353c40fe21fmr5467504a91.14.1769472763295;
        Mon, 26 Jan 2026 16:12:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231866b92csm10145642b3a.25.2026.01.26.16.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:12:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:12:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Hsu <hsu.yungteng@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: pmbus: add support for STEF48H28
Message-ID: <46a42764-6cf0-46c8-b764-4c4b394b04d0@roeck-us.net>
References: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
 <20260126063712.1049025-2-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126063712.1049025-2-hsu.yungteng@gmail.com>

On Mon, Jan 26, 2026 at 02:37:12PM +0800, Charles Hsu wrote:
> Add support for STEF48H28 hot-swap controller.
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>

Applied.

Thanks,
Guenter
