Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378D155C82
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 00:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262482; cv=none; b=KIUxOi9abUwxUirWe5LaWTV3wPYpWDvfmB+f7eQg6hf7vGFMIEFhzlouE7pqgI8HWEJjxBm1G93jA3LhfFz19AQJ5WHrT10fJ/5F1lZsPPGUdkuvn9/6dGgdpjU190pjGgh6nJI/pwqhVQgGmJYDPZG+GkR53PyMBPdke4JBFOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262482; c=relaxed/simple;
	bh=ljubIT2IkWwAV5PEltj2zpXHUvbHQeZCEk9idJaQXVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7zSUmwaRRU7FjrqubeVMA9Pxya6aMLbKUPXxxaF9LWbNWp0FN06S/I0Bxt+B5GYxamB+iZQE6IXBfMSzRWEohKMvGBQMIhmPhDY4zUQV7mjgQ2w1IWjTKl+eeyIpdTXhIYF6vpH/9tfzkefEoGXIlFvkc0GCFXDVEXPRmu2rzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl5hRC7P; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl5hRC7P"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ae287a8444so2719522eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768262480; x=1768867280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbMElHy7hB/VQu8Z2iOab/fhBVVxmnUGu6DCKdYqD2g=;
        b=Pl5hRC7PVQaoGMqkpguSrtu8RQkhwpetgfu3sp5ooc1Qvp/PQPwYSfGcgea93NfYpa
         wsmA21ikKEJOGcr7mGPmKh782nYXSALNFsJyHsY/QX7JQ/fNo14GBZ7Wa4W9BxkUFzIf
         CBQYjUJYYWWUyUxcWwUissAX2MWTOo8MDNQW8jkQJEtArTkq20PqzYopaxgITMQQ796I
         uYS5Ta2W6zVCcEi/lMDNNVsd+DowobzxWVOs2vfd2nWcKyzSlFzplMbWd1n7uQR9JUvZ
         Laholw9x5/Gl/DKkZ14MgrioEzxw9ttbaoKtg0e8D9HDtPFNT2nFkBKu5cv6M4CEyehg
         J3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262481; x=1768867281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YbMElHy7hB/VQu8Z2iOab/fhBVVxmnUGu6DCKdYqD2g=;
        b=FHG+QRrric3RKZEaC0YAauAXE+FJyOKwxWSixqfJKktQ0XmBgp0+lYrGPcNBcfFWay
         TpJlyhehUqjdet9Y4jl0YgaGG4/UgQsNrkAeD9TMyNVCSUdb5xihCFg7jlHM3ZwBwsIV
         JOBR4wWPQCO04eJ/Gsyuv5oCFbpV++NnVENXAMuFBFG2y0O6Et8AEZH3mhlARPGXzU9B
         9GC6ki/41tzIxJJbrh+pFybuZznY2N7B4/vXK+2zbBxwWjutG7Qeka0j+I20OzyCeLRO
         Xl173dtuRyfGFOngFjOZkRn2a1UhKpzJECEQko4fv9i13pN4J2qkGIo09xtS1jMUWBNB
         U1AA==
X-Forwarded-Encrypted: i=1; AJvYcCXkvRpvHyMujhjMz4Vjeulloal6T/5WdLvqiSmKfZBf2eWb4d3w0jzlhgOdW8XhukxLemqjDtRoYzJ15Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYR3A5Z4wKqcqpBMHIGCkelwUTEu4qu5XISiGBQ8rsHdmhY4N
	Q8S/6VSTmlH4UHCv1C73lePMl6BVfBAVCxmmIWBPBOrU5hw2ke5ZmFmK58uqyRf0
X-Gm-Gg: AY/fxX4ZRu6XH2FAGBlzVSzVt2s+rPW8Tnv/d7AU4eeJeGcxKiL4AI92yDqYEl1xBTp
	ZcD5ldLbe9CASzpuNz4AwwxaCwIb4iwwMp4I+PFLJ5NKaP0I8pP12KFVTHAorZqj9CCemEgWYEM
	vHtzGDNFqhhpEcBmcX7Fta9RuXFEj9H/NWuWc29UzSx3UD9aYYZcxPpYfDA8oMxQwbPLb5L0keS
	Ip0/u3VcC27UfCz4kiWxzJ16PzFfEApG3BCgIkvcxKHysY47dVVec4C0Zpzh+i2pNh6C9NjbZAn
	9nqe952yfdoaIczxUV8f739qeXsx/Z870QnjuwFgn2XZiR/iW1/UBBA2uRE3IzM8ULLzTmdRGZN
	J1gjzO9CxMoFdheubkhAfqx7WL8EWysCxw0zGdzwakFz2kpH5TnvpcRoyxyZoAmZKW6Ai5lc4tH
	WKSXd3etndPISyLH7zRsxwCIAQ
X-Google-Smtp-Source: AGHT+IEktrbnpg5k/hQ/FM7X4gvEV6eHIctAQ/ELVaDdLGEhx2/yHf8MZ+Ac7V4M7GShQRqDtBHM6Q==
X-Received: by 2002:a05:7300:b58a:b0:2a6:9fb5:f78c with SMTP id 5a478bee46e88-2b44f313ed9mr1202384eec.4.1768262480330;
        Mon, 12 Jan 2026 16:01:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm17154773eec.6.2026.01.12.16.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:01:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:01:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Laveesh Bansal <laveeshb@laveeshbansal.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: hwmon: coretemp: Update supported
 CPUs and TjMax values
Message-ID: <afac8d11-c70e-4479-9e04-2d502251ff15@roeck-us.net>
References: <20260106155426.547872-1-laveeshb@laveeshbansal.com>
 <20260106155426.547872-2-laveeshb@laveeshbansal.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106155426.547872-2-laveeshb@laveeshbansal.com>

On Tue, Jan 06, 2026 at 03:54:25PM +0000, Laveesh Bansal wrote:
> Update the coretemp documentation to reflect current driver capabilities:
> 
> - Extend the supported CPU model list to include Atom processors from
>   Bonnell through Jasper Lake, maintaining the original format with
>   model numbers and adding X86_FEATURE_DTHERM as the actual detection
>   mechanism. Added models: 0x37 (Bay Trail), 0x4a (Merrifield),
>   0x4c (Cherry Trail), 0x5a (Moorefield), 0x5c (Apollo Lake),
>   0x7a (Gemini Lake), 0x96 (Elkhart Lake), 0x9c (Jasper Lake)
> 
> - Update the description to note that per-package temperature sensing
>   is available on Sandy Bridge and all newer processors
> 
> - Clarify that TjMax is read from MSR_IA32_TEMPERATURE_TARGET on modern
>   CPUs (Nehalem and newer)
> 
> - Add TjMax values for newer Atom processor families to Appendix A:
>   - 22nm Silvermont/Bay Trail: E38xx at 110C, Z37xx at 90C
>   - 22nm Silvermont/Moorefield: Z35xx at 90C
>   - 14nm Airmont/Cherry Trail: Z8xxx at 90C
>   - 14nm Goldmont/Apollo Lake: 105C
>   - 14nm Goldmont Plus/Gemini Lake: 105C
>   - 10nm Tremont/Elkhart Lake: 105C
>   - 10nm Tremont/Jasper Lake: 105C
> 
> TjMax values obtained from Intel ARK and official datasheets:
> - E3845: https://www.intel.com/content/www/us/en/products/sku/78475/intel-atom-processor-e3845-2m-cache-1-91-ghz/specifications.html
> - Z3600/Z3700: https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z36xxx-z37xxx-datasheet-vol-1.pdf
> 
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>

Applied.

Thanks,
Guenter
