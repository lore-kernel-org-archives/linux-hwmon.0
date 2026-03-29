Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E605037C0F0
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 19:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774811444; cv=none; b=YNzTV88ELYRFSCaKYQQ2Su617pNHpXRav5zrgG1/c+HK7yS3NqPlXjcRfnRdUSJRdasdcZWB8nBRbukLhQsuWXqiBUoMTVUmzj1E62Qxr7Z0hSnAzKXqPv7wIYnldud47r/Ay94uhk4bDtU7qv24ewhNfUnlMhfYqkCUCwyi7vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774811444; c=relaxed/simple;
	bh=zGldTs5fsGuuz7jAf5l/tWje7BqB4EnVpX18Q2GZmDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iweQSqgoH+xwbWOFT/SplTLzP30lHrehNpqGjuOLOydt5A65j/HUBzXneuQ4ldhwW0O2Xz0hDAqtHGYzF3h6DQZYO2yrGvL/avuwiYC1UPdGmictFN+5FDv9FFKn+uSxbgY60Gl/67CyBgR0r4XwkM1S8b35632/xR4swH1VtX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN/SEyH2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN/SEyH2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2471567a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774811442; x=1775416242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IEDG0KImXI5R+9pUHBh7bB4VygAWQhG2Ky+eYI3fiI=;
        b=KN/SEyH2z5M0qvtgcEOVeA7lPkNmBw1QBOgNyYPYri4Uay6/J3NAe46dgliErRGmRD
         LWeocBPpA+wOYaZgOA9bNKp3qbtumyIOjdTYh8K2kRjWeWtamnvNK9E4CYeDg09PIvzA
         vZiAQdzkHEjIVu8Oi8DOX79PbK0JvyPrEHIbdDHzmkhBt4gX94zm8MUy5LVRTuoxx/85
         2qxuWbk55QelMQ5m2THo1pVN6qJTHYwgV9+WsObTNIlAiwU+wj8e2s0PDjBinK/coGnZ
         81/8tcL/IiL/U95Sic3AxR2Ij4XyqySwLjkP8htzxtGBgpbVl5syKxNY7PfIrlkb1V5i
         35OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774811442; x=1775416242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/IEDG0KImXI5R+9pUHBh7bB4VygAWQhG2Ky+eYI3fiI=;
        b=V28pntCsFjQ2nAq5m2WfGU+1lozgDrfhzigI7f1Hy+uaQeV6uvDIoNFlwZat7FKbQT
         +NBQtGuzhv9bjpxVyHjF5wqZIgGLUMnSfYM3uZ64Rc8HSiDjuwoWrhE7pcdR+4euL+wO
         VqELCF/FxWfCqrZiIlwlwXXvsxIAU/8AAJY0+Mlfs+wxStEFQ1zo2EkmdDXjCRNfdK4Z
         7EgUFOIBHXg7LtIlJxNTzj2zoe/w8g4DmgDBDst1ys/Ru5g9eHu0yIlOr9ZrANLPOrNQ
         RPyTcsr0EhnAwm9ILoNHQuMz0fNJH/tX6NHmp3QvFWEEx6a81y9YAgcY44A9isVCFxup
         acBg==
X-Gm-Message-State: AOJu0YwhU6Wg9Td9WaLCQsvhs2ng3+H77H5lZPx2haQeAzRlF13a6D68
	o2VZnkI2vEj80UHE3BvA1GMw+bNd16pdPLYPsL1hS+ITEa4t8A4yuA/r
X-Gm-Gg: ATEYQzyrP7q2zWE7ZTy9wCnpMZDESNRql6igx7all5Mh5Zo0QhyHHvpewjRRCUO+VTZ
	kr0OMrFWiNOAtcVhA560/vma2YAGOeSJc4e3/J6GsYJ9NybvYFV0jNXTBHmjtY96buHlAw0DrC6
	tllbdXaoHl4XSYAKusNUXWpRaTWthaiqHOsiHpvu4MyO7lfiY33azrSk+tdtWe72R614RntCFV/
	JoIG4EN1re4TpgJZ3BYF1WXut7b1zXVqXb5bHR3Egi2HJRJ8j5lIwtwp71B6Tz12oCnqWWOCt4u
	0R70qZpRZ+DSvBxJRUQTsqOgPBDxfRu9q5/NKVTLqKLWUY94PHHhcoePrWWzhxcKaPlPoW8uqcJ
	UIzt92jhzbJVb5BkYyHeUWndrl8eBTQ2QhA4RfNTZ1WcIl5ZBiVMYa9H1in1G3L43vF9X3wb54A
	XgyFJr39XiiLndCm0xWNPiXLr17yw5cgRHspDi
X-Received: by 2002:a17:903:3d0f:b0:2b0:49e6:9622 with SMTP id d9443c01a7336-2b0cdcde5ecmr98326255ad.37.1774811442176;
        Sun, 29 Mar 2026 12:10:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24277fb3asm58534395ad.57.2026.03.29.12.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 12:10:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 29 Mar 2026 12:10:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"Delphine_CC_Chiu@Wiwynn.com" <Delphine_CC_Chiu@wiwynn.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/4] hwmon: (tps53679) Fix array access with zero-length
 block read
Message-ID: <2ce7caad-512a-40cd-ac2d-c2abd7198a80@roeck-us.net>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
 <20260329170925.34581-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329170925.34581-2-sanman.pradhan@hpe.com>

On Sun, Mar 29, 2026 at 05:09:40PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> i2c_smbus_read_block_data() can return 0, indicating a zero-length
> read. When this happens, tps53679_identify_chip() accesses buf[ret - 1]
> which is buf[-1], reading one byte before the buffer on the stack.
> 
> Fix by changing the check from "ret < 0" to "ret <= 0", treating a
> zero-length read as an error (-EIO), which prevents the out-of-bounds
> array access.
> 
> Also fix a typo in the adjacent comment: "if present" instead of
> duplicate "if".
> 
> Fixes: 75ca1e5875fe ("hwmon: (pmbus/tps53679) Add support for TPS53685")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
